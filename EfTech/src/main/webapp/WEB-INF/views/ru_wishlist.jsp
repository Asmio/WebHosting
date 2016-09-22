<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

        <title>MediaCenter - Responsive eCommerce Template</title>

        <!-- Bootstrap Core CSS -->
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
        <!-- ============================================================= TOP NAVIGATION ============================================================= -->

<%@include file="template/nav.jsp" %>        
<!-- ============================================================= TOP NAVIGATION : END ============================================================= -->       <!-- ============================================================= HEADER ============================================================= -->
<%@include file="template/header.jsp" %>
        
        
        <!-- ============================================================= HEADER : END ============================================================= --><div class="animate-dropdown"><!-- ========================================= BREADCRUMB ========================================= -->
<!--<div id="top-mega-nav">
    <div class="container">
        <nav>
            <ul class="inline">
                <li class="dropdown le-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-list"></i> shop by department
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Computer Cases & Accessories</a></li>
                        <li><a href="#">CPUs, Processors</a></li>
                        <li><a href="#">Fans, Heatsinks &amp; Cooling</a></li>
                        <li><a href="#">Graphics, Video Cards</a></li>
                        <li><a href="#">Interface, Add-On Cards</a></li>
                        <li><a href="#">Laptop Replacement Parts</a></li>
                        <li><a href="#">Memory (RAM)</a></li>
                        <li><a href="#">Motherboards</a></li>
                        <li><a href="#">Motherboard &amp; CPU Combos</a></li>
                        <li><a href="#">Motherboard Components</a></li>
                    </ul>
                </li>

                <li class="breadcrumb-nav-holder"> 
                    <ul>
                        <li class="breadcrumb-item">
                            <a href="index.htm">Home</a>
                        </li>
                        <li class="breadcrumb-item current gray">
                            <a href="wishlist.html">Wishlist</a>
                        </li>
                    </ul>
                </li> /.breadcrumb-nav-holder 
            </ul>
        </nav>
    </div>
     /.container 
</div>-->
            <!-- /#top-mega-nav -->
<!-- ========================================= BREADCRUMB : END ========================================= --></div>     <div class="main-content" id="main-content">
    <div class="row">
        <div class="col-lg-10 center-block page-wishlist style-cart-page inner-bottom-xs">

            <div class="inner-xs">
                <div class="page-header">
                    <h2 class="page-title">Cписок станков для рассмотрения</h2>
                </div>
            </div><!-- /.section-page-title -->

            <div class="items-holder">
                <div class="container-fluid wishlist_table">
                      
                    
                    <c:forEach var="wishit" items="${wishlistCart.items}">
                    <div class="row cart-item cart_item" id="yith-wcwl-row-1">
                        
                        <div class="col-xs-12 col-sm-1 no-margin">
                            <a title="Remove this product" class="remove_from_wishlist remove-item" href="del-from-wishlist.htm?id=${wishit.product.id}&page=ru-wishlist">x</a>
                        </div>

                        <div class="col-xs-12 col-sm-1 no-margin">
                            <a href="hmc${wishit.product.id}.htm">
                                <img width="73" height="73" alt="${wishit.product.model}" class="attachment-shop_thumbnail wp-post-image" src="resources/assets/images/products/${wishit.product.photo1}">
                            </a>
                        </div>
                        <div class="col-xs-12 col-sm-4 no-margin">
                            <div class="title">
                                <a href="hmc${wishit.product.id}.htm">${wishit.product.model}</a>
                            </div><!-- /.title --> 
                                <div class="title">
                                    <a href="#">${wishit.product.benchType}</a>
                                </div>
                            <div>
                                <span class="label label-success wishlist-in-stock">${wishit.product.year} / location:${wishit.product.benchLocation}</span>
                            </div>    
                        </div>
                        
                        <div class="col-xs-12 col-sm-3 no-margin">
                            <div class="price">
                                <span class="amount">${wishit.product.cost}</span>                         
                            </div>
                        </div>
<!--                        <div class="col-xs-12 col-sm-3 no-margin">
                            <div class="price">
                                <span class="amount"></span>                         
                                <span class="amount">Location: ${wishit.product.benchLocation}</span>                         
                            </div>
                        </div>-->
                        
                        <div class="col-xs-12 col-sm-3 no-margin">
                            <div class="text-right">
                                <div class="add-cart-button">
                                    <a class="le-button add_to_cart_button product_type_simple" href="add-product-to-customer-basket.htm?id=${wishit.product.id}&page=wihslist">Add to cart</a>
                                </div>                          
                            </div>
                        </div>
                    
                    </div><!-- /.cart-item -->
            </c:forEach>
                                    
<!--                    <div class="row cart-item cart_item" id="yith-wcwl-row-6">
                        
                        <div class="col-xs-12 col-sm-1 no-margin">
                            <a title="Remove this product" class="remove_from_wishlist remove-item" href="#">Ã</a>
                        </div>

                        <div class="col-xs-12 col-sm-1 no-margin">
                            <a href="single-product.html">
                                <img width="73" height="73" alt="I - Book Mini Laptop" class="attachment-shop_thumbnail wp-post-image" src="resources/assets/images/products/product-small-02.jpg">                           
                            </a>
                        </div>
                        <div class="col-xs-12 col-sm-4 no-margin">
                            <div class="title">
                                <a href="single-product.html">I - Book Mini Laptop</a>
                            </div> /.title  
                            <div>
                                <span class="label label-danger wishlist-out-of-stock">Out of Stock</span>
                            </div>                      
                        </div>
                        
                        <div class="col-xs-12 col-sm-3 no-margin">
                            <div class="price">
                                <span class="amount">$1,199.95</span>                           
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-3 no-margin">
                            <div class="text-right">
                                <div class="add-cart-button">
                                    <a class="le-button disabled product_type_simple" href="cart.html.html">Add to cart</a>
                                </div>                          
                            </div>
                        </div>
                    </div>-->
                    <!-- /.cart-item -->

                </div><!-- /.wishlist-table -->
            </div><!-- /.items-holder -->

        </div><!-- .large-->
    </div><!-- .row-->  
</div>      <!-- ============================================================= FOOTER ============================================================= -->


<%@include file="template/footer.jsp" %>


<!-- ============================================================= FOOTER : END ============================================================= -->   </div><!-- /.wrapper -->

    <!-- For demo purposes â can be removed on production -->
    
<!--    <div class="config open">
        <div class="config-options">
            <h4>Pages</h4>
            <ul class="list-unstyled animate-dropdown">
                <li class="dropdown">
                    <button class="dropdown-toggle btn le-button btn-block" data-toggle="dropdown">View Pages</button>
                    <ul class="dropdown-menu">
                                                <li><a href="#">Home</a></li>
                                                <li><a href="#">Home Alt</a></li>
                                                <li><a href="category-grid.html">Category - Grid/List</a></li>
                                                <li><a href="category-grid-2.html">Category 2 - Grid/List</a></li>
                                                <li><a href="single-product.html">Single Product</a></li>
                                                <li><a href="single-product-sidebar.html">Single Product with Sidebar</a></li>
                                                <li><a href="cart.html">Shopping Cart</a></li>
                                                <li><a href="checkout.html">Checkout</a></li>
                                                <li><a href="#">About Us</a></li>
                                                <li><a href="#">Contact Us</a></li>
                                                <li><a href="#">Blog</a></li>
                                                <li><a href="#">Blog Full Width</a></li>
                                                <li><a href="blog-post.html">Blog Post</a></li>
                                                <li><a href="faq.html">FAQ</a></li>
                                                <li><a href="terms.html">Terms & Conditions</a></li>
                                                <li><a href="authentication.html">Login/Register</a></li>
                                                <li><a href="404.html">404</a></li>
                                                <li><a href="wishlist.html">Wishlist</a></li>
                                                <li><a href="compare.html">Product Comparison</a></li>
                                                <li><a href="track-your-order.html">Track your Order</a></li>
                                            </ul>   
                </li>
            </ul>
            <h4>Header Styles</h4>
            <ul class="list-unstyled">
                <li><a href="category-grid.html&amp;style=alt1">Header 1</a></li>
                <li><a href="category-grid.html&amp;style=alt">Header 2</a></li>
            </ul>
            <h4>Colors</h4>
            <ul class="list-unstyled">
                <li><a class="changecolor green-text" href="#" title="Green color">Green</a></li>
                <li><a class="changecolor blue-text" href="#" title="Blue color">Blue</a></li>
                <li><a class="changecolor red-text" href="#" title="Red color">Red</a></li>
                <li><a class="changecolor orange-text" href="#" title="Orange color">Orange</a></li>
                <li><a class="changecolor navy-text" href="#" title="Navy color">Navy</a></li>
                <li><a class="changecolor dark-green-text" href="#" title="Darkgreen color">Dark Green</a></li>
            </ul>
        </div>
        <a class="show-theme-options" href="#"><i class="fa fa-wrench"></i></a>
    </div>-->
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