package controller.GioHang;

import dataBase.GioHangDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.GioHang;

import java.io.IOException;
@WebServlet("/xoa-san-pham-gio-hang")
public class XoaGioHang extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding(("UTF-8"));
        resp.setContentType("text/html; charset = UTF-8");
        String maSanPham = req.getParameter("maSanPham") ;
        String tenDangNhap = req.getParameter("tenDangNhap") ;
        GioHang gioHang = new GioHang() ;
        gioHang.setTenDangNhap(tenDangNhap);
        gioHang.setMaSanPham(maSanPham);
        GioHangDAO.getInstance().delete(gioHang);
        resp.sendRedirect("cart.jsp");
    }
}
