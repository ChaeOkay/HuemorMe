$(document).ready(function() {
  $('.colorpicker').each(function(i, whatAmI){
  	console.log(whatAmI)
  	$(whatAmI).farbtastic($(whatAmI).find(".color"))
  })
  // .farbtastic('.color');
});