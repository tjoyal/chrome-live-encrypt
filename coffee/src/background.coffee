# Set up listners
#chrome.extension.onRequest.addListener(
#  (request, sender, sendResponse) ->
#    if request.module == 'ChromeLiveEncrypt'
#      if request.method == 'get_keys'
#        sendResponse ChromeLiveEncrypt.KeyStore.get_keys()
#)

# Keep everything fresh while developing
$(document).ready ->
  ChromeLiveEncrypt.KeyStore.reset();

  for i in [1,2]
    key = new ChromeLiveEncrypt.Key()
    key.name = 'Name' + i
    key.secret = 'Secret' + i
    key.note = 'Note' + i
    ChromeLiveEncrypt.KeyStore.add_key( key )

  console.log( 'Current keys', ChromeLiveEncrypt.KeyStore.get_keys() )