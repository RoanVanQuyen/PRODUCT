package controller;

import dataBase.DanhSachMongMuonDAO;
import dataBase.GioHangDAO;
import dataBase.KhachHangDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DanhSachMongMuon;
import model.GioHang;
import model.KhachHang;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/dang-nhap")
public class DangNhap extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding(("UTF-8"));
        resp.setContentType("text/html; charset = UTF-8");
        String tenDangNhap_login = req.getParameter("tenDangNhap_login");
        String matKhau_login = req.getParameter("matKhau_login") ;
        ArrayList<KhachHang> khachHangs = KhachHangDAO.getInstance().select();
        HttpSession session = req.getSession();
        session.setMaxInactiveInterval(15);
        int login = 0 ;
        String index_login = req.getParameter("logout") ;
        if(index_login != null){
            session.invalidate();
            resp.sendRedirect("login.jsp");
        }
        else {
            for (int i = 0; i < khachHangs.size(); i++) {
                if (khachHangs.get(i).getTenDangNhap().equals(tenDangNhap_login) && khachHangs.get(i).getMatKhau().equals(matKhau_login)) {
                    login = 1;
                    ///Đưa người dùng đến trang web quản lí
                    if (khachHangs.get(i).getTenDangNhap().equals("admin")) {
                        RequestDispatcher RD = getServletContext().getRequestDispatcher("/index_manager.jsp");
                        session.setAttribute("value_user", khachHangs.get(i).getHoVaTen());
                        RD.forward(req, resp);
                    } else {
                        /// người dùng mặc định
                        KhachHang khachHang = new KhachHang() ;
                        khachHang.setTenDangNhap(tenDangNhap_login);
                        ArrayList<GioHang> gioHangs = GioHangDAO.getInstance().SelectByTenDangNhap(khachHang);
                        ArrayList<DanhSachMongMuon>danhSachMongMuons = DanhSachMongMuonDAO.getInstance().SelectByTenDangNhap(khachHang) ;
                        req.setAttribute("gioHangs",gioHangs);
                        req.setAttribute("danhSachMongMuons",danhSachMongMuons);
                        RequestDispatcher RD = getServletContext().getRequestDispatcher("/index.jsp");
                        session.setAttribute("value_user", khachHangs.get(i).getHoVaTen());
                        session.setAttribute("tenDangNhap" , khachHangs.get(i).getTenDangNhap());
                        RD.forward(req, resp);
                    }
                }
            }
            if (login != 1) {
                RequestDispatcher RD = getServletContext().getRequestDispatcher("/login.jsp");
                session.setAttribute("problemLogin", "Sai tên đăng nhập hoặc mật khẩu vui lòng thử lại");
                RD.forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
