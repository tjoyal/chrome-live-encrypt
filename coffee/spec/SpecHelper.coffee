beforeEach ->
  this.addMatchers ->
    # nothing

key_factory = (number) ->
  key = new ChromeLiveEncrypt.Key()
  key.name = 'Name' + number
  key.secret = 'Secret' + number
  key.note = 'Note' + number
  key

key_factory_validation = (key, number) ->
  key.name == ("Name" + number) && key.secret == ("Secret" + number) && key.note == ("Note" + number)