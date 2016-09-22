<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
            <script src="assets/js/html5shiv.js"></script>
            <script src="assets/js/respond.min.js"></script>
        <![endif]-->
    </head>
    
    
    
    
<body>

    
    <div class="wrapper">
        <!-- ============================================================= TOP NAVIGATION ============================================================= -->

  <%@include file="template/nav.jsp" %>
        
<!-- ============================================================= TOP NAVIGATION : END ============================================================= -->       <!-- ============================================================= HEADER ============================================================= -->

<%@include file="template/header.jsp" %>                                 
<!-- ============================================================= HEADER : END ============================================================= --><div class="animate-dropdown"><!-- ========================================= BREADCRUMB ========================================= -->

    <div id="top-mega-nav">
    <div class="container">
        <nav>
            <ul class="inline">
<!--                <li class="dropdown le-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-list"></i> shop by department
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="vmc.htm">Vertical machine centers</a></li>

                    </ul>
                </li>-->
<%@include file="template/dropdown le-dropdown.jsp" %>


                <li class="breadcrumb-nav-holder"> 
                    <ul>
                        <li class="breadcrumb-item">
                            <a href="index.htm">Главная</a>
                        </li>
                        <li class="breadcrumb-item current gray">
                            <a href="#">Корзина</a>
                        </li>
                    </ul>
                </li><!-- /.breadcrumb-nav-holder -->
            </ul>
        </nav>
    </div><!-- /.container -->
</div><!-- /#top-mega-nav -->
<!-- ========================================= BREADCRUMB : END ========================================= --></div>     <section id="cart-page">
    <div class="container">
        <!-- ========================================= CONTENT ========================================= -->
        <div class="col-xs-12 col-md-9 items-holder no-margin">
<!--         
-->       <c:forEach var="item" items="${cart.items}">
            <div class="row no-margin cart-item">
                <div class="col-xs-12 col-sm-2 no-margin">
                    <a href="vmc${item.product.id}.htm" class="thumb-holder">
                        <img class="lazy" alt="" width="73" height="73" src="resources/assets/images/products/${item.product.photo1}" />
                    </a>
                </div>

                <div class="col-xs-12 col-sm-5 ">
                    <div class="title">
                        <a href="#">${item.product.model}</a>
                    </div>
                    <div class="brand">${item.product.year} / </div>
                </div> 

                

                
                
                <div class="col-xs-12 col-sm-3 no-margin">
                    <div class="quantity">
                        <div class="le-quantity">
                              <form>
            <a class="minus" href="#reduce" onclick="window.location.assign('updatequantity.htm?id=${item.product.id}&quantity=${item.quantity-1}');"></a>
                                <!--<a class="minus" href="#reduce"></a>-->
            <input name="quantity" readonly="readonly" type="text"  value="${item.quantity}" /> </a> 
        <!--<input name="quantity" readonly="readonly" type="text" value="${item.quantity}" />-->
                                <!--<a class="plus" href="#add"></a>-->
            <a class="plus" href="#add"  onclick="window.location.assign('updatequantity.htm?id=${item.product.id}&quantity=${item.quantity+1}');"></a> 
                            
                            
                          
                            </form>
                                
<!--                              <form>
                                <a class="minus" href="#reduce"></a>
                                <input name="quantity" readonly="readonly" type="text" value="1" />
                                <a class="plus" href="#add"></a>
                            </form>     -->
                                
                        </div>
                    </div>
                </div> 


                <div class="col-xs-12 col-sm-2 no-margin">
                    <div class="price">
                        ${item.product.price} * ${item.quantity}<br> = ${item.total} 
                    </div>

                    <a class="close-btn" href="updatequantity.htm?id=${item.product.id}&quantity=0"></a>
                </div>
            </div> 
                    <!--/.cart-item--> 
         </c:forEach>
            
            
<!--            <div class="row no-margin cart-item">
                <div class="col-xs-12 col-sm-2 no-margin">
                    <a href="#" class="thumb-holder">
                        <img class="lazy" alt="" src="http://placehold.it/73x73" />
                    </a>
                </div>

                <div class="col-xs-12 col-sm-5">
                    <div class="title">
                        <a href="#">white lumia 9001 </a>
                    </div>
                    <div class="brand">sony</div>
                </div> 

                <div class="col-xs-12 col-sm-3 no-margin">
                    <div class="quantity">
                        <div class="le-quantity">
                            <form>
                                <a class="minus" href="#reduce"></a>
                                <input name="quantity" readonly="readonly" type="text" value="1" />
                                <a class="plus" href="#add"></a>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-2 no-margin">
                    <div class="price">
                        $2000.00
                    </div>
                    <a class="close-btn" href="#"></a>
                </div>
            </div> -->
            <!--/.cart-item--> 

<!--            <div class="row no-margin cart-item">
                <div class="col-xs-12 col-sm-2 no-margin">
                    <a href="#" class="thumb-holder">
                        <img class="lazy" alt="" src="http://placehold.it/73x73" />
                    </a>
                </div>

                <div class="col-xs-12 col-sm-5">
                    <div class="title">
                        <a href="#">white lumia 9001 </a>
                    </div>
                    <div class="brand">sony</div>
                </div> 

                <div class="col-xs-12 col-sm-3 no-margin">
                    <div class="quantity">
                        <div class="le-quantity">
                            <form>
                                <a class="minus" href="#reduce"></a>
                                <input name="quantity" readonly="readonly" type="text" value="1" />
                                <a class="plus" href="#add"></a>
                            </form>
                        </div>
                    </div>
                </div> 
                
                <div class="col-xs-12 col-sm-2 no-margin">
                    <div class="price">
                        $2000.00
                    </div>
                    <a class="close-btn" href="#"></a>
                </div>
            </div> /.cart-item -->

<!--            <div class="row no-margin cart-item">
                <div class="col-xs-12 col-sm-2 no-margin">
                    <a href="#" class="thumb-holder">
                        <img class="lazy" alt="" src="http://placehold.it/73x73" />
                    </a>
                </div>

                <div class="col-xs-12 col-sm-5">
                    <div class="title">
                        <a href="#">white lumia 9001 </a>
                    </div>
                    <div class="brand">sony</div>
                </div> 

                <div class="col-xs-12 col-sm-3 no-margin">
                    <div class="quantity">
                        <div class="le-quantity">
                            <form>
                                <a class="minus" href="#reduce"></a>
                                <input name="quantity" readonly="readonly" type="text" value="1" />
                                <a class="plus" href="#add"></a>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-2 no-margin">
                    <div class="price">
                        $2000.00
                    </div>
                    <a class="close-btn" href="#"></a>
                </div>
            </div> /.cart-item -->
        </div>
        <!-- ========================================= CONTENT : END ========================================= -->

        <!-- ========================================= SIDEBAR ========================================= -->

        <div class="col-xs-12 col-md-3 no-margin sidebar ">
            <div class="widget cart-summary">
                <h1 class="border">shopping cart</h1>
                <div class="body">
                    <ul class="tabled-data no-border inverse-bold">
                        <li>
                            <label>cart subtotal</label>
                            <div class="value pull-right">${cart.subtotal}</div>
                        </li>
                        <li>
                            <label>VAT</label>
                            <div class="value pull-right">not included</div>
                        </li>
                        <li>
                            <label>shipping</label>
                            <div class="value pull-right">not included</div>
                        </li>
                    </ul>
                    <ul id="total-price" class="tabled-data inverse-bold no-border">
                        <li>
                            <label>order total</label>
                            <div class="value pull-right">${cart.total}</div>
                        </li>
                    </ul>
                    <div class="buttons-holder">
                        <!--<a class="le-button big" href="#" >checkout</a>-->
                        <a class="simple-link block" href="index.htm" >continue shopping</a>
                    </div>
                </div>
            </div><!-- /.widget -->

<!--            <div id="cupon-widget" class="widget">
                <h1 class="border">use coupon</h1>
                <div class="body">
                    <form>
                        <div class="inline-input">
                            <input data-placeholder="enter coupon code" type="text" />
                            <button class="le-button" type="submit">Apply</button>
                        </div>
                    </form>
                </div>
            </div> /.widget -->
        </div><!-- /.sidebar -->

        <!-- ========================================= SIDEBAR : END ========================================= -->
    </div>
</section>      
                        
                        
                
                        
                        

<!-- ============================================================= FOOTER ============================================================= -->

<%@include file="template/footer.jsp" %>
                        
<!-- ============================================================= FOOTER : END ============================================================= -->   </div><!-- /.wrapper -->

    <!-- For demo purposes â can be removed on production -->
    
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