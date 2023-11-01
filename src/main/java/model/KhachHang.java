package model;

import java.util.Collections;
import java.util.Comparator;

public class KhachHang  {
    private String maKH ;
    private String tenDangNhap ;
    private String matKhau ;
    private String hoVaTen ;
    private String gioiTinh ;
    private String diaChi ;
    private String soDienThoai ;

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getHoVaTen() {
        return hoVaTen;
    }

    public void setHoVaTen(String hoVaTen) {
        this.hoVaTen = hoVaTen;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public KhachHang(String maKH, String tenDangNhap, String matKhau, String hoVaTen, String gioiTinh, String diaChi, String soDienThoai) {
        this.maKH = maKH;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.hoVaTen = hoVaTen;
        this.gioiTinh = gioiTinh;
        this.diaChi = diaChi;
        this.soDienThoai = soDienThoai ;
    }
    public KhachHang(){}

    @Override
    public String toString() {
        return "KhachHang{" +
                "maKH='" + maKH + '\'' +
                ", tenDangNhap='" + tenDangNhap + '\'' +
                ", matKhau='" + matKhau + '\'' +
                ", hoVaTen='" + hoVaTen + '\'' +
                ", gioiTinh='" + gioiTinh + '\'' +
                ", diaChi='" + diaChi + '\'' +
                ", soDienThoai='" + soDienThoai + '\'' +
                '}';
    }
}
