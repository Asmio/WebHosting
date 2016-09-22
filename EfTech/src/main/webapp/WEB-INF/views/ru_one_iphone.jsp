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
                    </a>-->
                    
<!--                   <ul class="dropdown-menu">
                        <li><a href="vmc.htm">Vertical machine centers</a></li>
                        <li><a href="#">Horizontal machine centers</a></li>
                        <li><a href="#">Lathe CNC</a></li>

                    </ul>-->
<%@include file="template/dropdown le-dropdown.jsp" %>
                  
                <!--</li>-->

                <li class="breadcrumb-nav-holder"> 
                    <ul>
<!--                        <li class="dropdown breadcrumb-item">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Vertical machine center</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">PDA</a>
                                    <a href="#">accesories</a>
                                    <a href="#">tablets</a>
                                    <a href="#">games</a>
                                    <a href="#">consoles</a>
                                </li>
                            </ul>
                        </li> 
                        /.breadcrumb-item 

                        <li class="dropdown breadcrumb-item">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Desktop PC </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">PDA</a>
                                    <a href="#">accesories</a>
                                    <a href="#">tablets</a>
                                    <a href="#">games</a>
                                    <a href="#">consoles</a>
                                </li>
                            </ul>
                        </li> -->
                        <!--/.breadcrumb-item--> 

                        <li class="breadcrumb-item">
                            <a href="index.htm">Главная</a>
                        </li> 
                        <!--/.breadcrumb-item--> 

                        <li class="breadcrumb-item current">
                            <a href="">${iphone.manufacturer} - ${iphone.model}</a>
                        </li> 
                        <!--/.breadcrumb-item--> 
                    </ul>
                </li> 
                <!--/.breadcrumb-nav-holder--> 

            </ul> 
            <!--/.inline--> 
        </nav>

    </div> 
        <!--/.container--> 
</div> 
    <!--/#top-mega-nav--> 






<!-- ========================================= BREADCRUMB : END ========================================= --></div>     <div id="single-product">
    <div class="container">

         <div class="no-margin col-xs-12 col-sm-6 col-md-5 gallery-holder">
    <div class="product-item-holder size-big single-product-gallery small-gallery">

        <div id="owl-single-product">
            <div class="single-product-gallery-item" id="slide1">
                <a data-rel="prettyphoto" href="resources/assets/images/products/${iphone.photo1}">
                    <img class="img-responsive" alt="" 
                         src="resources/assets/images/products/${iphone.photo1}" 
                         data-echo="resources/assets/images/products/${iphone.photo1}" />
                         <!--src="resources/assets/images/blank.gif"--> 
                </a>
            </div><!-- /.single-product-gallery-item -->
            
            <div class="single-product-gallery-item" id="slide2">
                <a data-rel="prettyphoto" href="resources/assets/images/products/${iphone.photo2}">
                    <img class="img-responsive" alt="" 
                         src="resources/assets/images/products/${iphone.photo2}" 
                         data-echo="resources/assets/images/products/${iphone.photo2}" />
                         <!--src="resources/assets/images/blank.gif"--> 
                </a>
            </div><!-- /.single-product-gallery-item -->
            
            <div class="single-product-gallery-item" id="slide3">
                <a data-rel="prettyphoto" href="resources/assets/images/products/${iphone.photo3}">
                    <img class="img-responsive" alt="" 
                         src="resources/assets/images/products/${iphone.photo3}" 
                         data-echo="resources/assets/images/products/${iphone.photo3}" />
                         <!--src="resources/assets/images/blank.gif"--> 
                </a>
            </div><!-- /.single-product-gallery-item -->

<!--            <div class="single-product-gallery-item" id="slide2">
                <a data-rel="prettyphoto" href="resources/assets/images/products/product-gallery-01.jpg">
                    <img class="img-responsive" alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-gallery-01.jpg" />
                </a>
            </div> /.single-product-gallery-item 
<!--    
            <div class="single-product-gallery-item" id="slide3">
                <a data-rel="prettyphoto" href="resources/assets/images/products/product-gallery-01.jpg">
                    <img class="img-responsive" alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-gallery-01.jpg" />
                </a>
            </div> /.single-product-gallery-item -->
        </div><!-- /.single-product-slider -->


        <div class="single-product-gallery-thumbs gallery-thumbs">

            <div id="owl-single-product-thumbnails">
                <a class="horizontal-thumb active" data-target="#owl-single-product" data-slide="0" href="#slide1">
                    <!--<img width="67" alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/bench${iphone.id}.jpg" />-->
                    <img width="67" alt="" src="resources/assets/images/products/${iphone.photo1}" data-echo="resources/assets/images/products/${iphone.photo1}" />
                </a>

   
                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="1" href="#slide2">
                    <!--<img width="67" alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/gallery-thumb-01.jpg" />-->
                    <img width="67" alt=""  src="resources/assets/images/products/${iphone.photo2}" data-echo="resources/assets/images/products/${iphone.photo2}"  />
                </a>

                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="2" href="#slide3">
                    <!--<img width="67" alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/bench${iphone.id}.jpg" />-->
                    <img width="67" alt=""  src="resources/assets/images/products/${iphone.photo3}" data-echo="resources/assets/images/products/${iphone.photo3}"  />
                </a>
<!--                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="2" href="#slide3">
                    <img width="67" alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/bench${iphone.id}.jpg" />
                    <img width="67" alt="" src="resources/assets/images/products/bench4.jpg" data-echo="resources/assets/images/products/bench4.jpg" />
                </a>-->



            </div> 
                <!--/#owl-single-product-thumbnails--> 

            <div class="nav-holder left hidden-xs">
                <a class="prev-btn slider-prev" data-target="#owl-single-product-thumbnails" href="#prev"></a>
            </div> 
            <!--/.nav-holder--> 
            
            <div class="nav-holder right hidden-xs">
                <a class="next-btn slider-next" data-target="#owl-single-product-thumbnails" href="#next"></a>
            </div> 
            <!--/.nav-holder--> 

        </div>
                <!-- /.gallery-thumbs -->

    </div><!-- /.single-product-gallery -->
</div><!-- /.gallery-holder -->        
        <div class="no-margin col-xs-12 col-sm-7 body-holder">
    <div class="body">
        <!--<div class="star-holder inline"><div class="star" data-score="4"></div></div>-->
        <div class="availability"><label>Availability:</label><span class="available">  in stock</span></div>

        <div class="title"><a href="#">${iphone.manufacturer} - ${iphone.model}</a></div>
        <div class="brand">${iphone.year}   </div>

        <div class="social-row">
            <span class="st_facebook_hcount"></span>
            <span class="st_twitter_hcount"></span>
            <span class="st_pinterest_hcount"></span>
        </div>

        <div class="buttons-holder">
            <a class="btn-add-to-wishlist" href="add-product-to-wish-list.htm?id=${iphone.id}">add to wishlist</a>
            <a class="btn-add-to-compare" href="add-product-to-compare-list.htm?id=${iphone.id}">add to compare list</a>
        </div>

        <div class="excerpt">
            <p>${iphone.description}</p>
            
        </div>
        
        <div class="prices">
<!--            <div class="price-current">$1740.00</div>
            <div class="price-prev">$2199.00</div>-->
        </div>

        <div class="qnt-holder">
<!--            <div class="le-quantity">
                <form>
                    <a class="minus" href="#reduce"></a>
                    <input name="quantity" readonly="readonly" type="text" value="1" />
                    <a class="plus" href="#add"></a>
                </form>
            </div>-->
            <a id="addto-cart" href="add-product-to-customer-basket.htm?id=${iphone.id}" class="le-button huge">add to cart</a>
        </div><!-- /.qnt-holder -->
    </div><!-- /.body -->

</div><!-- /.body-holder -->
    </div><!-- /.container -->
    
    
    
    
    
</div><!-- /.single-product -->

<!-- ========================================= SINGLE PRODUCT TAB ========================================= -->
<section id="single-product-tab">
    <div class="container">
        <div class="tab-holder">
            
            <ul class="nav nav-tabs simple" >
                <li class="active"><a href="#description" data-toggle="tab">Описание</a></li>
                <li><a href="#additional-info" data-toggle="tab">Характеристики</a></li>
                <!--<li><a href="#reviews" data-toggle="tab">Reviews (3)</a></li>-->
            </ul><!-- /.nav-tabs -->

            <div class="tab-content">
                <div class="tab-pane active" id="description">
                    <p>${iphone.description}</p>

                    <!--<p>Sed consequat orci vel rutrum blandit. Nam non leo vel risus cursus porta quis non nulla. Vestibulum vitae pellentesque nunc. In hac habitasse platea dictumst. Cras egestas, turpis a malesuada mollis, magna tortor scelerisque urna, in pellentesque diam tellus sit amet velit. Donec vel rhoncus nisi, eget placerat elit. Phasellus dignissim nisl vel lectus vehicula, eget vehicula nisl egestas. Duis pretium sed risus dapibus egestas. Nam lectus felis, sodales sit amet turpis se.</p>-->
                   

                    <div class="meta-row">
                        <div class="inline">
                            <label>SKU:</label>
                            <span>54687621</span>
                        </div><!-- /.inline -->

                        <span class="seperator">/</span>

                        <div class="inline">
                            <label>categories:</label>
                            <!--<span><a href="#">-50% sale</a>,</span>-->
                            <span><a href="#">gaming</a>,</span>
                            <span><a href="#">desktop PC</a></span>
                        </div><!-- /.inline -->

                        <span class="seperator">/</span>

                        <div class="inline">
                            <label>tag:</label>
                            <span><a href="#">fast</a>,</span>
                            <span><a href="#">gaming</a>,</span>
                            <span><a href="#">strong</a></span>
                        </div><!-- /.inline -->
                    </div><!-- /.meta-row -->
                </div><!-- /.tab-pane #description -->

                <div class="tab-pane" id="additional-info">
                    
                <ul class="tabled-data">
                    <li>
                        <label>Модель </label>
                        <div class="value">${iphone.model}</div>

                    </li>
                        <li>
                            <label>Производитель</label>
                            <div class="value">${iphone.manufacturer}</div>
                            
                        </li>
                            <li>
                                <label>Год </label>
                                <div class="value">${iphone.year}</div>
                            </li>
                            
            <li>
                <label>Тип</label>
                <div class="value">${iphone.type}</div>
            </li>
                    <li>
                        <label>Операционная система</label>
                        <div class="value">${iphone.os}</div>
                    </li>
                            <li>
                                <label>Размер экрана</label>
                                <div class="value">${iphone.display_size}</div>
                            </li>
                                    <li>
                                        <label>Разрешение экрана</label>
                                        <div class="value">${iphone.display_resolution}</div>
                                    </li>
                                            <li>
                                                <label>RAM память</label>
                                                <div class="value">${iphone.ram_memory}</div> mm
                                            </li>
                                                    <li>
                                                        <label>Flash память</label>
                                                        <div class="value">${iphone.flash_memory}</div>
                                                    </li>
                        <li>
                            <label>Несколько СИМ</label>
                            <div class="value">${iphone.sim_several}</div>
                        </li>
                                <li>
                                    <label>Камера</label>
                                    <div class="value">${iphone.camera}</div>
                                </li>
                                        <li>
                                            <label>Количество точек матрицы </label>
                                            <div class="value">${iphone.matrix_points},  Мп</div>
                                        </li>
                                                <li>
                                                    <label>Конструкция корпуса </label>
                                                    <div class="value">${iphone.design_case}</div>
                                                </li>

                <li>
                    <label>Материал</label>
                    <div class="value">${iphone.material}</div>
                </li>
                        <li>
                            <label>Цвет</label>
                            <div class="value">${iphone.color}</div>
                        </li>
                                <li>
                                    <label>Формат SIM-карты  </label>
                                    <div class="value">${iphone.sim_format}</div>
                                </li>
                        <li>
                            <label>Габориты</label>
                            <div class="value">${iphone.dimensions}</div>
                        </li>
                                <li>
                                    <label>Вес  </label>
                                    <div class="value">${iphone.weight}</div>
                                </li>

                <li>
                    <label>Тип аккумулятора </label>
                    <div class="value">${iphone.battery_type}</div>
                </li>
                        <li>
                            <label>Ёмкость аккумулятора</label>
                            <div class="value">${iphone.battery_capacity}  мА·ч</div>
                        </li>
                                <li>
                                    <label>Несъёмный аккумулятор </label>
                                    <div class="value">${iphone.battery_removable}</div>
                                </li>
                                        <li>
                                            <label>Время разговора</label>
                                            <div class="value">${iphone.time_talk}, часов</div>
                                        </li>
                                                <li>
                                                    <label>Время ожидания (коректир)</label>
                                                    <div class="value">${iphone.time_out}</div>
                                                </li>
                                                        <li>
                                                            <label>Описание</label>
                                                            <div class="value">${iphone.description}</div>
                                                        </li>
                      
                        
                    </ul><!-- /.tabled-data -->

                    <div class="meta-row">
                        <div class="inline">
                            <label>SKU:</label>
                            <span>54687621</span>
                        </div><!-- /.inline -->

                        <span class="seperator">/</span>

                        <div class="inline">
                            <label>categories:</label>
                            <!--<span><a href="#">-50% sale</a>,</span>-->
                            <span><a href="#">gaming</a>,</span>
                            <span><a href="#">desktop PC</a></span>
                        </div><!-- /.inline -->

                        <span class="seperator">/</span>

                        <div class="inline">
                            <label>tag:</label>
                            <span><a href="#">fast</a>,</span>
                            <span><a href="#">gaming</a>,</span>
                            <span><a href="#">strong</a></span>
                        </div><!-- /.inline -->
                    </div><!-- /.meta-row -->
                </div><!-- /.tab-pane #additional-info -->


<!--                <div class="tab-pane" id="reviews">
                    <div class="comments">
                        <div class="comment-item">
                            <div class="row no-margin">
                                <div class="col-lg-1 col-xs-12 col-sm-2 no-margin">
                                    <div class="avatar">
                                        <img alt="avatar" src="resources/assets/images/default-avatar.jpg">
                                    </div> /.avatar 
                                </div> /.col 

                                <div class="col-xs-12 col-lg-11 col-sm-10 no-margin">
                                    <div class="comment-body">
                                        <div class="meta-info">
                                            <div class="author inline">
                                                <a href="#" class="bold">John Smith</a>
                                            </div>
                                            <div class="star-holder inline">
                                                <div class="star" data-score="4"></div>
                                            </div>
                                            <div class="date inline pull-right">
                                                12.07.2013
                                            </div>
                                        </div> /.meta-info 
                                        <p class="comment-text">
                                            Integer id purus ultricies nunc tincidunt congue vitae nec felis. Vivamus sit amet nisl convallis, faucibus risus in, suscipit sapien. Vestibulum egestas interdum tellus id venenatis. 
                                        </p> /.comment-text 
                                    </div> /.comment-body 

                                </div> /.col 

                            </div> /.row 
                        </div> /.comment-item 

                        <div class="comment-item">
                            <div class="row no-margin">
                                <div class="col-lg-1 col-xs-12 col-sm-2 no-margin">
                                    <div class="avatar">
                                        <img alt="avatar" src="resources/assets/images/default-avatar.jpg">
                                    </div> /.avatar 
                                </div> /.col 

                                <div class="col-xs-12 col-lg-11 col-sm-10 no-margin">
                                    <div class="comment-body">
                                        <div class="meta-info">
                                            <div class="author inline">
                                                <a href="#" class="bold">Jane Smith</a>
                                            </div>
                                            <div class="star-holder inline">
                                                <div class="star" data-score="5"></div>
                                            </div>
                                            <div class="date inline pull-right">
                                                12.07.2013
                                            </div>
                                        </div> /.meta-info 
                                        <p class="comment-text">
                                            Integer id purus ultricies nunc tincidunt congue vitae nec felis. Vivamus sit amet nisl convallis, faucibus risus in, suscipit sapien. Vestibulum egestas interdum tellus id venenatis. 
                                        </p> /.comment-text 
                                    </div> /.comment-body 

                                </div> /.col 

                            </div> /.row 
                        </div> /.comment-item 

                        <div class="comment-item">
                            <div class="row no-margin">
                                <div class="col-lg-1 col-xs-12 col-sm-2 no-margin">
                                    <div class="avatar">
                                        <img alt="avatar" src="resources/assets/images/default-avatar.jpg">
                                    </div> /.avatar 
                                </div> /.col 

                                <div class="col-xs-12 col-lg-11 col-sm-10 no-margin">
                                    <div class="comment-body">
                                        <div class="meta-info">
                                            <div class="author inline">
                                                <a href="#" class="bold">John Doe</a>
                                            </div>
                                            <div class="star-holder inline">
                                                <div class="star" data-score="3"></div>
                                            </div>
                                            <div class="date inline pull-right">
                                                12.07.2013
                                            </div>
                                        </div> /.meta-info 
                                        <p class="comment-text">
                                            Integer id purus ultricies nunc tincidunt congue vitae nec felis. Vivamus sit amet nisl convallis, faucibus risus in, suscipit sapien. Vestibulum egestas interdum tellus id venenatis. 
                                        </p> /.comment-text 
                                    </div> /.comment-body 

                                </div> /.col 

                            </div> /.row 
                        </div> /.comment-item 
                    </div> /.comments 

                    <div class="add-review row">
                        <div class="col-sm-8 col-xs-12">
                            <div class="new-review-form">
                                <h2>Add review</h2>
                                <form id="contact-form" class="contact-form" method="post" >
                                    <div class="row field-row">
                                        <div class="col-xs-12 col-sm-6">
                                            <label>name*</label>
                                            <input class="le-input" >
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <label>email*</label>
                                            <input class="le-input" >
                                        </div>
                                    </div> /.field-row 
                                    
                                    <div class="field-row star-row">
                                        <label>your rating</label>
                                        <div class="star-holder">
                                            <div class="star big" data-score="0"></div>
                                        </div>
                                    </div> /.field-row 

                                    <div class="field-row">
                                        <label>your review</label>
                                        <textarea rows="8" class="le-input"></textarea>
                                    </div> /.field-row 

                                    <div class="buttons-holder">
                                        <button type="submit" class="le-button huge">submit</button>
                                    </div> /.buttons-holder 
                                </form> /.contact-form 
                            </div> /.new-review-form 
                        </div> /.col 
                    </div> /.add-review 

                </div> /.tab-pane #reviews -->
            </div><!-- /.tab-content -->

        </div><!-- /.tab-holder -->
    </div><!-- /.container -->
</section><!-- /#single-product-tab -->
<!-- ========================================= SINGLE PRODUCT TAB : END ========================================= -->




<!-- ========================================= RECENTLY VIEWED ========================================= -->
<!--<section id="recently-reviewd" class="wow fadeInUp">
    <div class="container">
        <div class="carousel-holder hover">
            
            <div class="title-nav">
                <h2 class="h1">Recently Viewed</h2>
                <div class="nav-holder">
                    <a href="#prev" data-target="#owl-recently-viewed" class="slider-prev btn-prev fa fa-angle-left"></a>
                    <a href="#next" data-target="#owl-recently-viewed" class="slider-next btn-next fa fa-angle-right"></a>
                </div>
            </div> /.title-nav 

            <div id="owl-recently-viewed" class="owl-carousel product-grid-holder">
                <div class="no-margin carousel-item product-item-holder size-small hover">
                    <div class="product-item">
                        <div class="ribbon red"><span>sale</span></div> 
                        <div class="image">
                            <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-11.jpg" />
                        </div>
                        <div class="body">
                            <div class="title">
                                <a href="single-product.html">LC-70UD1U 70" class aquos 4K ultra HD</a>
                            </div>
                            <div class="brand">Sharp</div>
                        </div>
                        <div class="prices">
                            <div class="price-current text-right">$1199.00</div>
                        </div>
                        <div class="hover-area">
                            <div class="add-cart-button">
                                <a href="single-product.html" class="le-button">Add to Cart</a>
                            </div>
                            <div class="wish-compare">
                                <a class="btn-add-to-wishlist" href="#">Add to Wishlist</a>
                                <a class="btn-add-to-compare" href="#">Compare</a>
                            </div>
                        </div>
                    </div> /.product-item 
                </div> /.product-item-holder 

                <div class="no-margin carousel-item product-item-holder size-small hover">
                    <div class="product-item">
                        <div class="ribbon blue"><span>new!</span></div> 
                        <div class="image">
                            <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-12.jpg" />
                        </div>
                        <div class="body">
                            <div class="title">
                                <a href="single-product.html">cinemizer OLED 3D virtual reality TV Video</a>
                            </div>
                            <div class="brand">zeiss</div>
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
                    </div> /.product-item 
                </div> /.product-item-holder 

                <div class=" no-margin carousel-item product-item-holder size-small hover">
                    <div class="product-item">

                        <div class="image">
                            <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-13.jpg" />
                        </div>
                        <div class="body">
                            <div class="title">
                                <a href="single-product.html">s2340T23" full HD multi-Touch Monitor</a>
                            </div>
                            <div class="brand">dell</div>
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
                    </div> /.product-item 
                </div> /.product-item-holder 

                <div class=" no-margin carousel-item product-item-holder size-small hover">
                    <div class="product-item">
                        <div class="ribbon blue"><span>new!</span></div> 
                        <div class="image">
                            <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-14.jpg" />
                        </div>
                        <div class="body">
                            <div class="title">
                                <a href="single-product.html">kardon BDS 7772/120 integrated 3D</a>
                            </div>
                            <div class="brand">harman</div>
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
                    </div> /.product-item 
                </div> /.product-item-holder 

                <div class=" no-margin carousel-item product-item-holder size-small hover">
                    <div class="product-item">
                        <div class="ribbon green"><span>bestseller</span></div> 
                        <div class="image">
                            <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-15.jpg" />
                        </div>
                        <div class="body">
                            <div class="title">
                                <a href="single-product.html">netbook acer travel B113-E-10072</a>
                            </div>
                            <div class="brand">acer</div>
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
                    </div> /.product-item 
                </div> /.product-item-holder 

                <div class=" no-margin carousel-item product-item-holder size-small hover">
                    <div class="product-item">

                        <div class="image">
                            <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-16.jpg" />
                        </div>
                        <div class="body">
                            <div class="title">
                                <a href="single-product.html">iPod touch 5th generation,64GB, blue</a>
                            </div>
                            <div class="brand">apple</div>
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
                    </div> /.product-item 
                </div> /.product-item-holder 

                <div class=" no-margin carousel-item product-item-holder size-small hover">
                    <div class="product-item">

                        <div class="image">
                            <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-13.jpg" />
                        </div>
                        <div class="body">
                            <div class="title">
                                <a href="single-product.html">s2340T23" full HD multi-Touch Monitor</a>
                            </div>
                            <div class="brand">dell</div>
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
                    </div> /.product-item 
                </div> /.product-item-holder 

                <div class=" no-margin carousel-item product-item-holder size-small hover">
                    <div class="product-item">
                        <div class="ribbon blue"><span>new!</span></div> 
                        <div class="image">
                            <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-14.jpg" />
                        </div>
                        <div class="body">
                            <div class="title">
                                <a href="single-product.html">kardon BDS 7772/120 integrated 3D</a>
                            </div>
                            <div class="brand">harman</div>
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
                    </div> /.product-item 
                </div> /.product-item-holder 
            </div> /#recently-carousel 

        </div> /.carousel-holder 
    </div> /.container 
</section> /#recently-reviewd -->
<!-- ========================================= RECENTLY VIEWED : END ========================================= -->      <!-- ============================================================= FOOTER ============================================================= -->

<%@include file="template/footer.jsp" %>

<!-- ============================================================= FOOTER : END ============================================================= -->   </div><!-- /.wrapper -->



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