<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name='robots' content='all, follow' />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Great admin</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/public/css/styleAdmin.css"/>
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
				<h2> <sec:authentication property="principal.username" /><span>( )</span>
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
					<li><a href=""><spring:message code="add"/></a></li>
				</ul>
			</div>
			<!-- /breadcrumbs -->		
			<div class="box">
				<div class="box_add_edit_product">
					<c:set var="pr" value="<%=session.getAttribute(\"product\")%>"></c:set>
					<p><c:out value="${resultAddMessage}"></c:out></p>
					<form:form class="formBox" method="post" commandName="newProduct" action="${pageContext.request.contextPath}/admin/addProduct${pr}">
						<div class="form-group">
							<label for="product_ID">ID</label>
							<form:input class="form-control" required="required" type="text" id="product_ID" path="product_ID"/>
						</div>
						<c:if test="${pr == \"Plywood\"}">
							<div class="form-group">
								<label for="water_resistance"><spring:message code="products.water_resistance"/></label>
								<form:select class="form-control" id="water_resistance" path="water_resistance">
									<form:option value="FK"></form:option>
									<form:option value="-"></form:option>
								</form:select>
							</div>
							<div class="form-group">
								<label for="sanded_or_unsanded"><spring:message code="products.sanded_or_unsanded"/></label>
							<form:select class="form-control" id="sanded_or_unsanded" path="sanded_or_unsanded">
								<form:option value="sanded"></form:option>
								<form:option value="unsanded"></form:option>
							</form:select>
							</div>
						</c:if>
						<c:if test="${pr == \"ParticleBoard\"}">
							<div class="form-group">
								<label for="laminated"><spring:message code="products.laminated"/></label>
								<form:input type="number" class="form-control" id="laminated" path="laminated"/>
							</div>
						</c:if>
						<div class="form-group">
							<label for="thickness"><spring:message code="products.thickness"/></label>
							<form:input type="number" class="form-control" id="thickness" path="thickness"/>
						</div>
						<div class="form-group">
							<label for="length"><spring:message code="products.length"/></label>
							<form:input type="number" class="form-control" id="length" path="length"/>
						</div>
						<div class="form-group">
							<label for="weight"><spring:message code="products.weight"/></label>
							<form:input type="number" class="form-control" id="weight" path="weight"/>
						</div>
						<div class="form-group">
							<label for="foto_1"><spring:message code="products.foto"/> 1</label>
							<form:input class="form-control" id="foto_1" path="foto_1"/>
						</div>
						<div class="form-group">
							<label for="foto_2"><spring:message code="products.foto"/> 2</label>
							<form:input class="form-control" id="foto_2" path="foto_2"/>
						</div>
						<div class="form-group">
							<label for="foto_3"><spring:message code="products.foto"/> 3</label>
							<form:input class="form-control" id="foto_3" path="foto_3"/>
						</div>
						<div class="form-group">
							<label for="foto_4"><spring:message code="products.foto"/> 4</label>
							<form:input class="form-control" id="foto_4" path="foto_4"/>
						</div>
						<div class="form-group">
							<label for="description_bench"><spring:message code="products.description_bench"/></label>
							<form:textarea rows="3" class="form-control" id="description_bench" path="description_bench"/>
						</div>
						<div class="form-group">
							<label for="price"><spring:message code="products.price"/></label>
							<form:input type="number" class="form-control" id="price" path="price"/>
						</div>
						<input type="submit" value="<spring:message code="add"/>" class="button" id="upload"></input>
					</form:form>
				</div>
				<div class="headlines">
					<h2>
						<span><spring:message code="admin.loading_data"/></span>
					</h2>
					<a href="#help" class="help"></a>
				</div>
				<div class="box-content">		
					<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER_INFO')">
						<h2><spring:message code="admin.loading_data_excel"/></h2>
						<form:form class="formBox" method="post" enctype="multipart/form-data" commandName="uploadFiles" action="${pageContext.request.contextPath}/admin/uploadExcelInfoFile">
							<fieldset>
								<div class="form">
									<div class="col1">
										<div class="clearfix file">
											<div class="lab">
												<label for="inputFile"><spring:message code="admin.loading_data_excel.data_file"/>:</label>
											</div>
											<div class="con">
												<input type="file" class="upload-file" id="inputFile"
													name="files" required="required" multiple="multiple" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"/>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-action">
									<input type="submit" value="<spring:message code="admin.loading_data.upload"/>" class="button"
										id="upload" />
								</div>
							</fieldset>
						</form:form>
						<p><c:out value="${resultExcelInfoMessage}"></c:out></p>
					 </sec:authorize>                                                           
					<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER_PRICE')">
						<h2><spring:message code="admin.loading_prices_excel"/></h2>
						<form:form class="formBox" method="post" enctype="multipart/form-data" commandName="uploadFiles" action="${pageContext.request.contextPath}/admin/uploadExcelPriceFile">
							<fieldset>
								<div class="form">
									<div class="col1">
										<div class="clearfix file">
											<div class="lab">
												<label for="inputFile"><spring:message code="admin.loading_prices_excel.price_file"/>:</label>
											</div>
											<div class="con">
												<input type="file" class="upload-file" id="inputFile"
													name="files" required="required" multiple="multiple" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"/>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-action">
									<input type="submit" value="<spring:message code="admin.loading_data.upload"/>" class="button"
										id="upload" />
								</div>
							</fieldset>
						</form:form>
						<p><c:out value="${resultExcelPriceMessage}"></c:out></p>
					</sec:authorize>                                 
					<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER_PICT')">               
						<h2><spring:message code="admin.loading_images"/></h2>
						<form:form class="formBox" method="post" commandName="uploadFiles" action="${pageContext.request.contextPath}/admin/uploadPhoto"
							enctype="multipart/form-data">
							<fieldset>
								<div class="form">
									<div class="col1">
										<div class="clearfix file">
											<div class="lab">
												<label for="inputFile"><spring:message code="admin.loading_images.images"/>:</label>
											</div>
											<div class="con">
												<input type="file" class="upload-file" name="files"
													id="image" required="required" multiple="multiple" accept="image/*"/>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-action">
									<input type="submit" value="<spring:message code="admin.loading_data.upload"/>" class="button"
										id="upload" />
								</div>
							</fieldset>
						</form:form>
						<p><c:out value="${resultPhotoMessage}"></c:out></p>
					</sec:authorize>
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