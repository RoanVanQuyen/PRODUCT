package dataBase;

import model.SanPham;
import model.TheLoai;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SanPhamDAO implements DAOinterface<SanPham> {
    public static SanPhamDAO getInstance(){
        return new SanPhamDAO() ;
    }
    @Override
    public ArrayList<SanPham> select() {
        Connection connect = JDBC.getConnection() ;
        String sql = "select * from SanPham" ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql);
            ResultSet RS = PST.executeQuery() ;
            ArrayList<SanPham> sanPhams = new ArrayList<SanPham>() ;
            while(RS.next()){
                ArrayList<String> anhSanPham = new ArrayList<>() ;
                anhSanPham.add(RS.getString("hinhAnhSanPham00")) ;
                anhSanPham.add(RS.getString("hinhAnhSanPham01"));
                anhSanPham.add(RS.getString("hinhAnhSanPham02")) ;
                anhSanPham.add(RS.getString("hinhAnhSanPham03"));
                TheLoai theLoai = new TheLoai(RS.getString("maTheLoai") , "") ;
                SanPham one = new SanPham(RS.getString("maSanPham") , RS.getString("tenSanPham") , RS.getDouble("giaSanPham") , theLoai , RS.getString("moTaChiTiet") , anhSanPham) ;
                sanPhams.add(one) ;
            }
            connect.close();
            return sanPhams ;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public SanPham selectById(SanPham sanPham) {
        Connection connect = JDBC.getConnection() ;
        String sql = "select * from SanPham where maSanPham = ?" ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql);
            PST.setString(1, sanPham.getMaSanPham());
            ResultSet RS = PST.executeQuery() ;
            while(RS.next()){
                ArrayList<String> hinhAnh = new ArrayList<String>() ;
                hinhAnh.add(RS.getString("hinhAnhSanPham00"));
                hinhAnh.add(RS.getString("hinhAnhSanPham01"));
                hinhAnh.add(RS.getString("hinhAnhSanPham02"));
                hinhAnh.add(RS.getString("hinhAnhSanPham03"));
                TheLoai Tl = new TheLoai(RS.getString("maTheLoai")  , "vv") ;
                SanPham one =  new SanPham(RS.getString("maSanPham") , RS.getString("tenSanPham") , RS.getDouble("giaSanPham") ,
                        Tl , RS.getString("moTaChiTiet"), hinhAnh) ;
                connect.close();
                return  one ;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    return null ;
    }

    @Override
    public void insert(SanPham sanPham) {
        Connection connect = JDBC.getConnection() ;
        String sql = "insert into SanPham()  values(? , ? , ? , ? ,? ,  ? , ? , ? , ?)" ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql);
            PST.setString(1 , sanPham.getMaSanPham());
            PST.setString(2,  sanPham.getTenSanPham());
            PST.setDouble(3,  sanPham.getGiaSanPham());
            TheLoai theLoai = sanPham.getTheLoai();
            PST.setString(4 , theLoai.getMaTL());
            PST.setString(5,  sanPham.getMoTaChiTiet());
            ArrayList<String> hinhAnhSanPham = sanPham.getAnhSanPham() ;
            for(int i = 0 ; i < hinhAnhSanPham.size() ; i++) {
                PST.setString(i + 6,hinhAnhSanPham.get(i)) ;
            }
            connect.close();
            PST.executeUpdate() ;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void insertAll(ArrayList<SanPham> t) {

    }

    @Override
    public void delete(SanPham sanPham) {
        Connection connect = JDBC.getConnection() ;
        String sql =  "delete from SanPham where maSanPham = ?" ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql);
            PST.setString(1, sanPham.getMaSanPham());
            PST.executeUpdate() ;
            connect.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(SanPham sanPham) {
        String sql = "update SanPham set tenSanPham = ? , giaSanPham = ? , maTheLoai  = ? ,moTaChiTiet = ?  , hinhAnhSanPham00 = ? , hinhAnhSanPham01 = ? , hinhAnhSanPham02 = ? , hinhAnhSanPham03 = ? where maSanPham = ?";
        Connection connect = JDBC.getConnection() ;
        try {
            PreparedStatement PST  = connect.prepareStatement(sql);
            PST.setString(1, sanPham.getTenSanPham());
            PST.setDouble(2, sanPham.getGiaSanPham());
            PST.setString(3, sanPham.getTheLoai().getMaTL());
            PST.setString(4, sanPham.getMoTaChiTiet());
            ArrayList<String> hinhAnh = sanPham.getAnhSanPham();
            PST.setString(5, hinhAnh.get(0));
            PST.setString(6, hinhAnh.get(1));
            PST.setString(7, hinhAnh.get(2));
            PST.setString(8, hinhAnh.get(3));
            PST.setString(9, sanPham.getMaSanPham());
            PST.executeUpdate() ;
            connect.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<SanPham> selectByPages(int index){
        String sql = "SELECT * from SanPham \n" +
                "ORDER by giaSanPham\n" +
                "LIMIT 6 OFFSET ?; " ;
        Connection connect = JDBC.getConnection() ;
        try {
            PreparedStatement PST = connect.prepareStatement(sql);
            PST.setInt(1 , index);
            ResultSet RS = PST.executeQuery()  ;
            ArrayList<SanPham> sanPhams = new ArrayList<SanPham>() ;
            while(RS.next()){
                ArrayList<String> anhSanPham = new ArrayList<>() ;
                anhSanPham.add(RS.getString("hinhAnhSanPham00")) ;
                anhSanPham.add(RS.getString("hinhAnhSanPham01"));
                anhSanPham.add(RS.getString("hinhAnhSanPham02")) ;
                anhSanPham.add(RS.getString("hinhAnhSanPham03"));
                TheLoai theLoai = new TheLoai(RS.getString("maTheLoai") , "") ;
                SanPham one = new SanPham(RS.getString("maSanPham") , RS.getString("tenSanPham") , RS.getDouble("giaSanPham") , theLoai , RS.getString("moTaChiTiet") , anhSanPham) ;
                sanPhams.add(one) ;
            }
            connect.close();
            return sanPhams ;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
