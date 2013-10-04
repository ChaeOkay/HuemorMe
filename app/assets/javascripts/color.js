window.onload = function() {
	window.addEventListener('shake', shakeEventDidOccur, false);
		console.log("SHAKE")
		//function to call when shake occurs
		function shakeEventDidOccur () {

		  //put your own code here etc.
		  	var randomColor = '#' + (Math.random()*0xFFFFFF<<0).toString(16);
		  	$.farbtastic('#colorpicker').setColor(randomColor)
		  	$('.imageblock').css("backgroundColor", randomColor)
		  	makeAjax();
	}
}

function callback(color) {
	// console.log("callback: " + $.farbtastic('#colorpicker').hsl)
			$('.imageblock').css("backgroundColor", color)
			var hsl = getColor()
			var hue = Math.floor(hsl[0]*65535);
			var saturation = Math.floor(hsl[1]*255);
			var brightness 	= Math.floor(hsl[2]*255);
}

function getColor() {
	return $.farbtastic('#colorpicker').hsl;
}

function makeAjax() {
	var hsl = getColor()
	var hue = Math.floor(hsl[0]*65535);
	var saturation = Math.floor(hsl[1]*255);
	var brightness 	= Math.floor(hsl[2]*255);
	console.log("On mouseup: " + hsl)
	$self = $("#color_setter")
	      $.ajax({
	      	type: "GET",
	      	url: '/bridges/' + $self.data('bridge-id') + '/lamps/' + $self.data('lamp-id') + '/settings',
	      	data: 'lamp[command]=set_color_and_sat&lamp[data][color]=' + hue + '&lamp[data][saturation]=' + saturation + '&lamp[data][brightness]=' + brightness
	      })
}

$("#colorpicker").mouseup(function(){
	makeAjax();
})

$(document).ready(function() {
	$('#colorpicker').addTouch();
	$.farbtastic('#colorpicker', callback)
});

