flour = require 'flour'
cp    = require('child_process')

task 'build', ->
    flour.compile 'src/numpack.coffee', 'lib/numpack.js'

task 'watch', ->
    invoke 'build'
    watch 'src/*.coffee', -> invoke 'build'

task 'test', ->
    cp.spawn 'node_modules/.bin/mocha', [], stdio: 'inherit'