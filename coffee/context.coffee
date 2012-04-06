$(document).ready ->
  $(document).find('.live-encrypt').each (index, element) ->
    code = $(element).html()

    console.log "replacing element! (" + code + ")"
    chrome.extension.sendRequest {decode: code}, (response) ->
      console.log "replacing element! => "
      $(element).html( response )
