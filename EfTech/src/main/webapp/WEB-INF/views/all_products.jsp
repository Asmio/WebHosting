<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
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
        
		<link href="${pageContext.request.contextPath}/resources/assets/css/slider.css" rel="stylesheet">

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
        
        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css">
        
        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.ico">

        <!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
        <!--[if lt IE 9]>
            <script src="${pageContext.request.contextPath}/resources/assets/js/html5shiv.js"></script>
            <script src="${pageContext.request.contextPath}/resources/assets/js/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript">
	        function updateCheckbox(id){
	        	document.getElementById(id).setAttribute("checked", "checked");
	        }
        </script>
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
			<c:set var="pr" value="<%=session.getAttribute(\"product\")%>"></c:set>
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
				                        	<c:if test="${pr == \"Plywood\"}">
				                        		<a href="#"><spring:message code="products.plywood"/></a>
				                        	</c:if>
				                            <c:if test="${pr == \"ParticleBoard\"}">
				                        		<a href="#"><spring:message code="products.particle_board"/></a>
				                        	</c:if>
				                        </li>
				                    </ul>
				                </li>
				            </ul>
				        </nav>
				    </div>
				</div>
			</div> 
        	<div class="col-xs-12 col-sm-4 col-md-3 sidemenu-holder">	
				<c:set var="maxLength" value="<%=session.getAttribute(\"maxLength\")%>"></c:set>
				<c:set var="maxThickness" value="<%=session.getAttribute(\"maxThickness\")%>"></c:set>
				<c:set var="maxWeight" value="<%=session.getAttribute(\"maxWeight\")%>"></c:set>
				<c:set var="maxPrice" value="<%=session.getAttribute(\"maxPrice\")%>"></c:set>
				<c:set var="maxLaminated" value="<%=session.getAttribute(\"maxLaminated\")%>"></c:set>
				<c:set var="Thickness" value="<%=session.getAttribute(\"thickness\")%>"></c:set>
				<c:set var="Length" value="<%=session.getAttribute(\"length\")%>"></c:set>
				<c:set var="Weight" value="<%=session.getAttribute(\"weight\")%>"></c:set>
				<c:set var="Price" value="<%=session.getAttribute(\"price\")%>"></c:set>
				<div>
				<form method="get" action="filter${pr}">
					<div class="form-group">
						<label><spring:message code="products.thickness"/></label>
						<input id="thicknessSlider" name="thickness" type="text" class="span2" value="${Thickness}" data-slider-value="[${Thickness}]" data-slider-min="0" data-slider-max="${maxThickness}" data-slider-step="1"/>
						</div>
					<div class="form-group">
						<label><spring:message code="products.length"/></label>
						<input id="lengthSlider" name="length" type="text" class="span2" value="${Length}" data-slider-value="[${Length}]" data-slider-min="0" data-slider-max="${maxLength}" data-slider-step="1"/>
					</div>
					<div class="form-group">
						<label><spring:message code="products.weight"/></label>
						<input id="weightSlider" name="weight" type="text" class="span2" value="${Weight}" data-slider-value="[${Weight}]" data-slider-min="0" data-slider-max="${maxWeight}" data-slider-step="1"/>
					</div>
					<c:if test="${pr == \"Plywood\"}">
						<div class="form-group">
							<label for="water_resistance"><spring:message code="products.water_resistance"/></label>
							<select class="form-control" name="water_resistance" id="water_resistance">
								<option  value="FK">FK</option>
								<option value="-">-</option>
							</select>
						</div>
						<div class="form-group">
							<label for="sanded_or_unsanded"><spring:message code="products.sanded_or_unsanded"/></label>
							<select class="form-control" name="sanded_or_unsanded" id="sanded_or_unsanded">
								<option  value="sanded"><spring:message code="products.sanded_or_unsanded.sanded"/></option>
								<option value="unsanded"><spring:message code="products.sanded_or_unsanded.unsanded"/></option>
							</select>
						</div>
					</c:if>
					<c:if test="${pr == \"ParticleBoard\"}">
						<c:set var="Laminated" value="<%=session.getAttribute(\"laminated\")%>"></c:set>
						<div class="form-group">
							<label><spring:message code="products.laminated"/></label>
							<input id="laminatedSlider" name="laminated" type="text" class="span2" value="${Laminated}" data-slider-value="[${Laminated}]" data-slider-min="0" data-slider-max="${maxLaminated}" data-slider-step="1"/>
						</div>
					</c:if>
					<div class="form-group">
						<label><spring:message code="products.price"/></label>
						<input id="priceSlider" name="price" type="text" class="span2" value="${Price}" data-slider-value="[${Price}]" data-slider-min="0" data-slider-max="${maxPrice}" data-slider-step="1"/>
					</div>
					<input type="submit" value="<spring:message code="main.filter"/>" class="le-button"></input>
				</form>
				</div>
			</div>
        	<div class="col-xs-12 col-sm-8 col-md-9">
				        <div class="product-grid-holder medium">
				            <div class="col-xs-12 col-md-12">
			                	<c:set var="column" value="${1}"/>
									<c:forEach items="${pagedListHolder.pageList}" var="item">
										<c:if test="${column == 1}">
											<div class="row row_all_product">
										</c:if>
										<c:if test="${column == 4}">
											<div class="row row_all_product">
											<c:set var="column" value="${1}"/>
										</c:if>
										<c:choose>
											<c:when test="${column == 1}">
												<div class="col-xs-12 col-md-3 col-sm-4 product-item-holder size-medium hover">
											</c:when>
											<c:otherwise>
												<div class="col-xs-12 col-md-3 col-md-offset-1 col-sm-4 product-item-holder size-medium hover">
											</c:otherwise>
										</c:choose>
					                        <div class="product-item">
					                            <div class="image">
					                                <a href="${pageContext.request.contextPath}/single-product.html?product=<%=session.getAttribute("product")%>&id=${item.product_ID}">
					                                	<img class="img_products" alt="" src="${pageContext.request.contextPath}/resources/assets/images/blank.gif" data-echo="${pageContext.request.contextPath}/resources/assets/images/products/${item.foto_1}" />
					                            	</a>
					                            </div>
					                            <div class="body">
					                                <div class="title">
					                                    <a href="${pageContext.request.contextPath}/single-product.html?product=<%=session.getAttribute("product")%>&id=${item.product_ID}">${item.toString()}</a>
					                                </div>
					                            </div>
					                            <sec:authorize access="hasRole('ROLE_ADMIN')">
						                            <div class="prices">
						                                <div class="price-current text-right">${item.price}$</div>
						                            </div>
					                            </sec:authorize>
					                            <div class="hover-area">
					                            	<sec:authorize access="hasRole('ROLE_ADMIN')">
						                                <div class="add-cart-button">
						                                    <a onclick="addToCart('${pr}', '${item.product_ID}')" class="le-button img-update-cart"><spring:message code="main.add_to_cart"/></a>
						                                </div>
					                                </sec:authorize>
					                                <div class="wish-compare">
					                                	<label class="btn-add-to-compare"><spring:message code="main.compare"/> <input id="${item.product_ID}" onclick="updateCompareList('${pr}', '${item.product_ID}')" type="checkbox"/></label>   
					                                	<c:if test="${pr == \"Plywood\" }">
					                                		<c:forEach  items="${compareList.listPlywood}" var="compItem">
					                                			<c:if test="${compItem.product_ID == item.product_ID}">
					                                				<script>
					                                					updateCheckbox("${item.product_ID}");
					                                				</script>
						                                		</c:if>
					                                		</c:forEach>
					                                	</c:if>
					                                	<c:if test="${pr == \"ParticleBoard\" }">
					                                		<c:forEach  items="${compareList.listParticleBoard}" var="compItem">
					                                			<c:if test="${compItem.product_ID == item.product_ID}">
						                                			<script>
					                                					updateCheckbox("${item.product_ID}");
					                                				</script>
						                                		</c:if>
					                                		</c:forEach>
					                                	</c:if>	
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
    <script src="${pageContext.request.contextPath}/resources/assets/js/js.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    

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