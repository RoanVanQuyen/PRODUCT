package controller.SanPham;

import dataBase.SanPhamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.SanPham;

import java.io.IOException;

@WebServlet("/xoa-san-pham")
public class XoaSanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String maSanPham  = req.getParameter("maSanPham")  ;
        SanPham sanPham = new SanPham() ;
        sanPham.setMaSanPham(maSanPham);
        SanPhamDAO.getInstance().delete(sanPham);
        resp.sendRedirect("index_manager.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
