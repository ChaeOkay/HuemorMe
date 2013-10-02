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


$(document).ready(function(){
	bridgeConfig.register()
})