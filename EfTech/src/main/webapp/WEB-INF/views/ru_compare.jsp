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

    
    
    <div id="top-mega-nav">
    <div class="container">
        <nav>
            <ul class="inline">
<!--                <li class="dropdown le-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-list"></i> shop by department
                    </a>-->
<!--                    <ul class="dropdown-menu">
                        <li><a href="vmc.htm">Vertical machine centers</a></li>
                        <li><a href="#">Horizontal machine centers</a></li>
                        <li><a href="#">Lathe CNC</a></li>
       
                    </ul>-->
                       <%@include file="template/dropdown le-dropdown.jsp" %>
                
                <!--</li>-->

                <li class="breadcrumb-nav-holder"> 
                    <ul>
                        <li class="breadcrumb-item">
                            <a href="index.htm">Главная</a>
                        </li>
                        <li class="breadcrumb-item current gray">
                            <!--<a href="index.php?page=compaore">Product Comparison</a>-->
                            <a href="#">Сравниваемые товары</a>
                        </li>
                    </ul>
                </li> 
                <!--/.breadcrumb-nav-holder--> 
            </ul>
        </nav>
    </div>
        <!--/.container--> 
</div> 
    <!--/#top-mega-nav--> 
<!-- ========================================= BREADCRUMB : END ========================================= --></div>     <div class="main-content" id="main-content">
    <div class="container">
        <div class="inner-xs">
            <div class="page-header">
                <h2 class="page-title">
                    Сравниваемые товары            
                </h2>
            </div>
        </div><!-- /.section-page-title -->

        <div class="table-responsive inner-bottom-xs inner-top-xs">

            <table class="table table-bordered table-striped compare-list">
                <thead>
                    <tr>
                        <td>&nbsp;</td>
                       
                   <c:forEach items="${compareCart.items}" var="item1">
                        <td class="text-center">
                            <div class="image-wrap">
                                <a data-product_id="39" href="delete-phone-${item1.product.id}-from-compare.htm" class="remove-link"><i class="fa fa-times-circle"></i></a>
                                <a href="iphone-${item1.product.id}.htm" > <img width="220" height="154" alt="Iconia W700" class="attachment-yith-woocompare-image" src="resources/assets/images/products/${item1.product.photo1}">   </a>                     
                            </div>
                                <p><a href="iphone-${item1.product.id}.htm" > <strong>${item1.product.model}</strong> </a> </p>
                        </td>
                   </c:forEach> 
                        
                
<!--                        <td class="text-center">
                            <div class="image-wrap">
                                <a data-product_id="34" href="#" class="remove-link"><i class="fa fa-times-circle"></i></a>
                                <img width="220" height="154" alt="POV Action Cam" class="attachment-yith-woocompare-image" src="resources/assets/images/products/product-02.jpg">                        
                            </div>
                            <p><strong>AS100V Action Cam</strong></p>
                        </td>
                        <td class="text-center">
                            <div class="image-wrap">
                                <a data-product_id="30" href="#" class="remove-link"><i class="fa fa-times-circle"></i></a>
                                <img width="220" height="154" alt="PlayStation 4" class="attachment-yith-woocompare-image" src="resources/assets/images/products/product-03.jpg">                        
                            </div>
                            <p><strong>PlayStation 4</strong></p>
                        </td>
                        <td class="text-center">
                            <div class="image-wrap">
                                <a data-product_id="20" href="#" class="remove-link"><i class="fa fa-times-circle"></i></a>
                                <img width="220" height="154" alt="Cyber-shot Digital Camera WX300" class="attachment-yith-woocompare-image" src="resources/assets/images/products/product-04.jpg">                       
                            </div>
                            <p><strong>Cyber-shot Digital Camera WX300</strong></p>
                        </td>-->
                    </tr>
                    
                    
                    <tr class="tr-add-to-cart">
                        <td>&nbsp;</td>
                    <c:forEach items="${compareCart.items}" var="item1">
                        <td class="text-center">
                            <div class="add-cart-button">
                                <a class="le-button add_to_cart_button  product_type_simple" href="add-product-to-customer-basket.htm?id=${item1.product.id}">Add to cart</a>
                            </div>                    
                        </td>
                   </c:forEach>
<!--                        <td class="text-center">
                            <div class="add-cart-button">
                                <a class="le-button add_to_cart_button  product_type_simple" href="cart.html.html">Add to cart</a>
                            </div>
                        </td>
                        <td class="text-center">
                            <div class="add-cart-button">
                                <a class="le-button add_to_cart_button  product_type_simple" href="cart.html.html">Add to cart</a>
                            </div>
                        </td>
                        <td class="text-center">
                            <div class="add-cart-button">
                                <a class="le-button add_to_cart_button  product_type_variable" href="cart.html.html">Add to cart</a>
                            </div>                    
                        </td>-->
                    </tr>
                    
                    
                </thead>
                
                <tbody>
                                                                                                     
                  <tr class="comparison-item price">
                        <th>Manufacturer</th>
                     <c:forEach items="${compareCart.items}" var="item1">
                        <td class="comparison-item-cell odd product_39">
                            <span class="amount">${item1.product.manufacturer}</span>                        
                        </td>
                     </c:forEach>
<!--                        <td class="comparison-item-cell even product_34">
                            <del><span class="amount">$299.99</span></del> 
                            <ins><span class="amount">$269.99</span></ins>                        
                        </td>
                        <td class="comparison-item-cell odd product_30">
                            <span class="amount">$399.99</span>                        
                        </td>
                        <td class="comparison-item-cell even product_20">
                            <del><span class="amount">$329.99</span></del> 
                            <ins><span class="amount">$249.99</span>&ndash;<span class="amount">$329.99</span></ins>                        
                        </td>-->
                    </tr>
                    
                    
                    
                    <tr class="comparison-item price">
                        <th>Год</th>
                     <c:forEach items="${compareCart.items}" var="item1">
                        <td class="comparison-item-cell odd product_39">                                           
                            <p>${item1.product.year}</p>                        
                        </td>
                     </c:forEach>
                    </tr>  
                    
                    
                    
                    <tr class="comparison-item description">
                        <th>Type:</th>
                                <c:forEach items="${compareCart.items}" var="item1">
                                    <td class="comparison-item-cell odd product_39">
                                        <p> ${item1.product.type} </p>
                                    </td>
                                </c:forEach>
                        
<!--                        <td class="comparison-item-cell even product_34">
                            <p>Nulla sed sapien a ligula auctor maximus. Aliquam eget condimentum nunc. Maecenas efficitur pretium nunc in semper. Nullam ac luctus nisl. </p>
                        </td>
                        <td class="comparison-item-cell odd product_30">
                            <p>Nulla sed sapien a ligula auctor maximus. Aliquam eget condimentum nunc. Maecenas efficitur pretium nunc in semper. Nullam ac luctus nisl. </p>
                        </td>
                        <td class="comparison-item-cell even product_20">
                            <p>Nulla sed sapien a ligula auctor maximus. Aliquam eget condimentum nunc. Maecenas efficitur pretium nunc in semper. Nullam ac luctus nisl. </p>
                        </td>-->
                    </tr>
                        
                    
                    <tr class="comparison-item price">
                        <th>Операционная система </th>
                     <c:forEach items="${compareCart.items}" var="item1">
                        <td class="comparison-item-cell odd product_39">
                            <!--<span class="amount">${item1.product.os}</span>-->                        
                            <p>${item1.product.os}</p>                        
                        </td>
                     </c:forEach>
                    </tr>
                    
                    
                    <tr class="comparison-item description">
                        <th>Размер экрана, дюйм</th>
                                <c:forEach items="${compareCart.items}" var="item1">
                                    <td class="comparison-item-cell odd product_39">
                                        <p> ${item1.product.display_size} </p>
                                    </td>
                                </c:forEach>
                    </tr>
                                    
                                <tr class="comparison-item description">
                                    <th>Разрешение экрана </th>
                                        <c:forEach items="${compareCart.items}" var="item1">
                                            <td class="comparison-item-cell odd product_39">
                                                <p> ${item1.product.display_resolution} </p>
                                            </td>
                                        </c:forEach>
                                </tr>                    
                       
                                             <tr class="comparison-item price">
                                                <th>Оперативная память, ГБ</th>
                                             <c:forEach items="${compareCart.items}" var="item1">
                                                <td class="comparison-item-cell odd product_39">                                           
                                                    <p>${item1.product.ram_memory}</p>                        
                                                </td>
                                             </c:forEach>
                                            </tr>                         
                    
                                                        <tr class="comparison-item description">
                                                         <th>Флэш-память, ГБ</th>
                                                                <c:forEach items="${compareCart.items}" var="item1">
                                                                    <td class="comparison-item-cell odd product_39">
                                                                        <p> ${item1.product.flash_memory} </p>
                                                                    </td>
                                                                </c:forEach>
                                                        </tr>                    
                                    
         <tr class="comparison-item price">
            <th>Поддержка нескольких SIM-карт </th>
         <c:forEach items="${compareCart.items}" var="item1">
            <td class="comparison-item-cell odd product_39">                                           
                <p>${item1.product.sim_several}</p>                        
            </td>
         </c:forEach>
        </tr>                         
                    
               <tr class="comparison-item description">
                <th>Встроенная камера </th>
                        <c:forEach items="${compareCart.items}" var="item1">
                            <td class="comparison-item-cell odd product_39">
                                <p> ${item1.product.camera} </p>
                            </td>
                        </c:forEach>
               </tr>                       
                    
                        <tr class="comparison-item price">
                            <th>Количество точек матрицы ,  Мп</th>
                         <c:forEach items="${compareCart.items}" var="item1">
                            <td class="comparison-item-cell odd product_39">                                           
                                <p>${item1.product.matrix_points}</p>                        
                            </td>
                         </c:forEach>
                        </tr>                         
                    
                                   <tr class="comparison-item description">
                                    <th>Конструкция корпуса </th>
                                            <c:forEach items="${compareCart.items}" var="item1">
                                                <td class="comparison-item-cell odd product_39">
                                                    <p> ${item1.product.design_case} </p>
                                                </td>
                                            </c:forEach>
                                   </tr>                           
                    
                                           <tr class="comparison-item price">
                                                <th>Материал корпуса </th>
                                             <c:forEach items="${compareCart.items}" var="item1">
                                                <td class="comparison-item-cell odd product_39">                                           
                                                    <p>${item1.product.material}</p>                        
                                                </td>
                                             </c:forEach>
                                           </tr>                         
                    
                                                       <tr class="comparison-item description">
                                                        <th>Цвет корпуса </th>
                                                                <c:forEach items="${compareCart.items}" var="item1">
                                                                    <td class="comparison-item-cell odd product_39">
                                                                        <p> ${item1.product.color} </p>
                                                                    </td>
                                                                </c:forEach>
                                                       </tr>                       
                       
                                                                       <tr class="comparison-item description">
                                                                        <th>Формат SIM-карты  </th>
                                                                                <c:forEach items="${compareCart.items}" var="item1">
                                                                                    <td class="comparison-item-cell odd product_39">
                                                                                        <p> ${item1.product.sim_format} </p>
                                                                                    </td>
                                                                                </c:forEach>
                                                                       </tr>                       
       <tr class="comparison-item description">
        <th>Габориты </th>
                <c:forEach items="${compareCart.items}" var="item1">
                    <td class="comparison-item-cell odd product_39">
                        <p> ${item1.product.dimensions} </p>
                    </td>
                </c:forEach>
       </tr>                       
                    
               <tr class="comparison-item description">
                <th>Вес </th>
                        <c:forEach items="${compareCart.items}" var="item1">
                            <td class="comparison-item-cell odd product_39">
                                <p> ${item1.product.weight} </p>
                            </td>
                        </c:forEach>
               </tr>                       
                       
                       <tr class="comparison-item description">
                        <th>Тип аккумулятора  </th>
                                <c:forEach items="${compareCart.items}" var="item1">
                                    <td class="comparison-item-cell odd product_39">
                                        <p> ${item1.product.battery_type} </p>
                                    </td>
                                </c:forEach>
                       </tr>                       
                    
                                   <tr class="comparison-item description">
                                    <th>Ёмкость аккумулятора, мА·ч </th>
                                            <c:forEach items="${compareCart.items}" var="item1">
                                                <td class="comparison-item-cell odd product_39">
                                                    <p> ${item1.product.battery_capacity} </p>
                                                </td>
                                            </c:forEach>
                                   </tr>                       
                       
                                           <tr class="comparison-item description">
                                            <th>Несъёмный аккумулятор </th>
                                                    <c:forEach items="${compareCart.items}" var="item1">
                                                        <td class="comparison-item-cell odd product_39">
                                                            <p> ${item1.product.battery_removable} </p>
                                                        </td>
                                                    </c:forEach>
                                           </tr>                       
                    
                                                       <tr class="comparison-item description">
                                                        <th>Время разговора,  часов </th>
                                                                <c:forEach items="${compareCart.items}" var="item1">
                                                                    <td class="comparison-item-cell odd product_39">
                                                                        <p> ${item1.product.time_talk} </p>
                                                                    </td>
                                                                </c:forEach>
                                                       </tr>                       
                                                                   <tr class="comparison-item description">
                                                                    <th>Время ожидания </th>
                                                                            <c:forEach items="${compareCart.items}" var="item1">
                                                                                <td class="comparison-item-cell odd product_39">
                                                                                    <p> ${item1.product.time_out} </p>
                                                                                </td>
                                                                            </c:forEach>
                                                                   </tr>                       
                       

                    
                       
                       
                       
                       
                       
                       
<!--                    <tr class="comparison-item stock">
                        <th>Availability</th>

                        <td class="comparison-item-cell odd product_39">
                            <span class="label label-success"><span class="">In stock</span></span>                        
                        </td>
                        <td class="comparison-item-cell even product_34">
                            <span class="label label-success"><span class="">In stock</span></span>                        
                        </td>
                        <td class="comparison-item-cell odd product_30">
                            <span class="label label-success"><span class="">In stock</span></span>                        
                        </td>
                        <td class="comparison-item-cell even product_20">
                            <span class="label label-success"><span class="">In stock</span></span>                        
                        </td>
                    </tr>
                                    
                    <tr class="price repeated">
                        <th>Price</th>
                        <td class="odd product_39"><span class="amount">$629.99</span></td>
                        <td class="even product_34"><del><span class="amount">$299.99</span></del> <ins><span class="amount">$269.99</span></ins></td>
                        <td class="odd product_30"><span class="amount">$399.99</span></td>
                        <td class="even product_20"><del><span class="amount">$329.99</span></del> <ins><span class="amount">$249.99</span>&ndash;<span class="amount">$329.99</span></ins></td>
                    </tr>-->
                    
                    
                    
                    
                </tbody>
            </table>
        </div><!-- /.table-responsive -->
    </div><!-- /.container -->  
</div>   


<!-- ============================================================= FOOTER ============================================================= -->

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