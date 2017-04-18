// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$( document ).ready(function() {

  // MODAL SCRIPTS
  $('.project-img').on('click', function (event) {
    event.preventDefault();
    var targetModal = '#modal-'+event.target.id;
    $(targetModal).modal();
  });

  // CAROUSEL SCRIPTS
  var lefts = $('.left');
  for (var i=1; i <= lefts.length; i++) {
    var element = '#left-'+i;
    $(element).click(function(e){
      e.preventDefault();
      target = e.target;
      if (target.classList.contains('glyphicon')) {
        target = target.parentElement;
      }
      target = target.id.replace('left-','');
      var items = $('#carousel-'+target).find('.carousel-item')
      var currentItem = items.filter('.active');
      var prevItem = currentItem.prev();
      currentItem.removeClass('active');
      if ( prevItem.length ) {
        currentItem = prevItem.addClass('active');
      } else {
        currentItem = items.last().addClass('active');
      }
    });
  }

  var rights = $('.right');
  for (var i=1; i <= rights.length; i++) {
    var element = '#right-'+i;
    $(element).click(function(e){
      e.preventDefault();
      target = e.target;
      if (target.classList.contains('glyphicon')) {
        target = target.parentElement;
      }
      target = target.id.replace('right-','');
      var items = $('#carousel-'+target).find('.carousel-item')
      var currentItem = items.filter('.active');
      var nextItem = currentItem.next();
      currentItem.removeClass('active');
      if ( nextItem.length ) {
        currentItem = nextItem.addClass('active');
      } else {
        currentItem = items.first().addClass('active');
      }
    });
  }

});