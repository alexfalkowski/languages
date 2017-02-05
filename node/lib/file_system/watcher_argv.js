const
  fs = require('fs'),
  filename = process.argv[2];

if (!filename) {
  throw Error('A file must be specified!');
}

fs.watch(filename, () => {
  console.log(`File ${filename} has changed!`);
});

console.log(`Now watching ${filename}`);
