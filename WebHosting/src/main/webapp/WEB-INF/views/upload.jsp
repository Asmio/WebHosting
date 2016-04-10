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
	<title>Upload</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.ui.widget.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.iframe-transport.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/myuploadfunction.js"></script>	
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
			            <li><a href="user"><spring:message code="main.header.menu.mypage" /></a></li>
			            <li><a href="#"><spring:message code="main.header.menu.settings" /></a></li>
			            <li role="separator" class="divider"></li>
			            <li>
				            <form action="<c:url value='j_spring_security_logout' />" method="post" id="logoutForm">
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
						<a href="login"><spring:message code="main.header.link.logIn" /></a>
					</li>
				</sec:authorize>
		       </ul>
		       
		    </div>
		  </div>
		</nav>
	</header>
	
	<div class="content">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 upload-logo">
					<p class="upload-logo-content"><spring:message code="upload.logo" /></p>
					<!-- <div class="col-md-12"> -->
						<div id="dropzone" class="col-md-12">
							<img class="img-drag" src="${pageContext.request.contextPath}/resources/img/icon-drag.png">
							<p><spring:message code="upload.draganddrop" /></p>
							<p><spring:message code="or" /></p>
							<div class="file-upload col-md-6 col-md-offset-3">
								<label>
									<input id="fileupload" type="file" name="files[]" data-url="download?${_csrf.parameterName}=${_csrf.token}" multiple>
          							<span><spring:message code="upload.btnComputer" /></span>
								</label>
							</div>
						</div>
						<div id="progress" class="blue stripes col-md-6 col-md-offset-3">
							<div id="progressbar"></div>
						</div>
						<div id="status" class="col-md-6 col-md-offset-3">
						</div>
					<!-- </div> -->
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
</body>
</html>
