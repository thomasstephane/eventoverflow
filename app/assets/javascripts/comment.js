$(document).ready(function(){
  $('.comment-add').on('click', function(event){
    event.preventDefault();
    $(this).parent().find('form.new_comment:first').toggle("slow");
  });

  $('.new_comment').on('submit', function(event) {
    event.preventDefault();
    var error_area = $(this).parent().find('.error-messages:first');
    error_area.hide("slow");
    if ($(this).find('textarea').val() === "") {
      error_area.find('p').text("Your comment can't be blank");
      error_area.show("slow");
    } else {
      $(this).unbind('submit').submit();
    }
  });
});