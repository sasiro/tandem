  $(document).ready(function() {
function changeLanguageText() {
   $(".goog-te-combo :first-child").text("English");
    //$('.goog-te-menu-value span:first-child').html('English');
   $('#google_translate_element').fadeIn('slow');
}

 setTimeout(changeLanguageText, 50);
  });