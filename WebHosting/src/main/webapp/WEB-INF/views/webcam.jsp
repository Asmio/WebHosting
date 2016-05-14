<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Webcam</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style-webcam.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
	<link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jwplayer/jwplayer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ScriptCam/scriptcam.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/webcam-page.js"></script>
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container-fluid main">
		<%@ include file="header.jsp" %>
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-xs-4 col-xs-offset-4 webcam-content">
						<div id="recorder">
							<div class="webcam-content-title"><spring:message code="webcam.title"/></div>
							<div id="webcam"></div>
							<br clear="both"/>
							<div id="setupPanel">
								<img src="${pageContext.request.contextPath}/resources/ScriptCam/webcamlogo.png" style="vertical-align:text-top"/>
								<select id="cameraNames" size="1" onChange="changeCamera()" style="width:145px;font-size:10px;height:25px;">
								</select>
								<img src="${pageContext.request.contextPath}/resources/ScriptCam/miclogo.png" style="vertical-align:text-top;"/>
								<select id="microphoneNames" size="1" onChange="changeMicrophone()" style="width:128px;font-size:10px;height:25px;">
								</select>
							</div>
							<div style="text-align: center;">
								<button id="recordStartButton" class="btn btn-small" onclick="startRecording()" disabled><spring:message code="webcam.start" /></button>&nbsp;
								<button id="recordPauseResumeButton" class="btn btn-small" value="0" onclick="pauseResumeCamera()" disabled><spring:message code="webcam.pause" /></button>
								<button id="recordStopButton" class="btn btn-small" onclick="closeCamera()" disabled><spring:message code="webcam.stop" /></button>
								<div style="padding-left:5px;padding-right:5px;">
									<spring:message code="webcam.time" />
									<input type="text" id="timeLeft" style="width:50px;font-size:10px;">&nbsp;
								</div>
							</div>
						</div>
						<div class="webcam-player"><div id="mediaplayer" style="display:none;"></div></div>
						
						<div id="message" class="webcam-message"></div>	
					</div>
				</div>
			</div>	
		</div>
		<%@ include file="footer.jsp" %>
	</div>	
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
