$(document).ready(function(){
  $('.comment-add').on('click', function(event){
    event.preventDefault();
    $(this).parent().find('form.new_comment:first').toggle("slow");
  });
});