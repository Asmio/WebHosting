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
	<title>Search</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jq.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.liTextLength.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/home-page.js"></script>
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container-fluid main">
		<%@ include file="header.jsp" %>
		<div class="content">
			<div class="container home-content">
				<p class="video-list-title"><spring:message code="search.title" />${messageSearch}</p>
				<div id="row" class="row">
					<c:forEach items="${videoList}" var="video">
		    			<div class="col-md-2 col-sm-4 col-xs-4 cols-xs-offset-4 home-content-cell">
		    				<div class="home-content-cell-a">
			    				<a href="${pageContext.request.contextPath}/video/${video.id}">
			    					<img class="home-content-img" src="${pageContext.request.contextPath}/download/image?fileId=${video.id}">
			    					<img class="hide-img" src="${pageContext.request.contextPath}/resources/img/play.png">
			    				</a>
			    			</div>
			    			<a href="${pageContext.request.contextPath}/video/${video.id}" title="${video.name}" class="linkvideo-name">${video.name}</a>
			    			<a href="${pageContext.request.contextPath}/user/${video.username}" title="${video.username}">${video.username}</a>	
		    			</div>
		    			<c:set var="count" value="${count + 1}"></c:set>
				    </c:forEach>
				</div>  
	    	</div>
		</div>
		<%@ include file="footer.jsp" %>
	</div>	
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
