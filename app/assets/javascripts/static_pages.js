var Boxlayout = (function() {

  function init() {
    var $el = $( "#bl-main" );
    var $sections = $el.children("section");

    $sections.each(function() {
      var $section = $(this);

      // expand the clicked section and scale down the others
      $section.on('click', function() {
        if(!$section.data('open') ) {
          $section.data('open', true).addClass('bl-expand bl-expand-top');
          $el.addClass('bl-expand-item');
        }
        window.location.hash = $section.attr('id');
      }).find('i.bl-icon-close').on('click', function(e) {
        sectionClose($el, $section);
        return false;
      });

      // close section on 'esc'
      $(document).on('keydown', function(e){
        if (e.keyCode == '27') sectionClose($el, $section);
      });
    });
  }

  return {init : init};

})();

var sectionClose = (function($el, $section) {
  $section.data('open', false).removeClass();
  $el.removeClass('bl-expand-item');
  window.location.hash = "";
  document.title = "Cody Ma";
});
