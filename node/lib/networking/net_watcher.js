'use strict';

const
  fs = require('fs'),
  net = require('net'),
  filename = process.argv[2],
  newline = '\n';

if (!filename) {
  throw Error('You must specify filename!');
}

let server = net.createServer((connection) => {
  console.log('Subscribed!');
  connection.write(`Now watching ${filename}${newline}`);

  let watcher = fs.watch(filename, () => {
    connection.write(`Filename ${filename}  has changed ${new Date().toISOString()}${newline}`);
  });

  connection.on('close', () => {
    console.log('Closed connection!');
    watcher.close();
  });
});

server.listen(10000, () => {
  console.log('Connected to port 10000');
});
