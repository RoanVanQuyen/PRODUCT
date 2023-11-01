package controller;

import dataBase.SanPhamDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.SanPham;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/chi-tiet-san-pham")
public class ChiTietSanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding(("UTF-8"));
        resp.setContentType("text/html; charset = UTF-8");
        String maSanPham = req.getParameter("maSanPham") ;
        SanPham one = new SanPham() ;
        one.setMaSanPham(maSanPham);
        SanPham sanPham = SanPhamDAO.getInstance().selectById(one);
        req.setAttribute("maSanPham" ,sanPham.getMaSanPham());
        req.setAttribute("tenSanPham" , sanPham.getTenSanPham());
        req.setAttribute("giaSanPham" , sanPham.getGiaSanPham());
        req.setAttribute("loaiSanPham" , sanPham.getTheLoai().getMaTL());
        req.setAttribute("moTaChiTiet" , sanPham.getMoTaChiTiet());
        ArrayList<String> hinhAnhSanPham = sanPham.getAnhSanPham() ;
        req.setAttribute("hinhAnhSanPham00" , hinhAnhSanPham.get(0));
        req.setAttribute("hinhAnhSanPham01" , hinhAnhSanPham.get(1));
        req.setAttribute("hinhAnhSanPham02" , hinhAnhSanPham.get(2));
        req.setAttribute("hinhAnhSanPham03" , hinhAnhSanPham.get(3));
//        SanPhamDAO.getInstance().delete(one);
        RequestDispatcher RD = getServletContext().getRequestDispatcher("/single-product.jsp");
        RD.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
