'use strict';

const
  net = require('net'),
  ldj = require('./ldj'),
  client = net.connect(10000),
  ldjClient = ldj.connect(client);

ldjClient.on('message', (message) => {
  switch (message.type) {
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
