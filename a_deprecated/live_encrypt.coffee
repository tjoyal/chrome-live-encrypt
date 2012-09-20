class document.LiveEncrypt

#  staticKey: '@#$%YNBFDW#$BY%T#$%?#'

  getKeys: ->
    JSON.parse( localStorage.getItem('keys') )

  setKeys: (keys) ->
    localStorage.setItem('keys', JSON.stringify(keys))

  addKey: (name, key) ->
    keys = this.getKeys()
    keys.push {name: name, key: key}
    this.setKeys(keys)

  encode: (text, key) ->
    return LiveEncrypt.encode(text, key)

  decode: (text, key) ->
    value = LiveEncryptCrypt.decode(text, key)

    if value != false
      return value

    return 'unable to decode : ' + text

  decodeAny: (text) ->

    keys = this.getKeys()

    for key in keys
      value = LiveEncryptCrypt.decode(text, key)

      if value != false
        return value

    return 'unable to decode : ' + text