$(document).ready(function(){
  $('.attend-change').on('click', function(event){
    event.preventDefault();
    $('.attend-modify').toggle("slow");
  });
});