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
$(document).ready(function() {
    toggleTrueRandom();
    toggleCyclicRandom();
    trueRandom();
    cyclicRandom();
    $(window).load(function () {
      console.log("page loaded!");
      removeAbsence();
    });
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

toggleTrueRandom = function() {
  $('.true-random-button').on('click', function(){
    $('#true-random').show()
    $('#cyclic-random').hide()
  })
}
toggleCyclicRandom = function() {
  $('.cyclic-random-button').on('click', function(){
    $('#cyclic-random').show()
    $('#true-random').hide()
  })
}

trueRandom = function() {
  $('#true-random').on("click", function(){
    $.ajax({
      url: this.name,
      method: "GET"
    })
    .done(function(response){
      console.log(response);
      var students = response.shuffle();
        $('#true-random-student').empty()
        $('#true-random-student').html(students[0])
    })
  })
}

cyclicRandom = function() {
  var studentsString = $('#students').val()
  var students = studentsString
    .substr(0, studentsString.length - 2)
    .substr(2)
    .split('", "')
    .shuffle();
    $('#cyclic-random').on('click', function() {
      if (students.length > 1){
        console.log(students);
        $('#cyclic-random-student').empty()
        $('#cyclic-random-student').html(students[0])
        students.splice(0, 1)
      } else if (students.length === 1){
      	$('#cyclic-random-student').empty()
  	    $('#cyclic-random-student').html(students[0])
  	    studentsString = $('#students').val()
  	    students = studentsString
          .substr(0, studentsString.length - 2)
          .substr(2)
          .split('", "')
          .shuffle();
	   } else {
      	console.log('no students');
	   }
   })
}

Array.prototype.shuffle = function() {
    var input = this;
    for (var i = input.length - 1; i >= 0; i--) {
        var randomIndex = Math.floor(Math.random() * (i + 1));
        var itemAtIndex = input[randomIndex];
        input[randomIndex] = input[i];
        input[i] = itemAtIndex;
    }
    return input;
}

removeAbsence = function(){
  $(".biz").on('click', function(event){
    $.ajax({
      url: this.title,
      data: this.id,
      method: "POST"
    })
  })
}
