'use strict';

const
  net = require('net'),
  client = net.connect(10000);

client.on('data', (data) => {
  let message = JSON.parse(data);

  switch(message.type) {
    case 'watching':
      console.log(`Watching ${message.file}`);
      break;
    case 'changed':
      console.log(`${message.file} changed at ${message.timestamp}`);
      break;
    default:
      throw Error('No idea!');
  }
});
