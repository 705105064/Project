//Tran Thi Lieu - 705105064
package BaiThiNgay9_3_2022;

import java.util.Scanner;

public class NhaDat extends BatDongSan{
	private double matTien;//m
	private int soTang;
	private double chieuRongNgo;
	private boolean sanVuon;//true, false
	
	//pthuc khoi tao
	public NhaDat() {
		
	}
	
	
	public NhaDat(double matTien, int soTang, double chieuRongNgo, boolean sanVuon) {
		super();
		this.matTien = matTien;
		this.soTang = soTang;
		this.chieuRongNgo = chieuRongNgo;
		this.sanVuon = sanVuon;
	}


	//getter, setter
	public double getMatTien() {
		return matTien;
	}
	public void setMatTien(double matTien) {
		this.matTien = matTien;
	}
	public int getSoTang() {
		return soTang;
	}
	public void setSoTang(int soTang) {
		this.soTang = soTang;
	}
	public double getChieuRongNgo() {
		return chieuRongNgo;
	}
	public void setChieuRongNgo(double chieuRongNgo) {
		this.chieuRongNgo = chieuRongNgo;
	}
	public boolean isSanVuon() {
		return sanVuon;
	}
	public void setSanVuon(boolean sanVuon) {
		this.sanVuon = sanVuon;
	}
	//nhap
	public void NhapNhaDat() {
		Scanner sc = new Scanner(System.in);
		super.Nhap();
		System.out.println("Nhap mat tien nha dat: ");
		this.matTien = sc.nextDouble();
		System.out.println("Nhap so tang nha dat: ");
		this.soTang = sc.nextInt();
		System.out.println("Nhap chieu rong ngo: ");
		this.chieuRongNgo = sc.nextDouble();
		System.out.println("Nha dat co san vuon ko (True/False): ");
		this.sanVuon = sc.nextBoolean();
		sc.nextLine();
	}
	
	//xuat
	public void XuatNhaDat() {
		super.Xuat();
		System.out.println("\n" + this.toString());
	}


	@Override
	public String toString() {
		return "NhaDat [matTien=" + matTien + ", soTang=" + soTang + ", chieuRongNgo=" + chieuRongNgo + ", sanVuon="
				+ sanVuon + "]";
	}
	
	
}
