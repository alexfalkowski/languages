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
  connection.write('{"type": "changed", "file": "targ');

  let timer = setTimeout(() => {
    connection.write(`et.txt", "timestamp": "2017-01-25T04:51:53.781Z" }${newline}`);
    connection.end();
  }, 1000);

  connection.on('end', () => {
    clearTimeout(timer);
    console.log('Subscriber disconnected!');
  });
});

server.listen(10000, () => {
  console.log('Connected to port 10000');
});
