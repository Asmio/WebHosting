<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="MediaCenter, Template, eCommerce">
        <meta name="robots" content="all">

        <title><spring:message code="main.checkout"/></title>

        <!-- Bootstrap Core CSS -->
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

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
        
        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css">
        
        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.ico">

        <!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
        <!--[if lt IE 9]>
            <script src="assets/js/html5shiv.js"></script>
            <script src="assets/js/respond.min.js"></script>
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
			                        <li class="breadcrumb-item">
			                            <a href="${pageContext.request.contextPath}/cart.html"><spring:message code="main.cart"/></a>
			                        </li>
			                        <li class="breadcrumb-item current gray">
			                            <a href="#"><spring:message code="main.checkout"/></a>
			                        </li>
			                    </ul>
			                </li>
			            </ul>
			        </nav>
			    </div>
			</div>
		</div>  
		<section id="checkout-page">  
		    <div class="container">
				<form:form id="data" class="formBox col-md-5 col-xs-5 col-cm-5" method="post" commandName="indent" action="${pageContext.request.contextPath}/cart/makeOrder">
					<div class="form-group">
						<label for="fio"><spring:message code="main.cart.order.fio"/>*</label>
						<form:input class="form-control" required="required" type="text" id="fio" path="fioCustomer"/>
					</div>
					<div class="form-group">
						<label for="phone"><spring:message code="main.cart.order.phone"/>*</label>
						<form:input class="form-control" required="required" type="text" id="phone" path="phoneCustomer"/>
					</div>
					<div class="form-group">
						<label for="address"><spring:message code="main.cart.order.address"/>*</label>
						<form:input class="form-control" required="required" type="text" id="address" path="address"/>
					</div>
				</form:form>
				<section id="your-order">
					<div class="col-md-12">
						<h2 class="border h1"><spring:message code="main.cart.order"/></h2>
						<c:forEach var="item" items="${cart.itemsPlywood}">
						   <div class="row no-margin order-item">
						       <div class="col-xs-2 col-md-2 col-sm-2 no-margin">
						           ${item.quantity} x
						       </div>
						       <div class="col-xs-7 col-md-7 col-sm-7">
						           <div class="title">
						               <a href="${pageContext.request.contextPath}/single-product.html?product=Plywood&id=${item.product.product_ID}">${item.product}</a>
						           </div>
						       </div> 
						       <div class="col-xs-3 col-md-3 col-sm-3 no-margin">
						           <div class="price">
						               ${item.total}$
						           </div>
						       </div>
						   </div> 
						</c:forEach>
						
						<c:forEach var="item" items="${cart.itemsParticleBoard}">
						   <div class="row no-margin order-item">
						       <div class="col-xs-2 col-md-2 col-sm-2 no-margin">
						           ${item.quantity} x
						       </div>
						       <div class="col-xs-7 col-md-7 col-sm-7">
						           <div class="title">
						               <a href="${pageContext.request.contextPath}/single-product.html?product=ParticleBoard&id=${item.product.product_ID}">${item.product}</a>
						           </div>
						       </div> 
						       <div class="col-xs-3 col-md-3 col-sm-3 no-margin">
						           <div class="price">
						               ${item.total}$
						           </div>
						       </div>
						   </div>
						</c:forEach>
					</div>
			    </section>
			    <div id="total-area" class="col-xs-12 col-md-12 col-sm-12 no-margin">
			        <div id="subtotal-holder" class="col-xs-4 col-md-4 col-sm-4 pull-right no-padding sidebar ">
	                    <ul id="total-field" class="tabled-data inverse-bold">
	                        <li>
	                            <label><spring:message code="main.cart.whole_order"/></label>
	                            <div class="value pull-right">${cart.total}$</div>
	                        </li>
	                    </ul>
			        </div>
		        </div>
	            <div class="place-order-button col-md-12 col-xs-12 col-sm-12">
	            	<input type="submit" form="data" value="<spring:message code="send"/>" class="le-button pull-right" id="upload"></input>
	            </div>
	    	</div>    
        </section>            
                        
                
                        
                        

<!-- ============================================================= FOOTER ============================================================= -->

<%@include file="template/footer.jsp" %>
                        
<!-- ============================================================= FOOTER : END ============================================================= -->   </div><!-- /.wrapper -->

    <!-- For demo purposes â can be removed on production -->
    
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
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-slider.min.js"></script>
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