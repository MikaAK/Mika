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
//
//= require analytics.js.coffee
//= require turbolinks
//= require bootstrap.min

/* Functions For Web Start
============================= */
var $window = $(window);
var _animation_has_run = false;

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
    },
    function () {
      $(this).prev().removeClass('button-down');
    }
  );
}

function triangle_animation() {
  $triangleItems = $([$('.current-projects'), $('.secret'), $('.favorite')]);
  $triangleItems.each(function() {
    $(this).hover(function() {
        $triangleItems.each(function() {
          $(this).css('-webkit-animation-play-state', 'paused');
        });
      },
      function() {
        $triangleItems.each(function() {
          $(this).css('-webkit-animation-play-state', 'running');
        });
      }
    );
  });
}

function show_box() {
  if($(window).width() > 768 && _animation_has_run === false) {

    $('.current-projects').removeClass('active');

    $('.tab-content').hide(0, function() {

      $(this).prev().css('right', '29.337803855%');
      $triangleItems = $([$('.current-projects'), $('.secret'), $('.favorite')]);

      $('li').click(function () {
        if (_animation_has_run === false) {

          $triangleItems.each(function() {
            $(this).css('-webkit-animation-play-state', 'running');
            $(this).on('mouseenter', function() {
              $triangleItems.each(function() {
                $(this).off('mouseenter');
                $(this).css('-webkit-animation-play-state', 'running');
              });
            });
          });
        }
        $(this).parent().animate({right: 0}, {
          duration: 3000,
          queue: false,
          complete: function() {

            $('.tab-content').show(1000);
            $triangleItems.each(function() {
              $(this).on('mouseenter', triangle_animation());
            });
            _animation_has_run = true;
          }
        });
      });
    });
    console.log('hitFlagtrue');
  }

  else {

    if($('li').hasClass('active')) {
    }
    else {
      $('.current-projects').addClass('active');
    }
    $('.tab-content').show();
  }
}
/* Functions For Web End
=========================== */


/* Called after document Load
================================ */
$(document).ready(function() {
  var $mainLogo = $('#main-logo');
  show_box();
  console.log(_animation_has_run);
  triangle_animation();
  wrap_element_link_mobile($mainLogo, '/');
  resize_section();
  button_down('.project-year + .darkgreen-button');

  $window.resize(function() {
    resize_section();
    show_box(_animation_has_run);
    wrap_element_link_mobile($mainLogo, '/');
  });
});