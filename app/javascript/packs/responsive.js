// スクロール上下に伴う動きをつける
$(function() {
  var navbarHeight = $(".navbar").outerHeight();
  var didScroll;
  var lastScrollTop = 0;
  var delta = 5;

  $(window).scroll(function(event){
    didScroll = true;
  });

  setInterval(function() {
    if (didScroll) {
      hasScrolled();
      didScroll = false;
    }
  }, 250);

  function hasScrolled() {
    var scrollTop = $(this).scrollTop();

    if (Math.abs(lastScrollTop - scrollTop) <= delta)
      return;

    if (scrollTop > lastScrollTop && scrollTop > navbarHeight){
      $('.navbar').removeClass('nav-down').addClass('nav-up');
    } else {
      if(scrollTop + $(window).height() < $(document).height()) {
        $('.navbar').removeClass('nav-up').addClass('nav-down');
      }
    }

    lastScrollTop = scrollTop;
  }
});