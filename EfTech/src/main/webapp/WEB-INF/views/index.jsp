<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>



<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="Wood, Particleboard , Plywood">
        <meta name="robots" content="all">

		
        <title><spring:message code="main.title"/></title>

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
        <!-- ============================================================= TOP NAVIGATION ============================================================= -->

              
<!-- ============================================================= TOP NAVIGATION ============================================================= -->
<%@include file="template/nav.jsp" %>        
<!-- ============================================================= TOP NAVIGATION : END ============================================================= -->       <!-- ============================================================= HEADER ============================================================= -->
<%@include file="template/header.jsp" %>
<!-- ============================================================= HEADER : END ============================================================= --><div class="animate-dropdown"><!-- ========================================= BREADCRUMB ========================================= -->
  
        
        
<!-- ============================================================= HEADER : END ============================================================= -->       <div id="top-banner-and-menu">
    <div class="container">
        <div class="col-xs-12 col-sm-4 col-md-3 sidemenu-holder">
            <!-- ================================== TOP NAVIGATION ================================== -->
<div class="side-menu animate-dropdown">
    <div class="head"><i class="fa fa-list"></i> <spring:message code="main.sections"/></div>        
    <nav class="yamm megamenu-horizontal" role="navigation">
        <ul class="nav">
<!--            <li class="dropdown menu-item">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages</a>
                <ul class="dropdown-menu mega-menu">
                                        <li class="yamm-content">
                        <div class="row">
                            <div class="col-md-4">
                                <ul class="list-unstyled">
                                                                        <li><a href="index.html">Home</a></li>
                                                                        <li><a href="index-2.html">Home Alt</a></li>
                                                                        <li><a href="category-grid.html">Category - Grid/List</a></li>
                                                                        <li><a href="category-grid-2.html">Category 2 - Grid/List</a></li>
                                                                        <li><a href="single-product.html">Single Product</a></li>
                                                                        <li><a href="single-product-sidebar.html">Single Product with Sidebar</a></li>
                                                                    </ul>
                            </div>
                            <div class="col-md-4">
                                <ul class="list-unstyled">
                                                                        <li><a href="cart.html&amp;style=alt2">Shopping Cart</a></li>
                                                                        <li><a href="checkout.html">Checkout</a></li>
                                                                        <li><a href="about.html">About Us</a></li>
                                                                        <li><a href="contact.html">Contact Us</a></li>
                                                                        <li><a href="blog.html">Blog</a></li>
                                                                        <li><a href="blog-fullwidth.html">Blog Full Width</a></li>
                                                                    </ul>
                            </div>
                            <div class="col-md-4">
                                <ul class="list-unstyled">
                                                                        <li><a href="blog-post.html">Blog Post</a></li>
                                                                        <li><a href="faq.html">FAQ</a></li>
                                                                        <li><a href="terms.html">Terms & Conditions</a></li>
                                                                        <li><a href="authentication.html">Login/Register</a></li>
                                                                        <li><a href="404.html">404</a></li>
                                                                        <li><a href="wishlist.html">Wishlist</a></li>
                                                                    </ul>
                            </div>
                        </div>
                    </li>
                    
                </ul>
            </li>-->
            <!-- /.menu-item -->
           
           
       
            
         
<!--            <li class="dropdown menu-item">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Smart Phones &amp; Tablets</a>
                <ul class="dropdown-menu mega-menu">
                    <li class="yamm-content">
                         ================================== MEGAMENU VERTICAL ================================== 
<div class="row">
    <div class="col-xs-12 col-lg-4">
        <ul>
            <li><a href="#">Computer Cases &amp; Accessories</a></li>
            <li><a href="#">CPUs, Processors</a></li>
            <li><a href="#">Fans, Heatsinks &amp; Cooling</a></li>
            <li><a href="#">Graphics, Video Cards</a></li>
            <li><a href="#">Interface, Add-On Cards</a></li>
            <li><a href="#">Laptop Replacement Parts</a></li>
            <li><a href="#">Memory (RAM)</a></li>
            <li><a href="#">Motherboards</a></li>
            <li><a href="#">Motherboard &amp; CPU Combos</a></li>
            <li><a href="#">Motherboard Components &amp; Accs</a></li>
        </ul>
    </div>

    <div class="col-xs-12 col-lg-4">
        <ul>
            <li><a href="#">Power Supplies Power</a></li>
            <li><a href="#">Power Supply Testers Sound</a></li>
            <li><a href="#">Sound Cards (Internal)</a></li>
            <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
            <li><a href="#">Other</a></li>
        </ul>
    </div>

    <div class="dropdown-banner-holder">
        <a href="#"><img alt="" src="${pageContext.request.contextPath}/resources/assets/images/banners/banner-side.png" /></a>
    </div>
</div>
 ================================== MEGAMENU VERTICAL ==================================     
                    </li>
                </ul>
            </li>-->
            <!-- /.menu-item -->
        
            
            <!--<li><a href="vmc.htm">IPhone 5</a></li>-->
            <li><a href="${pageContext.request.contextPath}/plywood.html"><spring:message code="products.plywood"/></a></li>
            <li><a href="${pageContext.request.contextPath}/particleBoard.html"><spring:message code="products.particle_board"/></a></li>
            <!--<li><a href="vmc.htm">IPhone 7</a></li>-->
<!--            <li><a href="#">Horizontal machine CNC</a></li>
            -->
        </ul><!-- /.nav -->
    </nav><!-- /.megamenu-horizontal -->
</div><!-- /.side-menu -->
<!-- ================================== TOP NAVIGATION : END ================================== -->     </div><!-- /.sidemenu-holder -->

        <div class="col-xs-12 col-sm-8 col-md-9 homebanner-holder">
            <!-- ========================================== SECTION â HERO ========================================= -->
            
<div id="hero">
    <div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">
        <c:forEach items="${sliderList}" var="slider">
        	<a href="${pageContext.request.contextPath}/single-product.html?product=Plywood&id=${slider.product_ID}">
		        <div class="item" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/products/${slider.foto_1});">
		            <div class="container-fluid">
		                <div class="caption vertical-center text-left">
		                </div>
		            </div>
		        </div>
	        </a>
        </c:forEach>
    </div><!-- /.owl-carousel -->
</div>
            
<!-- ========================================= SECTION â HERO : END ========================================= -->           
        </div><!-- /.homebanner-holder -->

    </div><!-- /.container -->
</div><!-- /#top-banner-and-menu -->

<!-- ========================================= HOME BANNERS ========================================= -->
<!--<section id="banner-holder" class="wow fadeInUp">
    <div class="container">
        <div class="col-xs-12 col-lg-6 no-margin banner">
            <a href="category-grid-2.html">
                <div class="banner-text theblue">
                    <h1>New Life</h1>
                    <span class="tagline">Introducing New Category</span>
                </div>
                <img class="banner-image" alt="" src="${pageContext.request.contextPath}/resources/assets/images/blank.gif" data-echo="${pageContext.request.contextPath}/resources/assets/images/banners/banner-narrow-01.jpg" />
            </a>
        </div>
        <div class="col-xs-12 col-lg-6 no-margin text-right banner">
            <a href="category-grid-2.html">
                <div class="banner-text right">
                    <h1>Time &amp; Style</h1>
                    <span class="tagline">Checkout new arrivals</span>
                </div>
                <img class="banner-image" alt="" src="${pageContext.request.contextPath}/resources/assets/images/blank.gif" data-echo="${pageContext.request.contextPath}/resources/assets/images/banners/banner-narrow-02.jpg" />
            </a>
        </div>
    </div> /.container 
</section> /#banner-holder -->
<!-- ========================================= HOME BANNERS : END ========================================= -->
<!--<div id="products-tab" class="wow fadeInUp">
    <div class="container">
        <div class="tab-holder">
             Nav tabs 
            <ul class="nav nav-tabs" >
                <li class="active"><a href="#featured" data-toggle="tab">featured</a></li>
                <li><a href="#new-arrivals" data-toggle="tab">new arrivals</a></li>
                <li><a href="#top-sales" data-toggle="tab">top sales</a></li>
            </ul>

             Tab panes 
            <div class="tab-content">
                <div class="tab-pane active" id="featured">
                    <div class="product-grid-holder">
                        <div class="col-sm-4 col-md-3  no-margin product-item-holder hover">
                            <div class="product-item">
                                <div class="ribbon red"><span>sale</span></div> 
                                <div class="image">
                                    <img alt="" src="${pageContext.request.contextPath}/resources/assets/images/blank.gif" data-echo="${pageContext.request.contextPath}/resources/assets/images/products/product-01.jpg" />
                                </div>
                                <div class="body">
                                    <div class="label-discount green">-50% sale</div>
                                    <div class="title">
                                        <a href="single-product.html">VAIO Fit Laptop - Windows 8 SVF14322CXW</a>
                                    </div>
                                    <div class="brand">sony</div>
                                </div>
                                <div class="prices">
                                    <div class="price-prev">$1399.00</div>
                                    <div class="price-current pull-right">$1199.00</div>
                                </div>

                                <div class="hover-area">
                                    <div class="add-cart-button">
                                        <a href="single-product.html" class="le-button">add to cart</a>
                                    </div>
                                    <div class="wish-compare">
                                        <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                                        <a class="btn-add-to-compare" href="#">compare</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4 col-md-3 no-margin product-item-holder hover">
                            <div class="product-item">
                                <div class="ribbon blue"><span>new!</span></div> 
                                <div class="image">
                                    <img alt="" src="${pageContext.request.contextPath}/resources/assets/images/blank.gif" data-echo="${pageContext.request.contextPath}/resources/assets/images/products/product-02.jpg" />
                                </div>
                                <div class="body">
                                    <div class="label-discount clear"></div>
                                    <div class="title">
                                        <a href="single-product.html">White lumia 9001</a>
                                    </div>
                                    <div class="brand">nokia</div>
                                </div>
                                <div class="prices">
                                    <div class="price-prev">$1399.00</div>
                                    <div class="price-current pull-right">$1199.00</div>
                                </div>
                                <div class="hover-area">
                                    <div class="add-cart-button">
                                        <a href="single-product.html" class="le-button">add to cart</a>
                                    </div>
                                    <div class="wish-compare">
                                        <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                                        <a class="btn-add-to-compare" href="#">compare</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                     
                        
               
                        
                       

                    </div>
                    <div class="loadmore-holder text-center">
                        <a class="btn-loadmore" href="#">
                            <i class="fa fa-plus"></i>
                            load more products</a>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>-->
<!-- ========================================= BEST SELLERS ========================================= -->
<%-- <section id="bestsellers" class="color-bg wow fadeInUp">
    <div class="container">
        <h1 class="section-title">Наиболее продаваемые</h1>

        <div class="product-grid-holder medium">
            <div class="col-xs-12 col-md-7 no-margin">
                <div class="row no-margin">
					<c:forEach items="${sliderList}" var="list">
	                    <div class="col-xs-12 col-sm-4 no-margin product-item-holder size-medium hover">
	                        <div class="product-item">
	                            <div class="image">
	                                <img alt="" src="${pageContext.request.contextPath}/resources/assets/images/blank.gif" data-echo="${pageContext.request.contextPath}/resources/assets/images/products/${list.foto_1}" />
	                            </div>
	                            <div class="body">
	                                <div class="label-discount clear"></div>
	                                <div class="title">
	                                    <a href="single-product.html">beats studio headphones official one</a>
	                                </div>
	                                <div class="brand">beats</div>
	                            </div>
	                            <div class="prices">
	
	                                <div class="price-current text-right">$1199.00</div>
	                            </div>
	                            <div class="hover-area">
	                                <div class="add-cart-button">
	                                    <a href="single-product.html" class="le-button">Add to cart</a>
	                                </div>
	                                <div class="wish-compare">
	                                    <a class="btn-add-to-wishlist" href="#">Add to Wishlist</a>
	                                    <a class="btn-add-to-compare" href="#">Compare</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
					</c:forEach>
                </div>  
            </div>
</section> --%>
<!-- ========================================= BEST SELLERS : END ========================================= -->
<!-- ========================================= RECENTLY VIEWED ========================================= -->
<section id="recently-reviewd" class="wow fadeInUp">
    <div class="container">
        <div class="carousel-holder hover">
            
            <div class="title-nav">
                <h2 class="h1"><spring:message code="main.recently_uploaded"/></h2>
                <div class="nav-holder">
                    <a href="#prev" data-target="#owl-recently-viewed" class="slider-prev btn-prev fa fa-angle-left"></a>
                    <a href="#next" data-target="#owl-recently-viewed" class="slider-next btn-next fa fa-angle-right"></a>
                </div>
            </div>

            <div id="owl-recently-viewed" class="owl-carousel product-grid-holder">
                <c:forEach items="${recentlyUplPl}" var="item">
	                <div class="no-margin carousel-item product-item-holder size-small hover">
	                    <div class="product-item">
	                        <div class="ribbon red"><span>NEW</span></div> 
	                        <div class="image">
		                        <a href="${pageContext.request.contextPath}/single-product.html?product=Plywood&id=${item.product_ID}">
		                            <img alt="" class="img_products" src="${pageContext.request.contextPath}/resources/assets/images/products/${item.foto_1}" />
		                        </a>
	                        </div>
	                        <div class="body">
	                            <div class="title">
	                                <a href="${pageContext.request.contextPath}/single-product.html?product=Plywood&id=${item.product_ID}">${item}</a>
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
		                                <a onclick="addToCart('Plywood', '${item.product_ID}')" class="le-button img-update-cart"><spring:message code="main.add_to_cart"/></a>
						            </div>
	                            </sec:authorize>
	                            <div class="wish-compare">
	                            	<label class="btn-add-to-compare"><spring:message code="main.compare"/> <input id="${item.product_ID}" onclick="updateCompareList('Plywood', '${item.product_ID}')" type="checkbox"/></label>                 	
	                                <c:forEach  items="${compareList.listPlywood}" var="compItem">
                               			<c:if test="${compItem.product_ID == item.product_ID}">
                               				<script>
                               					updateCheckbox("${item.product_ID}");
                               				</script>
                                		</c:if>
                               		</c:forEach>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
                <c:forEach items="${recentlyUplPB}" var="item">
	                <div class="no-margin carousel-item product-item-holder size-small hover">
	                    <div class="product-item">
	                        <div class="ribbon red"><span>NEW</span></div> 
	                        <div class="image">
		                        <a href="${pageContext.request.contextPath}/single-product.html?product=ParticleBoard&id=${item.product_ID}">
		                            <img alt="" class="img_products" src="${pageContext.request.contextPath}/resources/assets/images/products/${item.foto_1}" />
		                        </a>
	                        </div>
	                        <div class="body">
	                            <div class="title">
	                                <a href="${pageContext.request.contextPath}/single-product.html?product=ParticleBoard&id=${item.product_ID}">${item}</a>
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
		                                <a onclick="addToCart('ParticleBoard', '${item.product_ID}')" class="le-button img-update-cart"><spring:message code="main.add_to_cart"/></a>
						            </div>
	                            </sec:authorize>
	                            <div class="wish-compare">
	                            	<label class="btn-add-to-compare"><spring:message code="main.compare"/> <input id="${item.product_ID}" onclick="updateCompareList('ParticleBoard', '${item.product_ID}')" type="checkbox"/></label>                 	
	                                <c:forEach  items="${compareList.listParticleBoard}" var="compItem">
                               			<c:if test="${compItem.product_ID == item.product_ID}">
                               				<script>
                               					updateCheckbox("${item.product_ID}");
                               				</script>
                                		</c:if>
                               		</c:forEach>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </div> 
</section>
<!-- ========================================= RECENTLY VIEWED : END ========================================= -->
<!-- ========================================= TOP BRANDS ========================================= -->
<!-- <section id="top-brands" class="wow fadeInUp">
    <div class="container">
        <div class="carousel-holder" >
            
            <div class="title-nav">
                <h1>Top Brands</h1>
                <div class="nav-holder">
                    <a href="#prev" data-target="#owl-brands" class="slider-prev btn-prev fa fa-angle-left"></a>
                    <a href="#next" data-target="#owl-brands" class="slider-next btn-next fa fa-angle-right"></a>
                </div>
            </div> 
            /.title-nav 
            
            <div id="owl-brands" class="owl-carousel brands-carousel">
                
                <div class="carousel-item">
                    <a href="#">
                        <img alt="" src="${pageContext.request.contextPath}/resources/assets/images/brands/brand_iphone5.png" />
                    </a>
                </div> 
                /.carousel-item 
                
                <div class="carousel-item">
                    <a href="#">
                        <img alt="" src="${pageContext.request.contextPath}/resources/assets/images/brands/brand_iphone6.png" />
                    </a>
                </div> 


               
            </div> 
            /.brands-caresoul 

        </div> 
        /.carousel-holder 
    </div> 
    /.container 
</section>  -->
<!--/#top-brands--> 
<!-- ========================================= TOP BRANDS : END ========================================= -->       <!-- ============================================================= FOOTER ============================================================= -->

<%@include file="template/footer.jsp" %>

<!-- ============================================================= FOOTER : END ============================================================= -->   </div><!-- /.wrapper -->

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