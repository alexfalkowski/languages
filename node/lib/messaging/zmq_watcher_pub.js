'use strict';

const
  fs = require('fs'),
  zmq = require('zmq'),
  publisher = zmq.socket('pub'),
  filename = process.argv[2];

fs.watch(filename, () => {
  let message = JSON.stringify({
    type: 'changed',
    file: filename,
    timestamp: new Date().toISOString()
  });
  publisher.send(message);
});

publisher.bind('tcp://*:10000', (err) => {
  console.log('Listening!');
});
