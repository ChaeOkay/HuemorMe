var adjustBrightness = function(){
  $('.slider-input').slider({
    slide: function(event, ui){
      $(this).next().attr('data-brightness', ui.value)
      $this = $(this).next()
      $.ajax({
      	type: "POST",
      	url: '/bridges/' + $this.data('bridge_id') + '/lamps/' + $this.data('lamp_id'),
      	data: // input params
      })
    }
  })
}

$(document).ready(function(){
  adjustBrightness()
})
