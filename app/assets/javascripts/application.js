// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap.min

/* Functions For Web Start
============================= */
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

function button_down(element) {
  $element = $(element);
  $element.hover(function () {
    $(this).prev().addClass('button-down');
  }, function () {
    $(this).prev().removeClass('button-down');
  });;
}

function triangle_animation() {
  $currentProject = $('.current-projects');
  $secret = $('.secret');
  $favorite = $('.favorite');

  if ($window.width() < 992) {

  }

  $currentProject.hover(function() {
    $(this).css('-webkit-animation-play-state', 'paused');
    $secret.css('-webkit-animation-play-state', 'paused');
    $favorite.css('-webkit-animation-play-state', 'paused');
  }, function() {
    $(this).css('-webkit-animation-play-state', 'running');
    $secret.css('-webkit-animation-play-state', 'running');
    $favorite.css('-webkit-animation-play-state', 'running');
  });
  $secret.hover(function() {
    $currentProject.css('-webkit-animation-play-state', 'paused');
    $favorite.css('-webkit-animation-play-state', 'paused');
    $(this).css('-webkit-animation-play-state', 'paused');
  }, function() {
    $(this).css('-webkit-animation-play-state', 'running');
    $currentProject.css('-webkit-animation-play-state', 'running');
    $favorite.css('-webkit-animation-play-state', 'running');
  });
  $favorite.hover(function() {
    $(this).css('-webkit-animation-play-state', 'paused');
    $secret.css('-webkit-animation-play-state', 'paused');
    $currentProject.css('-webkit-animation-play-state', 'paused');
  }, function() {
    $(this).css('-webkit-animation-play-state', 'running');
    $secret.css('-webkit-animation-play-state', 'running');
    $currentProject.css('-webkit-animation-play-state', 'running');
  });
}

// function hide_box() {
//   $('tab-content').hide();

//   if ($window.window)
// }
/* Functions For Web End
=========================== */


/* Called after document Load
================================ */
$(document).ready(function() {

  var $mainLogo = $('#main-logo');
  triangle_animation();
  wrap_element_link_mobile($mainLogo, '/');
  resize_section();
  button_down('.project-year + .darkgreen-button');

  $window.resize(function() {
    wrap_element_link_mobile($mainLogo, '/');
    resize_section();
    });
});