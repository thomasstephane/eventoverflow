$.fn.teletype = function(opts){
    var $this = this,
        defaults = {
            animDelay: 50
        },
        settings = $.extend(defaults, opts);

    $.each(settings.text.split(''), function(i, letter){
        setTimeout(function(){
          console.log($this.html());
            $this.html($this.html().slice(0,-1) + letter + '_');
        }, settings.animDelay * i);
    });
};

var words = ["create", "events", "list", "events", "view", "events", "join", "events"];

$(document).ready(function(){

  $('#rolling-title span').teletype({
      animDelay: 150,
      text: 'events'
  });
});