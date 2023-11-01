package controller;

import dataBase.KhachHangDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.KhachHang;

import java.io.IOException;
import java.util.Random;

@WebServlet("/dang-ky")
public class DangKy extends HttpServlet {
    Random RD = new Random() ;
    int id = RD.nextInt(1000000000);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding(("UTF-8"));
        resp.setContentType("text/html; charset = UTF-8");
        String tenDangNhap = req.getParameter("tenDangNhap");
        String matKhau = req.getParameter("matKhau");
        String hoVaTen = req.getParameter("hoVaTen");
        String gioiTinh = req.getParameter("gioiTinh");
        String diaChi = req.getParameter("diaChi");
        String soDienThoai = req.getParameter("soDienThoai");
        KhachHang khachHang = new KhachHang(id + "", tenDangNhap, matKhau, hoVaTen, gioiTinh, diaChi, soDienThoai);
        id++;
        req.setAttribute("value_tenDangNhap" ,tenDangNhap) ;
        req.setAttribute("value_matKhau" ,matKhau) ;
        req.setAttribute("value_hoVaTen" ,hoVaTen) ;
        req.setAttribute("value_gioiTinh" ,gioiTinh) ;
        req.setAttribute("value_diaChi" ,diaChi) ;
        req.setAttribute("value_soDienThoai" ,soDienThoai) ;
        HttpSession session = req.getSession() ;
        RequestDispatcher RD;
        if (KhachHangDAO.getInstance().selectById(khachHang) == null) {
            KhachHangDAO.getInstance().insert(khachHang);
            session.setAttribute("problemLogin" , "Đăng kí tài khoản thành công vui lòng đăng nhập") ;
            RD = getServletContext().getRequestDispatcher("/login.jsp");
        } else {
            session.setAttribute("error_tenDangNhap", "Tên đăng nhập đã tồn tại");
            RD = getServletContext().getRequestDispatcher("/login.jsp");
        }
        RD.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp) ;
    }
}
