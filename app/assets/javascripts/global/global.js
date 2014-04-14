// <------------- Functions for Web Global Start
var $window = $(window);

function wrap_element_link_mobile(object, path) {

  if($(this).width() < 768 && !object.parent().is('a')) {
    object.wrap("<a href='" +  path + "'></a>");
  }
  else if($(this).width() > 767 && object.parent().is('a')){
    object.unwrap();
  }
}

function resize_section() {
  var sectionMinHeight = $(window).height() - $('header').height() - $('footer').height() - 7;
  $('section').css('min-height',sectionMinHeight);
}
// Functions For Web Global End ------------->


/* Called after document Load
================================ */
$(document).ready(function() {
  var $mainLogo = $('#main-logo');
  wrap_element_link_mobile($mainLogo, '/');
  resize_section();

  $window.resize(function() {
    resize_section();
    wrap_element_link_mobile($mainLogo, '/');
  });
});