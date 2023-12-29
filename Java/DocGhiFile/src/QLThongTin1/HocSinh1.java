package QLThongTin1;

import java.util.Scanner;

public class HocSinh1 extends NhanSu1 {
	private int maHS;
	private int lop;
	private float diem;
	public int getMaHS() {
		return maHS;
	}
	public void setMaHS(int maHS) {
		this.maHS = maHS;
	}
	public int getLop() {
		return lop;
	}
	public void setLop(int lop) {
		this.lop = lop;
	}
	public float getDiem() {
		return diem;
	}
	public void setDiem(float diem) {
		this.diem = diem;
	}
	public HocSinh1() {
		// TODO Auto-generated constructor stub
	}
	public HocSinh1(String hoTen, int namSinh, String queQuan, boolean gioiTinh, int maHS, int lop, float diem) {
		super(hoTen, namSinh, queQuan, gioiTinh);
		this.maHS = maHS;
		this.lop = lop;
		this.diem = diem;
	}
	@Override
	public String toString() {
		return "HocSinh7_4 [maHS=" + maHS + ", lop=" + lop + ", diem=" + diem + "]";
	}
	public void NhapHS() {
		Scanner sc = new Scanner(System.in);
		System.out.print("Nhap ma HS: ");
		this.maHS = sc.nextInt();
		System.out.print("Nhap lop: ");
		this.lop = sc.nextInt();
		System.out.print("Nhap diem: ");
		this.diem = sc.nextFloat();
		sc.nextLine();
		super.NhapNhanSu();
	}
	public void XuatHS() {
		System.out.println(this.toString() + super.toString());
	}

}
