# Set up listners
chrome.extension.onRequest.addListener(
  (request, sender, sendResponse) ->
    if request.module == 'ChromeLiveEncrypt'
      if request.method == 'get_functions'
        sendResponse ChromeLiveEncrypt.KeyStore.get_keys()
)

$(document).ready ->
  console.log('backgound ready')
  ChromeLiveEncrypt.KeyStore.reset();
  console.log( ChromeLiveEncrypt.KeyStore.get_keys() )