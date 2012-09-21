beforeEach(function() {

  this.addMatchers({

  });

});

var key_factory = function(number) {
  key = new ChromeLiveEncrypt.Key();
  key.name = 'Name' + number;
  key.secret = 'Secret' + number;
  key.note = 'Note' + number;
  return key;
}

var key_factory_validation = function(key, number) {
  return key.name === ("Name" + number) &&
    key.secret === ("Secret" + number) &&
    key.note === ("Note" + number)
}