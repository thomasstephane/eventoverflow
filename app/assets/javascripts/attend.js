$(document).ready(function(){
  $('.attend-change').on('click', function(event){
    event.preventDefault();
    $(this).toggle("slow");
    $('.attend-modify').toggle("slow");
    $('.attend p').toggle("slow");
  });
});