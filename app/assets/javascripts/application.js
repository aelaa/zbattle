//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

semaphore = 0;

favoriteItemWidth = function() {
  return $('.favorite-works>.item').first().width()
}

favoriteScrollRight = function() {
  to_scroll = $('.favorite-works').scrollLeft() + favoriteItemWidth() * 4
  shift = favoriteItemWidth() * Math.round(to_scroll / favoriteItemWidth())
  $('.favorite-works').stop().animate({ scrollLeft: shift }, "slow")
}

favoriteScrollLeft = function() {
  to_scroll = $('.favorite-works').scrollLeft() - favoriteItemWidth() * 4
  shift = favoriteItemWidth() * Math.round(to_scroll / favoriteItemWidth())
  if (shift >= 0)
    $('.favorite-works').stop().animate({ scrollLeft: shift }, "slow")
}

$('document').ready( function() {
  $(window).resize( function() {
    $('.favorite-works>.item').last().bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function(e) {
      init = $('.favorite-works').scrollLeft()
      number = Math.round(init / favoriteItemWidth())
      $('.favorite-works').animate({ scrollLeft: number * favoriteItemWidth() }, "fast")
      $('.favorite-works>.item').last().unbind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd")
    })
  })
})

document.addEventListener("turbolinks:load", function() {
  path = document.URL.split('/')[3]
  if (path) {
    $(".navbar-nav>li.active").removeClass("active");
    $(".navbar-nav>li#" + path).addClass("active");
  }
})

$('document').ready(function() {
  $(".image").click(function() {
    alert();
  });

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
});
