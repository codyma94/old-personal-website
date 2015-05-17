var Boxlayout = (function() {

  function init() {
    var $el = $( "#bl-main" );
    var $sections = $el.children("section");
    var transEndEventNames = {
       'WebkitTransition' : 'webkitTransitionEnd',
       'MozTransition' : 'transitionend',
       'OTransition' : 'oTransitionEnd',
       'msTransition' : 'MSTransitionEnd',
       'transition' : 'transitionend'
    };

    // transition end event name
    var transEndEventName = transEndEventNames[ Modernizr.prefixed( 'transition' ) ];

    // support css transitions
    var supportTransitions = Modernizr.csstransitions;

    initEvents($el, $sections, transEndEventName, transEndEventNames, supportTransitions);
  }

  function initEvents($el, $sections, transEndEventName, transEndEventNames, supportTransitions) {
    $sections.each( function() {

      var $section = $(this);

      // expand the clicked section and scale down the others
      $section.on( 'click', function() {
        var newHash = $section.attr('id');

        if( !$section.data( 'open' ) ) {
          $section.data( 'open', true ).addClass( 'bl-expand bl-expand-top' );
          $el.addClass( 'bl-expand-item' );
        }
        window.location.hash = newHash;

      }).find( 'i.bl-icon-close' ).on( 'click', function(e) {

        // close the expanded section and scale up the others
        $section.data( 'open', false ).removeClass( 'bl-expand' ).on( transEndEventName, function( event ) {
          if( !$( event.target ).is( 'section' ) ) return false;
          $( this ).off( transEndEventName ).removeClass( 'bl-expand-top' );
        } );

        if( !supportTransitions ) {
          $section.removeClass( 'bl-expand-top' );
        }

        $el.removeClass( 'bl-expand-item' );
        window.location.hash = "";

        return false;

      });

      //refactor at some point
      $(document).on('keydown', function(e){
        if (e.keyCode == '27') {
          $section.data( 'open', false ).removeClass( 'bl-expand' ).on( transEndEventName, function( event ) {
            if( !$( event.target ).is( 'section' ) ) return false;
            $( this ).off( transEndEventName ).removeClass( 'bl-expand-top' );
          });

          if( !supportTransitions ) {
            $section.removeClass( 'bl-expand-top' );
          }

          $el.removeClass( 'bl-expand-item' );
          window.location.hash = "";
        }
      });
    });
  }

  return { init : init };

})();
