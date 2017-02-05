'use strict';

const
  zmq = require('zmq'),
  filename = process.argv[2],
  requester = zmq.socket('req');

requester.on('message', (data) => {
  let response = JSON.parse(data);
  console.log(`Received ${JSON.stringify(response)}`);
});

requester.connect('tcp://localhost:10000');
console.log(`Sending ${filename}`);

requester.send(JSON.stringify({ path: filename }));
