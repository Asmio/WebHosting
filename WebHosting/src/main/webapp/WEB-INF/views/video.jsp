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
	<script src="${pageContext.request.contextPath}/resources/js/video-page.js"></script>
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container-fluid main">
		<%@ include file="header.jsp" %>
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
						<sec:authorize access="hasRole('ROLE_USER')">
							<div class="videoplayer-description videoplayer-description-comment col-md-8 col-sm-8 col-xs-8">
								<img class="col-md-2 col-sm-2 col-xs-2" src="${pageContext.request.contextPath}/resources/img/comment.png">
								<textarea id="comment-area" class="form-control col-md-10 col-sm-10 col-xs-10" maxlength="300" onkeypress="return isNotMax(event)" placeholder="<spring:message code="video.comment.text" />"></textarea>
								<button class="send-comment col-md-2 col-sm-2 col-xs-2" value="${video.id}"><spring:message code="video.comment.addButton" /></button>
							</div>
						</sec:authorize>
						<div class="comments">
							<c:forEach items="${comments}" var="comments">
								<div class="comment-div col-md-8 col-sm-8 col-xs-8">
									<c:if test="${pageContext.request.userPrincipal.name == video.username || pageContext.request.userPrincipal.name == comments.userName || pageContext.request.userPrincipal.name == 'admin'}">
										<span class="comment-img-delete">
											<img src="${pageContext.request.contextPath}/resources/img/delete.png">
											<input class="idVideo" data-prop="${comments.id}" type="hidden" value="${comments.id}">
										</span>
									</c:if>
									<img class="col-md-2 col-sm-2 col-xs-2" src="${pageContext.request.contextPath}/resources/img/comment.png">		
									<a class="comment-name col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-4 col-xs-offset-6" href="${pageContext.request.contextPath}/user/${comments.userName}" title="${comments.userName}">${comments.userName}</a>
									<div class="col-md-10 col-sm-10 col-xs-10">${comments.value}</div>
									<div class="comment-div-time col-md-10 col-sm-10 col-xs-10">${comments.datePublication}</div>
								</div>
							</c:forEach>
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
		<%@ include file="footer.jsp" %>
	</div>	
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
