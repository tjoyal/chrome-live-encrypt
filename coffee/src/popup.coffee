namespace 'ChromeLiveEncrypt', (exports) ->

  class exports.Popup

    constructor: ->
      console.log(1)

    init: ->
      $("#tabs").tabs()
      $("#keys-template").hide()
      @load_keys()

    load_keys: ->
      for key in exports.KeyStore.get_keys()
        @element_new({name: key.name, secret: key.secret, note: key.note})

    element_new: (data) ->
      element = $("#keys-template").clone()
      element.data(data)
      @element_reload(element)
      @element_mode(element, 'show')
      $('#keys').append(element)

    element_reload: (element) ->
      $('input.name', element).val( element.data('name') )
      $('span.name', element).html( element.data('name') )
      $('input.secret', element).val( element.data('secret') )
      $('span.secret', element).html( element.data('secret') )
      $('input.note', element).val( element.data('note') )
      $('span.note', element).html( element.data('note') )
      $('span.id', element).html( element.data('id') )

    element_mode: (element, mode) ->
      element.show()
      $('.section.new', element).hide()
      $('.section.show', element).hide()
      $('.section.edit', element).hide()
      $('.section.' + mode, element).show()



$(document).ready ->
  popup = new ChromeLiveEncrypt.Popup()

  popup.init()



