package controller;

import dataBase.SanPhamDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.SanPham;

import java.io.IOException;
import java.util.ArrayList;

public class ProductsGallery extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String maSanPham = req.getParameter("maSanPham") ;
        ArrayList<SanPham> sanPhams = SanPhamDAO.getInstance().select();
        req.setAttribute("sanPhams", sanPhams);
       if(maSanPham.equals(null) == false){
           SanPham one = new SanPham() ;
           one.setMaSanPham(maSanPham);
           SanPham sanPhamDetail =  SanPhamDAO.getInstance().selectById(one);
           req.setAttribute("sanPhamDetail",sanPhamDetail);
       }
        RequestDispatcher RD = getServletContext().getRequestDispatcher("/single-product-gallery.jsp");
        RD.forward(req,resp);
    }
}
