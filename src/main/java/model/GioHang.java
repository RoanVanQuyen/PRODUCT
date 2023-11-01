package model;

public class GioHang {
    private  String tenDangNhap ;
    private  String maSanPham ;
    private  int soLuong ;

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(String maSanPham) {
        this.maSanPham = maSanPham;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public GioHang(String tenDangNhap, String maSanPham, int soLuong) {
        this.tenDangNhap = tenDangNhap;
        this.maSanPham = maSanPham;
        this.soLuong = soLuong;
    }
    public GioHang(){}
}
