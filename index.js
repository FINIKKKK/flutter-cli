#!/usr/bin/env node

const {program} = require('commander');
const {exec} = require('child_process');

const fs = require('fs').promises;
const path = require('path');

program
    .name('mycli')
    .description('CLI для клонирования репозитория с помощью git clone')
    .version('1.0.0');

program
    .command('build [destination]')
    .description('Клонирует репозиторий. Если указан аргумент ".", клонирование происходит в текущую директорию.')
    .action(async (destination) => {
        const inquirer = await import('inquirer');

        const answers = await inquirer.default.prompt([
            {
                type: 'input',
                name: 'projectName',
                message: 'Введите имя проекта:',
                default: () => destination ? path.basename(destination) : "my-new-project"
            },
            {
                type: 'input',
                name: 'projectDescription',
                message: 'Введите описание проекта:',
                default: () => destination ? path.basename(destination) : "my-new-project"
            }
        ]);

        console.log(`Клонирование репозитория`);
        const repoUrl = "https://github.com/FINIKKKK/flutter-template";
        const projectName = path.basename(repoUrl, '.git');
        const nameProject = answers.projectName.toLowerCase().replace(/\s+/g, '_');
        const id = `com.example.${nameProject}`;

        console.log(`Имя проекта: ${nameProject}`);
        console.log(`Id проекта: ${id}`);
        console.log(`Клонирование репозитория: ${repoUrl}`);

        let cloneDirectory = destination === '.' ? '.' : projectName;
        let cloneCommand = `git clone ${repoUrl} ${cloneDirectory}`;

        exec(cloneCommand, async (cloneError, cloneStdout, cloneStderr) => {
            if (cloneError) {
                console.error(`Ошибка при клонировании: ${cloneError.message}`);
                return;
            }
            if (cloneStderr) {
                console.log(`Информация о клонировании: ${cloneStderr}`);
            }

            console.log(cloneStdout || 'Репозиторий успешно клонирован.');

            console.log(`Удаление папки .git`);
            const gitDirPath = cloneDirectory === '.' ? path.join(process.cwd(), '.git') : path.join(process.cwd(), cloneDirectory, '.git');
            console.log(`Удаление папки .git в ${gitDirPath}...`);
            await fs.rm(gitDirPath, {recursive: true, force: true});

            console.log('Папка .git успешно удалена.');

            const pubspecPath = cloneDirectory === '.' ? path.join(process.cwd(), 'pubspec.yaml') : path.join(process.cwd(), cloneDirectory, 'pubspec.yaml');
            try {
                let content = await fs.readFile(pubspecPath, {encoding: 'utf8'});
                content = content.replace(/(name:\s+).*/, `$1${nameProject}`);
                content = content.replace(/(description:\s+).*/, `$1${answers.projectDescription}`);
                await fs.writeFile(pubspecPath, content, {encoding: 'utf8'});
                console.log('Имя проекта в pubspec.yaml успешно обновлено.');
            } catch (err) {
                console.error(`Ошибка при обновлении имени проекта в pubspec.yaml: ${err}`);
            }
        });
    });

program.parse(process.argv);
