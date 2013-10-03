function Lamp(elem){
	this.$elem = elem
	thing = elem
	this.init();
}

Lamp.prototype = {
	init: function() {
		this.set_toggle_on_off_listener();
		this.adjustBrightness();
	},
	// init: function() {
	// 	this.adjustBrightness();
	// 	this.setBrightnessValue();
	// 	this.toggle_on_off();
	// 	this.toggle_colorloop_on_off();
	// },

	adjustBrightness: function(){
	  this.$getSlider().slider({
	  	range: 'max',
	  	min: 1,
	  	max: 255,
	  	value: this.getBrightnessValue(),
	    slide: function(event, ui){
	      $(this).next().attr('data-brightness', ui.value)
	    },
	    stop: function(event, ui){
	    	$this = $(this).next()
	      $.ajax({
	      	type: "GET",
	      	url: '/bridges/' + $this.data('bridge-id') + '/lamps/' + $this.data('lamp-id') + '/settings',
	      	data: 'lamp[command]=set_brightness&lamp[data][brightness]=' + ui.value
	      })
	    }
	  })
	},
	$getSlider:function(){
		return this.$elem.find('.slider-input')
	},
	$getBrightness:function(){
		return this.$elem.find('.brightvalue')
	},
	getBrightnessValue: function(){
		return parseInt(this.$getBrightness().attr('data-brightness'))
	},

	set_toggle_on_off_listener: function(){
		var self = this
		self.$getOnOffForm().on('ajax:success', function(){
			self.toggleOnOff()
		})
	},
	$getOnOffForm:function(){
		return this.$elem.find(".on_off")
	},
	toggleOnOff:function(){
		if (this.getOnOffHiddenField().val() === "turn_on") {
			this.getOnOffHiddenField().val("turn_off")
			this.getOnOffButton().val("Turn Off?")
		} else {
			this.getOnOffHiddenField().val("turn_on")
			this.getOnOffButton().val("Turn On?")
		}
	},	
	getOnOffHiddenField:function(){
		return this.$getOnOffForm().find('.submit_hidden_value')
	},
	getOnOffButton:function(){
		return this.$getOnOffForm().find('.tiny.button')
	}
		// $button = $(this).children().next().next()
		// if ($button.val() === "Turn on?"){
		// 	$button.val("Turn off?")
		// }
		// else {
		// 	$button.val("Turn on?")
		// }
	// toggle_colorloop_on_off: function(){
	// 	$(".colorloop").on('ajax:success', function(){
	// 	$button = $(this).children().next().next()
	// 	if ($button.val() === "Turn colorloop on?"){
	// 		$button.val("Turn colorloop off?")
	// 	}
	// 	else {
	// 		$button.val("Turn colorloop on?")
	// 	}
	// })
	// }
}

$(document).ready(function(){
	lamps = []
	$('.lamp').each(function(i,elem){
		lamps.push(new Lamp($(elem)))
	})
})

