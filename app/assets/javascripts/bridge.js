var bridgeConfig = {

	register: function(){
		$("#getIP").on("click", function(e){
			e.preventDefault()
			$.ajax({
				url: 'https://www.meethue.com/api/nupnp',
				type: 'GET'
			}).done(function(result){
					var deviceId = result[0].id
					var ip = result[0].internalipaddress
					$.ajax({
						url: 'http://' + ip + '/api',
						method: 'POST',
						data: JSON.stringify({"devicetype":"huemorme","username":"Huemoremesilly"})
					}).done(function(result){
						if(result[0].error === undefined){
							$("#getIP").hide()
							$(".new_bridge").toggleClass("hide")
							$("#connect_message").hide()
							$("#bridgeIp").val(ip)
							$("#deviceId").val(deviceId)
						} else {
							$("body").append(
								"<small class=error>" + result[0].error.description + "</small>"
								)
						}
					})
			})
		})	
	}
}

var lampConfig = {

	search: function(){
		$("#addLamps").on("click", function(e){
			e.preventDefault()
			ip = $(this).data("ip")
			$.ajax({
				method: 'GET',
				url: 'http://' + ip + '/api/Huemoremesilly/lights'
			}).done(function(result){
				var lampArray = []
				for (var key in result) {
					if (result.hasOwnProperty(key)) {
						lampArray.push(key)
					}
				}
				$("#addLamps").append("<input name='lamp_ids' type='hidden' value=" + lampArray + ">")
				$("#addLamps").off("click")
				$("#addLamps").trigger("click")
			})
		})
	}
}


$(document).ready(function(){
	bridgeConfig.register()
	lampConfig.search()
})