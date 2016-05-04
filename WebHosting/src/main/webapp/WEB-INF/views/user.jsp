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
	<title>Home</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/user-page.js"></script>
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
			<c:set var="user" value="${user}"></c:set>	
			<div class="container">
				<div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 user-logo">
					<h3><c:out value="${user.username}"></c:out></h3>
				</div>
				<div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 user-description">
					<div class="col-md-6">
						<c:if test="${pageContext.request.userPrincipal.name == user.username}">
							<c:choose>
								<c:when test="${user.description == null || user.description == ''}">
									<p class="user-description-content"><spring:message code="user.descriptionContent" /></p>
								</c:when>
								<c:otherwise>
									<p class="user-description-content">${user.description}</p>
								</c:otherwise>
						    </c:choose>
						    <div class="user-description-cell">
								<textarea class="user-description-area" rows="3" cols="62" placeholder="<spring:message code="user.descriptionContent" />"></textarea>
								<button class="btn btn-default user-description-save" value=""><spring:message code="user.descriptionButton.save" /></button>
								<button class="btn btn-default user-description-cancel" value=""><spring:message code="user.descriptionButton.cancel" /></button>
							</div>
						</c:if>
						<c:if test="${pageContext.request.userPrincipal.name != user.username}">
							<p class="user-description-content2">${user.description}</p>
						</c:if>
						
					</div>
				</div>
				<div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 video-list">
					<c:if test="${pageContext.request.userPrincipal.name == user.username}">
						<p class="video-list-title"><spring:message code="user.myVideo" />(${videoListSize})</p>
					</c:if>
					<c:if test="${pageContext.request.userPrincipal.name != user.username}">
						<p class="video-list-title"><spring:message code="user.video" />(${videoListSize})</p>
					</c:if>
					<c:set var="count" value="0"></c:set>
					<c:forEach items="${videoList}" var="video">
		    			<div class="col-md-12 col-sm-12 col-xs-12 user-content-cell row">
		    				<div class="col-md-4 col-sm-4 col-xs-4">
			    				<div class="user-content-cell-a">
					    			<a href="${pageContext.request.contextPath}/video/${video.id}">
					    				<img class="user-content-img" src="${pageContext.request.contextPath}/download/image?fileId=${video.id}">
					    				<img class="user-hide-img" src="${pageContext.request.contextPath}/resources/img/play.png">
					    			</a>
				    			</div>
		    				</div>
		    				<c:if test="${pageContext.request.userPrincipal.name == user.username}">
			    				<span title="<spring:message code="user.video.delete" />" class="user-hide-img-delete">
									<img src="${pageContext.request.contextPath}/resources/img/delete.png">
									<input class="idVideo" data-prop="${video.id}" type="hidden" value="${video.id}">
								</span>
		    				</c:if>
		    				<div class="col-md-8 col-sm-8 col-xs-8">
		    					<a class="user-linkvideo-name linkvideo-name" href="${pageContext.request.contextPath}/video/${video.id}" title="${video.name}">${video.name}</a>
			    				<c:if test="${pageContext.request.userPrincipal.name == user.username}">	
			    					<c:choose>
										<c:when test="${video.description == null || video.description == ''}">
												<p class="user-videodescription-content"><spring:message code="user.video.descriptionContent" /></p>
											</c:when>
										<c:otherwise>
												<p class="user-videodescription-content">${video.description}</p>
										</c:otherwise>
								    </c:choose>
								    <div class="user-videodescription-cell col-md-12 col-sm-12 col-xs-12">
										<textarea class="user-videodescription-area col-md-12 col-sm-12 col-xs-12" placeholder="<spring:message code="user.video.descriptionContent" />"></textarea>
										<button class="btn btn-default user-videodescription-save" value=""><spring:message code="user.descriptionButton.save" /></button>
										<button class="btn btn-default user-videodescription-cancel" value=""><spring:message code="user.descriptionButton.cancel" /></button>
									</div>
			    				</c:if>
			    				<c:if test="${pageContext.request.userPrincipal.name != user.username}">
			    					<div class="col-md-12 col-sm-12 col-xs-12">
			    						<p class="user-videodescription-content2">${video.description}</p>
			    					</div>
								</c:if>
							</div>
		    			</div>
				    </c:forEach>
				</div>
			</div>
		</div>
		<footer>
			<div class="container">
				<ul class="nav navbar-nav navbar-left icons">
					<li><a href="${pageContext.request.contextPath}/?lang=ru"><img src="${pageContext.request.contextPath}/resources/img/Russia.png"></a></li>
					<li><a href="${pageContext.request.contextPath}/?lang=en"><img src="${pageContext.request.contextPath}/resources/img/United-Kingdom.png"></a></li>
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
