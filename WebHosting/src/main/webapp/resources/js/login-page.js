function restorePassword(){
   var username = $('#user_login').val();
   username = username.trim();
   if (username == ""){
		$('#user_login').focus();
		return;
   }
   $.ajax({
        url: 'restorePassword',
        data: ({username : encodeURIComponent(username)}),
        success: function(data) {
        	$('#message-restore').text(data);
        }
   });
}