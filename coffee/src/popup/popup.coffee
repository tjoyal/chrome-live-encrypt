namespace 'ChromeLiveEncrypt', (exports) ->

  class exports.Popup

    constructor: ->
      console.log(1)

    init: ->
      $("#tabs").tabs()
      $("#keys-template").hide()
      @load_keys()

    load_keys: ->

      # todo : replace me with actual loading
      clone = $("#keys-template").clone()
      clone.show()
      $('#keys').append(clone)



$(document).ready ->
  popup = new ChromeLiveEncrypt.Popup()

  popup.init()



