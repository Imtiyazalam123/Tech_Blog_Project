/**
 * 
 */
/*$(document).ready(function(e){
	alert("js page has loaded.....");
}) */

function doLike(pid, uid, temp){
	console.log(pid + "   " + uid);
	
	const d = {
		uid: uid,
		pid: pid,
		operation: 'like'
	}
	
	$.ajax({
		url: 'LikeServlet',
		data: d,
		
		success: function (data, textStatus, jqXHR) {
			console.log(data)
			if(data.trim() == 'true'){
	
				let c = $(temp).text();
				c++;
				console.log(c);
				$(temp).html("<i class = 'fa fa-thumbs-o-up'></i> <span>"+ c +"</span>");
				$(temp).addClass('btn-light text-dark')
			}
			else {
				
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("Error")
		}
	})
}