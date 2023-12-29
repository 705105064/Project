package QLThongTin1;

import java.util.Scanner;

public class NhanSu1 {
	private String hoTen;
	private int namSinh;
	private String queQuan;
	private boolean gioiTinh;
	public NhanSu1(String hoTen, int namSinh, String queQuan, boolean gioiTinh) {
		super();
		this.hoTen = hoTen;
		this.namSinh = namSinh;
		this.queQuan = queQuan;
		this.gioiTinh = gioiTinh;
	}
	public NhanSu1() {
		// TODO Auto-generated constructor stub
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public int getNamSinh() {
		return namSinh;
	}
	public void setNamSinh(int namSinh) {
		this.namSinh = namSinh;
	}
	public String getQueQuan() {
		return queQuan;
	}
	public void setQueQuan(String queQuan) {
		this.queQuan = queQuan;
	}
	public boolean isGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	@Override
	public String toString() {
		return "NhanSu7_4 [hoTen=" + hoTen + ", namSinh=" + namSinh + ", queQuan=" + queQuan + ", gioiTinh=" + gioiTinh
				+ "]";
	}
	public void NhapNhanSu() {
		Scanner sc = new Scanner(System.in);
		System.out.print("Nhap ho ten: ");
		this.hoTen = sc.nextLine();
		System.out.print("Nhap nam sinh: ");
		this.namSinh = sc.nextInt();
		System.out.print("Nhap que quan: ");
		sc.nextLine();
		this.queQuan = sc.nextLine();
		System.out.print("Nhap gioi tinh: ");
		this.gioiTinh = sc.nextBoolean();
		
	}
	public void XuatNhanSu() {
		System.out.println(this.toString());
	}

}
