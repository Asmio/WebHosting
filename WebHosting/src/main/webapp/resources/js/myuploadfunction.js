$(function () {
    $('#fileupload').fileupload({
        dataType: 'text',
        
        done: function (e, data) {
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
        
        send: function (e, data) {
            if (data.files.length > 10) {
                return false;
            }
            var type;
            $.each(data.files, function (index, file) {
            	if (file.type != 'video/mp4'){
            		type = false;
            		return false;
            	}
            	
            });
            if(type == false){
            	if ($("#status").hasClass('file_success')){
            		$("#status").removeClass('file_success');
            		$("#status").addClass('file_error');
            	}
            	$("#status").text("Только mp4!");
            	return false;
            }
        },
 
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progressbar').css('width',progress + '%');
            $('#progressbar').text(progress + '%');
        },
        dropZone: $('#dropzone')
    });
});