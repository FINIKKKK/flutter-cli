#!/usr/bin/env node

const { program } = require('commander');
const { exec } = require('child_process');

const fs = require('fs');
const path = require('path');

program
  .name('mycli')
  .description('CLI для клонирования репозитория с помощью git clone')
  .version('1.0.0');



program
  .command('build')
  .description('Клонирует репозиторий')
  .action(() => {
    console.log(`Клонирование репозитория`);
    const repoUrl = "https://github.com/FINIKKKK/flutter-template";
    const projectName = path.basename(repoUrl, '.git'); // Извлекает имя проекта из URL
    console.log(`Клонирование репозитория: ${repoUrl}`);

    exec(`git clone ${repoUrl}`, (cloneError, cloneStdout, cloneStderr) => {
      if (cloneError) {
        console.error(`Ошибка при клонировании: ${cloneError.message}`);
        return;
      }
      if (cloneStderr) {
        console.log(`Информация о клонировании: ${cloneStderr}`);
      }

      console.log(cloneStdout || 'Репозиторий успешно клонирован.');
      const gitDirPath = path.join(process.cwd(), projectName, '.git');
      console.log(`Удаление папки .git в ${gitDirPath}...`);
      fs.rm(gitDirPath, { recursive: true, force: true }, (rmError) => {
        if (rmError) {
          console.error(`Ошибка при удалении папки .git: ${rmError}`);
          return;
        }
        console.log('Папка .git успешно удалена.');
      });
    });
  });

program.parse(process.argv);
