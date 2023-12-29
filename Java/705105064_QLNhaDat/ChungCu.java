//Tran Thi Lieu - 705105064
package BaiThiNgay9_3_2022;

import java.util.Scanner;

public class ChungCu extends BatDongSan {
	private String chuDauTu;
	private int soPhongNgu;
	private double phiGuiXe;//vnd/thang
	private boolean tangHam;//co/ko
	private boolean tienIch;//co/ko
	
	//phuong thuc khoi tao
	public ChungCu() {
		// TODO Auto-generated constructor stub
	}
	
	public ChungCu(String chuDauTu, int soPhongNgu, double phiGuiXe, boolean tangHam, boolean tienIch) {
		super();
		this.chuDauTu = chuDauTu;
		this.soPhongNgu = soPhongNgu;
		this.phiGuiXe = phiGuiXe;
		this.tangHam = tangHam;
		this.tienIch = tienIch;
	}

	//getter, setter
	public String getChuDauTu() {
		return chuDauTu;
	}
	public void setChuDauTu(String chuDauTu) {
		this.chuDauTu = chuDauTu;
	}
	public int getSoPhongNgu() {
		return soPhongNgu;
	}
	public void setSoPhongNgu(int soPhongNgu) {
		this.soPhongNgu = soPhongNgu;
	}
	public double getPhiGuiXe() {
		return phiGuiXe;
	}
	public void setPhiGuiXe(double phiGuiXe) {
		this.phiGuiXe = phiGuiXe;
	}
	public boolean isTangHam() {
		return tangHam;
	}
	public void setTangHam(boolean tangHam) {
		this.tangHam = tangHam;
	}
	public boolean isTienIch() {
		return tienIch;
	}
	public void setTienIch(boolean tienIch) {
		this.tienIch = tienIch;
	}
	
	//nhap
	public void NhapChungCu() {
		Scanner sc = new Scanner(System.in);
		super.Nhap();
		System.out.println("Nhap chu dau tu: ");
		this.chuDauTu = sc.nextLine();
		System.out.println("Nhap so phong ngu Chung cu: ");
		this.soPhongNgu = sc.nextInt();
		System.out.println("Nhap phi gui xe: ");
		this.phiGuiXe = sc.nextDouble();
		System.out.println("Chung cu co tang ham ko (True/False)? ");
		this.tangHam = sc.nextBoolean();
		System.out.println("Chung cu co tien ich ko (True/False)? ");
		this.tienIch = sc.nextBoolean();
		sc.nextLine();
		
	}
	
	//xuat
	public void XuatChungCu() {
		super.Xuat();
		System.out.println("Chu dau tu: " + this.chuDauTu);
		System.out.println("So phong ngu Chung cu: " + this.soPhongNgu);
		System.out.println("Phi gui xe: " + this.phiGuiXe);
		System.out.println("Tang ham: " + this.tangHam);
		System.out.println("tien ich: " + this.tienIch);
//		System.out.println("\n\n"+ this.toString());
	}

	@Override
	public String toString() {
		return "ChungCu [chuDauTu=" + chuDauTu + ", soPhongNgu=" + soPhongNgu + ", phiGuiXe=" + phiGuiXe + ", tangHam="
				+ tangHam + ", tienIch=" + tienIch + "]";
	}

	
}
