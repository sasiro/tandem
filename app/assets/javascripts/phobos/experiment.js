
$( document ).ready(function() {

$( ".facebook-button" ).click(function() {


   trak.io.track('Signed up');
});

$( "#facebook-button-imagen" ).click(function() {

   ga("send","event","registro-facebook","click","imagen");
   trak.io.track('Signed up');
});

$( "#facebook-button-navbar" ).click(function() {

   ga("send","event","registro-facebook","click","navbar");
   trak.io.track('Signed up');
});

});
