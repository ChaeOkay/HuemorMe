var adjustBrightness = function(){
  $('.slider-input').slider({
    slide: function(event, ui){
      $(this).next().attr('brightness', ui.value)
    }
  })
}

$(document).ready(function(){
  adjustBrightness()
})
