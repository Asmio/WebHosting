$(function () {
    $('#fileupload').fileupload({
        dataType: 'text',
        
        done: function (e, data) {
        	$("#status").append(data.result); 
        },
        
        fail: function (e, data) {
        	$("#status").append(data.result); 
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
            	$("#status").text('только mp4');
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