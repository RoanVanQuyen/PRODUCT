<%@ page import="model.SanPham" %>
<%@ page import="dataBase.SanPhamDAO" %>
<%@ page import="model.KhachHang" %>
<%@ page import="model.GioHang" %>
<%@ page import="dataBase.GioHangDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>

<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-login</title>
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
                                                <li><a href="login.jsp" title="Login">Login</a></li>
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
                                            <a href="index.jsp"><img style = "width : 150px ; height : 80px" src="assets\img\logo\logo.png" alt=""></a>
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
                                                <%
                                                    String tenDangNhap = session.getAttribute("tenDangNhap") + "" ;
                                                    KhachHang khachHang = new KhachHang();
                                                    khachHang.setTenDangNhap(tenDangNhap);
                                                    ArrayList<GioHang> gioHangs = GioHangDAO.getInstance().SelectByTenDangNhap(khachHang);
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
                                                                <li><a href="pages-shop-list?index=1&url=shop-list.jsp">shop</a>
                                                                    <div class="mega_menu jewelry">
                                                                        <div class="mega_items jewelry">
                                                                            <ul>
                                                                                <li><a href="pages-shop-list?index=1&shop-list.jsp">shop list</a></li>
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
                                                                                    <li><a href="login.html">Login</a></li>
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
                                                                                <li><a href="login.html">Login</a></li>
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
                                                <li>login</li>
                                            </ul>

                                        </div>
                                    </div>
                                </div>
                        </div>
                        <!--breadcrumbs area end-->

                       <!-- customer login start -->
                        <div class="customer_login">
                            <div class="row">
                                       <!--login area start-->
                                        <div class="col-lg-6 col-md-6">
                                            <div class="account_form">
                                                <h2>login</h2>
                                                <h4> <%= session.getAttribute("problemLogin") == null ? "" : session.getAttribute("problemLogin")+"" %></h4>
                                                <form action="dang-nhap">
                                                    <p>   
                                                        <label>Tên đăng nhập<span>*</span></label>
                                                        <input type="text" name = "tenDangNhap_login" id = "tenDangNhap_login">
                                                     </p>
                                                     <p>   
                                                        <label>Mật khẩu<span>*</span></label>
                                                        <input type="password" name = "matKhau_login" id = "matKhau_login">
                                                     </p>   
                                                    <div class="login_submit">
                                                        <button type="submit">login</button>
                                                        <label for="remember">
                                                            <input id="remember" type="checkbox">
                                                            Remember me
                                                        </label>
                                                        <a href="#">Lost your password?</a>
                                                    </div>

                                                </form>
                                             </div>    
                                        </div>
                                        <!--login area start-->

                                        <!--register area start-->
                                        <div class="col-lg-6 col-md-6">
                                            <div class="account_form register">
                                                <h2>Register</h2>
                                                <form action="dang-ky" method = "post">
                                                    <% String error_tenDangNhap = request.getAttribute("error_tenDangNhap") == null ? "" : request.getAttribute("error_tenDangNhap") + "" ;
                                                        String value_tenDangNhap = request.getAttribute("value_tenDangNhap") == null ? "" : request.getAttribute("value_tenDangNhap") +""  ;
                                                        String value_matKhau = request.getAttribute("value_matKhau") == null ? "" : request.getAttribute("value_matKhau") +""  ;
                                                        String value_hoVaTen = request.getAttribute("value_tenDangNhap") == null ? "" : request.getAttribute("value_hoVaTen") +""  ;
                                                        String value_gioiTinh = request.getAttribute("value_tenDangNhap") == null ? "" : request.getAttribute("value_gioiTinh") +""  ;
                                                        String value_diaChi = request.getAttribute("value_tenDangNhap") == null ? "" : request.getAttribute("value_diaChi") +""  ;
                                                        String value_soDienThoai = request.getAttribute("value_tenDangNhap") == null ? "" : request.getAttribute("value_soDienThoai") +""  ;
                                                    %>
                                                    <p>   
                                                        <label for = "tenDangNhap"> Tên đăng nhập<span>*</span></label>
                                                        <input type="text" id = "tenDangNhap" name = "tenDangNhap" value = "<%=value_tenDangNhap%>" >
                                                        <p id = "error_username" style = "color:red"><%=error_tenDangNhap%></p>
                                                    </p>
                                                    <p>
                                                        <label for = "matKhau"> Mật khẩu <span>*</span></label>
                                                        <input type="password" id = "matKhau" name = "matKhau" value = "<%=value_matKhau%>" >
                                                        <p id =  "error_password" style = "color :red"></p>
                                                    </p>
                                                    <p>
                                                        <label for = "confirm_password"> Xác nhận mật khẩu<span>*</span></label>
                                                        <input type="password" id = "confirm_password" name = "password"  >
                                                        <p id = "error_confirm_password" style = "display : none">Mật khẩu nhập lại chưa đúng<p>
                                                    </p>
                                                    <p>
                                                        <label for = "hoVaTen"> Họ và tên<span>*</span></label>
                                                        <input type="text" id = "hoVaTen" name = "hoVaTen" value = "<%=value_hoVaTen%>">
                                                    </p>
                                                    <p>
                                                        <label for = "gioiTinh"> Giới tính<span>*</span></label>
                                                        <input type="text" id = "gioiTinh" name = "gioiTinh" value = "<%=value_gioiTinh%>">
                                                    </p>
                                                    <p>
                                                        <label for = "diaChi"> Địa chỉ <span>*</span></label>
                                                        <input type="text" id = "diaChi" name = "diaChi" value = "<%=value_diaChi%>">
                                                    </p>
                                                    <p>
                                                        <label for = "soDienThoai"> Số điện thoại<span>*</span></label>
                                                        <input type="number" id = "soDienThoai" name = "soDienThoai" value = "<%=value_soDienThoai%>">
                                                    </p>
                                                    <div class="login_submit">
                                                        <button type="button" id = "register">Register</button>
                                                    </div>
                                                </form>
                                                <script>

                                                    matKhau.onkeyup = function (){
                                                        var matKhau = document.getElementById("matKhau").value;
                                                        var xacNhanMatKhau = document.getElementById("confirm_password").value ;
                                                        var error_confirm_password = document.getElementById("error_confirm_password") ;
                                                        if(matKhau != xacNhanMatKhau){
                                                            error_confirm_password.style = "display:block ; color :red";
                                                        }
                                                        else{
                                                            error_confirm_password.style = "display : none" ;
                                                        }
                                                    }

                                                    confirm_password.onkeyup = function (){
                                                        var matKhau = document.getElementById("matKhau").value;
                                                        var xacNhanMatKhau = document.getElementById("confirm_password").value ;
                                                        var error_confirm_password = document.getElementById("error_confirm_password") ;
                                                        if(matKhau != xacNhanMatKhau){
                                                            error_confirm_password.style = "display:block ; color :red";
                                                        }
                                                        else{
                                                            error_confirm_password.style = "display : none" ;
                                                        }
                                                    }
                                                    register.onclick = function(){
                                                        var username = document.getElementById("tenDangNhap").value.trimEnd();
                                                        var password = document.getElementById("matKhau").value.trimEnd();
                                                        var error_username = document.getElementById("error_username") ;
                                                        var error_password = document.getElementById("error_password") ;
                                                        error_username.style.display = "none" ;
                                                        error_password.style.display = "none" ;
                                                        var register = document.getElementById("register") ;
                                                        // kiem tra tai khoan
                                                        var user = 1 ;
                                                        if(username.length == 0){
                                                            error_username.style.display = "block" ;
                                                            error_username.innerHTML = "Nhập vào tên đăng nhập" ;
                                                            user = 0 ;
                                                        }
                                                        for(var i = 0 ; i < username.length ; i++){
                                                            if(username[i] == ' '){
                                                                error_username.style.display = "block" ;
                                                                error_username.innerHTML = "Tên đăng nhập không được chứa đấu cách" ;
                                                                user = 0 ;
                                                            }
                                                        }
                                                        //kiemtra matkhau
                                                        var hoa = 0 , thuong = 0 , dacbiet = 0 ,khoangtrang = 0  ;
                                                        for(var i = 0 ; i< password.length ; i++){
                                                            if(password[i] >= 'A' && password[i] <= 'Z'){
                                                                hoa = 1 ;
                                                            }
                                                            if(password[i] >= 'a' && password[i] <= 'z'){
                                                                thuong = 1 ;
                                                            }
                                                            if(password[i] < 'a' && password[i] > 'Z' || password[i] < 'A' && password[i] > '9' || password[i] <'0' || password[i] > 'z'){
                                                                dacbiet = 1 ;
                                                            }
                                                            if(password[i] ==' '){
                                                                khoangtrang = 1 ;
                                                            }
                                                        }
                                                        if(user == 1 && hoa == 1 && thuong == 1 && dacbiet == 1 && password.length > 7){
                                                            register.type =  "submit" ;
                                                        }
                                                        else{
                                                            if(hoa == 0){
                                                                error_password.style.display = "block" ;
                                                                error_password.innerHTML = "Yêu cầu 1 chữ hoa";
                                                            }
                                                            // else{
                                                            //     error_password.style.display = "none" ;
                                                            // }
                                                            if(thuong == 0){
                                                                error_password.style.display = "block" ;
                                                                error_password.innerHTML = "Yêu cầu 1 chữ thường";
                                                            }
                                                            // else{
                                                            //     error_password.style.display = "none" ;
                                                            // }
                                                            if(dacbiet == 0){
                                                                error_password.style.display = "block" ;
                                                                error_password.innerHTML= "Yêu cầu 1 kí tự đặc biệt";
                                                            }
                                                            // else{
                                                            //     error_password.style.display = "none" ;
                                                            // }
                                                            if(password.length < 8){
                                                                error_password.style.display = "block" ;
                                                                error_password.innerHTML="Yêu cầu đủ 8 kí tự" ;
                                                            }
                                                            // else{
                                                            //     error_password.style.display = "none" ;
                                                            // }
                                                            if(khoangtrang > 0){
                                                                error_password.style.display = "block" ;
                                                                error_password.innerHTML ="Không được có khoảng trắng" ;
                                                            }
                                                        }
                                                    }

                                                </script>
                                            </div>    
                                        </div>
                                        <!--register area end-->
                                    </div>
                        </div>
                        <!-- customer login end -->

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
