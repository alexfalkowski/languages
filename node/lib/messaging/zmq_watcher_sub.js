'use strict';

const
  zmq = require('zmq'),
  subscriber = zmq.socket('sub');

subscriber.subscribe('');

subscriber.on('message', (data) => {
  let message = JSON.parse(data);
  console.log(`File ${message.file} chnaged at ${message.timestamp}`);
});

subscriber.connect('tcp://localhost:10000');
