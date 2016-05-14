$(document).ready(function() {
$("#webcam").scriptcam({ 
	path: 'resources/ScriptCam/',
	fileReady:fileReady,
	cornerRadius:20,
	cornerColor:'e3e5e2',
	onError:onError,
	promptWillShow:promptWillShow,
	showMicrophoneErrors:false,
	showDebug:true,
	onWebcamReady:onWebcamReady,
	setVolume:setVolume,
	timeLeft:timeLeft,
	fileName:'demo166884',
	connected:showRecord
});
setVolume(0);
$("#slider").slider({ animate: true, min: 0, max: 100 , value: 50, orientation: 'vertical', disabled:true});
$("#slider").bind( "slidechange", function(event, ui) {
	$.scriptcam.changeVolume($( "#slider" ).slider( "option", "value" ));
});
});
function showRecord() {
$( "#recordStartButton" ).attr( "disabled", false );
}
function startRecording() {
$( "#recordStartButton" ).attr( "disabled", true );
$( "#recordStopButton" ).attr( "disabled", false );
$( "#recordPauseResumeButton" ).attr( "disabled", false );
$.scriptcam.startRecording();
}
function closeCamera() {
$("#slider").slider( "option", "disabled", true );
$("#recordPauseResumeButton" ).attr( "disabled", true );
$("#recordStopButton" ).attr( "disabled", true );
$.scriptcam.closeCamera();
$('#message').html('Пожалуйста, дождитесь преобразования файла...');
$('#message').attr('title', 'Please wait for the file conversion to finish...');
}
function pauseResumeCamera() {
if ($( "#recordPauseResumeButton" ).attr('value') == 0) {
	if ($( "#recordPauseResumeButton" ).html() == 'Пауза'){
		$( "#recordPauseResumeButton" ).html( "Возобновить" );
	} else {
		$( "#recordPauseResumeButton" ).html( "Resume" );
	}
	$( "#recordPauseResumeButton" ).attr('value', 1);
	$.scriptcam.pauseRecording();
}
else {
	if ($( "#recordPauseResumeButton" ).html() == 'Возобновить'){
		$( "#recordPauseResumeButton" ).html( "Пауза" );
	} else {
		$( "#recordPauseResumeButton" ).html( "Pause" );
	}
	$( "#recordPauseResumeButton" ).attr('value', 0);
	$.scriptcam.resumeRecording();
}
}
function fileReady(fileName) {
$('#recorder').hide();
fileName2=fileName.replace('mp4','gif');
var fileNameNoExtension=fileName.replace(".mp4", "");
jwplayer("mediaplayer").setup({
	width:320,
	height:240,
	file: fileName,
	image: fileNameNoExtension+'_0000.jpg',
	tracks: [{ 
		file: fileNameNoExtension+'.vtt', 
		kind: 'thumbnails'
	}]
});
$.ajax({
    url : 'webcam/downloadFromWebcam',
    data: ({fileURL : fileName}),
    async: false,
    success : function(str){
    	$('#message').html(str + '(<a title="Save" class="webcam-a-save" href="'+fileName+'">Скачать</a>)');
    }
});
$('#mediaplayer').show();
$('.webcam-player').show();
}
function onError(errorId,errorMsg) {
alert(errorMsg);
}
function onWebcamReady(cameraNames,camera,microphoneNames,microphone,volume) {
$( "#slider" ).slider( "option", "disabled", false );
$( "#slider" ).slider( "option", "value", volume );
$.each(cameraNames, function(index, text) {
	$('#cameraNames').append( $('<option></option>').val(index).html(text) )
}); 
$('#cameraNames').val(camera);
$.each(microphoneNames, function(index, text) {
	$('#microphoneNames').append( $('<option></option>').val(index).html(text) )
}); 
$('#microphoneNames').val(microphone);
}
function promptWillShow() {
}
function setVolume(value) {

}
function timeLeft(value) {
$('#timeLeft').val(value);
}
function changeCamera() {
$.scriptcam.changeCamera($('#cameraNames').val());
}
function changeMicrophone() {
$.scriptcam.changeMicrophone($('#microphoneNames').val());
}