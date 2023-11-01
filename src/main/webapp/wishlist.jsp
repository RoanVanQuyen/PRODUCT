<%@ page import="java.util.ArrayList" %>
<%@ page import="model.DanhSachMongMuon" %>
<%@ page import="dataBase.DanhSachMongMuonDAO" %>
<%@ page import="model.KhachHang" %>
<%@ page import="model.SanPham" %>
<%@ page import="dataBase.SanPhamDAO" %>
<%@ page import="model.GioHang" %>
<%@ page import="dataBase.GioHangDAO" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-wishlist</title>
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
                                                <%
                                                    String value_user = session.getAttribute("value_user") == null ? "" : session.getAttribute("value_user")+"" ;
                                                    String tenDangNhap = session.getAttribute("tenDangNhap") == null ?  "hihi" : session.getAttribute("tenDangNhap") + "" ;
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
                                    <div class="col-lg-3 col-md-3">
                                        <div class="logo">
                                            <a href="index.jsp"><img style = "width : 150px ; height : 80px"  src="assets\img\logo\logo.png" alt=""></a>
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
                                            <li>wishlist</li>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--breadcrumbs area end-->

                         <!--shopping cart area start -->
                        <div class="shopping_cart_area">
                               <form action="#"> 
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="table_desc wishlist">
                                                <div class="cart_page table-responsive">
                                                    <table>
                                                        <thead>
                                                            <tr>
                                                                <th class="product_remove">Delete</th>
                                                                <th class="product_thumb">Image</th>
                                                                <th class="product_name">Product</th>
                                                                <th class="product-price">Price</th>
                                                                <th class="product_quantity">Stock Status</th>
                                                                <th class="product_total">Add To Cart</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
//                                                                String tenDangNhap = session.getAttribute("tenDangNhap")  + "";
                                                                KhachHang one = new KhachHang() ;
                                                                one.setTenDangNhap(tenDangNhap) ;
                                                                ArrayList<DanhSachMongMuon>danhSachMongMuons = DanhSachMongMuonDAO.getInstance().SelectByTenDangNhap(one);
                                                                for(int i = 0 ; i < danhSachMongMuons.size() ; i++){
                                                                    String maSanPham = danhSachMongMuons.get(i).getMaSanPham() ;
                                                                    SanPham sp = new SanPham() ;
                                                                    sp.setMaSanPham(maSanPham);
                                                                    SanPham sanPham = SanPhamDAO.getInstance().selectById(sp);
                                                                    String tenSanPham = sanPham.getTenSanPham()  ;
                                                                    Double giaSanPham = sanPham.getGiaSanPham();
                                                                    String hinhAnhSanPham = sanPham.getAnhSanPham().get(0) ;
                                                            %>
                                                            <tr>
                                                               <td class="product_remove"><a href="xoa-danh-sach-mong-muon?tenDangNhap=<%=tenDangNhap%>&maSanPham=<%=maSanPham%>">X</a></td>
                                                                <td class="product_thumb"><a href="chi-tiet-san-pham?maSanPham=<%=maSanPham%>"><img src="<%=hinhAnhSanPham%>" alt=""></a></td>
                                                                <td class="product_name"><a href="#"><%=tenSanPham%></a></td>
                                                                <td class="product-price"><%=giaSanPham%></td>
                                                                <td class="product_quantity">In Stock</td>
                                                                <td class="product_total"><a href="them-gio-hang?tenDangNhap=<%=tenDangNhap%>&maSanPham=<%=maSanPham%>&soLuong=1">Add To Cart</a></td>
                                                            </tr>
                                                            <% } %>

                                                        </tbody>
                                                    </table>   
                                                </div>  

                                            </div>
                                         </div>
                                     </div>

                                </form> 
                                <div class="row">
                                    <div class="col-12">
                                         <div class="wishlist-share">
                                            <h4>Share on:</h4>
                                            <ul>
                                                <li><a href="#"><i class="fa fa-rss"></i></a></li>           
                                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>           
                                                <li><a href="#"><i class="fa fa-tumblr"></i></a></li>           
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>        
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>        
                                            </ul>      
                                        </div>
                                    </div> 
                                </div>

                         </div>
                         <!--shopping cart area end -->

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
