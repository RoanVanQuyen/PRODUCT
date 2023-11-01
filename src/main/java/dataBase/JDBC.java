package dataBase;

import model.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;
import java.util.regex.Pattern;

public class JDBC{
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver") ;
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/QuanLyWebBanDongHo" , "root" ,"") ;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String [] args){
        ArrayList<SanPham> ans = SanPhamDAO.getInstance().selectByPages(0);
        for(int i = 0 ; i < ans.size() ; i++){
            System.out.println(ans.get(i).getTenSanPham());
            System.out.println(ans.get(i).getGiaSanPham());
            System.out.println();
        }
    }
//    Đồng Hồ Casio 40mm Nam MTP-VT01L-1BUDF
//    Đồng Hồ Frederique Constant 40mm Nam FC-312V4S4
//    Đồng Hồ Calvin Klein 30mm Nữ K4E2N616
//    Đồng Hồ Nam Citizen Automatic Watch NH8350-08B
//    Đồng Hồ Olym Pianus 34mm Nữ OP990-45DDGS-GL-T
}
