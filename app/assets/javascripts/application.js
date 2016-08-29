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
  trueRandom();
  cyclicRandom();
});

$(function() {
    $('#search').on('keyup', function() {
        var pattern = $(this).val();
        $('.searchable-container .items').hide();
        $('.searchable-container .items').filter(function() {
            return $(this).text().match(new RegExp(pattern, 'i'));
        }).show();
    });
});

trueRandom = function(){
  $('#true-random').on('click', function(){
    console.log("clicked");
    $.ajax({
      url: '/teachers/'+ $('#teacher_id').val() + '/classrooms/' + $('#classroom_id').val(),
      method: 'GET'
    })
    .done(function(response){
      console.log(response);
      $('#true-random-student').empty()
      $('#true-random-student').html(response)
    })
  })
}

cyclicRandom = function(){
  $('#cyclic-random').on('click', function(){
    console.log("clicked");
    $.ajax({
      url: '/teachers/'+ $('#teacher_id').val() + '/classrooms/' + $('#classroom_id').val() + '/students',
      method: 'GET'
    })
    .done(function(response){
      console.log(response);
      $('#cyclic-random-student').empty()
      $('#cyclic-random-student').html(response)
    })
  })
}
