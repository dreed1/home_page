(function () {
  var _this = this;
  this.applyBindings = function() {
    console.log('bindings appliead')
  }
  $(document).ready(function(){
    _this.applyBindings();
  })
})();