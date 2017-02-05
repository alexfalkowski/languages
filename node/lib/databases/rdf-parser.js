'use strict';

const
  fs = require('fs'),
  cheerio = require('cheerio');

var parser = (filename, callback) => {
  fs.readFile(filename, (err, data) => {
    if (err) {
      return callback(err);
    }

    let
      doc = cheerio.load(data.toString()),
      collect = (index, elem) => {
        return doc(elem).text();
      }

    callback(null, {
      _id: doc('pgterms\\:ebook').attr('rdf:about').replace('ebooks/', ''),
      title: doc('dcterms\\:title').text(),
      authors: doc('pgterms\\:agent pgterms\\:name').map(collect),
      subjects: doc('[rdf\\:resource$="/LCSH"] ~ rdf\\:value').map(collect)
    })
  });
};

module.exports = parser;
