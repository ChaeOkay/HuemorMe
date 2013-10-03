function callback(color) {
	// console.log("callback: " + $.farbtastic('#colorpicker').hsl)

			var hsl = getColor()
			var hue = Math.floor(hsl[0]*65535);
			var saturation = Math.floor(hsl[1]*255);
			var brightness 	= Math.floor(hsl[2]*255);
}

function getColor() {
	return $.farbtastic('#colorpicker').hsl;
}

$("#colorpicker").mouseup(function(){
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
})

$(document).ready(function() {
	$.farbtastic('#colorpicker', callback)
});