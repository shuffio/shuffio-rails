// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

function resize_board_elements() {
  $('.board').each(function() {
    var height = $(this).height();
    $(this).css({
        'font-size': (height * .6) + 'px',
        'line-height': height + 'px'
    })
  });
}

function form_submit_js() {
  document.getElementById("import_admin_teams_file").onchange = function() {
      document.getElementById("import_admin_teams_form").submit();
  };
}

document.addEventListener("DOMContentLoaded", resize_board_elements);
window.addEventListener("resize", resize_board_elements);
document.addEventListener("DOMContentLoaded", form_submit_js);

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
