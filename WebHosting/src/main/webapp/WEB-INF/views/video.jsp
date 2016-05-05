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
	<title>Video</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery.min.js"></script>
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
			      		<a href="${pageContext.request.contextPath}/uploadpage"><button type="button" class="btn btn-default navbar-left btn-add-video"><spring:message code="main.header.button.addVideo" /></button></a>
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
			<div class="container-fluid">
				<c:set var="video" value="${video}"></c:set>
				<div class="row">
					<div class="col-md-8 col-sm-8 col-xs-8">
						<video class="videoplayer col-md-12 col-sm-12 col-xs-12" controls="controls" preload="none" poster="${pageContext.request.contextPath}/download/image?fileId=${video.id}">
							<source src="${pageContext.request.contextPath}/download/video/${video.id}" type="video/mp4">
						</video>
						<div class="videoplayer-description col-md-12 col-sm-12 col-xs-12">
							<div class="clearfix">
								<h3 class="col-md-8 col-sm-8 col-xs-8 videoplayer-description-title"><c:out value="${video.name}"></c:out></h3>
								<a href="${pageContext.request.contextPath}/user/${video.username}" class="col-md-4 col-sm-4 col-xs-4 videoplayer-description-username">
									${video.username}
								</a>
							</div>
						</div>
						<div class="videoplayer-description col-md-12 col-sm-12 col-xs-12">
							<div class="clearfix">
								<div class="col-md-8 col-sm-8 col-xs-8 videoplayer-description-text">${video.description}</div>
							</div>
								<div class="col-md-4 col-md-offset-8 col-sm-4 col-sm-offset-8 col-xs-4 col-xs-offset-8 videoplayer-description-datePublication"><spring:message code="video.description.datePublication" />${video.datePublication}</div>		
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4">
						<div class="col-md-12 col-sm-12 col-xs-12 video-other-content">
							<div><spring:message code="video.otherVideo" /></div>
							<c:forEach items="${videoList}" var="video">
				    			<div class="col-md-12 col-sm-12 col-xs-12 video-other-content-cell">
				    				<div class="col-md-7 col-sm-7 col-xs-7 video-other-content-cell-a">
					    				<a href="${pageContext.request.contextPath}/video/${video.id}">
					    					<img class="video-other-content-img" src="${pageContext.request.contextPath}/download/image?fileId=${video.id}">
					    					<img class="video-other-hide-img" src="${pageContext.request.contextPath}/resources/img/play.png">
					    				</a>
					    			</div>
					    			<div class="col-md-5 col-sm-5 col-xs-5">
					    				<a href="${pageContext.request.contextPath}/video/${video.id}" title="${video.name}" class="video-other-linkvideo-name">${video.name}</a>	
					    			</div>
					    		</div>			    			
						    </c:forEach>
						</div>
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
