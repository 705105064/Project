//Tran Thi Lieu - 705105064
package BaiThiNgay9_3_2022;

import java.util.Scanner;

public class BatDongSan {
	private String MaBDS;
	private String TenBDS;
	private double giaTri;//VND
	private double dienTich;//m^2
	private double cachTrungTam;//km
	
	//pthuc khoi tao
	public BatDongSan() {
		// TODO Auto-generated constructor stub
	}
	
	
	public BatDongSan(String maBDS, String tenBDS, double giaTri, double dienTich, double cachTrungTam) {
		super();
		MaBDS = maBDS;
		TenBDS = tenBDS;
		this.giaTri = giaTri;
		this.dienTich = dienTich;
		this.cachTrungTam = cachTrungTam;
	}


	//getter, setter
	public String getMaBDS() {
		return MaBDS;
	}
	public void setMaBDS(String maBDS) {
		MaBDS = maBDS;
	}
	public String getTenBDS() {
		return TenBDS;
	}
	public void setTenBDS(String tenBDS) {
		TenBDS = tenBDS;
	}
	public double getGiaTri() {
		return giaTri;
	}
	public void setGiaTri(double giaTri) {
		this.giaTri = giaTri;
	}
	public double getDienTich() {
		return dienTich;
	}
	public void setDienTich(double dienTich) {
		this.dienTich = dienTich;
	}
	public double getCachTrungTam() {
		return cachTrungTam;
	}
	public void setCachTrungTam(double cachTrungTam) {
		this.cachTrungTam = cachTrungTam;
	}
	
	public void Nhap() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Nhap ma bat dong san: ");
		this.MaBDS = sc.nextLine();
		System.out.println("Nhap ten bat dong san: ");
		this.TenBDS = sc.nextLine();
		System.out.println("Nhap gia tri(VND): ");
		this.giaTri = sc.nextDouble();
		System.out.println("Nhap dien tich(m^2): ");
		this.dienTich = sc.nextDouble();
		System.out.println("Cach trung tam(km): ");
		this.cachTrungTam = sc.nextDouble();
		sc.nextLine();
		
	}
	
	public void Xuat() {
		System.out.print("\nMa bat dong san: " + this.MaBDS);
		System.out.print("\nTen bat dong san: " + this.TenBDS);
		System.out.print("\nGia tri(VND): " + this.giaTri);
		System.out.print("\nDien tich(m^2): " + this.dienTich);
		System.out.print("\nCach trung tam(km): " + this.cachTrungTam);
		//System.out.println(this.toString());
	}


	@Override
	public String toString() {
		return "BatDongSan [MaBDS=" + MaBDS + ", TenBDS=" + TenBDS + ", giaTri=" + giaTri + ", dienTich=" + dienTich
				+ ", cachTrungTam=" + cachTrungTam + "]";
	}
	
	
}
