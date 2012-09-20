{exec} = require 'child_process'
{spawn} = require 'child_process'

task 'clean', 'Clean previous medatada', ->
  exec 'rm src/js/*.js'

task 'build', 'Build project from coffee/*.coffee to src/js/*.js', ->
  exec 'coffee --compile --bare --output src/js/ coffee/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'build-watch', 'Build and watch project from coffee/*.coffee to src/js/*.js', ->
  spawn 'coffee', ['--compile', '--bare', '--watch', '--output', 'src/js/', 'coffee/'], customFds: [0..2]
