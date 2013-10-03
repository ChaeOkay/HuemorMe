var Color = {
	init: function() {
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
		});
		$.farbtastic('#colorpicker', this.callback)
	},

	callback: function(color) {
	// console.log("callback: " + $.farbtastic('#colorpicker').hsl)
		var hsl = Color.getColor()
		var hue = Math.floor(hsl[0]*65535);
		var saturation = Math.floor(hsl[1]*255);
		var brightness 	= Math.floor(hsl[2]*255);
	},

	getColor: function() {
		return $.farbtastic('#colorpicker').hsl;
	}
};

$(document).ready(function() {
	if ($('#colorpicker').length > 0) {
  	Color.init();
  }
});
