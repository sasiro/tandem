# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(window).load ->
  isMobile =
    Android: ->
      (if navigator.userAgent.match(/Android/i) then true else false)

    BlackBerry: ->
      (if navigator.userAgent.match(/BlackBerry/i) then true else false)

    iOS: ->
      (if navigator.userAgent.match(/iPhone|iPad|iPod/i) then true else false)

    Windows: ->
      (if navigator.userAgent.match(/IEMobile/i) then true else false)

    any: ->
      isMobile.Android() or isMobile.BlackBerry() or isMobile.iOS() or isMobile.Windows()


  $ ->
    $("#myModal").modal "show"  
    $('#user_language_speak_ids').chosen(placeholder_text_multiple: "My native languages are ..." ) unless isMobile.any()
    $('#user_language_improve_ids').chosen(placeholder_text_multiple: "I am learning ...") unless isMobile.any()

