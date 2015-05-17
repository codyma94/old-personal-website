var Boxlayout = (function() {

  function init() {
    var $el = $("#bl-main");
    var $sections = $el.children("section");

    initEvents($el, $sections);
  }

  function initEvents($el, $sections) {
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
        closeSection($el, $section);
      });

      // close section on 'esc'
      $(document).on('keydown', function(e){
        if (e.keyCode == '27') closeSection($el, $section);
      });
    });
  }
  return {init : init};
})();

var closeSection = (function($el, $section) {
  $section.data('open', false).removeClass();
  $el.removeClass('bl-expand-item');
  window.location.hash = "";
});
