package model;

public class BenhVien {
    private String ten ;
    private String diaChi ;
    private String giamDoc  ;

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getGiamDoc() {
        return giamDoc;
    }

    public void setGiamDoc(String giamDoc) {
        this.giamDoc = giamDoc;
    }

    public BenhVien(String ten, String diaChi, String giamDoc) {
        this.ten = ten;
        this.diaChi = diaChi;
        this.giamDoc = giamDoc;
    }
    public BenhVien(){}

    @Override
    public String toString() {
        return "BenhVien{" +
                "ten='" + ten + '\'' +
                ", diaChi='" + diaChi + '\'' +
                ", giamDoc='" + giamDoc + '\'' +
                '}';
    }
}
