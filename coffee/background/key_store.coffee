namespace 'ChromeLiveEncrypt', (exports) ->

  class exports.KeyStore

    @reset: ->
      @set_keys([])

    @add_key: (key) ->
      keys = @get_keys()
      keys.push(key)
      @set_keys(keys)

    @get_keys: ->
      str = localStorage.getItem("keys")

      # If undefined return a still valid value
      if str == null
        return []

      skeys = JSON.parse(str)
      keys = []
      for skey in skeys
        key = exports.Key.unserialize(skey)
        keys.push(key)
      keys

    @set_keys: (keys) ->
      skeys = []
      for key in keys
        skey = key.serialize()
        skeys.push(skey)
      str = JSON.stringify(skeys)

      localStorage.setItem("keys", str )

    @find: (id) ->
      for key in @get_keys()
        if key.id == id
          return key

      return undefined