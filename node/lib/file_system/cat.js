#!/usr/bin/env node --harmony

require('fs').createReadStream('target.txt').pipe(process.stout);
