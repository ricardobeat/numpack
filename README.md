Numpack
==================

Numpack is a very fast number array packer for node.js and the browser. Useful for packing maps, RGB matrixes and the like. It can achieve anywhere between 10-90% compression rates depending on the randomity of the values.

    numpack = require('numpack')

    compacted = numpack.compact [1,1,2,2,3,3,3]
    // ;2<2=3

    numpack.expand compacted
    // [1,1,2,2,3,3,3] (Array)

It's a very simple form of compression, but it takes advantage of using the identifiers as separators themselves, which gives much better results than turning an array into a string, and then compressing it. It's twice as fast as [lzw-async](https://github.com/hiddentao/lzw-async) while achieving similar (~50%) compression on a random 10k long string.