'use strict';

let range = function* (s, f) {
  for (var i = s; i < f; i++) {
    yield i;
  }
}

exports.range = range;
