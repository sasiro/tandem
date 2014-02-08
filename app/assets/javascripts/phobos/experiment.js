
$( document ).ready(function() {

$( ".facebook-button" ).click(function() {
  
   ga("send","event","registro-facebook","click");
   trak.io.track('Signed up');
});
});