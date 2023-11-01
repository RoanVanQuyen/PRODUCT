package model;

public class DanhSachMongMuon {
    private String tenDangNhap ;
    private String maSanPham ;

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

    public DanhSachMongMuon(String tenDangNhap, String maSanPham) {
        this.tenDangNhap = tenDangNhap;
        this.maSanPham = maSanPham;
    }
    public DanhSachMongMuon(){}
}
