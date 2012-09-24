# The reason we go through API is that we dont want the context to grab full access over keys.
# It is reserved to background and popup context

namespace 'ChromeLiveEncrypt', (exports) ->

  class exports.Api

    @get_keys: ->
      chrome.extension.sendRequest {module: 'ChromeLiveEncrypt', method: 'todo'}, (response) ->
        console.log "replacing element! => "
  #      $(element).html( response )
