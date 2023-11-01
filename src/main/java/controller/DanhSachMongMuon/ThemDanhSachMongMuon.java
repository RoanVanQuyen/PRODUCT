package controller.DanhSachMongMuon;

import dataBase.DanhSachMongMuonDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DanhSachMongMuon;
import model.KhachHang;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/them-danh-sach-mong-muon")
public class ThemDanhSachMongMuon extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String maSanPham = req.getParameter("maSanPham") ;
        String tenDangNhap = req.getParameter("tenDangNhap") ;
        if(tenDangNhap.equals(null + "")) {
            DanhSachMongMuon danhSachMongMuon = new DanhSachMongMuon(tenDangNhap, maSanPham);
            KhachHang khachHang = new KhachHang();
            khachHang.setTenDangNhap(tenDangNhap);
            ArrayList<DanhSachMongMuon> danhSachMongMuons = DanhSachMongMuonDAO.getInstance().SelectByTenDangNhap(khachHang);
            int check = 0;
            for (int i = 0; i < danhSachMongMuons.size(); i++) {
                if (danhSachMongMuons.get(i).getMaSanPham().equals(maSanPham)) {
                    check = 1;
                }
            }
            if (check == 0)
                DanhSachMongMuonDAO.getInstance().insert(danhSachMongMuon);
        }
        resp.sendRedirect("wishlist.jsp");
    }
}
