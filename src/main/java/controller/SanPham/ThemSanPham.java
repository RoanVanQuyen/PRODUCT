package controller.SanPham;

import dataBase.SanPhamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.SanPham;
import model.TheLoai;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

@WebServlet("/them-san-pham")
public class ThemSanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding(("UTF-8"));
        resp.setContentType("text/html; charset = UTF-8");
        String tenSanPham = req.getParameter("tenSanPham") ;
        Double giaSanPham = Double.parseDouble(req.getParameter("giaSanPham") );
        Random random = new Random() ;
        int Id = random.nextInt(99999999);
        TheLoai theLoai = new TheLoai(req.getParameter("theLoai") , "") ;
        String moTaChiTiet = req.getParameter("moTaChiTiet") ;
        String hinhAnhSanPham00 = req.getParameter("hinhAnhSanPham00");
        String hinhAnhSanPham01 = req.getParameter("hinhAnhSanPham01");
        String hinhAnhSanPham02 = req.getParameter("hinhAnhSanPham02");
        String hinhAnhSanPham03 = req.getParameter("hinhAnhSanPham03");
        ArrayList<String> hinhAnh = new ArrayList<String>() ;
        hinhAnh.add(hinhAnhSanPham00) ;
        hinhAnh.add(hinhAnhSanPham01) ;
        hinhAnh.add(hinhAnhSanPham02) ;
        hinhAnh.add(hinhAnhSanPham03) ;
        SanPham sanPham = new SanPham(Id +"" , tenSanPham , giaSanPham,theLoai,moTaChiTiet,hinhAnh) ;
        SanPhamDAO.getInstance().insert(sanPham);
        resp.sendRedirect("index_manager.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
