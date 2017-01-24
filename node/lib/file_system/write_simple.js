const fs = require('fs');

fs.writeFile('target.txt', 'Hello NodeJS', function(err) {
  if (err) {
    throw err;
  }

  console.log('File saved');
});
