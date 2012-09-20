namespace 'ChromeLiveEncrypt', (exports) ->

  class exports.KeyStore

    constructor: ->
      console.log(2)

    @reset: ->
      @set_keys([])

      # demo key
      key = new exports.Key('Id1')
      key.name = 'Name1'
      key.secret = 'Secret1'
      key.note = 'Note1'
      @add_key(key)

    @add_key: (key) ->
      keys = @get_keys()
      keys.push(key)
      @set_keys(keys)

    @get_keys: ->
      str = localStorage.getItem("keys")
      console.log("get_keys: ",  str)
      skeys = JSON.parse(str)
      keys = []
      for skey in skeys
        key = exports.Key.unserialize(skey)
        keys.push(key)
      keys

    @set_keys: (keys) ->
      console.log("set_keys: ",  keys)

      skeys = []
      for key in keys
        skey = key.serialize()
        skeys.push(skey)
      str = JSON.stringify(skeys)

      localStorage.setItem("keys", str )
