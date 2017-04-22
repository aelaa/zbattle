//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

function favoriteItemWidth() {
  return $('.favorite-works>.item').first().width()
}

function favoriteScrollRight() {
  to_scroll = $('.favorite-works').scrollLeft() + favoriteItemWidth() * 4;
  shift = favoriteItemWidth() * Math.round(to_scroll / favoriteItemWidth());
  $('.favorite-works').stop().animate({ scrollLeft: shift }, "slow");
}

function favoriteScrollLeft() {
  to_scroll = $('.favorite-works').scrollLeft() - favoriteItemWidth() * 4;
  shift = favoriteItemWidth() * Math.round(to_scroll / favoriteItemWidth());
  if (shift >= 0) {
    $('.favorite-works').stop().animate({ scrollLeft: shift }, "slow");
  }
}

semaphore = 0;

document.addEventListener("turbolinks:load", function() {
  path = document.URL.split('/')[3]
  $(".navbar-nav>li.active").removeClass("active");
  $(".navbar-nav>li#" + path).addClass("active");
})

$('document').ready(function() {
  $(window).scroll(function() {
    if ($(window).scrollTop() >= $('.navbar').offset().top) {
      if (semaphore == 0) {
        semaphore = 1;
        $('footer').animate({ bottom: 0 }, 200, 'linear', function() { semaphore = 0 });
      }
    } else {
      if (semaphore == 0) {
        semaphore = 1;
        $('footer').animate({ bottom: -30 }, 200, 'linear', function() { semaphore = 0 });
      }
    };
  });
  $(window).resize(function() {
    // $('.favorite-works>.item').last().bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function(){
      // init = $('.favorite-works').scrollLeft();
      // shift = Math.round(init / favoriteItemWidth());
      // $('.favorite-works').animate({ scrollLeft: init - shift }, "fast");
  // });
  });
});
