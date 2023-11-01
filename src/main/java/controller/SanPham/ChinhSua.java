package controller.SanPham;

import dataBase.SanPhamDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.SanPham;
import model.TheLoai;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/chinh-sua-san-pham")
public class ChinhSua extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String maSanPham = req.getParameter("maSanPham") ;
        String tenSanPham = req.getParameter("tenSanPham") ;
        Double giaSanPham = Double.parseDouble(req.getParameter("giaSanPham")== null ? "0.0" : req.getParameter("giaSanPham"));
        String loaiSanPham = req.getParameter("theLoai") ;
        TheLoai Tl= new TheLoai(loaiSanPham , "vv") ;
        String moTaChiTiet = req.getParameter("moTaChiTiet") ;
        ArrayList<String> hinhAnh = new ArrayList<String>() ;
        String hinhAnh00 = req.getParameter("hinhAnhSanPham00") ;
        String hinhAnh01 = req.getParameter("hinhAnhSanPham01") ;
        String hinhAnh02 = req.getParameter("hinhAnhSanPham02") ;
        String hinhAnh03 = req.getParameter("hinhAnhSanPham03") ;
        hinhAnh.add(hinhAnh00);
        hinhAnh.add(hinhAnh01);
        hinhAnh.add(hinhAnh02);
        hinhAnh.add(hinhAnh03);
        if(tenSanPham == null){
            SanPham SP = new SanPham() ;
            SP.setMaSanPham(maSanPham);
            SanPham sanPham = SanPhamDAO.getInstance().selectById(SP);
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
            RequestDispatcher RD = getServletContext().getRequestDispatcher("/index_manager.jsp");
            RD.forward(req,resp);
        }
        else {
            SanPham one = new SanPham(maSanPham, tenSanPham, giaSanPham, Tl, moTaChiTiet, hinhAnh);
            SanPhamDAO.getInstance().update(one);
            resp.sendRedirect("index_manager.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
