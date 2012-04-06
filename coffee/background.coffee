liveEncrypt = new document.LiveEncrypt()

# Set up listners
chrome.extension.onRequest.addListener(
  (request, sender, sendResponse) ->
    if request.decode
      try
        sendResponse liveEncrypt.decode(request.decode  )
      catch e
        alert e
)
