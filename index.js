#!/usr/bin/env node

const { program } = require('commander');
const buildCommand = require('./commands/build');

program
  .name('mycli')
  .description('CLI для клонирования репозитория с помощью git clone')
  .version('1.0.0');

buildCommand(program);

program.parse(process.argv);
