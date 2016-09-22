<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	
	<title>Изделия из дерева</title>
	
	<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
        
        <!-- Customizable CSS -->
        <link rel="stylesheet" href="resources/assets/css/main.css">
        <link rel="stylesheet" href="resources/assets/css/green.css">
        <link rel="stylesheet" href="resources/assets/css/owl.carousel.css">
        <link rel="stylesheet" href="resources/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="resources/assets/css/animate.min.css">

        <!-- Demo Purpose Only. Should be removed in production -->
        <link rel="stylesheet" href="resources/assets/css/config.css">

        <link href="resources/assets/css/green.css" rel="alternate stylesheet" title="Green color">
        <link href="resources/assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
        <link href="resources/assets/css/red.css" rel="alternate stylesheet" title="Red color">
        <link href="resources/assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
        <link href="resources/assets/css/navy.css" rel="alternate stylesheet" title="Navy color">
        <link href="resources/assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
        <!-- Demo Purpose Only. Should be removed in production : END -->

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
        
        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
        
        <!-- Favicon -->
        <link rel="shortcut icon" href="resources/assets/images/favicon.ico">

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
		
		<div class="container">
        	<div class="col-xs-12 col-sm-4 col-md-3 sidemenu-holder">
				<div class="side-menu animate-dropdown">
				    <div class="head"><i class="fa fa-list"></i> Разделы</div>        
				    <nav class="yamm megamenu-horizontal" role="navigation">
				        <ul class="nav">
				            <li><a href="plywood.html">Фанера</a></li>
				            <li><a href="particleBoard.html">ДСП</a></li>
				        </ul>
				    </nav>
				</div>
			</div>
			<c:set value="${item}" var="item"></c:set>
        	<div class="col-xs-12 col-sm-8 col-md-9">
		        <div class="product-grid-holder medium">
		        	<div class="col-xs-5 col-sm-5 col-md-5">
		        		<img class="foto_product" id="foto_product" alt="" src="${pageContext.request.contextPath}/resources/assets/images/products/${item.foto_1}"/>
		        		<div class="row">
			        		<div class="mini_foto_product col-xs-4 col-sm-4 col-md-4 col-xs-offset-2 col-sm-offset-2 col-md-offset-2">
			        			<img onClick="chg(this)" src="${pageContext.request.contextPath}/resources/assets/images/products/${item.foto_1}"/>
			        		</div>
			        		<div class="mini_foto_product col-xs-4 col-sm-4 col-md-4">
			        			<img onClick="chg(this)" src="${pageContext.request.contextPath}/resources/assets/images/products/${item.foto_2}"/>
			        		</div>
		        		</div>
		        		<div class="row">
			        		<div class="mini_foto_product col-xs-4 col-sm-4 col-md-4 col-xs-offset-2 col-sm-offset-2 col-md-offset-2">
			        			<img onClick="chg(this)" src="${pageContext.request.contextPath}/resources/assets/images/products/${item.foto_3}"/>
			        		</div>
			        		<div class="mini_foto_product col-xs-4 col-sm-4 col-md-4">
			        			<img onClick="chg(this)" src="${pageContext.request.contextPath}/resources/assets/images/products/${item.foto_4}"/>
			        		</div>
		        		</div>
		        	</div>
	        		<div class="box-description col-xs-6 col-sm-6 col-md-6">
	        			<c:set var="prod" value='<%=session.getAttribute("product")%>'/>
			        	<h2>${item}</h2>
		        		<ul>
		        			<li><span class="field_product">Толщина:</span> ${item.thickness} mm</li>
		        			<li><span class="field_product">Длина:</span> ${item.length} mm</li>
		        			<li><span class="field_product">Вес:</span> ${item.weight} kg</li>
		        			<c:if test="${prod == 'Plywood'}">
			        			<li><span class="field_product">Водонепроницаемый:</span> ${item.water_resistance}</li>
			        			<li><span class="field_product">Шлифованный или нет:</span> ${item.sanded_or_unsanded}</li>
		        			</c:if>
		        			<c:if test="${prod == 'ParticleBoard'}">
		        				<li><span class="field_product">Ламинированный:</span> ${item.laminated}</li>
		        			</c:if>
		        			<li><span class="field_product">Описание станка:</span> ${item.description_bench}</li>
		        		</ul>
		        		<div class="box-bye-compare">
			        		<div class="wish-compare">
	                            <a class="btn-add-to-compare" href="#">Сравнить</a>
	                        </div>
			        		<div class="add-cart-button">
	                            <a href="#" class="le-button">Купить ${item.price}$</a>
	                        </div>
		        		</div>
	        		</div>	
		        </div>
			</div>
		</div>
		<%@include file="template/footer.jsp" %>
	</div>

    <!-- For demo purposes â can be removed on production : End -->

    <!-- JavaScripts placed at the end of the document so the pages load faster -->
    <script src="resources/assets/js/jquery-1.10.2.min.js"></script>
    <script src="resources/assets/js/jquery-migrate-1.2.1.js"></script>
    <script src="resources/assets/js/bootstrap.min.js"></script>
    <script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
    <script src="resources/assets/js/gmap3.min.js"></script>
    <script src="resources/assets/js/bootstrap-hover-dropdown.min.js"></script>
    <script src="resources/assets/js/owl.carousel.min.js"></script>
    <script src="resources/assets/js/css_browser_selector.min.js"></script>
    <script src="resources/assets/js/echo.min.js"></script>
    <script src="resources/assets/js/jquery.easing-1.3.min.js"></script>
    <script src="resources/assets/js/bootstrap-slider.min.js"></script>
    <script src="resources/assets/js/jquery.raty.min.js"></script>
    <script src="resources/assets/js/jquery.prettyPhoto.min.js"></script>
    <script src="resources/assets/js/jquery.customSelect.min.js"></script>
    <script src="resources/assets/js/wow.min.js"></script>
    <script src="resources/assets/js/scripts.js"></script>
    <script src="resources/assets/js/js.js"></script>

    <!-- For demo purposes â can be removed on production -->
    
    <script src="resources/assets/switchstylesheet/switchstylesheet.js"></script>
    
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