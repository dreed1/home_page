(function () {
  var _this = this;

  var views,
      activeViewIndex = 0;

  $(document).ready(function(){
    views = [$('#base'), $('#code'), $('#photos'), $('#music')];
    bindEvents();
  })

  var bindEvents = function() {
    $('.main-header-title').click(function() {
      showBase();
    });
    $('#main-header-music').click(function() {
      showMusic();
    });
    $('#main-header-photos').click(function() {
      showPhotos();
    });
    $('#main-header-code').click(function() {
      showCode();
    });
  }

  var showBase = function() {
    if(activeViewIndex != 0) {
      var $activeView = views[activeViewIndex];
      activeViewIndex = 0;

      $activeView.hide(
        "slide", 
        { direction: "right" }, 
        400, 
        function() {
          $('#base').show("slide", { direction: "left" });
        }
      );
    }
  }

  var showCode = function() {
    if(activeViewIndex != 1) {
      var $activeView = views[activeViewIndex];
      activeViewIndex = 1;
      
      $activeView.hide(
        "slide", 
        { direction: "left" }, 
        400, 
        function() {
          $('#code').show("slide", { direction: "right" });
        }
      );
    }
  }

  var showPhotos = function() {
    if(activeViewIndex != 2) {
      var $activeView = views[activeViewIndex];
      activeViewIndex = 2;
      
      $activeView.hide(
        "slide", 
        { direction: "left" }, 
        400, 
        function() {
          $('#photos').show("slide", { direction: "right" });
        }
      );
    }
  }

  var showMusic = function() {
    if(activeViewIndex != 3) {
      var $activeView = views[activeViewIndex];
      activeViewIndex = 3;
      
      $activeView.hide(
        "slide", 
        { direction: "left" }, 
        400, 
        function() {
          $('#music').show("slide", { direction: "right" });
        }
      );
    }
  }
})();