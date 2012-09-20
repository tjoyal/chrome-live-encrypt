# Set up listners
chrome.extension.onRequest.addListener(
  (request, sender, sendResponse) ->
    if request.module == 'ChromeLiveEncrypt'
      if request.method == 'get_functions'
        sendResponse ChromeLiveEncrypt.KeyStore.get_keys()
)


namespace = (target, name, block) ->
  [target, name, block] = [(if typeof exports isnt 'undefined' then exports else window), arguments...] if arguments.length < 3
  top    = target
  target = target[item] or= {} for item in name.split '.'
  block target, top


namespace 'ChromeLiveEncrypt', (exports) ->

  class exports.Key

    @id = ''
    @name = ''
    @secret = ''
    @note = ''

    constructor: (id) ->
      console.log('Creating key')

    serialize: ->
      json = {id: @id, name: @name, secret: @secret, note: @note}
      JSON.stringify(json)

    @unserialize: (str) ->
      json = JSON.parse(str)
      key = new exports.Key(json.id)
      key.name = json.name
      key.secret = json.secret
      key.note = json.note
      key




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


$(document).ready ->
  console.log('backgound ready')
  ChromeLiveEncrypt.KeyStore.reset();
  console.log( ChromeLiveEncrypt.KeyStore.get_keys() )