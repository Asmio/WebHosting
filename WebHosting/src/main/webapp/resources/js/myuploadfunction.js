$(function () {
	var processingMessage;
    $('#fileupload').fileupload({
        dataType: 'text',
        
        send: function (e, data) {
        	$('#status').text("");
        	$('#progressbar').css('width', '0');
            $('#progressbar').text('');
    		var error = false;
    		$.ajax({
    			async: false,
                url: 'checkVideo',
                data: ({nameVideo : encodeURIComponent(data.files[0].name)}),
                success: function(data) {
                	var arr = data.split('/');
                	if (arr[0] == 'error'){
                    	$("#status").removeClass('file_success');
                    	$("#status").addClass('file_error');
                    	$('#status').text(arr[1]);
                		error = true;
                	} else if(arr[0] == 'ok') {
                		processingMessage = arr[1];
                		error = false;
                		$('body').css({cursor:'wait'} );
                	}
                }
    		});
    		if (error == true){
    			return false;	
    		}
            /*if (data.files.length > 10) {
                return false;
            }
            
            var errorMessage;
            var error = false;
        	$.each(data.files, function (index, file) {
            	$.ajax({
                        url: 'checkVideo',
                        data: ({nameVideo : encodeURIComponent(file.name)}),
                        success: function(data) {
                        	var arr = data.split('/');
                        	if (arr[0] == 'error'){
                        		if ($("#status").hasClass('file_success')){
                            		$("#status").removeClass('file_success');
                            		$("#status").addClass('file_error');
                            		$('#status').text(arr[1]);
                            	}
                        		error = true;
                        	}
                        }
                });
            });*/
        },
        
        done: function (e, data) {
        	$('body').css({cursor:'default'} );
        	$("#status").text(data.result);
        	if ($("#status").hasClass('file_error')){
        		$("#status").removeClass('file_error');
        		$("#status").addClass('file_success');
        	} else {
        		if (!$("#status").hasClass('file_success')){
        			$("#status").addClass('file_success');
            	}
        	}	 
        },
        
        fail: function (e, data) {
        	$('body').css({cursor:'default'} );
        	$("#status").text(data.result);
        	if ($("#status").hasClass('file_success')){
        		$("#status").removeClass('file_success');
        		$("#status").addClass('file_error');
        	} else {
        		if (!$("#status").hasClass('file_error')){
        			$("#status").addClass('file_error');
            	}
        	} 
        },
 
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progressbar').css('width',progress + '%');
            $('#progressbar').text(progress + '%');
            if (progress == 100){
            	$("#status").text(processingMessage);
            }
        },
        dropZone: $('#dropzone')
    });
});