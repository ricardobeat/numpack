should  = require 'should'
numpack = require '../src/numpack.coffee'

describe 'numpack', ->

    compacted = null
    expanded  = null

    source = (Math.floor Math.random() * 255 for i in [0..999])

    it 'should compress stuff correctly', ->
        compacted = numpack.compact source
        compacted.should.be.type 'string'

    it 'should expand stuff correctly', ->
        expanded = numpack.expand compacted
        expanded.should.be.an.instanceOf Array
        expanded.should.eql source

    it 'should make things smaller', ->
        sourceString = source.join('')
        (compacted.length < sourceString.length).should.be.true

    after ->
        console.log """
        
            Source: #{source.join().length}
            Compacted: #{compacted.length}
        """


        
