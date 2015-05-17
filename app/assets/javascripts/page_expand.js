// expands section based on hash of url
window.onload = function(){
  var hash = (window.location.hash).replace('#', '');
  if (hash.length != 0) {
    var $main = $("#bl-main");
    var $sections = $main.children("section");
    var $child;

    switch (hash) {
      case "about":
        console.log("about");
        $child = $("#bl-main section:nth-child(1)")
        break;
      case "resume":
        console.log("resume");
        $child = $("#bl-main section:nth-child(2)")
        break;
      case "blog":
        console.log("blog");
        $child = $("#bl-main section:nth-child(3)")
        break;
      case "contact":
        console.log("contact");
        $child = $("#bl-main section:nth-child(4)")
        break;
    }

    var transEndEventNames = {
       'WebkitTransition' : 'webkitTransitionEnd',
       'MozTransition' : 'transitionend',
       'OTransition' : 'oTransitionEnd',
       'msTransition' : 'MSTransitionEnd',
       'transition' : 'transitionend'
    };
    var transEndEventName = transEndEventNames[ Modernizr.prefixed( 'transition' ) ];

    $child.data( 'open', false ).removeClass( 'bl-expand' ).on( transEndEventName, function( event ) {
      if( !$( event.target ).is( 'section' ) ) return false;
      $( this ).off( transEndEventName ).removeClass( 'bl-expand-top' );
    });

    $main.removeClass( 'bl-expand-item' );
    if( !$child.data( 'open' ) ) {
      $child.data( 'open', true ).addClass( 'bl-expand bl-expand-top' );
      $main.addClass( 'bl-expand-item' );
    }
  }

}
