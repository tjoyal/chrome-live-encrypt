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


  getEncodingObject: ->
    return new Nibbler {
      dataBits: 8,
      codeBits: 5,
      keyString: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',
      pad: '='
    }

  encode: (text, key) ->
    base32 = this.getEncodingObject()
    return base32.encode(key + text)

  decode: (text) ->

    keys = this.getKeys()

    for key in keys
      key = key.key
      base32 = this.getEncodingObject()

      try
        decoded = base32.decode(text)
        if decoded.substr(0, key.length) == key
          return decoded.substr(key.length)
      catch e
        # nothing

    return 'unable to decode : ' + text
