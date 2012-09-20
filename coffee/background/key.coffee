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