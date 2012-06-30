class document.LiveEncryptCrypt

  encode: (text, key) ->
    base32 = this.getEncodingObject()
    return base32.encode(key + text)

  decode: (text, key) ->

    key = key.key
    base32 = this.getEncodingObject()

    try
      decoded = base32.decode(text)
      if decoded.substr(0, key.length) == key
        return decoded.substr(key.length)
    catch e
      # nothing

    return false


  /* PRIVATE? */

  getEncodingObject: ->
    return new Nibbler {
      dataBits: 8,
      codeBits: 5,
      keyString: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',
      pad: '='
    }