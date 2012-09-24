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
      for key in exports.KeyStore.get_keys()
        clone = $("#keys-template").clone()
        $('.name', clone).val( key.name )
        $('.secret', clone).val( key.secret )
        $('.note', clone).val( key.note )
        clone.show()
        $('#keys').append(clone)

$(document).ready ->
  popup = new ChromeLiveEncrypt.Popup()

  popup.init()



