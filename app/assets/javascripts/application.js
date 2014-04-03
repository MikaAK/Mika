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
    console.log('This is the path: ' + path);
    object.unwrap();
  }
}

function resize_section() {
  var sectionHeight = $window.height() - $('header').height() - $('footer').height();
  $('section').css('min-height',sectionHeight);

}

function center_tab_text() {
  if($(this).width() < 768) {
    $('.tab-text').css('padding-top', $('.tab-content').height() / 4);
  }
}
/* Functions For Web End
=========================== */


/* Called after document Load
================================ */
$(document).ready(function() {
  
  var $mainLogo = $('#main-logo');
  
  wrap_element_link_mobile($mainLogo, '/');
  center_tab_text();
  resize_section();

  $window.resize(function() {
    wrap_element_link_mobile($mainLogo, '/');
    resize_section();
    center_tab_text();
  })
})