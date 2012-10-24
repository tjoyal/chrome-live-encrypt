namespace 'ChromeLiveEncrypt', (exports) ->

  class exports.Popup

    constructor: ->
      # nothing

    init: ->
      $("#tabs").tabs()
      $("#keys-template").hide()
      @load_keys()
      @live_bind()

    load_keys: ->
      for key in exports.KeyStore.get_keys()
        data = @data_from_key(key)
        @element_new(data)

    element_new: (data, options = {}) ->

      mode = options.mode || 'show'
      direction = options.direction || 'last'

      element = $("#keys-template").clone()
      element.attr('id', '')
      element.data(data)
      element.show()
      @element_mode(element, mode)

      if direction == "first"
        $('#keys').prepend(element)
      if direction == "last"
        $('#keys').append(element)

    data_from_key: (key) ->
      {id: key.id, name: key.name, secret: key.secret, note: key.note}

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
      id = element.data('id')
      if id != undefined
        exports.KeyStore.remove( id )
      element.remove()

    element_save: (element) ->
      id = element.data('id')

      key
      if id == undefined
        # new
        key = new exports.Key()
        key.name = element.data('name')
        key.secret = element.data('secret')
        key.note = element.data('note')
        exports.KeyStore.add_key(key)
      else
        # update
        key = exports.KeyStore.find(id)
        key.name = element.data('name')
        key.secret = element.data('secret')
        key.note = element.data('note')
        exports.KeyStore.update(key)

      #todo : Update element data
      data = @data_from_key(key)
      element.data(data)

      @element_mode(element, 'show')


    live_bind: ->

      $('#new-key').click =>
        @element_new({}, {mode: 'new', direction: 'first'})

      $('#keys .key button').live 'click', (event) =>
        button = $(event.target)
        section = $(button).closest('.section')
        element = $(section).closest('.key')

        if section.hasClass('new')
          if button.hasClass('cancel')
            @element_remove(element)
          if button.hasClass('create')
            @element_save(element)

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
