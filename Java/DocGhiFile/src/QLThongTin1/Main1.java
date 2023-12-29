package QLThongTin1;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class Main1 implements Serializable{
	public static void main(String[] args) {
		ArrayList<HocSinh1> listHS = new ArrayList<HocSinh1>();
		int n;
		Scanner sc  = new Scanner(System.in);
		System.out.println("Nhap so hoc sinh: ");
		n = sc.nextInt();
		for (int i = 0; i < n; i++) {
			System.out.println("Nhap hoc sinh thu " + (i+1));
			HocSinh1 hs = new HocSinh1();
			hs.NhapHS();
			listHS.add(hs);
		}
		
		ArrayList<GiaoVien1> listGV = new ArrayList<GiaoVien1>();
		int m;//so giao vien
		System.out.println("Nhap so giao vien: ");
		m = sc.nextInt();
		for (int i = 0; i < m; i++) {
			System.out.println("Nhap Giao Vien thu " + (i+1));
			GiaoVien1 gv = new GiaoVien1();
			gv.NhapGV();
			listGV.add(gv);
		}
		
		//In lại toàn bộ danh sách Giáo viên và Học sinh đã nhập
//		System.out.println("---Thong tin da nhap---");
//		for (int i = 0; i < n; i++) {
//			list.get(i);
//		}
		//In danh sách chỉ gồm Học sinh
		System.out.println("---Thong tin Hoc Sinh da nhap---");
		for (int i = 0; i < listHS.size(); i++) {
			listHS.get(i).XuatHS();
		}
		//In danh sách chỉ gồm Giáo viên
		System.out.println("---Thong tin Giao Vien da nhap---");
		for (int i = 0; i < listGV.size(); i++) {
			listGV.get(i).XuatGV();
		}
		
	}


}
