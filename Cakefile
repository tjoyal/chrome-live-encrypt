{exec} = require 'child_process'
task 'build', 'Build project from coffee/*.coffee to src/js/*.js', ->
  exec 'rm src/js/*.js'
  exec 'coffee --compile --output src/js/ coffee/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
