<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
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
	<jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder"></jsp:useBean>
	<c:url value="${pagedUrl}" var="pagedLink">
		<c:param name="p" value="~"></c:param>
	</c:url>
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
        	<div class="col-xs-12 col-sm-8 col-md-9">
				        <div class="product-grid-holder medium">
				            <div class="col-xs-12 col-md-12 no-margin">
			                	<c:set var="column" value="${1}"/>
									<c:forEach items="${pagedListHolder.pageList}" var="item">
										<c:if test="${column == 1}">
											<div class="row no-margin">
										</c:if>
										<c:if test="${column == 4}">
											<div class="row no-margin">
											<c:set var="column" value="${1}"/>
										</c:if>
					                    <div class="col-xs-12 col-sm-4 no-margin product-item-holder size-medium hover">
					                        <div class="product-item">
					                            <div class="image">
					                                <a href="single-product.html?product=<%=session.getAttribute("product")%>&id=${item.product_ID}">
					                                	<img class="img_products" alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/${item.foto_1}" />
					                            	</a>
					                            </div>
					                            <div class="body">
					                                <div class="title">
					                                    <a href="single-product.html?product=<%=session.getAttribute("product")%>&id=${item.product_ID}">${item.toString()}</a>
					                                </div>
					                            </div>
					                            <div class="prices">
					
					                                <div class="price-current text-right">${item.price}$</div>
					                            </div>
					                            <div class="hover-area">
					                                <div class="add-cart-button">
					                                    <a href="single-product.html" class="le-button">Добавить в корзину</a>
					                                </div>
					                                <div class="wish-compare">
					                                    <a class="btn-add-to-compare" href="#">Сравнить</a>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                    <c:if test="${column == 3}">
											</div>
										</c:if>
										<c:set var="column" value="${column + 1}"/> 
									</c:forEach>
			                  	<c:if test="${column == 2 || column == 3}">
										</div>
								</c:if>
				            </div>
				            <tg:paging pagedLink="${pagedLink}" pagedListHolder="${pagedListHolder}"></tg:paging>
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