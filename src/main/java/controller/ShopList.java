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

@WebServlet("/pages-shop-list")
public class ShopList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int numberPages = Integer.parseInt(req.getParameter("index"))  ;
        String url = req.getParameter("url") ;
        numberPages = (numberPages - 1) * 6;
        ArrayList<SanPham> sanPhams = SanPhamDAO.getInstance().selectByPages(numberPages);
        req.setAttribute("sanPhamsPages" , sanPhams);

        RequestDispatcher RD = getServletContext().getRequestDispatcher("/" + url);
        RD.forward(req,resp);
    }
}
