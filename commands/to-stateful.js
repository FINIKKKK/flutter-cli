import fs from "fs";

export default function (program) {
    program
        .command('to-stateful <filePath>')
        .description('преобразует Stateless виджет в Stateful')
        .action(async (filePath) => {
            fs.promises.readFile(filePath, {encoding: 'utf8'})
                .then(async content => {
                    // Находим имя виджета
                    const widgetNameMatch = content.match(/class\s+(\w+)\s+extends\s+StatelessWidget\s+\{/);
                    if (!widgetNameMatch) {
                        throw new Error("Не удалось найти имя Stateless виджета.");
                    }
                    const widgetName = widgetNameMatch[1];
                    console.log(widgetName);

                    // Замена StatefulWidget на StatelessWidget
                    content = content.replace(/extends StatelessWidget/g, 'extends StatefulWidget');


                    // Проверяем, есть ли уже метод build в классе виджета, и вставляем перед ним
                    if (content.includes('Widget build(BuildContext context)')) {
                        const createStateMethod = `
  @override
  ${widgetName}State createState() => ${widgetName}State();
}

/*
  State----------------
 */
class ${widgetName}State extends State<${widgetName}> {
`;

                        content = content.replace(/(\n+)(\s+\/\/ Builder ----------------\s+@override\s+Widget build\(BuildContext context\))/, `\n\n\t${createStateMethod.trim()}\n$2`);
                    }

                    return fs.promises.writeFile(filePath, content, {encoding: 'utf8'});
                    console.log('Stateless виджет успешно преобразован в Stateful виджет.');
                })
                .then(() => console.log('Файл успешно преобразован в Stateful виджет.'))
                .catch(err => console.error('Ошибка при преобразовании файла:', err));
        })
};