# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->

  $('form').on 'click', '.remove_fields', (event) ->
    console.log $(this)
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.twelve12').remove()
    event.preventDefault()
    
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('.donation-reward .span8').last().after($(this).data('fields').replace(regexp, time))
    callback_donation()
    event.preventDefault()

		readURL = (input) ->
		  if input.files and input.files[0]
		    reader = new FileReader()
		    reader.onload = (e) ->
		      $("#image_preview").attr "src", e.target.result

		    reader.readAsDataURL input.files[0]
		$("#project_image").change ->
		  readURL this
