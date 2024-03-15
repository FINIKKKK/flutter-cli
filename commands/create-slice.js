import fs from "fs";
import inquirer from "inquirer";
import path from "path";

function toCamelCase(str) {
    return str
        .toLowerCase()
        .replace(/[^a-zA-Z0-9]+(.)/g, (match, chr) => chr.toUpperCase());
}

function formatSliceName(name) {
    return name.split(/\s|-/).map(toCamelCase).join('');
}

function capitalize(str) {
    return str.charAt(0).toUpperCase() + str.slice(1);
}

export default function (program) {
    program
        .command('create-slice')
        .description('Создает новый slice')
        .action(async () => {

            const answers = await inquirer.prompt([
                {
                    type: 'input',
                    name: 'sliceName',
                    message: 'Как назвать slice?',
                    validate(input) {
                        // Простая проверка на непустое имя
                        if (/^\s*$/.test(input)) {
                            return 'Имя slice не может быть пустым.';
                        }
                        return true;
                    }
                }
            ]);

            const sliceName = formatSliceName(answers.sliceName);
            const SliceName = capitalize(sliceName);
            const sliceDirPath = path.join(process.cwd(), 'lib/store/slices', sliceName);

            console.log(`Директория ${sliceDirPath} создана.`);

            // Создание директории для slice
            fs.mkdir(sliceDirPath, {recursive: true}, (err) => {
                if (err) {
                    return console.error(err);
                }

                const stateContent = `// -------------------------
// State
// -------------------------
class ${SliceName}State {
  dynamic testData;

  ${SliceName}State({
    this.testData,
  });
}
`;

                const actionsContent = `// -------------------------
// Actions
// -------------------------
class SetTestData {
  final dynamic value;

  SetTestData(this.value);
}
`;

                const reducersContent = `// -------------------------
// Reducers
// -------------------------
${SliceName}State ${sliceName}Reducers(${SliceName}State state, action) {
  switch (action.runtimeType) {
    case SetTestData:
      state.testData = action.value;
      return state;

    default:
      return state;
  }
}
`;

                const files = [
                    {name: 'state.dart', content: stateContent},
                    {name: 'actions.dart', content: actionsContent},
                    {name: 'reducers.dart', content: reducersContent},
                ];

                // Создание файлов внутри директории slice
                files.forEach(({name, content}) => {
                    const filePath = path.join(sliceDirPath, name);
                    fs.writeFile(filePath, content, (err) => {
                        if (err) {
                            console.error(`Ошибка при создании файла ${name}:`, err);
                        } else {
                            console.log(`Файл ${name} создан в ${sliceDirPath}.`);
                        }
                    });
                });
            });

        })
};