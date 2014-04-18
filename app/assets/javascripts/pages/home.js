var $window = $(window);
var _animation_has_run = false;

// <------ Functions for Home Page Start
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
  if($(window).width() > 768 && !_animation_has_run) {

    $('li').removeClass('active');

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
// Functions for Home Page End ----------->


/* Called after document Load
================================ */
$(document).ready(function() {
  show_box();
  triangle_animation();

  $window.resize(function() {
    show_box();
  })
});