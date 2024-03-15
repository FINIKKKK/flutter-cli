#!/usr/bin/env node

import {program} from 'commander';
import buildCommand from './commands/build.js';
import toStatelessCommand from './commands/to-stateless.js';
import toStatefulCommand from "./commands/to-stateful.js";
import createSliceCommand from "./commands/create-slice.js";

program
    .name('mycli')
    .description('CLI')
    .version('1.0.0');

buildCommand(program);
toStatelessCommand(program);
toStatefulCommand(program);
createSliceCommand(program);

program.parse(process.argv);
