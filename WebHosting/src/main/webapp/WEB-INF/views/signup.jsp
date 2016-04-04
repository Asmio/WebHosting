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
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/style.css" rel="stylesheet">
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<title>Insert title here</title>
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
		      <a class="navbar-brand" href="/hosting/"><img src="resources/img/logo.png"></a>
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
		       <li><a href="signin"><spring:message code="main.header.link.logIn" /></a></li>
		       </ul>
		    </div>
		  </div>
		</nav>
	</header>
	<div class="container formregistr">
		<form:form method="POST" action="user-registration" commandName="user" class="form-horizontal" role="form">
			<h3><spring:message code="logAndReg.registr.logo" /></h3>
			<p><spring:message code="logAndReg.registr.logo2" /></p>
			<div class="form-group">
				<form:label path="login" for="user_login" class="col-sm-2 control-label"><spring:message code="logAndReg.login" /></form:label>
				<div class="col-sm-10">
					<form:input path="login" class="form-control" id="user_login" placeholder="Email" /> 
				</div>
				<form:errors path="login"></form:errors>
			</div>
			<div class="form-group">
				<form:label path="password" for="user_password" class="col-sm-2 control-label"><spring:message code="logAndReg.password" /></form:label>
			    <div class="col-sm-10">
			    	<form:input type="password" path="password" class="form-control" id="user_password" placeholder="Password"/>
			  	</div>
			  	<form:errors path="password"></form:errors> 
			</div>
			<div class="form-group">
				<form:label path="confirmPassword" for="repeat_password" class="col-sm-2 control-label"><spring:message code="logAndReg.registr.repeatpassword" /></form:label>
			    <div class="col-sm-10">
			    	<form:input type="password" path="confirmPassword" class="form-control" id="repeat_password" placeholder="Repeat password"/>
			  	</div>
			  	<form:errors path="confirmPassword"></form:errors> 
			</div>
			<div class="form-group">
				<div class="col-sm-12">
			    	<button type="submit" class="btn btn-default"><spring:message code="logAndReg.registr.button" /></button>
			  	</div>
			</div>
		</form:form>
	</div>
	<script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
</body>
</html>