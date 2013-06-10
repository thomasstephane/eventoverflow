$(document).ready(function(){
  $('#options-display a').on('click', function(event){
    event.preventDefault();
    if ($('#options-display a').text() === "Less options") {
      $('.more-options').slideUp("slow");
      $('#options-display a').text("More Options");
    } else {
      $('.more-options').slideDown("slow");
      $('#options-display a').text("Less options");
    }
  });
});