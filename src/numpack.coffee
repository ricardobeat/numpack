numpack = 

    # charCode offset. Only use characters > 58 to exclude numbers
    offset: 58

    compact: (arr) ->

        current = null
        count   = 0
        output  = ''
        last = arr.length

        print = -> output += current + count if count > 0

        for item, i in arr

            item_code = String.fromCharCode(+item + @offset)

            if item_code is current
                count++
            else
                print()
                current = item_code
                count = 1

        print()

        return output

    expand: (src) ->
        output = []

        src.replace /\D\d+/g, (m) =>
            value = +m.charCodeAt(0) - @offset
            count = +m.slice(1)
            while count--
                output.push value

        return output

if module?.exports?
    module.exports = numpack
else
    window.Roller = numpack