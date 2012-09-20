# liveEncrypt = new document.LiveEncrypt()

#updateKeys = ->
#  keys = liveEncrypt.getKeys()
#
#  $('#keys').html('');
#
#  for key in keys
#    $('#keys').append('name : ' + key.name + '<br />')
#    $('#keys').append('key : ' + key.key)
#    $('#keys').append('<hr />')
#
#
#window.add_key = ->
#
#  $('#add-key-btn').css('display', 'none')
#
#  elem = $('#add-key').clone().attr('id', '').css('display', 'block')
#
#  $('#tabs-keys').append(elem);
#
#window.save_key = (btn) ->
#
#  elem = $(btn).closest('.add-key')
#
#  name = elem.find('.name').val()
#  key = elem.find('.key').val()
#  liveEncrypt.addKey(name, key)
#
#  elem.remove()
#
#  $('#add-key-btn').css('display', 'block')
#
#  updateKeys()
#  updateKeys()


#updateKeys()
#window.setInterval ->
#  updateKeys()
#, 100
#


namespace = (target, name, block) ->
  [target, name, block] = [(if typeof exports isnt 'undefined' then exports else window), arguments...] if arguments.length < 3
  top    = target
  target = target[item] or= {} for item in name.split '.'
  block target, top


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



