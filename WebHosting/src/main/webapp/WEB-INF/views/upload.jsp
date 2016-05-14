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
	<title>Upload</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.ui.widget.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.iframe-transport.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/myuploadfunction.js"></script>	
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container-fluid main">
	<%@ include file="header.jsp" %>
	
	<div class="content">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 upload-logo">
					<p class="upload-logo-content"><spring:message code="upload.logo" /></p>
						<div id="dropzone" class="col-md-12">
							<img class="img-drag" src="${pageContext.request.contextPath}/resources/img/icon-drag.png">
							<p><spring:message code="upload.draganddrop" /></p>
							<p><spring:message code="or" /></p>
							<div class="file-upload col-md-6 col-md-offset-3">
								<label>
									<input id="fileupload" type="file" name="files[]" data-url="download?${_csrf.parameterName}=${_csrf.token}">
          							<span><spring:message code="upload.btnComputer" /></span>
								</label>
							</div>
						</div>
						<div id="progress" class="blue stripes col-md-6 col-md-offset-3">
							<div id="progressbar"></div>
						</div>
						<div id="status" class="col-md-6 col-md-offset-3">
						</div>
						<div class="col-md-5 div-specif">
							<div class="logo-specif"><spring:message code="upload.specifications" /></div>
							<img src="${pageContext.request.contextPath}/resources/img/icon-specs.png">
							<ul>
								<li><spring:message code="upload.specifications.duration" /></li>
								<li><spring:message code="upload.specifications.size" /></li>
								<li><spring:message code="upload.specifications.format" /></li>
							</ul>
						</div>
				</div>
			</div>
		</div>
	<%@ include file="footer.jsp" %>
	</div>
</body>
</html>
