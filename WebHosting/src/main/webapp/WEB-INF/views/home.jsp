<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/style.css" rel="stylesheet">
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
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
		      <a class="navbar-brand" href="#"><img src="resources/img/logo.png"></a>
		    </div>
		
		    
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <form:form class="navbar-form navbar-left" role="search">
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="...">
		        </div>
		        <button type="submit" class="btn btn-default btn-search"><img alt="" src="resources/img/search.png"></button>
		      </form:form>
		      
		        		      
		      <ul class="nav navbar-nav navbar-right">
			    <form:form class="navbar-form navbar-left">
			        <button type="submit" class="btn btn-default"><spring:message code="main.header.button.addVideo" /></button>
				</form:form>
		        <li><a href="#" data-toggle="modal" data-target="#myModal"><spring:message code="main.header.link.logIn" /></a></li>
		      </ul>
		    </div>
		  </div>
		</nav>
	</header>
		<!-- Modal --> 
		<div class="modal container" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
			<div class="modal-body"> 
				<ul class="nav nav-tabs" id="login-or-register"> 
					<li ><a href="#register" data-toggle="tab"><spring:message code="logAndReg.signup" /></a></li> 
					<li class="active"><a href="#profile" data-toggle="tab"><spring:message code="logAndReg.signin" /></a></li> 
				</ul>
				<div class="tab-content"> 
					<div class="tab-pane" id="register"> 
						<form:form method="POST"  commandName="user" action="registration-user"> 
							<div class="row"> 
								<h3><spring:message code="logAndReg.registr.logo" /></h3> 
								<p><spring:message code="logAndReg.registr.logo2" /></p> 
							</div> 
							<div class="row"> 
								<form:label path="login" for="login"><spring:message code="logAndReg.login" /></form:label> 
								<form:input path="login" id="login" placeholder="Email"/> 
								<span class="required">*</span>
								<form:errors path="login"></form:errors>
							</div> 
							<div class="row"> 
								<form:label path="password" for="password"><spring:message code="logAndReg.password" /></form:label>
								<form:input path="password" id="password" placeholder="Password"/> 
								<span class="required">*</span>
								<form:errors path="password"></form:errors> 
							</div> 
							<div class="row"> 
								<label for="password_repeat"><spring:message code="logAndReg.registr.repeatpassword" /></label> 
								<input id="password_repeat" name="password_repeat" value="" placeholder="Repeat password"/> 
								<span class="required">*</span>
								<span id="comparepassword"></span> 
							</div> 
							<div class="row"> <spring:message code="logAndReg.markedfield" /> </div> 
							<div class="row"> 
								<button class="btn btn-large btn-primary" type="submit"><spring:message code="logAndReg.registr.button" /></button>
							</div> 
						</form:form> 
					</div> 
					<div class="tab-pane active" id="profile"> 
						<form:form method="POST"  commandName="user" action="login-user"> 
							<div class="row"> 
								<h3><spring:message code="logAndReg.login.logo" /></h3> 
								<p><spring:message code="logAndReg.login.logo2" /></p> 
							</div> 
							<div class="row">
								<form:label path="login" for="user_login"><spring:message code="logAndReg.login" /></form:label> 
								<form:input path="login" id="user_login" placeholder="Email" /> 
								<span class="required">*</span>
								<form:errors path="login"></form:errors> 
							</div> 
							<div class="row"> 
								<form:label path="password" for="user_password"><spring:message code="logAndReg.password" /></form:label> 
								<form:input path="password" id="user_password" placeholder="Password"/> 
								<span class="required">*</span>
								<form:errors path="password"></form:errors> 
							</div> 
							<div class="row"> <spring:message code="logAndReg.markedfield" /> </div>  
							<div class="row"> 
								<button class="btn btn-large btn-primary" type="submit"><spring:message code="logAndReg.login.button" /></button> 
							</div> 
						</form:form> 
					</div> 
				</div> 
			</div> 
			<div class="modal-footer"> 
				<button class="btn" data-dismiss="modal" aria-hidden="true"><spring:message code="logAndReg.buttonClose" /></button> 
			</div> 
		</div>
	<script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
