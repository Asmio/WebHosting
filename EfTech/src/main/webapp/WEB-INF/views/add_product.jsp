<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
				<a href="${pageContext.request.contextPath}/j_spring_security_logout">logout</a>
			</div>
			<!-- /#user -->
		</div>
		<!-- /header -->
		<!-- #content -->
		<div id="content">

			<!-- breadcrumbs -->
			<div class="breadcrumbs">
				<ul>
					<li class="home"><a href="">Homepage</a></li>
					<li>Admin Page</li>
				</ul>
			</div>
			<!-- /breadcrumbs -->		
			<div class="box">
				<div class="box_add_edit_product">
					<c:set var="pr" value="<%=session.getAttribute(\"product\")%>"></c:set>
					<p><c:out value="${resultAddMessage}"></c:out></p>
					<form:form class="formBox" method="post" commandName="newProduct" action="addProduct${pr}">
						<div class="form-group">
							<label for="product_ID">ID</label>
							<form:input class="form-control" type="text" id="product_ID" path="product_ID"/>
						</div>
						<c:if test="${pr == \"Plywood\"}">
							<div class="form-group">
								<label for="water_resistance">Водонепроницаемый</label>
								<form:select class="form-control" id="water_resistance" path="water_resistance">
									<form:option value="FK"></form:option>
									<form:option value="-"></form:option>
								</form:select>
							</div>
							<div class="form-group">
								<label for="sanded_or_unsanded">Шлифованный или нет</label>
							<form:select class="form-control" id="sanded_or_unsanded" path="sanded_or_unsanded">
								<form:option value="sanded"></form:option>
								<form:option value="unsanded"></form:option>
							</form:select>
							</div>
						</c:if>
						<c:if test="${pr == \"ParticleBoard\"}">
							<div class="form-group">
								<label for="laminated">Ламинированный</label>
								<form:input type="number" class="form-control" id="laminated" path="laminated"/>
							</div>
						</c:if>
						<div class="form-group">
							<label for="thickness">Толщина</label>
							<form:input type="number" class="form-control" id="thickness" path="thickness"/>
						</div>
						<div class="form-group">
							<label for="length">Длина</label>
							<form:input type="number" class="form-control" id="length" path="length"/>
						</div>
						<div class="form-group">
							<label for="weight">Вес</label>
							<form:input type="number" class="form-control" id="weight" path="weight"/>
						</div>
						<div class="form-group">
							<label for="foto_1">Фото 1</label>
							<form:input class="form-control" id="foto_1" path="foto_1"/>
						</div>
						<div class="form-group">
							<label for="foto_2">Фото 2</label>
							<form:input class="form-control" id="foto_2" path="foto_2"/>
						</div>
						<div class="form-group">
							<label for="foto_3">Фото 3</label>
							<form:input class="form-control" id="foto_3" path="foto_3"/>
						</div>
						<div class="form-group">
							<label for="foto_4">Фото 4</label>
							<form:input class="form-control" id="foto_4" path="foto_4"/>
						</div>
						<div class="form-group">
							<label for="description_bench">Описание станка</label>
							<form:textarea rows="3" class="form-control" id="description_bench" path="description_bench"/>
						</div>
						<div class="form-group">
							<label for="price">Цена</label>
							<form:input type="number" class="form-control" id="price" path="price"/>
						</div>
						<input type="submit" value="Добавить" class="button" id="upload"></input>
					</form:form>
				</div>
				<div class="headlines">
					<h2>
						<span>Загрузка данных</span>
					</h2>
					<a href="#help" class="help"></a>
				</div>
				<div class="box-content">		
					<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER_INFO')">
						<h2>Загрузить данные из Exel</h2>
						<form:form class="formBox" method="post" enctype="multipart/form-data" commandName="uploadFiles" action="uploadExcelInfoFile">
							<fieldset>
								<div class="form">
									<div class="col1">
										<div class="clearfix file">
											<div class="lab">
												<label for="inputFile">Файл с данными:</label>
											</div>
											<div class="con">
												<input type="file" class="upload-file" id="inputFile"
													name="files" multiple="multiple" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"/>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-action">
									<input type="submit" value="Загрузить" class="button"
										id="upload" />
								</div>
							</fieldset>
						</form:form>
						<p><c:out value="${resultExcelInfoMessage}"></c:out></p>
					 </sec:authorize>                                                           
					<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER_PRICE')">
						<h2>Загрузка цен с файла</h2>
						<form:form class="formBox" method="post" enctype="multipart/form-data" commandName="uploadFiles" action="uploadExcelPriceFile">
							<fieldset>
								<div class="form">
									<div class="col1">
										<div class="clearfix file">
											<div class="lab">
												<label for="inputFile">Файл с ценами:</label>
											</div>
											<div class="con">
												<input type="file" class="upload-file" id="inputFile"
													name="files" multiple="multiple" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"/>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-action">
									<input type="submit" value="Загрузить" class="button"
										id="upload" />
								</div>
							</fieldset>
						</form:form>
						<p><c:out value="${resultExcelPriceMessage}"></c:out></p>
					</sec:authorize>                                 
					<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER_PICT')">               
						<h2>Загрузка изображений HMC</h2>
						<form class="formBox" method="post" action="addHmcPhoto.htm"
							enctype="multipart/form-data">
							<fieldset>
						
								<div class="form">
									<div class="col1">
										<div class="clearfix file">
											<div class="lab">
												<label for="inputFile">Изображения:</label>
											</div>
											<div class="con">
												<input type="file" class="upload-file" name="image"
													id="image" multiple="true" /> <br />
											</div>
										</div>
									</div>
								</div>
								<div class="tab-action">
									<input type="submit" value="Загрузить" class="button"
										id="upload" />
								</div>
								${result}
							</fieldset>
						</form>
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
				<li><a href="${pageContext.request.contextPath}/admin/plywood.html" class="link">Plywood</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/particleboard.html" class="link">ParticleBoard</a></li>
			</ul>
			<!-- /.mainmenu -->

		</div>
		<!-- /#sidebar -->
		<!-- #footer -->
		<div id="footer">
			<p>
				© 2010 Great Admin | <a href="index.html">Top</a>
			</p>
		</div>
		<!-- /#footer -->

	</div>
	<!-- /#main -->
</body>
</html>