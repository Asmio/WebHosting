<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<li class="dropdown le-dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <i class="fa fa-list"></i> <spring:message code="main.sections"/> 
        </a>

        <ul class="dropdown-menu">
            <li><a href="${pageContext.request.contextPath}/plywood.html"><spring:message code="products.plywood"/></a></li>
            <li><a href="${pageContext.request.contextPath}/particleBoard.html"><spring:message code="products.particle_board"/></a></li>
        </ul>
</li>

                  