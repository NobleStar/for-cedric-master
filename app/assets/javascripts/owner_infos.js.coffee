# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	readURL = (input) ->
		if input.files and input.files[0]
			reader = new FileReader()
			reader.onload = (e) ->
				$("#owner_img").attr "src", e.target.result

			reader.readAsDataURL input.files[0]
	$("#owner_info_photo").change ->
		readURL this