// expands section based on hash of url
$(window).on('load hashchange', function(){
  var hash = (window.location.hash).replace('#', '');
  if (hash.length != 0) {
    var $main = $("#bl-main");
    var $sections = $main.children("section");
    var $child;

    switch (hash) {
      case "about":
        $child = $("#bl-main section:nth-child(1)")
        document.title = "Cody Ma | About"
        break;
      case "resume":
        $child = $("#bl-main section:nth-child(2)")
        document.title = "Cody Ma | Resume"
        break;
      case "blog":
        $child = $("#bl-main section:nth-child(3)")
        document.title = "Cody Ma | Blog"
        break;
      case "contact":
        $child = $("#bl-main section:nth-child(4)")
        document.title = "Cody Ma | Contact"
        break;
    }

    $("#bl-main>section.bl-expand").removeClass();
    $child.data('open', false).removeClass('bl-expand');
    if(!$child.data('open')) {
      $child.data('open', true ).addClass('bl-expand bl-expand-top');
    }
  }
});
