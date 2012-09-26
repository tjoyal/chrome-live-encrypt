namespace 'ChromeLiveEncrypt', (exports) ->

  class exports.Popup

    constructor: ->
      console.log(1)

    init: ->
      $("#tabs").tabs()
      $("#keys-template").hide()
      @load_keys()
      @live_bind()

    load_keys: ->
      for key in exports.KeyStore.get_keys()
        @element_new({name: key.name, secret: key.secret, note: key.note})

    element_new: (data, mode = 'show') ->
      element = $("#keys-template").clone()
      element.attr('id', '')
      element.data(data)
      element.show()
      @element_mode(element, mode)
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
      @element_reload(element)
      $('.section.new', element).hide()
      $('.section.show', element).hide()
      $('.section.edit', element).hide()
      $('.section.' + mode, element).show()

    element_remove: (element) ->
      #todo : Remove element from store
      element.remove()

    element_save: (element) ->
      #todo : Update element in store
      #todo : Update element data
      @element_mode(element, 'show')


    live_bind: ->

      $('#new-key').click =>
        @element_new({}, 'new')

      $('#keys .key button').live 'click', (event) =>
        button = $(event.target)
        section = $(button).closest('.section')
        element = $(section).closest('.key')

        if section.hasClass('show')
          if button.hasClass('edit')
            @element_mode(element, 'edit')

        if section.hasClass('edit')
          if button.hasClass('cancel')
            @element_mode(element, 'show')
          if button.hasClass('remove')
            @element_remove(element)
          if button.hasClass('save')
            @element_save(element)

$(document).ready ->
  popup = new ChromeLiveEncrypt.Popup()

  popup.init()
