package controller.DanhSachMongMuon;

import dataBase.DanhSachMongMuonDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DanhSachMongMuon;

import java.io.IOException;
@WebServlet("/xoa-danh-sach-mong-muon")
public class XoaDanhSachMongMuon extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String maSanPham = req.getParameter("maSanPham") ;
        String tenDangNhap = req.getParameter("tenDangNhap") ;
        DanhSachMongMuon danhSachMongMuon = new DanhSachMongMuon(tenDangNhap ,maSanPham ) ;
        DanhSachMongMuonDAO.getInstance().delete(danhSachMongMuon);
        resp.sendRedirect("wishlist.jsp");
    }
}
