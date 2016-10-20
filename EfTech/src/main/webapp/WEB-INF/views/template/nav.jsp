<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="top-bar animate-dropdown">
    <div class="container">
        <div class="col-xs-12 col-sm-6 no-margin">
            <ul>
                <li><a href="${pageContext.request.contextPath}/index.html"><spring:message code="main.home"/></a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle"  data-toggle="dropdown" href="#change-colors"><spring:message code="change_color"/></a>

                    <ul class="dropdown-menu" role="menu" >
                        <li role="presentation"><a role="menuitem" class="changecolor green-text" tabindex="-1" href="#" title="Green color"><spring:message code="change_color.green"/></a></li>
                        <li role="presentation"><a role="menuitem" class="changecolor blue-text" tabindex="-1" href="#" title="Blue color"><spring:message code="change_color.blue"/></a></li>
                        <li role="presentation"><a role="menuitem" class="changecolor red-text" tabindex="-1" href="#" title="Red color"><spring:message code="change_color.red"/></a></li>
                        <li role="presentation"><a role="menuitem" class="changecolor orange-text" tabindex="-1" href="#" title="Orange color"><spring:message code="change_color.orange"/></a></li>
                        <li role="presentation"><a role="menuitem" class="changecolor navy-text" tabindex="-1" href="#" title="Navy color"><spring:message code="change_color.navy"/></a></li>
                        <li role="presentation"><a role="menuitem" class="changecolor dark-green-text" tabindex="-1" href="#" title="Darkgreen color"><spring:message code="change_color.dark_green"/></a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.col -->

        <div class="col-xs-12 col-sm-6 no-margin">
        <sec:authorize access="isAuthenticated()">
            <ul class="right">
            	<li class="dropdown">
                    <a class="dropdown-toggle" href="" data-toggle="dropdown"><sec:authentication property="principal.username" />( )</a>
                    <ul class="dropdown-menu" role="menu" >
                        <li role="presentation"><a href="${pageContext.request.contextPath}/j_spring_security_logout"><spring:message code="logout"/></a></li>
                    </ul>
                </li>
            </ul>
        </sec:authorize>
        </div><!-- /.col -->
		
    </div><!-- /.container -->
</nav>
<!-- /.top-bar -->