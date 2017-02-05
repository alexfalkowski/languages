'use strict';

const
  zmq = require('zmq'),
  generator = require('./generator'),
  filename = process.argv[2],
  requester = zmq.socket('req');

requester.on('message', (data) => {
  let response = JSON.parse(data);
  console.log(`Received ${JSON.stringify(response)}`);
});

requester.connect('tcp://127.0.0.1:10000');
console.log(`Sending ${filename}`);

for (let i of generator.range(1, 4)) {
  console.log(`Sending request ${i} for ${filename}`);
  requester.send(JSON.stringify({ path: filename }))
}
