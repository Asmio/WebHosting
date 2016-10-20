<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	
	<title><spring:message code="main.title"/></title>
	
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
            <script src="resources/assets/js/html5shiv.js"></script>
            <script src="resources/assets/js/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript">
	        function updateCheckbox(id){
	        	document.getElementById(id).setAttribute("checked", "checked");
	        }
        </script>
</head>
<body>
	<div class="wrapper">
	
		<%@include file="template/nav.jsp" %>        
		<%@include file="template/header.jsp" %>
		
		<div class="container">
			<c:set value="${item}" var="item"></c:set>
			<c:set var="prod" value='<%=session.getAttribute("product")%>'/>
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
				                        <li class="breadcrumb-item gray">
				                        	<c:if test="${prod == \"Plywood\"}">
				                        		<a href="${pageContext.request.contextPath}/plywood.html"><spring:message code="products.plywood"/></a>
				                        	</c:if>
				                            <c:if test="${prod == \"ParticleBoard\"}">
				                        		<a href="${pageContext.request.contextPath}/particleBoard.html"><spring:message code="products.particle_board"/></a>
				                        	</c:if>
				                        </li>
				                        <li class="breadcrumb-item current gray">
				                            <a href="#">${item}</a>
				                        </li>
				                    </ul>
				                </li>
				            </ul>
				        </nav>
				    </div>
				</div>
			</div>
        	<div class="col-xs-9 col-xs-offset-2 col-sm-9 col-sm-offset-2 col-md-9 col-md-offset-2">
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
	        		<a href="${pageContext.request.contextPath}/downloadPDF?product=${prod}&id=${item.product_ID}" target="_blank"><img class="pdf-image"  src="${pageContext.request.contextPath}/resources/assets/images/pdf.png"/></a>	
			        	<h2>${item}</h2>
		        		<ul>
		        			<li><span class="field_product"><spring:message code="products.thickness"/>:</span> ${item.thickness} mm</li>
		        			<li><span class="field_product"><spring:message code="products.length"/>:</span> ${item.length} mm</li>
		        			<li><span class="field_product"><spring:message code="products.weight"/>:</span> ${item.weight} kg</li>
		        			<c:if test="${prod == 'Plywood'}">
			        			<li><span class="field_product"><spring:message code="products.water_resistance"/>:</span> ${item.water_resistance}</li>
			        			<li><span class="field_product"><spring:message code="products.sanded_or_unsanded"/>:</span> ${item.sanded_or_unsanded}</li>
		        			</c:if>
		        			<c:if test="${prod == 'ParticleBoard'}">
		        				<li><span class="field_product"><spring:message code="products.laminated"/>:</span> ${item.laminated}</li>
		        			</c:if>
		        			<li><span class="field_product"><spring:message code="products.description_bench"/>:</span> ${item.description_bench}</li>
		        			<li><span class="field_product"><spring:message code="products.price"/>:</span> ${item.price}$</li>
		        		</ul>
		        		<div class="box-bye-compare">
			        		<div class="wish-compare">
	                            <label class="btn-add-to-compare"><spring:message code="main.compare"/> <input id="${item.product_ID}" onclick="updateCompareList('${prod}', '${item.product_ID}')" type="checkbox"/></label>
	                        	<c:if test="${prod == \"Plywood\" }">
                             		<c:forEach  items="${compareList.listPlywood}" var="compItem">
                             			<c:if test="${compItem.product_ID == item.product_ID}">
                             				<script>
                             					updateCheckbox("${item.product_ID}");
                             				</script>
                              		</c:if>
                             		</c:forEach>
                             	</c:if>
                             	<c:if test="${prod == \"ParticleBoard\" }">
                             		<c:forEach  items="${compareList.listParticleBoard}" var="compItem">
                             			<c:if test="${compItem.product_ID == item.product_ID}">
                              			<script>
                             					updateCheckbox("${item.product_ID}");
                             				</script>
                              		</c:if>
                             		</c:forEach>
                             	</c:if>	
	                        </div>
	                        <sec:authorize access="hasRole('ROLE_ADMIN')">
	                        	<div class="add-cart-button">
	                            	<a class="le-button img-update-cart" onclick="addToCart('${prod}', '${item.product_ID}')"><spring:message code="main.add_to_cart"/> ${item.price}$</a>
	                        	</div>
	                        </sec:authorize>
		        		</div>
	        		</div>	
		        </div>
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
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-slider.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.raty.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.prettyPhoto.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.customSelect.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/js.js"></script>

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