package dataBase;
import model.KhachHang ;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class KhachHangDAO implements DAOinterface<KhachHang>{
    public static KhachHangDAO getInstance(){
        return new KhachHangDAO() ;
    }
    @Override
    public ArrayList<KhachHang> select() {
        Connection connect = JDBC.getConnection() ;
        String sql = "select * from KhachHang" ;
        try {
            ArrayList<KhachHang> ans = new ArrayList<KhachHang>()  ;
            PreparedStatement PST = connect.prepareStatement(sql);
            ResultSet RS  = PST.executeQuery() ;
            while(RS.next()){
                KhachHang one = new KhachHang(RS.getString("maKhachHang"), RS.getString("tenDangNhap") ,RS.getString("matKhau") ,
                RS.getString("hoVaTen") , RS.getString("gioiTinh") , RS.getString("diaChi") ,RS.getString("soDienThoai")) ;
                ans.add(one) ;
            }
            return ans ;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public KhachHang selectById(KhachHang khachHang) {
        Connection connect = JDBC.getConnection() ;
        String sql = "select * from KhachHang where tenDangNhap = ?" ;
        KhachHang One = null ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql);
            PST.setString(1,  khachHang.getTenDangNhap());
            ResultSet RS = PST.executeQuery() ;
            while(RS.next()){
                One = new KhachHang(RS.getString("maKhachHang"), RS.getString("tenDangNhap") ,RS.getString("matKhau") ,
                        RS.getString("hoVaTen") , RS.getString("gioiTinh") , RS.getString("diaChi") ,RS.getString("soDienThoai")) ;
            }
            connect.close();
            return  One ;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void insert(KhachHang khachHang) {
        Connection connect = JDBC.getConnection();
        String sql = "insert into KhachHang() values(? , ? , ? , ? , ? , ? , ?)" ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql);
            PST.setString(1,khachHang.getMaKH()) ;
            PST.setString(2,khachHang.getTenDangNhap());
            PST.setString(3,khachHang.getMatKhau()) ;
            PST.setString(4,khachHang.getHoVaTen()) ;
            PST.setString(5, khachHang.getGioiTinh());
            PST.setString(6, khachHang.getDiaChi());
            PST.setString(7, khachHang.getSoDienThoai());
            PST.executeUpdate();
            connect.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void insertAll(ArrayList<KhachHang> t) {

    }

    @Override
    public void delete(KhachHang khachHang) {

    }

    @Override
    public void update(KhachHang khachHang) {

    }
}
