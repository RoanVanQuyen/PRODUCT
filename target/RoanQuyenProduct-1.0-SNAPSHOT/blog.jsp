﻿<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-blog</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets\img\favicon.png">
		
		<!-- all css here -->
       <link rel="stylesheet" href="assets\css\bootstrap.min.css">
        <link rel="stylesheet" href="assets\css\plugin.css">
        <link rel="stylesheet" href="assets\css\bundle.css">
        <link rel="stylesheet" href="assets\css\style.css">
        <link rel="stylesheet" href="assets\css\responsive.css">
        <script src="assets\js\vendor\modernizr-2.8.3.min.js"></script>
    </head>
    <body>
            <!-- Add your site or application content here -->
            
            <!--pos page start-->
            <div class="pos_page">
                <div class="container">
                    <!--pos page inner-->
                    <div class="pos_page_inner">  
                       <!--header area -->
                        <div class="header_area">
                           <!--header top--> 
                            <div class="header_top">
                               <div class="row align-items-center">
                                    <div class="col-lg-6 col-md-6">
                                       <div class="switcher">
                                            <ul>
                                                <li class="languages"><a href="#"><img src="assets\img\logo\fontlogo.jpg" alt=""> English <i class="fa fa-angle-down"></i></a>
                                                    <ul class="dropdown_languages">
                                                        <li><a href="#"><img src="assets\img\logo\fontlogo.jpg" alt=""> English</a></li>
                                                        <li><a href="#"><img src="assets\img\logo\fontlogo2.jpg" alt=""> French </a></li>
                                                    </ul>   
                                                </li> 

                                                <li class="currency"><a href="#"> Currency : $ <i class="fa fa-angle-down"></i></a>
                                                    <ul class="dropdown_currency">
                                                        <li><a href="#"> Dollar (USD)</a></li>
                                                        <li><a href="#"> Euro (EUR)  </a></li>
                                                    </ul>  
                                                </li> 
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="header_links">
                                            <ul>
                                                <li><a href="contact.jsp" title="Contact">Contact</a></li>
                                                <li><a href="wishlist.jsp" title="wishlist">My wishlist</a></li>
                                                <li><a href="my-account.jsp" title="My account">My account</a></li>
                                                <li><a href="cart.jsp" title="My cart">My cart</a></li>
                                                <% String value_user = session.getAttribute("value_user") == null ? "" : session.getAttribute("value_user")+"" ;  %>
                                                <% if(value_user == ""){ %>
                                                <li><a href="login.jsp">Login</a></li>
                                                <% }
                                                else{ %>
                                                <li><a href="#">Hello: <%=value_user%></a></li> <%
                                                } %>
                                            </ul>
                                        </div>   
                                    </div>
                               </div> 
                            </div> 
                            <!--header top end-->

                            <!--header middel--> 
                            <div class="header_middel">
                                <div class="row align-items-center">
                                    <div class="col-lg-3 col-md-3">
                                        <div class="logo">
                                            <a href="index.jsp"><img src="assets\img\logo\logo.jpg.png" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-9 col-md-9">
                                        <div class="header_right_info">
                                            <div class="search_bar">
                                                <form action="#">
                                                    <input placeholder="Search..." type="text">
                                                    <button type="submit"><i class="fa fa-search"></i></button>
                                                </form>
                                            </div>
                                            <div class="shopping_cart">
                                                <a href="#"><i class="fa fa-shopping-cart"></i> 2Items - $209.44 <i class="fa fa-angle-down"></i></a>

                                                <!--mini cart-->
                                                <div class="mini_cart">
                                                    <div class="cart_item">
                                                       <div class="cart_img">
                                                           <a href="#"><img src="assets\img\cart\cart.jpg" alt=""></a>
                                                       </div>
                                                        <div class="cart_info">
                                                            <a href="#">lorem ipsum dolor</a>
                                                            <span class="cart_price">$115.00</span>
                                                            <span class="quantity">Qty: 1</span>
                                                        </div>
                                                        <div class="cart_remove">
                                                            <a title="Remove this item" href="#"><i class="fa fa-times-circle"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="cart_item">
                                                       <div class="cart_img">
                                                           <a href="#"><img src="assets\img\cart\cart2.jpg" alt=""></a>
                                                       </div>
                                                        <div class="cart_info">
                                                            <a href="#">Quisque ornare dui</a>
                                                            <span class="cart_price">$105.00</span>
                                                            <span class="quantity">Qty: 1</span>
                                                        </div>
                                                        <div class="cart_remove">
                                                            <a title="Remove this item" href="#"><i class="fa fa-times-circle"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="shipping_price">
                                                        <span> Shipping </span>
                                                        <span>  $7.00  </span>
                                                    </div>
                                                    <div class="total_price">
                                                        <span> total </span>
                                                        <span class="prices">  $227.00  </span>
                                                    </div>
                                                    <div class="cart_button">
                                                        <a href="checkout.jsp"> Check out</a>
                                                    </div>
                                                </div>
                                                <!--mini cart end-->
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>     
                            <!--header middel end-->      
                            <div class="header_bottom">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="main_menu_inner">
                                            <div class="main_menu d-none d-lg-block">
                                                <nav>
                                                    <ul>
                                                            <li class="active"><a href="index.jsp">Home</a>
                                                                <div class="mega_menu jewelry">
                                                                    <div class="mega_items jewelry">
                                                                        <ul>
                                                                            <li><a href="index.jsp">Home 1</a></li>
                                                                            <li><a href="index-2.jsp">Home 2</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div> 
                                                            </li>
                                                            <li><a href="shop.jsp">shop</a>
                                                                <div class="mega_menu jewelry">
                                                                    <div class="mega_items jewelry">
                                                                        <ul>
                                                                            <li><a href="&quot;pages-shop-list?index=1&quot;">shop list</a></li>
                                                                            <li><a href="shop-fullwidth.jsp">shop Full Width Grid</a></li>
                                                                            <li><a href="shop-fullwidth-list.jsp">shop Full Width list</a></li>
                                                                            <li><a href="shop-sidebar.jsp">shop Right Sidebar</a></li>
                                                                            <li><a href="shop-sidebar-list.jsp">shop list Right Sidebar</a></li>
                                                                            <li><a href="single-product.jsp">Product Details</a></li>
                                                                            <li><a href="single-product-sidebar.jsp">Product sidebar</a></li>
                                                                            <li><a href="single-product-video.jsp">Product Details video</a></li>
                                                                            <li><a href="single-product-gallery.jsp">Product Details Gallery</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>  
                                                            </li>
                                                            <li><a href="#">women</a>
                                                                <div class="mega_menu">
                                                                    <div class="mega_top fix">
                                                                        <div class="mega_items">
                                                                            <h3><a href="#">Accessories</a></h3>
                                                                            <ul>
                                                                                <li><a href="#">Cocktai</a></li>
                                                                                <li><a href="#">day</a></li>
                                                                                <li><a href="#">Evening</a></li>
                                                                                <li><a href="#">Sundresses</a></li>
                                                                                <li><a href="#">Belts</a></li>
                                                                                <li><a href="#">Sweets</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="mega_items">
                                                                            <h3><a href="#">HandBags</a></h3>
                                                                            <ul>
                                                                                <li><a href="#">Accessories</a></li>
                                                                                <li><a href="#">Hats and Gloves</a></li>
                                                                                <li><a href="#">Lifestyle</a></li>
                                                                                <li><a href="#">Bras</a></li>
                                                                                <li><a href="#">Scarves</a></li>
                                                                                <li><a href="#">Small Leathers</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="mega_items">
                                                                            <h3><a href="#">Tops</a></h3>
                                                                            <ul>
                                                                                <li><a href="#">Evening</a></li>
                                                                                <li><a href="#">Long Sleeved</a></li>
                                                                                <li><a href="#">Shrot Sleeved</a></li>
                                                                                <li><a href="#">Tanks and Camis</a></li>
                                                                                <li><a href="#">Sleeveless</a></li>
                                                                                <li><a href="#">Sleeveless</a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="mega_bottom fix">
                                                                        <div class="mega_thumb">
                                                                            <a href="#"><img src="assets\img\banner\banner1.jpg" alt=""></a>
                                                                        </div>
                                                                        <div class="mega_thumb">
                                                                            <a href="#"><img src="assets\img\banner\banner2.jpg" alt=""></a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li><a href="#">men</a>
                                                                <div class="mega_menu">
                                                                    <div class="mega_top fix">
                                                                        <div class="mega_items">
                                                                            <h3><a href="#">Rings</a></h3>
                                                                            <ul>
                                                                                <li><a href="#">Platinum Rings</a></li>
                                                                                <li><a href="#">Gold Ring</a></li>
                                                                                <li><a href="#">Silver Ring</a></li>
                                                                                <li><a href="#">Tungsten Ring</a></li>
                                                                                <li><a href="#">Sweets</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="mega_items">
                                                                            <h3><a href="#">Bands</a></h3>
                                                                            <ul>
                                                                                <li><a href="#">Platinum Bands</a></li>
                                                                                <li><a href="#">Gold Bands</a></li>
                                                                                <li><a href="#">Silver Bands</a></li>
                                                                                <li><a href="#">Silver Bands</a></li>
                                                                                <li><a href="#">Sweets</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="mega_items">
                                                                            <a href="#"><img src="assets\img\banner\banner3.jpg" alt=""></a>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </li>
                                                            <li><a href="#">pages</a>
                                                                <div class="mega_menu">
                                                                    <div class="mega_top fix">
                                                                        <div class="mega_items">
                                                                            <h3><a href="#">Column1</a></h3>
                                                                            <ul>
                                                                                <li><a href="portfolio.jsp">Portfolio</a></li>
                                                                                <li><a href="portfolio-details.jsp">single portfolio </a></li>
                                                                                <li><a href="about.jsp">About Us </a></li>
                                                                                <li><a href="about-2.jsp">About Us 2</a></li>
                                                                                <li><a href="services.jsp">Service </a></li>
                                                                                <li><a href="my-account.jsp">my account </a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="mega_items">
                                                                            <h3><a href="#">Column2</a></h3>
                                                                            <ul>
                                                                                <li><a href="blog.jsp">Blog </a></li>
                                                                                <li><a href="blog-details.jsp">Blog  Details </a></li>
                                                                                <li><a href="blog-fullwidth.jsp">Blog FullWidth</a></li>
                                                                                <li><a href="blog-sidebar.jsp">Blog  Sidebar</a></li>
                                                                                <li><a href="faq.jsp">Frequently Questions</a></li>
                                                                                <li><a href="404.jsp">404</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="mega_items">
                                                                            <h3><a href="#">Column3</a></h3>
                                                                            <ul>
                                                                                <li><a href="contact.jsp">Contact</a></li>
                                                                                <li><a href="cart.jsp">cart</a></li>
                                                                                <li><a href="checkout.jsp">Checkout  </a></li>
                                                                                <li><a href="wishlist.jsp">Wishlist</a></li>
                                                                                <li><a href="login.jsp">Login</a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            
                                                             <li><a href="blog.jsp">blog</a>
                                                                <div class="mega_menu jewelry">
                                                                    <div class="mega_items jewelry">
                                                                        <ul>
                                                                            <li><a href="blog-details.jsp">blog details</a></li>
                                                                            <li><a href="blog-fullwidth.jsp">blog fullwidth</a></li>
                                                                            <li><a href="blog-sidebar.jsp">blog sidebar</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>  
                                                            </li>
                                                            <li><a href="contact.jsp">contact us</a></li>

                                                        </ul>
                                                </nav>
                                            </div>
                                            <div class="mobile-menu d-lg-none">
                                                    <nav>
                                                        <ul>
                                                            <li><a href="index.jsp">Home</a>
                                                                <div>
                                                                    <div>
                                                                        <ul>
                                                                            <li><a href="index.jsp">Home 1</a></li>
                                                                            <li><a href="index-2.jsp">Home 2</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div> 
                                                            </li>
                                                            <li><a href="shop.jsp">shop</a>
                                                                <div>
                                                                    <div>
                                                                        <ul>
                                                                            <li><a href="&quot;pages-shop-list?index=1&quot;">shop list</a></li>
                                                                            <li><a href="shop-fullwidth.jsp">shop Full Width Grid</a></li>
                                                                            <li><a href="shop-fullwidth-list.jsp">shop Full Width list</a></li>
                                                                            <li><a href="shop-sidebar.jsp">shop Right Sidebar</a></li>
                                                                            <li><a href="shop-sidebar-list.jsp">shop list Right Sidebar</a></li>
                                                                            <li><a href="single-product.jsp">Product Details</a></li>
                                                                            <li><a href="single-product-sidebar.jsp">Product sidebar</a></li>
                                                                            <li><a href="single-product-video.jsp">Product Details video</a></li>
                                                                            <li><a href="single-product-gallery.jsp">Product Details Gallery</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>  
                                                            </li>
                                                            <li><a href="#">women</a>
                                                                <div>
                                                                    <div>
                                                                        <div>
                                                                            <h3><a href="#">Accessories</a></h3>
                                                                            <ul>
                                                                                <li><a href="#">Cocktai</a></li>
                                                                                <li><a href="#">day</a></li>
                                                                                <li><a href="#">Evening</a></li>
                                                                                <li><a href="#">Sundresses</a></li>
                                                                                <li><a href="#">Belts</a></li>
                                                                                <li><a href="#">Sweets</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div>
                                                                            <h3><a href="#">HandBags</a></h3>
                                                                            <ul>
                                                                                <li><a href="#">Accessories</a></li>
                                                                                <li><a href="#">Hats and Gloves</a></li>
                                                                                <li><a href="#">Lifestyle</a></li>
                                                                                <li><a href="#">Bras</a></li>
                                                                                <li><a href="#">Scarves</a></li>
                                                                                <li><a href="#">Small Leathers</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div>
                                                                            <h3><a href="#">Tops</a></h3>
                                                                            <ul>
                                                                                <li><a href="#">Evening</a></li>
                                                                                <li><a href="#">Long Sleeved</a></li>
                                                                                <li><a href="#">Shrot Sleeved</a></li>
                                                                                <li><a href="#">Tanks and Camis</a></li>
                                                                                <li><a href="#">Sleeveless</a></li>
                                                                                <li><a href="#">Sleeveless</a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <div>
                                                                            <a href="#"><img src="assets\img\banner\banner1.jpg" alt=""></a>
                                                                        </div>
                                                                        <div>
                                                                            <a href="#"><img src="assets\img\banner\banner2.jpg" alt=""></a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li><a href="#">men</a>
                                                                <div>
                                                                    <div>
                                                                        <div>
                                                                            <h3><a href="#">Rings</a></h3>
                                                                            <ul>
                                                                                <li><a href="#">Platinum Rings</a></li>
                                                                                <li><a href="#">Gold Ring</a></li>
                                                                                <li><a href="#">Silver Ring</a></li>
                                                                                <li><a href="#">Tungsten Ring</a></li>
                                                                                <li><a href="#">Sweets</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div>
                                                                            <h3><a href="#">Bands</a></h3>
                                                                            <ul>
                                                                                <li><a href="#">Platinum Bands</a></li>
                                                                                <li><a href="#">Gold Bands</a></li>
                                                                                <li><a href="#">Silver Bands</a></li>
                                                                                <li><a href="#">Silver Bands</a></li>
                                                                                <li><a href="#">Sweets</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div>
                                                                            <a href="#"><img src="assets\img\banner\banner3.jpg" alt=""></a>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </li>
                                                            <li><a href="#">pages</a>
                                                                <div>
                                                                    <div>
                                                                        <div>
                                                                            <h3><a href="#">Column1</a></h3>
                                                                            <ul>
                                                                                <li><a href="portfolio.jsp">Portfolio</a></li>
                                                                                <li><a href="portfolio-details.jsp">single portfolio </a></li>
                                                                                <li><a href="about.jsp">About Us </a></li>
                                                                                <li><a href="about-2.jsp">About Us 2</a></li>
                                                                                <li><a href="services.jsp">Service </a></li>
                                                                                <li><a href="my-account.jsp">my account </a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div>
                                                                            <h3><a href="#">Column2</a></h3>
                                                                            <ul>
                                                                                <li><a href="blog.jsp">Blog </a></li>
                                                                                <li><a href="blog-details.jsp">Blog  Details </a></li>
                                                                                <li><a href="blog-fullwidth.jsp">Blog FullWidth</a></li>
                                                                                <li><a href="blog-sidebar.jsp">Blog  Sidebar</a></li>
                                                                                <li><a href="faq.jsp">Frequently Questions</a></li>
                                                                                <li><a href="404.jsp">404</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div>
                                                                            <h3><a href="#">Column3</a></h3>
                                                                            <ul>
                                                                                <li><a href="contact.jsp">Contact</a></li>
                                                                                <li><a href="cart.jsp">cart</a></li>
                                                                                <li><a href="checkout.jsp">Checkout  </a></li>
                                                                                <li><a href="wishlist.jsp">Wishlist</a></li>
                                                                                <li><a href="login.jsp">Login</a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            
                                                            <li><a href="blog.jsp">blog</a>
                                                                <div>
                                                                    <div>
                                                                        <ul>
                                                                            <li><a href="blog-details.jsp">blog details</a></li>
                                                                            <li><a href="blog-fullwidth.jsp">blog fullwidth</a></li>
                                                                            <li><a href="blog-sidebar.jsp">blog sidebar</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>  
                                                            </li>
                                                            <li><a href="contact.jsp">contact us</a></li>

                                                        </ul>
                                                    </nav>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--header end -->
                         <!--breadcrumbs area start-->
                        <div class="breadcrumbs_area">
                            <div class="row">
                                <div class="col-12">
                                    <div class="breadcrumb_content">
                                        <ul>
                                            <li><a href="index.jsp">home</a></li>
                                            <li><i class="fa fa-angle-right"></i></li>
                                            <li>blog</li>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--breadcrumbs area end-->
                        
                        <!--blog area start-->
                        <div class="blog_area">
                            <div class="row">   
                                <div class="col-lg-4 col-md-6">
                                    <div class="single_blog">
                                        <div class="blog_thumb">
                                            <a href="blog-details.jsp"><img src="assets\img\blog\blog3.jpg" alt=""></a>
                                        </div>
                                        <div class="blog_content">
                                            <div class="blog_post">
                                                <ul>
                                                    <li>
                                                        <a href="#">Tech</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <h3><a href="blog-details.jsp">When an unknown took a galley of type.</a></h3>
                                            <p>Distinctively simplify dynamic resources whereas prospective core competencies. Objectively pursue multidisciplinary human capital for interoperable.</p>
                                            <div class="post_footer">
                                                <div class="post_meta">
                                                    <ul>
                                                        <li>Jun 20, 2018</li>
                                                        <li>3 Comments</li>
                                                    </ul>
                                                </div>
                                                <div class="Read_more">
                                                    <a href="blog-details.jsp">Read more  <i class="fa fa-angle-double-right"></i></a>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="single_blog">
                                        <div class="blog_thumb">
                                            <a href="blog-details.jsp"><img src="assets\img\blog\blog4.jpg" alt=""></a>
                                        </div>
                                        <div class="blog_content">
                                            <div class="blog_post">
                                                <ul>
                                                    <li>
                                                        <a href="#">Men</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <h3><a href="blog-details.jsp">When an unknown took a galley of type.</a></h3>
                                            <p>Distinctively simplify dynamic resources whereas prospective core competencies. Objectively pursue multidisciplinary human capital for interoperable.</p>
                                            <div class="post_footer">
                                                <div class="post_meta">
                                                    <ul>
                                                        <li>Jun 20, 2018</li>
                                                        <li>3 Comments</li>
                                                    </ul>
                                                </div>
                                                <div class="Read_more">
                                                    <a href="blog-details.jsp">Read more  <i class="fa fa-angle-double-right"></i></a>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="single_blog">
                                        <div class="blog_thumb">
                                            <a href="blog-details.jsp"><img src="assets\img\blog\blog1.jpg" alt=""></a>
                                        </div>
                                        <div class="blog_content">
                                            <div class="blog_post">
                                                <ul>
                                                    <li>
                                                        <a href="#">Women</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <h3><a href="blog-details.jsp">When an unknown took a galley of type.</a></h3>
                                            <p>Distinctively simplify dynamic resources whereas prospective core competencies. Objectively pursue multidisciplinary human capital for interoperable.</p>
                                            <div class="post_footer">
                                                <div class="post_meta">
                                                    <ul>
                                                        <li>Jun 20, 2018</li>
                                                        <li>3 Comments</li>
                                                    </ul>
                                                </div>
                                                <div class="Read_more">
                                                    <a href="blog-details.jsp">Read more  <i class="fa fa-angle-double-right"></i></a>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="single_blog">
                                        <div class="blog_thumb">
                                            <a href="blog-details.jsp"><img src="assets\img\blog\blog2.jpg" alt=""></a>
                                        </div>
                                        <div class="blog_content">
                                            <div class="blog_post">
                                                <ul>
                                                    <li>
                                                        <a href="#">fashion</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <h3><a href="blog-details.jsp">When an unknown took a galley of type.</a></h3>
                                            <p>Distinctively simplify dynamic resources whereas prospective core competencies. Objectively pursue multidisciplinary human capital for interoperable.</p>
                                            <div class="post_footer">
                                                <div class="post_meta">
                                                    <ul>
                                                        <li>Jun 20, 2018</li>
                                                        <li>3 Comments</li>
                                                    </ul>
                                                </div>
                                                <div class="Read_more">
                                                    <a href="blog-details.jsp">Read more  <i class="fa fa-angle-double-right"></i></a>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="single_blog">
                                        <div class="blog_thumb">
                                            <a href="blog-details.jsp"><img src="assets\img\blog\blog5.jpg" alt=""></a>
                                        </div>
                                        <div class="blog_content">
                                            <div class="blog_post">
                                                <ul>
                                                    <li>
                                                        <a href="#">featured</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <h3><a href="blog-details.jsp">When an unknown took a galley of type.</a></h3>
                                            <p>Distinctively simplify dynamic resources whereas prospective core competencies. Objectively pursue multidisciplinary human capital for interoperable.</p>
                                            <div class="post_footer">
                                                <div class="post_meta">
                                                    <ul>
                                                        <li>Jun 20, 2018</li>
                                                        <li>3 Comments</li>
                                                    </ul>
                                                </div>
                                                <div class="Read_more">
                                                    <a href="blog-details.jsp">Read more  <i class="fa fa-angle-double-right"></i></a>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="single_blog">
                                        <div class="blog_thumb">
                                            <a href="blog-details.jsp"><img src="assets\img\blog\blog11.jpg" alt=""></a>
                                        </div>
                                        <div class="blog_content">
                                            <div class="blog_post">
                                                <ul>
                                                    <li>
                                                        <a href="#">Tech</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <h3><a href="blog-details.jsp">When an unknown took a galley of type.</a></h3>
                                            <p>Distinctively simplify dynamic resources whereas prospective core competencies. Objectively pursue multidisciplinary human capital for interoperable.</p>
                                            <div class="post_footer">
                                                <div class="post_meta">
                                                    <ul>
                                                        <li>Jun 20, 2018</li>
                                                        <li>3 Comments</li>
                                                    </ul>
                                                </div>
                                                <div class="Read_more">
                                                    <a href="blog-details.jsp">Read more  <i class="fa fa-angle-double-right"></i></a>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                        </div>
                        <!--blog area end-->
                        
                        <!--pagination style start--> 
                        <div class="blog_pagination">
                            <div class="row">
                                <div class="col-12">
                                    <div class="page_number">
                                        <span>Pages: </span>
                                        <ul>
                                            <li>«</li>
                                            <li class="current_number">1</li>
                                            <li><a href="#">2</a></li>
                                            <li>»</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--pagination style end--> 
                        
                        <!--brand logo strat--> 
                        <div class="brand_logo brand_about">
                            <div class="block_title">
                                <h3>Brands</h3>
                            </div>
                            <div class="row">
                                <div class="brand_active owl-carousel">
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="assets\img\brand\brand1.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="assets\img\brand\brand2.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="assets\img\brand\brand3.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="assets\img\brand\brand4.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="assets\img\brand\brand5.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="assets\img\brand\brand6.jpg" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>       
                        <!--brand logo end-->   
                    </div>
                    <!--pos page inner end-->
                </div>
            </div>
            <!--pos page end-->
            
            <!--footer area start-->
            <div class="footer_area">
                <div class="footer_top">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="footer_widget">
                                    <h3>About us</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                    <div class="footer_widget_contect">
                                        <p><i class="fa fa-map-marker" aria-hidden="true"></i>  19 Interpro Road Madison, AL 35758, USA</p>

                                        <p><i class="fa fa-mobile" aria-hidden="true"></i> (012) 234 432 3568</p>
                                        <a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i> Contact@plazathemes.com </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="footer_widget">
                                    <h3>My Account</h3>
                                    <ul>
                                        <li><a href="#">Your Account</a></li>
                                        <li><a href="#">My orders</a></li>
                                        <li><a href="#">My credit slips</a></li>
                                        <li><a href="#">My addresses</a></li>
                                        <li><a href="#">Login</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="footer_widget">
                                    <h3>Informations</h3>
                                    <ul>
                                        <li><a href="#">Specials</a></li>
                                        <li><a href="#">Our store(s)!</a></li>
                                        <li><a href="#">My credit slips</a></li>
                                        <li><a href="#">Terms and conditions</a></li>
                                        <li><a href="#">About us</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="footer_widget">
                                    <h3>extras</h3>
                                    <ul>
                                        <li><a href="#"> Brands</a></li>
                                        <li><a href="#"> Gift Vouchers </a></li>
                                        <li><a href="#"> Affiliates </a></li>
                                        <li><a href="#"> Specials </a></li>
                                        <li><a href="#"> Privacy policy </a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer_bottom">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-6 col-md-6">
                                <div class="copyright_area">
                                    <ul>
                                        <li><a href="#"> about us </a></li>
                                        <li><a href="#">  Customer Service  </a></li>
                                        <li><a href="#">  Privacy Policy  </a></li>
                                    </ul>
                                    <p>Copyright &copy; 2018 <a href="#">Pos Coron</a>. All rights reserved. </p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="footer_social text-right">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                        <li><a class="pinterest" href="#"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>
                                        
                                        <li><a href="#"><i class="fa fa-wifi" aria-hidden="true"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--footer area end-->
            
            
            
            
      
		
		<!-- all js here -->
        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
        <script src="assets\js\popper.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
        <script src="assets\js\ajax-mail.js"></script>
        <script src="assets\js\plugins.js"></script>
        <script src="assets\js\main.js"></script>
    </body>
</html>
