liveEncrypt = new document.LiveEncrypt()

updateKeys = ->
  keys = liveEncrypt.getKeys()

  $('#keys').html('');

  for key in keys
    $('#keys').append('name : ' + key.name + '<br />')
    $('#keys').append('key : ' + key.key)
    $('#keys').append('<hr />')


window.add_key = ->

  $('#add-key-btn').css('display', 'none')

  elem = $('#add-key').clone().attr('id', '').css('display', 'block')

  $('#tabs-keys').append(elem);

window.save_key = (btn) ->

  elem = $(btn).closest('.add-key')

  name = elem.find('.name').val()
  key = elem.find('.key').val()
  liveEncrypt.addKey(name, key)

  elem.remove()

  $('#add-key-btn').css('display', 'block')

  updateKeys()

$(document).ready ->
  $( "#tabs" ).tabs()

  liveEncrypt.setKeys([])
  liveEncrypt.addKey('key1', '1f4gsf4h')

  updateKeys()


#updateKeys()
#window.setInterval ->
#  updateKeys()
#, 100
#
