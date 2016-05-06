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
		<header>
			<nav class="navbar navbar-default menu">
			  <div class="container-fluid">
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
			    </div>
			
			    
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <form:form class="navbar-form navbar-left" role="search">
			        <div class="form-group">
			          <input type="text" class="form-control" placeholder="...">
			        </div>
			        <button type="submit" class="btn btn-default btn-search"><img alt="" src="${pageContext.request.contextPath}/resources/img/search.png"></button>
			      </form:form>
	        		      
			      <ul class="nav navbar-nav navbar-right">
			      	<li>
			      		<a href="uploadpage"><button type="button" class="btn btn-default navbar-left btn-add-video"><spring:message code="main.header.button.addVideo" /></button></a>
				    </li>
					<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
						<li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${pageContext.request.userPrincipal.name}<span class="caret"></span></a>
				          <ul class="dropdown-menu">
				            <li><a href="${pageContext.request.contextPath}/user/${pageContext.request.userPrincipal.name}"><spring:message code="main.header.menu.mypage" /></a></li>
				            <li><a href="#"><spring:message code="main.header.menu.settings" /></a></li>
				            <li role="separator" class="divider"></li>
				            <li>
					            <form action="${pageContext.request.contextPath}/j_spring_security_logout" method="post" id="logoutForm">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								</form>
								<script>
									function formSubmit() {
										document.getElementById("logoutForm").submit();
									}
								</script>
					            <a href="javascript:formSubmit()"><spring:message code="main.header.menu.exit" /></a>
				            </li>
				          </ul>
				        </li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ANONYMOUS')">
						<li>
							<a href="${pageContext.request.contextPath}/login"><spring:message code="main.header.link.logIn" /></a>
						</li>
					</sec:authorize>
			       </ul>
			       
			    </div>
			  </div>
			</nav>
		</header>
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
		<footer>
			<div class="container">
				<ul class="nav navbar-nav navbar-left icons">
					<li><a href="?lang=ru"><img src="${pageContext.request.contextPath}/resources/img/Russia.png"></a></li>
					<li><a href="?lang=en"><img src="${pageContext.request.contextPath}/resources/img/United-Kingdom.png"></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right icons">
					<li><a href="https://plus.google.com/u/0/106938424992200410927" target="_blank"><img src="${pageContext.request.contextPath}/resources/img/google.png"></a></li>
					<li><a href="http://vk.com/karlopap" target="_blank"><img src="${pageContext.request.contextPath}/resources/img/vkontakte.png"></a></li>
					<li><a href="https://twitter.com/gon4arikvadim" target="_blank"><img src="${pageContext.request.contextPath}/resources/img/twitter.png"></a></li>
					<li><a href="https://www.facebook.com/profile.php?id=100010436075953" target="_blank"><img src="${pageContext.request.contextPath}/resources/img/facebook.png"></a></li>
				</ul>
			</div>
		</footer>
	</div>	
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
