package controller.GioHang;

import dataBase.GioHangDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.GioHang;
import model.KhachHang;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/them-gio-hang")
public class ThemGioHang extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int soLuong = Integer.parseInt(req.getParameter("soLuong"));
        String tenDangNhap = req.getParameter("tenDangNhap") ;
        if(tenDangNhap.equals(null + "") == false) {
            KhachHang one = new KhachHang();
            one.setTenDangNhap(tenDangNhap);
            String maSanPham = req.getParameter("maSanPham");
            GioHang gioHang = new GioHang(tenDangNhap, maSanPham, soLuong);
            ArrayList<GioHang> gioHangs = GioHangDAO.getInstance().SelectByTenDangNhap(one);
            int check = 0;
            for (int i = 0; i < gioHangs.size(); i++) {
                if (gioHangs.get(i).getMaSanPham().equals(maSanPham)) {
                    gioHang.setSoLuong(gioHangs.get(i).getSoLuong() + soLuong);
                    GioHangDAO.getInstance().update(gioHang);
                    check = 1;
                }
            }
            if (check == 0 )
                GioHangDAO.getInstance().insert(gioHang);

        }resp.sendRedirect("cart.jsp");
//        SanPham oneSP = new SanPham() ;
//        oneSP.setMaSanPham(maSanPham);
//        SanPham sanPham = SanPhamDAO.getInstance().selectById(oneSP);
//        req.setAttribute("maSanPham" ,sanPham.getMaSanPham());
//        req.setAttribute("tenSanPham" , sanPham.getTenSanPham());
//        req.setAttribute("giaSanPham" , sanPham.getGiaSanPham());
//        req.setAttribute("loaiSanPham" , sanPham.getTheLoai().getMaTL());
//        req.setAttribute("moTaChiTiet" , sanPham.getMoTaChiTiet());
//        ArrayList<String> hinhAnhSanPham = sanPham.getAnhSanPham() ;
//        req.setAttribute("hinhAnhSanPham00" , hinhAnhSanPham.get(0));
//        req.setAttribute("hinhAnhSanPham01" , hinhAnhSanPham.get(1));
//        req.setAttribute("hinhAnhSanPham02" , hinhAnhSanPham.get(2));
//        req.setAttribute("hinhAnhSanPham03" , hinhAnhSanPham.get(3));
////        SanPhamDAO.getInstance().delete(one);
//        RequestDispatcher RD = getServletContext().getRequestDispatcher("/single-product.jsp");
//        RD.forward(req,resp);
    }
}
