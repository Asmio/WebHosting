$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
 
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progressbar').css('width',progress + '%');
            if(progress == 100){
            	$('#progressbar').css('width','0%');
            }
        },
        dropZone: $('#dropzone')
    });
});