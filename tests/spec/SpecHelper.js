beforeEach(function() {

  this.addMatchers({

  });

});

var key_factory = function(id) {
  key = new ChromeLiveEncrypt.Key(id);
  key.name = 'Name' + id;
  key.secret = 'Secret' + id;
  key.note = 'Note' + id;
  return key;
}

var key_factory_validation = function(id, key) {
  return key.id === id &&
    key.name === ("Name" + id) &&
    key.secret === ("Secret" + id) &&
    key.note === ("Note" + id)
}