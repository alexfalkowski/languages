const
  fs = require('fs'),
  stream = fs.createReadStream(process.argv[2]);

stream.on('data', (data) => {
  process.stdout.write(data);
});

stream.on('error', (err) => {
  process.stderr.write("error: " + err.message + "\n");
});
