<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name='robots' content='all, follow' />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Great admin</title>
<link
	href="${pageContext.request.contextPath}/resources/public/css/default.css"
	rel="stylesheet" type="text/css" media="screen" />
<link
	href="${pageContext.request.contextPath}/resources/public/css/blue.css"
	rel="stylesheet" type="text/css" media="screen" />
<!-- color skin: blue / red / green / dark -->
<link
	href="${pageContext.request.contextPath}/resources/public/css/datePicker.css"
	rel="stylesheet" type="text/css" media="screen" />
<link
	href="${pageContext.request.contextPath}/resources/public/css/wysiwyg.css"
	rel="stylesheet" type="text/css" media="screen" />
<link
	href="${pageContext.request.contextPath}/resources/public/css/fancybox-1.3.1.css"
	rel="stylesheet" type="text/css" media="screen" />
<link
	href="${pageContext.request.contextPath}/resources/public/css/visualize.css"
	rel="stylesheet" type="text/css" media="screen" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/jquery.dimensions.min.js"></script>

<!-- // Tabs // -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/ui.core.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/jquery.ui.tabs.min.js"></script>

<!-- // Table drag and drop rows // -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/tablednd.js"></script>

<!-- // Date Picker // -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/date.js"></script>
<!--[if IE]><script type="text/javascript" src="public/js/jquery.bgiframe.js"></script><![endif]-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/jquery.datePicker.js"></script>

<!-- // Wysiwyg // -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/jquery.wysiwyg.js"></script>

<!-- // Graphs // -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/excanvas.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/jquery.visualize.js"></script>

<!-- // Fancybox // -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/jquery.fancybox-1.3.1.js"></script>

<!-- // File upload // -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/jquery.filestyle.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/js/init.js"></script>
</head>
<body>
	<div id="main">
		<!-- #header -->
		<div id="header">
			<!-- #logo -->
			<div id="logo">
				<a href="${pageContext.request.contextPath}/index.html" title="Go to Homepage"><span>Great
						Admin</span></a>
			</div>
			<!-- /#logo -->
			<!-- #user -->
			<div id="user">
				<h2> <sec:authentication property="principal.username" /> <span>( )</span>
				</h2>
				<a href="${pageContext.request.contextPath}/j_spring_security_logout"><spring:message code="logout"/></a>
			</div>
			<!-- /#user -->
		</div>
		<!-- /header -->
		<!-- #content -->
		<div id="content">

			<!-- breadcrumbs -->
			<div class="breadcrumbs">
				<ul>
					<li class="home"><a href="${pageContext.request.contextPath}/admin"><spring:message code="main.home"/></a></li>
					<li><a href=""><spring:message code="products.plywood"/></li>
				</ul>
			</div>
			<!-- /breadcrumbs -->

			<div class="box">
				<div class="headlines">
					<h2>
						<span><spring:message code="products.plywood"/></span>
					</h2>
					<a href="#help" class="help"></a>
				</div>
				<div class="box-content">
					<!-- table -->
					<table class="tab tab-drag">
						<tr class="top nodrop nodrag">
							<td class="dragHandle">&nbsp;</td>
							<th><spring:message code="products.picture"/></th>
							<th>id</th>
							<th><spring:message code="products.thickness"/></th>
							<th><spring:message code="products.length"/></th>
							<th><spring:message code="products.weight"/></th>	
                            <th><spring:message code="products.water_resistance"/></th>
                            <th><spring:message code="products.sanded_or_unsanded"/></th>
                            <th><spring:message code="products.description_bench"/></th>                   
							<th><spring:message code="products.price"/></th>
							<th class="action"><spring:message code="action"/></th>
						</tr>
						<c:forEach items="${list}" var="list">
							<tr>
								<td class="dragHandle">&nbsp;</td>
								<td>
									<table>
										<tr>
											<td><img class="table_image" src="${pageContext.request.contextPath}/resources/assets/images/products/${list.foto_1}"/></td>
											<td><img class="table_image" src="${pageContext.request.contextPath}/resources/assets/images/products/${list.foto_2}"/></td>
										</tr>
										<tr>
											<td><img class="table_image" src="${pageContext.request.contextPath}/resources/assets/images/products/${list.foto_3}"/></td>
											<td><img class="table_image" src="${pageContext.request.contextPath}/resources/assets/images/products/${list.foto_4}"/></td>
										</tr>
									</table>
								</td>
                                <td>${list.product_ID}</td>
								<td>${list.thickness}</td>
								<td>${list.length}</td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
								<td>${list.weight}</td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
								<td>${list.water_resistance}</td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
								<td>${list.sanded_or_unsanded}</td>
								<td>${list.description_bench}</td>
								<td>${list.price}</td>
								<td class="action">
									<a href="${pageContext.request.contextPath}/admin/delete.html?product=<%=session.getAttribute("product")%>&id=${list.product_ID}" class="ico ico-delete">Delete</a> 
									<a href="${pageContext.request.contextPath}/admin/edit.html?product=<%=session.getAttribute("product")%>&id=${list.product_ID}" class="ico ico-edit">Edit</a></td>
							</tr>
						</c:forEach>
					</table>
					<!-- /table -->

					<!-- box-action -->
					<div class="tab-action">
						<a href="${pageContext.request.contextPath}/admin/add.html" class="btn-default"><span><spring:message code="add"/>
								</span></a>
					</div>

					<!-- /box-action -->
				</div>
				<!-- /box-content -->
			</div>
			<!-- /box -->
		</div>
		<!-- /#content -->
		<!-- #sidebar -->
		<div id="sidebar">

			<!-- mainmenu -->
			<ul id="floatMenu" class="mainmenu">
				<li><a href="${pageContext.request.contextPath}/admin/plywood.html" class="link"><spring:message code="products.plywood"/></a></li>
				<li><a href="${pageContext.request.contextPath}/admin/particleboard.html" class="link"><spring:message code="products.particle_board"/></a></li>
			</ul>
			<!-- /.mainmenu -->

		</div>
		<!-- /#sidebar -->
		<!-- #footer -->
		<div id="footer">
			<p>
				© 2010 Great Admin
			</p>
		</div>
		<!-- /#footer -->

	</div>
	<!-- /#main -->
</body>
</html>