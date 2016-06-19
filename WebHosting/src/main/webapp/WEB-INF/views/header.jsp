<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jwplayer/jquery.min.js"></script>
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
	      <form:form class="navbar-form navbar-left" method="GET" action="search" commandName="search" accept-charset="UTF-8" role="search">
	        <div class="form-group">
	          <form:input path="dataSearch" id="input-search" maxlength="100" class="form-control" placeholder="..." />
	        </div>
	        <form:button type="submit" class="btn btn-default btn-search"><img alt="" src="${pageContext.request.contextPath}/resources/img/search.png"></form:button>
	      </form:form>
       		      
	      <ul class="nav navbar-nav navbar-right my-navbar-ul">
	      	<sec:authorize access="hasRole('ROLE_USER')">
		      	<li>
		      		<a href="${pageContext.request.contextPath}/webcam"><button type="button" class="btn-default navbar-left btn-add-video-webcam"><img  src="${pageContext.request.contextPath}/resources/img/webcam.png"></button></a>
			    </li>
		      	<li>
		      		<a href="${pageContext.request.contextPath}/uploadpage"><button type="button" class="btn btn-default navbar-left btn-add-video"><spring:message code="main.header.button.addVideo" /></button></a>
			    </li>
		    </sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
				<li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${pageContext.request.userPrincipal.name}<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="${pageContext.request.contextPath}/user/${pageContext.request.userPrincipal.name}"><spring:message code="main.header.menu.mypage" /></a></li>
		            <li><a href="${pageContext.request.contextPath}/password/change"><spring:message code="main.header.menu.changepass" /></a></li>
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