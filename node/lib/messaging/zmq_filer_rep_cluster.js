'use strict';

const
  cluster = require('cluster'),
  generator = require('./generator'),
  fs = require('fs'),
  address = 'ipc://filer-dealer.ipc',
  zmq = require('zmq');

if (cluster.isMaster) {
  let
    router = zmq.socket('router').bind('tcp://127.0.0.1:10000', (err) => {
      if (err) {
        throw err;
      }

      console.log('Router istening!');
    }),
    dealer = zmq.socket('dealer').bind(address, (err) => {
      if (err) {
        throw err;
      }

      console.log('Dealer istening!');
    });

  router.on('message', () => {
    let frames = [...arguments]
    console.log(`Router frames ${frames}`);
    dealer.send(frames);
  });

  dealer.on('message', () => {
    let frames = [...arguments]
    console.log(`Dealer frames ${frames}`);
    router.send(frames);
  });

  cluster.on('online', (worker) => {
    console.log(`Worker ${worker.process.pid} is online!`);
  });

  for (let i of generator.range(0, 3)) {
    cluster.fork();
  }
} else {
  let responder = zmq.socket('rep').connect(address);

  responder.on('message', (data) => {
    let request = JSON.parse(data);
    console.log(`${process.pid} received request for ${request.path}`);

    fs.readFile(request.path, (err, data) => {
      if (err) {
        throw err;
      }

      cosole.log(`${process.pid} sending response!`);

      let message = JSON.stringify({
        pid: process.pid,
        data: data.toString(),
        timestamp: new Date().toISOString()
      });

      console.log(`Sending content ${message}`);

      responder.send();
    });
  });
}
