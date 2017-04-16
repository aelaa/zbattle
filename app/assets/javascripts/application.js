//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

function favoriteItemWidth() {
  return $('.favorite-works>.item').first().width()
}

function favoriteScrollRight() {
  to_scroll = $('.favorite-works').scrollLeft() + favoriteItemWidth() * 2;
  shift = favoriteItemWidth() * Math.round(to_scroll / favoriteItemWidth());
  $('.favorite-works').stop().animate({ scrollLeft: shift }, "slow");
}

function favoriteScrollLeft() {
  to_scroll = $('.favorite-works').scrollLeft() - favoriteItemWidth() * 2;
  shift = favoriteItemWidth() * Math.round(to_scroll / favoriteItemWidth());
  if (shift > 0) {
    $('.favorite-works').stop().animate({ scrollLeft: shift }, "slow");
  }
}

$('document').ready(function() {
  $(window).resize(function() {
    // $('.favorite-works>.item').last().bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function(){
      // init = $('.favorite-works').scrollLeft();
      // shift = Math.round(init / favoriteItemWidth());
      // $('.favorite-works').animate({ scrollLeft: init - shift }, "fast");
  // });
  });
});
