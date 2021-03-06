namespace 'ChromeLiveEncrypt', (exports) ->

  class exports.Key

    # todo: make this gen uuid + check
    nextAvailableId = 1000

    @id = ''
    @name = ''
    @secret = ''
    @note = ''

    constructor: () ->
      @id = nextAvailableId
      nextAvailableId++

    serialize: ->
      json = {id: @id, name: @name, secret: @secret, note: @note}
      JSON.stringify(json)

    @unserialize: (str) ->
      json = JSON.parse(str)
      key = new exports.Key()
      key.id = json.id
      key.name = json.name
      key.secret = json.secret
      key.note = json.note
      key