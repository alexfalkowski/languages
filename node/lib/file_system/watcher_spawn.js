"use strict";

const
  fs = require('fs'),
  spawn = require('child_process').spawn,
  filename = process.argv[2];

if (!filename) {
  throw Error('A file must be specified!');
}

fs.watch(filename, () => {
  let ls = spawn('ls', ['-lh', filename]);
  ls.stdout.pipe(process.pipe);
});

console.log(`Now watching ${filename}`);
