function changePassword(){
	var currentPas = $('#current_password').val();
	currentPas = currentPas.trim();
	if (currentPas == ""){
		$('#current_password').focus();
		return;
	}
	var newPas = $('#new_password').val();
	newPas = newPas.trim();
	if (newPas == ""){
		$('#new_password').focus();
		return;
	}
	var repeatPas = $('#repeat_password').val();
	repeatPas = repeatPas.trim();
	if (repeatPas == ""){
		$('#repeat_password').focus();
		return;
	}
	$.ajax({
        url: 'changePassword',
        data: ({currentPas : currentPas, newPas : newPas, repeatPas : repeatPas}),
        success: function(data) {
        	$('.message-password').text(data);
        	$('#current_password').val('');
        	$('#new_password').val('');
        	$('#repeat_password').val('');
        }
	});
}

$(function() {
   $('.button-change').on('click', changePassword);

})