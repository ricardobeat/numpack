(function() {
  var numpack;

  numpack = {
    offset: 58,
    compact: function(arr) {
      var count, current, i, item, item_code, last, output, print, _i, _len;
      current = null;
      count = 0;
      output = '';
      last = arr.length;
      print = function() {
        if (count > 0) {
          return output += current + count;
        }
      };
      for (i = _i = 0, _len = arr.length; _i < _len; i = ++_i) {
        item = arr[i];
        item_code = String.fromCharCode(+item + this.offset);
        if (item_code === current) {
          count++;
        } else {
          print();
          current = item_code;
          count = 1;
        }
      }
      print();
      return output;
    },
    expand: function(src) {
      var output,
        _this = this;
      output = [];
      src.replace(/\D\d+/g, function(m) {
        var count, value, _results;
        value = +m.charCodeAt(0) - _this.offset;
        count = +m.slice(1);
        _results = [];
        while (count--) {
          _results.push(output.push(value));
        }
        return _results;
      });
      return output;
    }
  };

  if ((typeof module !== "undefined" && module !== null ? module.exports : void 0) != null) {
    module.exports = numpack;
  } else {
    window.Roller = numpack;
  }

}).call(this);
