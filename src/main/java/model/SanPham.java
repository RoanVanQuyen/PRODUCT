package model;

import java.util.ArrayList;

public class SanPham extends TheLoai {
    private String maSanPham ;
    private String tenSanPham ;
    private Double giaSanPham ;
    private String moTaChiTiet ;
    private ArrayList<String> anhSanPham ;
    private TheLoai theLoai ;

    public TheLoai getTheLoai() {
        return theLoai;
    }

    public void setTheLoai(TheLoai theLoai) {
        this.theLoai = theLoai;
    }

    public String getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(String maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public Double getGiaSanPham() {
        return giaSanPham;
    }

    public void setGiaSanPham(Double giaSanPham) {
        this.giaSanPham = giaSanPham;
    }

    public String getMoTaChiTiet() {
        return moTaChiTiet;
    }

    public void setMoTaChiTiet(String moTaChiTiet) {
        this.moTaChiTiet = moTaChiTiet;
    }

    public ArrayList<String> getAnhSanPham() {
        return anhSanPham;
    }

    public void setAnhSanPham(ArrayList<String> anhSanPham) {
        this.anhSanPham = anhSanPham;
    }

    public SanPham(String maSanPham, String tenSanPham, Double giaSanPham, TheLoai theLoai , String moTaChiTiet, ArrayList<String> anhSanPham) {
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.giaSanPham = giaSanPham;
        this.moTaChiTiet = moTaChiTiet;
        this.anhSanPham = anhSanPham;
        this.theLoai = theLoai;
    }
    public SanPham(){}

    public SanPham(SanPham A){
        this.maSanPham = A.maSanPham;
        this.tenSanPham = A.tenSanPham;
        this.giaSanPham = A.giaSanPham;
        this.moTaChiTiet = A.moTaChiTiet;
        this.anhSanPham = A.anhSanPham;
        this.theLoai = A.theLoai;
    }
    @Override
    public String toString() {
        return "SanPham{" +
                "maSanPham='" + maSanPham + '\'' +
                ", tenSanPham='" + tenSanPham + '\'' +
                ", giaSanPham=" + giaSanPham +
                ", moTaChiTiet='" + moTaChiTiet + '\'' +
                ", anhSanPham=" + anhSanPham +
                '}';
    }

}
