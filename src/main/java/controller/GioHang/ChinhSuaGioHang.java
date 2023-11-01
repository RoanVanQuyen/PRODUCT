package controller.GioHang;

import dataBase.GioHangDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.GioHang;

import java.io.IOException;

@WebServlet("/cap-nhap-so-luong")
public class ChinhSuaGioHang extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer size = Integer.parseInt(req.getParameter("size")) ;
        for(int i = 0 ; i < size ; i++){
            String tenDangNhap = req.getParameter("tenDangNhap" + i) ;
            String maSanPham = req.getParameter("maSanPham" + i) ;
            Integer soLuong = Integer.parseInt(req.getParameter("capNhapSoLuong" + i));
            GioHang gioHang = new GioHang(tenDangNhap , maSanPham , soLuong) ;
            GioHangDAO.getInstance().update(gioHang);
        }
        resp.sendRedirect("cart.jsp");
    }
}
