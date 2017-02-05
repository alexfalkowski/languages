'use strict';

const
  fs = require('fs'),
  zmq = require('zmq'),
  responder = zmq.socket('rep');

responder.on('message', (data) => {
  let request = JSON.parse(data);
  console.log(`Message received ${request.path}`);

  fs.readFile(request.path, (err, content) => {
    if (err) {
      throw err;
    }

    let message = JSON.stringify({
      content: content.toString(),
      timestamp: new Date().toISOString(),
      pid: process.pid
    });

    console.log(`Sending content ${message}`);

    responder.send(message);
  });
});

responder.bind('tcp://127.0.0.1:10000', (err) => {
  if (err) {
    throw err;
  }

  console.log('Listening!');
});

process.on('SIGINT', () => {
  console.log('Shutting down!');
  responder.close();
});
