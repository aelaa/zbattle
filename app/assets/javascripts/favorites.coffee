favoriteItemWidth = ->
  return $('.favorite-works>.item').first().width()

favoriteScrollRight = ->
  to_scroll = $('.favorite-works').scrollLeft() + favoriteItemWidth() * 4
  shift = favoriteItemWidth() * Math.round(to_scroll / favoriteItemWidth())
  $('.favorite-works').stop().animate({ scrollLeft: shift }, "slow")

favoriteScrollLeft = ->
  to_scroll = $('.favorite-works').scrollLeft() - favoriteItemWidth() * 4
  shift = favoriteItemWidth() * Math.round(to_scroll / favoriteItemWidth())
  if (shift >= 0)
    $('.favorite-works').stop().animate({ scrollLeft: shift }, "slow")

$('document').ready( ->
  $(window).resize( ->
    $('.favorite-works>.item').last().bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", (e) ->
      init = $('.favorite-works').scrollLeft()
      shift = Math.round(init / favoriteItemWidth())
      $('.favorite-works').animate({ scrollLeft: init - shift }, "fast")
    )
  )
)
