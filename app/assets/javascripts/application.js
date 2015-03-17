// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require pikaday

var JobHunt = {
  init: function() {
    this.date_picker();
  },

  // initialize all the date pickers on the page using Pikaday
  date_picker: function() {
    var $inputs = $('[type=datetime]');

    for (var i = 0; i < $inputs.length; i++) {
      var picker = new Pikaday({ field: $inputs[i] });
    }
  }
};


$(function() {
  JobHunt.init();
});
