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
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
  $('.rating_btn').click(function(e){
    e.preventDefault();
    url = $(this).attr('href');

    $.ajax({
      type: "GET",
      url: url,
      success: function(data){
         //$("#ratings").hide();
         $(".ratings").html(data);
      }
    });
  })
  $('.rating_btn').mouseover(function(){
    $('.rating_btn').slice(0, $('.rating_btn').index(this)+1).css("color", "yellow")
  });
  $('.rating_btn').mouseleave(function(){
    $('.rating_btn').css("color", "gray")
  });
})
