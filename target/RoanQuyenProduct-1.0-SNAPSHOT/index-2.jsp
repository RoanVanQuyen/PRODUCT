<%@ page import="java.util.ArrayList" %>
<%@ page import="model.SanPham" %>
<%@ page import="dataBase.SanPhamDAO" %>
<%@ page import="model.GioHang" %>
<%@ page import="model.KhachHang" %>
<%@ page import="dataBase.GioHangDAO" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron - Fashion eCommerce Bootstrap4 Template</title>
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
                                                    <%
                                                        String value_user = session.getAttribute("value_user") == null ? "" : session.getAttribute("value_user")+"" ;
                                                        String tenDangNhap = session.getAttribute("tenDangNhap") + "" ;
                                                    %>
                                                    <li><a href="cart.jsp" title="My cart">My cart</a></li>
                                                    <% if(value_user == ""){ %>
                                                    <li><a href="login.jsp">Login</a></li>
                                                    <% }
                                                    else{ %>
                                                    <li><a href="dang-nhap?logout = true"><b>Hello: </b><%=value_user%></a></li> <%
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
                                       <!--logo start-->
                                        <div class="col-lg-3 col-md-3">
                                            <div class="logo">
                                                <a href="index.jsp"><img style = "width : 150px ; height : 80px" src="assets\img\logo\logo.png" alt=""></a>
                                            </div>
                                        </div>
                                        <!--logo end-->
                                        <div class="col-lg-9 col-md-9">
                                            <div class="header_right_info">
                                                <div class="search_bar">
                                                    <form action="#">
                                                        <input placeholder="Search..." type="text">
                                                        <button type="submit"><i class="fa fa-search"></i></button>
                                                    </form>
                                                </div>
                                                <div class="shopping_cart">
                                                    <%
                                                        KhachHang khachHang = new KhachHang() ;
                                                        khachHang.setTenDangNhap(tenDangNhap);
                                                        ArrayList<GioHang>gioHangs = GioHangDAO.getInstance().SelectByTenDangNhap(khachHang);
                                                        int tongTien = (int) 0;
                                                        for(int i = 0 ; i < gioHangs.size();i++) {
                                                            SanPham sanPham = new SanPham();
                                                            sanPham.setMaSanPham(gioHangs.get(i).getMaSanPham());
                                                            SanPham ans = SanPhamDAO.getInstance().selectById(sanPham);
                                                            tongTien += (ans.getGiaSanPham() * gioHangs.get(i).getSoLuong());
                                                        }
                                                    %>
                                                    <a href="#"><i class="fa fa-shopping-cart"></i> <%=gioHangs.size()%>Items-<%=tongTien%>.000.VND <i class="fa fa-angle-down"></i></a>

                                                    <!--mini cart-->
                                                    <div class="mini_cart">
                                                        <%
                                                            for(int i = 0 ; i < gioHangs.size();i++) {
                                                                SanPham sanPham = new SanPham();
                                                                sanPham.setMaSanPham(gioHangs.get(i).getMaSanPham());
                                                                SanPham ans = SanPhamDAO.getInstance().selectById(sanPham);
                                                                String tenSanPham = ans.getTenSanPham() ;
                                                                String hinhAnhSanPham = ans.getAnhSanPham().get(0) ;
                                                        %>
                                                        <div class="cart_item">
                                                            <div class="cart_img">
                                                                <a href="#"><img src="<%=hinhAnhSanPham%>" alt=""></a>
                                                            </div>
                                                            <div class="cart_info">
                                                                <a href="#"><%=tenSanPham%></a>
                                                                <span class="cart_price"><%=ans.getGiaSanPham()%></span>
                                                                <span class="quantity">Qty: <%=gioHangs.get(i).getSoLuong()%></span>
                                                            </div>
                                                            <div class="cart_remove">
                                                                <a title="Remove this item" href="xoa-san-pham-gio-hang?maSanPham=<%=gioHangs.get(i).getMaSanPham()%>&tenDangNhap=<%=tenDangNhap%>"><i class="fa fa-times-circle"></i></a>
                                                            </div>
                                                        </div>
                                                        <% } %>
                                                        <div class="shipping_price">
                                                            <span> Shipping </span>
                                                            <span>  <%=gioHangs.size() * 15000%>.VND  </span>
                                                        </div>
                                                        <div class="total_price">
                                                            <span> total </span>
                                                            <span class="prices">  <%=tongTien%>.000.VND </span>
                                                        </div>
                                                        <div class="cart_button">
                                                            <a href="checkout.jsp"> Check out</a>
                                                        </div>
                                                    </div>
                                                </div>
<%--                                                shopping cart end--%>
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
                                                            <li><a href="pages-shop-list?index=1&url=shop-list.jsp">shop</a>
                                                                <div class="mega_menu jewelry">
                                                                    <div class="mega_items jewelry">
                                                                        <ul>
                                                                            <li><a href="pages-shop-list?index=1&url=shop-list.jsp">shop list</a></li>
                                                                            <li><a href="pages-shop-list?index=1&url=shop-fullwidth.jsp">shop Full Width Grid</a></li>
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
                                                                            <li><a href="pages-shop-list?index=1&url=shop-list.jsp">shop list</a></li>
                                                                            <li><a href="pages-shop-list?index=1&url=shop-fullwidth.jsp">shop Full Width Grid</a></li>
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

                        <!--pos home section-->
                        <div class="pos_home_section">
                            <div class="row">
                               <!--banner slider start-->
                                <div class="col-12">
                                    <div class="banner_slider slider_two">
                                        <div class="slider_active owl-carousel">
                                            <div class="single_slider" style="background-image: url(assets/img/slider/slider_2.png)">
                                                <div class="slider_content">
                                                    <div class="slider_content_inner">  
                                                        <h1>fashion for you</h1>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. <br> Cumque eligendi quia, ratione porro, nemo non.</p>
                                                        <a href="#">shop now</a>
                                                    </div>     
                                                </div>
                                            </div>
                                            <div class="single_slider" style="background-image: url(assets/img/slider/slide_4.png)">
                                                 <div class="slider_content">
                                                    <div class="slider_content_inner">  
                                                        <h1>fashion for you</h1>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. <br> Cumque eligendi quia, ratione porro, nemo non.</p>
                                                        <a href="#">shop now</a>
                                                    </div>     
                                                </div> 
                                            </div>
                                            <div class="single_slider" style="background-image: url(assets/img/slider/slider_3.png)">
                                                 <div class="slider_content">
                                                    <div class="slider_content_inner">  
                                                        <h1>fashion for you</h1>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. <br> Cumque eligendi quia, ratione porro, nemo non.</p>
                                                        <a href="#">shop now</a>
                                                    </div>     
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    <!--banner slider start-->
                                </div>    
                            </div>  
                             <!--new product area start-->
                            <div class="new_product_area product_two">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="block_title">
                                        <h3>  New Products</h3>
                                    </div>
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="single_p_active owl-carousel">
                                        <%
                                            ArrayList<SanPham> sanPhams = SanPhamDAO.getInstance().select();
                                            for(int i = 0 ; i < sanPhams.size() ; i++){
                                                String maSanPham = sanPhams.get(i).getMaSanPham() ;
                                                String tenSanPham = sanPhams.get(i).getTenSanPham() ;
                                                Double giaSanPham = sanPhams.get(i).getGiaSanPham() ;
                                                ArrayList<String> hinhAnh = sanPhams.get(i).getAnhSanPham() ;
                                        %>
                                        <div class="col-lg-3">
                                            <div class="single_product">
                                                <div class="product_thumb">
                                                    <a href="chi-tiet-san-pham?maSanPham=<%=maSanPham%>"><img src="<%=hinhAnh.get(0)%>"></a>
                                                    <div class="img_icone">
                                                        <img src="assets\img\cart\span-new.png" alt="">
                                                    </div>
                                                    <div class="product_action">
                                                        <a href="them-gio-hang?tenDangNhap=<%=tenDangNhap%>&maSanPham=<%=maSanPham%>&soLuong=1"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                                <div class="product_content">
                                                    <span class="product_price"><%=giaSanPham%>.VND</span>
                                                    <h3 class="product_title"><a href="chi-tiet-san-pham?maSanPham=<%=maSanPham%>"><%=tenSanPham%></a></h3>
                                                </div>
                                                <div class="product_info">
                                                    <ul>
                                                        <li><a href="them-danh-sach-mong-muon?maSanPham=<%=maSanPham%>&tenDangNhap=<%=tenDangNhap%>" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                        <li><a href="chi-tiet-san-pham?maSanPham=<%=maSanPham%>" >View Detail</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <% } %>
                                    </div> 
                                </div>      
                            </div> 
                            <!--new product area start--> 
                                   
                            <!--banner area start-->
                            <div class="banner_area banner_two">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="single_banner">
                                            <a href="#"><img src="assets\img\banner\banner7.jpg" alt=""></a>
                                            <div class="banner_title">
                                                <p>Up to <span> 40%</span> off</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="single_banner">
                                            <a href="#"><img src="assets\img\banner\banner8.jpg" alt=""></a>
                                            <div class="banner_title title_2">
                                                <p>sale off <span> 30%</span></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="single_banner">
                                            <a href="#"><img src="assets\img\banner\banner11.jpg" alt=""></a>
                                            <div class="banner_title title_3">
                                                <p>sale off <span> 30%</span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>     
                            <!--banner area end--> 
                                                          
                            <!--featured product area start-->
                            <div class="new_product_area product_two">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="block_title">
                                        <h3>   featured Products</h3>
                                    </div>
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="single_p_active owl-carousel">
                                        <%
                                            //                                                    ArrayList<SanPham> sanPhams = SanPhamDAO.getInstance().select();
//                                                    for(int i = 0 ; i < sanPhams.size(); i++){
                                            for(int i = sanPhams.size() - 1; i>=0 ; i--){
                                                String maSanPham = sanPhams.get(i).getMaSanPham() ;
                                                String tenSanPham = sanPhams.get(i).getTenSanPham() ;
                                                Double giaSanPham = sanPhams.get(i).getGiaSanPham() ;
                                                ArrayList<String> hinhAnh = sanPhams.get(i).getAnhSanPham() ;
                                        %>
                                        <div class="col-lg-3">
                                            <div class="single_product">
                                                <div class="product_thumb">
                                                    <a href="chi-tiet-san-pham?maSanPham=<%=maSanPham%>"><img src="<%=hinhAnh.get(0)%>"></a>
                                                    <div class="img_icone">
                                                        <img src="assets\img\cart\span-new.png" alt="">
                                                    </div>
                                                    <div class="product_action">
                                                        <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                                <div class="product_content">
                                                    <span class="product_price"><%=giaSanPham%>.VND</span>
                                                    <h3 class="product_title"><a href="chi-tiet-san-pham?maSanPham=<%=maSanPham%>"><%=tenSanPham%></a></h3>
                                                </div>
                                                <div class="product_info">
                                                    <ul>
                                                        <li><a href="them-danh-sach-mong-muon?maSanPham=<%=maSanPham%>&tenDangNhap=<%=tenDangNhap%>" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                        <li><a href="trang-chu?maSanPham=<%=maSanPham%>" data-toggle="modal" data-target="#modal_box" title="Quick view">View Detail</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <% } %>
                                    </div> 
                                </div>      
                            </div> 
                            <!--featured product area start-->   
                                   
                            <!--blog area start-->
                            <div class="blog_area blog_two">
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
    
                                </div>    
                            </div>
                            <!--blog area end-->  
                                   
                            <!--brand logo strat--> 
                            <div class="brand_logo brand_two">
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
                        <!--pos home section end-->
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
            
            <!-- modal area start --> 
           <div class="modal fade" id="modal_box" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="modal_body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-5 col-md-5 col-sm-12">
                                        <div class="modal_tab">  
                                            <div class="tab-content" id="pills-tabContent">
                                                <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                                    <div class="modal_tab_img">
                                                        <a href="#"><img src="assets\img\product\product13.jpg" alt=""></a>    
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="tab2" role="tabpanel">
                                                    <div class="modal_tab_img">
                                                        <a href="#"><img src="assets\img\product\product14.jpg" alt=""></a>    
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="tab3" role="tabpanel">
                                                    <div class="modal_tab_img">
                                                        <a href="#"><img src="assets\img\product\product15.jpg" alt=""></a>    
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal_tab_button">    
                                                <ul class="nav product_navactive" role="tablist">
                                                    <li>
                                                        <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false"><img src="assets\img\cart\cart17.jpg" alt=""></a>
                                                    </li>
                                                    <li>
                                                         <a class="nav-link" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false"><img src="assets\img\cart\cart18.jpg" alt=""></a>
                                                    </li>
                                                    <li>
                                                       <a class="nav-link button_three" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false"><img src="assets\img\cart\cart19.jpg" alt=""></a>
                                                    </li>
                                                </ul>
                                            </div>    
                                        </div>  
                                    </div> 
                                    <div class="col-lg-7 col-md-7 col-sm-12">
                                        <div class="modal_right">
                                            <div class="modal_title mb-10">
                                                <h2>Handbag feugiat</h2> 
                                            </div>
                                            <div class="modal_price mb-10">
                                                <span class="new_price">$64.99</span>    
                                                <span class="old_price">$78.99</span>    
                                            </div>
                                            <div class="modal_content mb-10">
                                                <p>Short-sleeved blouse with feminine draped sleeve detail.</p>    
                                            </div>
                                            <div class="modal_size mb-15">
                                               <h2>size</h2>
                                                <ul>
                                                    <li><a href="#">s</a></li>
                                                    <li><a href="#">m</a></li>
                                                    <li><a href="#">l</a></li>
                                                    <li><a href="#">xl</a></li>
                                                    <li><a href="#">xxl</a></li>
                                                </ul>
                                            </div>
                                            <div class="modal_add_to_cart mb-15">
                                                <form action="#">
                                                    <input min="0" max="100" step="2" value="1" type="number">
                                                    <button type="submit">add to cart</button>
                                                </form>
                                            </div>   
                                            <div class="modal_description mb-15">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</p>    
                                            </div> 
                                            <div class="modal_social">
                                                <h2>Share this product</h2>
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                </ul>    
                                            </div>      
                                        </div>    
                                    </div>    
                                </div>     
                            </div>
                        </div>    
                    </div>
                </div>
            </div> 
            
          <!-- modal area end --> 
            
            
      
		
		<!-- all js here -->
        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
        <script src="assets\js\popper.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
        <script src="assets\js\ajax-mail.js"></script>
        <script src="assets\js\plugins.js"></script>
        <script src="assets\js\main.js"></script>
    </body>
</html>
