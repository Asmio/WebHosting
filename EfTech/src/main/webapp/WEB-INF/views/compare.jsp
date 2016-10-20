<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="keywords" content="Wood, Particleboard , Plywood">
	<meta name="robots" content="all">
	
	<title><spring:message code="main.compare"/></title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
        
        <!-- Customizable CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/green.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate.min.css">

        <!-- Demo Purpose Only. Should be removed in production -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/config.css">

        <link href="${pageContext.request.contextPath}/resources/assets/css/green.css" rel="alternate stylesheet" title="Green color">
        <link href="${pageContext.request.contextPath}/resources/assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
        <link href="${pageContext.request.contextPath}/resources/assets/css/red.css" rel="alternate stylesheet" title="Red color">
        <link href="${pageContext.request.contextPath}/resources/assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
        <link href="${pageContext.request.contextPath}/resources/assets/css/navy.css" rel="alternate stylesheet" title="Navy color">
        <link href="${pageContext.request.contextPath}/resources/assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
        <!-- Demo Purpose Only. Should be removed in production : END -->
        
		<link href="${pageContext.request.contextPath}/resources/assets/css/slider.css" rel="stylesheet">

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
        
        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css">
        
        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.ico">

        <!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
        <!--[if lt IE 9]>
            <script src="resources/assets/js/html5shiv.js"></script>
            <script src="resources/assets/js/respond.min.js"></script>
        <![endif]-->
</head>
<body>
	<div class="wrapper">
	
		<%@include file="template/nav.jsp" %>        
		<%@include file="template/header.jsp" %>
		<div class="animate-dropdown">
			<div id="top-mega-nav">
			    <div class="container">
			        <nav>
			            <ul class="inline ul-menu">
							<%@include file="template/dropdown le-dropdown.jsp" %>
			                <li class="breadcrumb-nav-holder"> 
			                    <ul>
			                        <li class="breadcrumb-item">
			                            <a href="${pageContext.request.contextPath}/index.html"><spring:message code="main.home"/></a>
			                        </li>
			                        <li class="breadcrumb-item current gray">
			                            <a href="#"><spring:message code="main.compare.compare_products"/></a>
			                        </li>
			                    </ul>
			                </li>
			            </ul>
			        </nav>
			    </div>
			</div>
		</div>
		<div class="container table-container">
			<c:set var="ListPlywood" value="${compareList.listPlywood}"></c:set>
			<c:set var="ListParticleBoard" value="${compareList.listParticleBoard}"></c:set>
			
			<c:if test="${compareList.total > 0}">
	        	<table class="table table-bordered text-center">
	        		<tr>
	        			<td></td>
		        		<c:forEach var="item" items="${ListPlywood}">	
		        			<td><a href="${pageContext.request.contextPath}/single-product.html?product=Plywood&id=${item.product_ID}"><img class="table_image" src="${pageContext.request.contextPath}/resources/assets/images/products/${item.foto_1}"/></a></td>
		        		</c:forEach>
		        		<c:forEach var="item" items="${ListParticleBoard}">	
		        			<td><a href="${pageContext.request.contextPath}/single-product.html?product=ParticleBoard&id=${item.product_ID}"><img class="table_image" src="${pageContext.request.contextPath}/resources/assets/images/products/${item.foto_1}"/></a></td>
		        		</c:forEach>
	        		</tr>
	        		<tr>
	        			<th><spring:message code="products.name"/></th>
		        		<c:forEach var="item" items="${ListPlywood}">	
		        			<td><a href="${pageContext.request.contextPath}/single-product.html?product=Plywood&id=${item.product_ID}">${item}</a></td>
		        		</c:forEach>
		        		<c:forEach var="item" items="${ListParticleBoard}">	
		        			<td><a href="${pageContext.request.contextPath}/single-product.html?product=ParticleBoard&id=${item.product_ID}">${item}</a></td>
		        		</c:forEach>
	        		</tr>
	        		<tr>
	        			<th><spring:message code="products.thickness"/></th>
		        		<c:forEach var="item" items="${ListPlywood}">	
		        			<td>${item.thickness}</td>
		        		</c:forEach>
		        		<c:forEach var="item" items="${ListParticleBoard}">	
		        			<td>${item.thickness}</td>
		        		</c:forEach>
	        		</tr>
	        		<tr>
	        			<th><spring:message code="products.length"/></th>
		        		<c:forEach var="item" items="${ListPlywood}">	
		        			<td>${item.length}</td>
		        		</c:forEach>
		        		<c:forEach var="item" items="${ListParticleBoard}">	
		        			<td>${item.length}</td>
		        		</c:forEach>
	        		</tr>
	        		<tr>
	        			<th><spring:message code="products.weight"/></th>
		        		<c:forEach var="item" items="${ListPlywood}">	
		        			<td>${item.weight}</td>
		        		</c:forEach>
		        		<c:forEach var="item" items="${ListParticleBoard}">	
		        			<td>${item.weight}</td>
		        		</c:forEach>
	        		</tr>
	        		<c:if test="${compareList.quantityPlywood > 0}">
	   					<tr>
		        			<th><spring:message code="products.water_resistance"/></th>
			        		<c:forEach var="item" items="${ListPlywood}">	
			        			<td>${item.water_resistance}</td>
			        		</c:forEach>
			        		<c:forEach var="item" items="${ListParticleBoard}">	
			        			<td></td>
			        		</c:forEach>
		        		</tr>
		        		<tr>
		        			<th><spring:message code="products.sanded_or_unsanded"/></th>
			        		<c:forEach var="item" items="${ListPlywood}">	
			        			<td>${item.sanded_or_unsanded}</td>
			        		</c:forEach>
			        		<c:forEach var="item" items="${ListParticleBoard}">	
			        			<td></td>
			        		</c:forEach>
		        		</tr>
	        		</c:if>
	        		<c:if test="${compareList.quantityParticleBoard > 0}">
	  					<tr>
		        			<th><spring:message code="products.laminated"/></th>
		        			<c:forEach var="item" items="${ListPlywood}">	
			        			<td></td>
			        		</c:forEach>
			        		<c:forEach var="item" items="${ListParticleBoard}">	
			        			<td>${item.laminated}</td>
			        		</c:forEach>
		        		</tr>
	        		</c:if>
	        		<tr>
	        			<th><spring:message code="products.description_bench"/></th>
		        		<c:forEach var="item" items="${ListPlywood}">	
		        			<td>${item.description_bench}</td>
		        		</c:forEach>
		        		<c:forEach var="item" items="${ListParticleBoard}">	
		        			<td>${item.description_bench}</td>
		        		</c:forEach>
	        		</tr>
	        		<tr>
	        			<th><spring:message code="products.price"/></th>
		        		<c:forEach var="item" items="${ListPlywood}">	
		        			<td>${item.price}</td>
		        		</c:forEach>
		        		<c:forEach var="item" items="${ListParticleBoard}">	
		        			<td>${item.price}</td>
		        		</c:forEach>
	        		</tr>
	        		<tr>
	        			<th></th>
		        		<c:forEach var="item" items="${ListPlywood}">	
		        			<td><a href="${pageContext.request.contextPath}/delete-from-compare.html?product=Plywood&id=${item.product_ID}"><spring:message code="main.compare.remove"/></a></td>
		        		</c:forEach>
		        		<c:forEach var="item" items="${ListParticleBoard}">	
		        			<td><a href="${pageContext.request.contextPath}/delete-from-compare.html?product=ParticleBoard&id=${item.product_ID}"><spring:message code="main.compare.remove"/></a></td>
		        		</c:forEach>
	        		</tr>
	        	</table>
        	</c:if>
		</div>
	</div>
		<%@include file="template/footer.jsp" %>
	</div>

    <!-- For demo purposes â can be removed on production : End -->

    <!-- JavaScripts placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-migrate-1.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
    <script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/gmap3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-hover-dropdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/css_browser_selector.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/echo.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.easing-1.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-slider.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.raty.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.prettyPhoto.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.customSelect.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/scripts.js"></script>
    

    <!-- For demo purposes â can be removed on production -->
    
    <script src="${pageContext.request.contextPath}/resources/assets/switchstylesheet/switchstylesheet.js"></script>
    
    <script>
        $(document).ready(function(){ 
            $(".changecolor").switchstylesheet( { seperator:"color"} );
            $('.show-theme-options').click(function(){
                $(this).parent().toggleClass('open');
                return false;
            });
        });

        $(window).bind("load", function() {
           $('.show-theme-options').delay(2000).trigger('click');
        });
    </script>
    <!-- For demo purposes â can be removed on production : End -->

    <script src="http://w.sharethis.com/button/buttons.js"></script>

</body>
</html>