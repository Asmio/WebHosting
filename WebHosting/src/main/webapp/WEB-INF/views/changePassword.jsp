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
	<title><spring:message code="main.header.menu.changepass" /></title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/change-password-page.js"></script>
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container-fluid main">
		<%@ include file="header.jsp" %>
		<div class="content">
			<div class="container formregistr">
				<h4><spring:message code="changePassword.logo" /></h4>
				<div class="col-md-12 col-sm-12 col-xs-12 change-pass-div">
					<label for="current_password" class="col-md-4 col-sm-4 col-xs-4 change-pass-label"><spring:message code="changePassword.currentPassword" /></label>
					<div class="col-md-8 col-sm-8 col-xs-8 change-pass-input">
						<input type="password" class="form-control" id="current_password" placeholder="<spring:message code="changePassword.currentPassword" />" /> 
					</div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 change-pass-div">
					<label for="new_password" class="col-md-4 col-sm-4 col-xs-4 change-pass-label"><spring:message code="changePassword.newPassword" /></label>
				    <div class="col-md-8 col-sm-8 col-xs-8 change-pass-input">
				    	<input type="password" class="form-control" id="new_password" placeholder="<spring:message code="changePassword.newPassword" />"/>
				  	</div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 change-pass-div">
					<label for="repeat_password" class="col-md-4 col-sm-4 col-xs-4 change-pass-label"><spring:message code="logAndReg.registr.repeatpassword" /></label>
				    <div class="col-md-8 col-sm-8 col-xs-8 change-pass-input">
				    	<input type="password" class="form-control" id="repeat_password" placeholder="<spring:message code="logAndReg.registr.repeatpassword" />"/>
				  	</div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 message-password"></div>
				<div class="col-md-12 col-sm-12 col-xs-12 change-pass-div">
					<div class="col-sm-12">
				    	<button type="button" class="btn btn-default button-change"><spring:message code="changePassword" /></button>
				  	</div>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp" %>
	</div>	
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
