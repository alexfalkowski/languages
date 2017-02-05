const fs = require('fs');

fs.writeFile('target.txt', 'Hello NodeJS', (err) => {
  if (err) {
    throw err;
  }

  console.log('File saved');
});
