import fs from "fs";

export default function (program) {
    program
        .command('to-stateless <filePath>')
        .description('преобразует Stateful виджет в Stateless')
        .action(async (filePath) => {
            fs.promises.readFile(filePath, {encoding: 'utf8'})
                .then(content => {
                    // Замена StatefulWidget на StatelessWidget
                    content = content.replace(/extends StatefulWidget/g, 'extends StatelessWidget');

                    /// Удаление метода createState
                    content = content.replace(/\s+@override\s+[_\w]+State\s+createState\(\)\s+=>\s+[_\w]+State\(\);\n\s*}\n/, '');

                    content = content.replace(/\n\/\*\n\s+State[-]+?\n\s+\*\/\nclass\s+\w+State\s+extends\s+State<\w+>\s*(with\s+\w+)?\s*\{/g, '\n');

                    content = content.replace(/(\s+\/\/ Dispose[ -]*\n)?\s+@override\s+void\s+dispose\(\)\s+\{[\s\S]*?\n\s+\}\n/g, '\n');

                    return fs.promises.writeFile(filePath, content, {encoding: 'utf8'});
                })
                .then(() => console.log('Файл успешно преобразован в Stateless виджет.'))
                .catch(err => console.error('Ошибка при преобразовании файла:', err));
        })
};