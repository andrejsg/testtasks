// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap



$(document).on("change", '#email_field', function() {
		var email_field_value = $("#email_field").val();
    $.ajax({
    		type: "GET",
    		url: "/users/check_email",
    		data: { email: email_field_value }
    });
});

$(document).on("blur", '#email_field', function() {
		var email_field_value = $("#email_field").val();
    $.ajax({
    		type: "GET",
    		url: "/users/check_email",
    		data: { email: email_field_value }
    });
});

$(document).on("focus", '#email_field', function() {
	var notice_text = $("#email_already_taken").text();
	if ( $("#email_already_taken").not(":empty") ) {
		$("#email_already_taken").empty();
	}
});















