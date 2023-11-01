package dataBase;

import model.GioHang;
import model.KhachHang;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GioHangDAO {
    public static GioHangDAO getInstance(){
        return new GioHangDAO() ;
    }
    public ArrayList<GioHang> SelectByTenDangNhap(KhachHang khachHang){
        ArrayList<GioHang> gioHangs = new ArrayList<GioHang>() ;
        Connection connect = JDBC.getConnection() ;
        String sql = "select  * from GioHang where tenDangNhap = ?" ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql);
            PST.setString(1, khachHang.getTenDangNhap());
            ResultSet RS = PST.executeQuery() ;
            while(RS.next()){
                GioHang gioHang = new GioHang(khachHang.getTenDangNhap(), RS.getString("maSanPham") , RS.getInt("soLuong")) ;
                gioHangs.add(gioHang) ;
            }
            connect.close();
            if(khachHang.getTenDangNhap().equals(null)){
                return null ;
            }
            else {
                return gioHangs;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(GioHang gioHang){
        Connection connect = JDBC.getConnection() ;
        String sql = "delete from GioHang where tenDangNhap = ? and maSanPham = ?" ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql);
            PST.setString(1 , gioHang.getTenDangNhap());
            PST.setString(2, gioHang.getMaSanPham());
            PST.executeUpdate() ;
            connect.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void update(GioHang gioHang){
        String sql = "UPDATE `GioHang` SET `soLuong` = ? WHERE `tenDangNhap` = ? AND `maSanPham` = ?" ;
        Connection connect = JDBC.getConnection() ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql) ;
            PST.setString(2, gioHang.getTenDangNhap());
            PST.setString(3, gioHang.getMaSanPham());
            PST.setInt(1,gioHang.getSoLuong());
            PST.executeUpdate() ;
            connect.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void insert(GioHang gioHang){
        Connection connect = JDBC.getConnection() ;
        String sql = "insert into GioHang() values(? , ?  , ?)" ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql) ;
            PST.setString(1, gioHang.getTenDangNhap());
            PST.setString(2, gioHang.getMaSanPham());
            PST.setInt(3,gioHang.getSoLuong());
            PST.executeUpdate() ;
            connect.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
