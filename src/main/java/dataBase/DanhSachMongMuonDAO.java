package dataBase;

import model.DanhSachMongMuon;
import model.GioHang;
import model.KhachHang;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DanhSachMongMuonDAO {
    public static DanhSachMongMuonDAO getInstance(){
        return new DanhSachMongMuonDAO() ;
    }
    public ArrayList<DanhSachMongMuon> SelectByTenDangNhap(KhachHang khachHang){
        ArrayList<DanhSachMongMuon> gioHangs = new ArrayList<DanhSachMongMuon>() ;
        Connection connect = JDBC.getConnection() ;
        String sql = "select  * from DanhSachMongMuon where tenDangNhap = ?" ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql);
            PST.setString(1, khachHang.getTenDangNhap());
            ResultSet RS = PST.executeQuery() ;
            while(RS.next()){
                DanhSachMongMuon danhSachMongMuon = new DanhSachMongMuon(khachHang.getTenDangNhap(), RS.getString("maSanPham")) ;
                gioHangs.add(danhSachMongMuon) ;
            }
            connect.close();
            return  gioHangs ;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void insert(DanhSachMongMuon danhSachMongMuon){
        Connection connect = JDBC.getConnection() ;
        String sql = "insert into DanhSachMongMuon() values(? , ? )" ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql) ;
            PST.setString(1, danhSachMongMuon.getTenDangNhap());
            PST.setString(2, danhSachMongMuon.getMaSanPham());
            PST.executeUpdate() ;
            connect.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void delete(DanhSachMongMuon danhSachMongMuon){
        Connection connect = JDBC.getConnection() ;
        String sql = "delete from DanhSachMongMuon where tenDangNhap = ? and maSanPham = ?" ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql) ;
            PST.setString(1, danhSachMongMuon.getTenDangNhap());
            PST.setString(2, danhSachMongMuon.getMaSanPham());
            PST.executeUpdate() ;
            connect.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
