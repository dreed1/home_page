(function () {
  var _this = this;
  $(document).ready(function(){
     $('.cluster-image').click(function() {
      $(this).colorbox({
        href: $(this).attr('src'),
        maxWidth: '80%',
        maxHeight: '80%',
        transition: 'fade',
        speed: 225,
        showClose: false,
        overlayClose: false,
        onOpen: function() {
          $('#cboxOverlay').addClass('black-overlay');
          $('#cboxContent').hide();
        },
        onComplete: function() {
          $('#cboxContent').show();
        },
        onClose: function() {
          $('#cboxOverlay').removeClass('black-overlay');
        }
      });
    });
  })
})();