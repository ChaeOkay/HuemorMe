function Lamp(elem){
	this.$elem = elem
	thing = elem
	this.init();
}

Lamp.prototype = {
	init: function() {
		this.set_toggle_on_off_listener();
		this.adjustBrightness();
		this.on_off()
		this.set_color_toggle_on_off_listener();
	},
	// init: function() {
	// 	this.adjustBrightness();
	// 	this.setBrightnessValue();
	// 	this.toggle_on_off();
	// 	this.toggle_colorloop_on_off();
	// },
	set_color_toggle_on_off_listener: function(){
		var self = this
		self.$getColorOnOffForm().on('ajax:success', function(){
			self.colorToggleOnOff();
		})
	},

	$getColorOnOffForm: function() {
		//colorloop
		return this.$elem.find(".colorloop")
	},

	colorToggleOnOff: function(){
		if (this.getColorOnOffHiddenField().val() === "turn_colorloop_on") {
			this.getColorOnOffHiddenField().val("turn_colorloop_off")
			this.getColorOnOffButton().val("Turn colorloop off?")
			console.log("in conditional if")
		} else {
			this.getColorOnOffHiddenField().val("turn_colorloop_on")
			this.getColorOnOffButton().val("Turn colorloop on?")
			console.log("in conditional else")
		}
	},

	getColorOnOffHiddenField:function(){
		return this.$getColorOnOffForm().find(".colorloop_hidden_value")
	},
	getColorOnOffButton:function(){
		return this.$getColorOnOffForm().find('.tiny.button')
	},

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

	on_off: function(){
    $('.imageblock').on('click', function(e){
      e.preventDefault()
      $('form.on_off').submit()

      if ($('.imageblock img').attr('src') == '/assets/arrow_on.png') {
        $('.imageblock img').attr('src', '/assets/arrow_off.png').fadeIn("slow")
      } else {
        $('.imageblock img').attr('src', '/assets/arrow_on.png').fadeIn("slow")
      }
    })
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
});
