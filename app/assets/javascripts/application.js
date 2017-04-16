//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

function favoriteItemWidth() {
  return $('.favorite-works>.item').first().width()
}

function favoriteScrollRight() {
  init = $('.favorite-works').scrollLeft();
  $('.favorite-works').animate({ scrollLeft: init + favoriteItemWidth() * 2 }, "slow");
}

function favoriteScrollLeft() {
  init = $('.favorite-works').scrollLeft();
  if (init > 0) {
    $('.favorite-works').animate({ scrollLeft: init - favoriteItemWidth() * 2 }, "slow");
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
