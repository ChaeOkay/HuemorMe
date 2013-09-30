var adjustBrightness = function(){
  $('.slider-input').slider({
  	range: 'max',
  	min: 1,
  	max: 255,
  	value: 0,
    slide: function(event, ui){
      $(this).next().attr('data-brightness', ui.value)
       $this = $(this).next()
      $.ajax({
      	type: "PATCH",
      	url: '/bridges/' + $this.data('bridge-id') + '/lamps/' + $this.data('lamp-id'),
      	data: 'lamp[command]=set_brightness&lamp[data][brightness]=' + ui.value
      })
    },
    stop: function(event, ui){
    	$this = $(this).next()
      // $.ajax({
      // 	type: "PATCH",
      // 	url: '/bridges/' + $this.data('bridge-id') + '/lamps/' + $this.data('lamp-id'),
      // 	data: 'lamp[command]=set_brightness&lamp[data]=' + ui.value
      // })
    }
  })
}

var setBrightnessValue = function(){
	$('.slider-input').each(function(){
		number = parseInt($(this).next().attr('data-brightness'))
		$(this).slider('value', number)
	})
}

var toggle_on_off = function(){
	$(".on_off").on('ajax:success', function(){
		$button = $(this).children().next().next()
		if ($button.val() === "Toggle on?"){
			$button.val("Toggle off?")
		}
		else {
			$button.val("Toggle on?")
		}
	})
}

$(document).ready(function(){
  adjustBrightness()
  setBrightnessValue()
  toggle_on_off()
})
