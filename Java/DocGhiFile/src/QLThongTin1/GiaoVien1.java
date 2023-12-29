package QLThongTin1;

import java.util.Scanner;

public class GiaoVien1 extends NhanSu1{
	private int maGV;
	private String phongBan;
	private float luong;
	public int getMaGV() {
		return maGV;
	}
	public void setMaGV(int maGV) {
		this.maGV = maGV;
	}
	public String getPhongBan() {
		return phongBan;
	}
	public void setPhongBan(String phongBan) {
		this.phongBan = phongBan;
	}
	public float getLuong() {
		return luong;
	}
	public void setLuong(float luong) {
		this.luong = luong;
	}
	public GiaoVien1() {
		// TODO Auto-generated constructor stub
	}
	public GiaoVien1(String hoTen, int namSinh, String queQuan, boolean gioiTinh, int maGV, String phongBan,
			float luong) {
		super(hoTen, namSinh, queQuan, gioiTinh);
		this.maGV = maGV;
		this.phongBan = phongBan;
		this.luong = luong;
	}
	@Override
	public String toString() {
		return "GiaoVien7_4 [maGV=" + maGV + ", phongBan=" + phongBan + ", luong=" + luong + "]";
	}
	public void XuatGV() {
		System.out.println(this.toString() + super.toString());
	}
	public void NhapGV() {
		super.NhapNhanSu();
		Scanner sc = new Scanner(System.in);
		System.out.print("Nhap Ma GV: ");
		this.maGV = sc.nextInt();
		System.out.print("Nhap phong ban cua GV: ");
		sc.nextLine();
		this.phongBan = sc.nextLine();
		System.out.print("Nhap luong GV: ");
		this.luong = sc.nextFloat();
		sc.nextLine();
		
	}

}
