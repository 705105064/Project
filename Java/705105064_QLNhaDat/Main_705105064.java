//Tran Thi Lieu - 705105064
package BaiThiNgay9_3_2022;

import java.util.ArrayList;
import java.util.Scanner;



public class Main_705105064 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		ArrayList<NhaDat> nhaDats = new ArrayList<NhaDat>();
		int N;
		
		System.out.println("Nhap so nha dat: ");
		N = sc.nextInt();
		
		for (int i = 0; i < N; i++) {
			System.out.println("\n\nNhap thong tin nha dat thu " + (i+1));
			NhaDat nhadat = new NhaDat();
			nhadat.NhapNhaDat();;
			nhaDats.add(nhadat);
		}

		//a, in ra tat ca nha dat co mat tien > 5 va co san vuon
		
		for (int i = 0; i < nhaDats.size(); i++) {
			if(nhaDats.get(i).getMatTien() > 5 && nhaDats.get(i).isSanVuon() == true) {
				System.out.println("----Nha dat co mat tien > 5m va co san vuon:----");
				nhaDats.get(i).XuatNhaDat();
			}			
		}
		
		//b, tong gia tri dien tich la 1 so chinh phuong
		for (int i = 0; i < nhaDats.size(); i++) {
			
		}
		
		//c, sap xep nha dat tang dan dien tich
		for (int i = 0; i < nhaDats.size(); i++) {
//			double temp = nhaDats.get(1).getDienTich();
			for (int j = i + 1; j < nhaDats.size(); j++) {
				if(nhaDats.get(i).getDienTich() > nhaDats.get(1).getDienTich()) {
					
//					temp = nhaDats.get(i).getDienTich();
//					nhaDats.get(i).getDienTich() = nhaDats.get(j).getDienTich();
//					nhaDats.get(i).getDienTich() = temp;
					
				}
			}	
		}
		
		
		sc.nextLine();
		//d, M chung cu
		ArrayList<ChungCu> chungCus = new ArrayList<ChungCu>();
		int M;
		System.out.println("\n\nNhap so chung cu: ");
		M = sc.nextInt();
		
		
		for (int i = 0; i < M; i++) {
			System.out.println("\n\nNhap thong tin chung cu thu " + (i+1));
			ChungCu chungcu = new ChungCu();
			chungcu.NhapChungCu();
			chungCus.add(chungcu);
		}
		
		sc.nextLine();
		
		for (int i = 0; i < chungCus.size(); i++) {
			if(chungCus.get(i).getChuDauTu() == "FLC" && chungCus.get(i).getSoPhongNgu() >= 3) {
				System.out.println("\n\n----Chung cu co chu dau tu 'FLC' va co 3 phong ngu:----");
				chungCus.get(i).Xuat();
			}
		}
		
		//e, dem so luong
		int demTMcaue = 0;
		for (int i = 0; i < chungCus.size(); i++) {
			
			if(chungCus.get(i).getPhiGuiXe() >= 150000 && chungCus.get(i).isTienIch() == true) {
				demTMcaue++;
			}
		}
		System.out.println("\n\nSo luong chung cu thoa man cau e la: " + demTMcaue);
		
	}

}
