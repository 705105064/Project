use QLNV
--16 Dua ra ho ten cua cac truong phong
select HoTen 
from NHAN_VIEN
where ChucVu = 'Truong phong'

--17 dua ra danh sach nhan vien co luong sap xep theo chieu giam dan
select * from NHAN_VIEN
order by Luong DESC

--18 Danh sach cac nhan vien sap xep theo chieu tang dan cua ten, neu ten trung nhau thi sap xep theo chieu tang dan cua ho dem
select * from NHAN_VIEN
order by Ten, HoDem ASC 

--19 Dua ra danh sach nhan vien lam viec o phong 40
select * from NHAN_VIEN
where MaDV = 40

--20 Dua ra danh sach nhan vien co sinh nhat trong thang 3
select * from NHAN_VIEN
where Month(NgaySinh) = 3

--21 Danh sach gom cac ma nhan vien tham gia cac du an co ma 1, 3, 5
select MaNV
from LAM_VIEC
where MaDA = 1 or MaDA = 3 or MaDA = 5
--cach 2
select MaNV
from LAM_VIEC
where MaDA in (1 ,3, 5)

--22 Danh sach cac nhan vien co luong tu 3 trieu den 5 trieu
select * from NHAN_VIEN
where Luong between '3000000' and '5000000'

--23 Danh sach cac nhan vien co tuoi tu 40 den 60
select * from NHAN_VIEN
where year(getdate()) - year(NgaySinh) between '40' and '60'

--24 Dua ra ten cac du an co chua tu san pham
select TenDA
from DU_AN
where TenDA like '%San Pham%'

--25 Dua ra ten cac nhan vien co chua van 'an'
select Ten
from NHAN_VIEN
where Ten like '%an'

--26 Dua ra danh sach cac nhan vien co ky tu dau tien cua ten tu D den L
select * from NHAN_VIEN
where left(Ten, 1) between 'D' and 'L'

--27 Dua ra danh sach 3 nhan vien co luong cao nhat
select top(3) * from NHAN_VIEN
order by Luong DESC

--28 Dua ra danh sach tat ca cac nhan vien co luong thap nhat
select * from NHAN_VIEN
where Luong = (select Min(Luong) from NHAN_VIEN)

--29 Dua ra danh sach cac nhan vien sap xep theo chieu tang dan cua ten, neu ten trung nhau thí ap xep theo chieu tang cua ho dem. Neu ten và dem cung trung nhau thi sap xep theo ngay sinh giam dan
select * from NHAN_VIEN
order by Ten, HoDem ASC, NgaySinh DESC

--30 Sao chep cac nhan vien nu co tuoi tren 55 va nhan vien nam co tuoi tren 60 vao bang NV_NGHIHUU
Select * into NV_NGHIHUU
from NHAN_VIEN 
where (GioiTinh = 'Nu' and year(getdate()) - year(NgaySinh) > 55) or 
	(GioiTinh = 'Nam' and year(getdate()) - year(NgaySinh) > 60)

Select * From NV_NGHIHUU

--31 Sao luu ket qua truy van tinh tong luong cua tung don vi vao bang TONG_LUONG_DV
Select MaDV, sum(Luong) as TongLuong
into TONG_LUONG_DV
from NHAN_VIEN 
group by MaDV

Select * From TongLuong

--32 Bo sung them thong tin cho 3 nhan vien moi vao bang NHAN_VIEN
insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV, DiaChi)
	values ('212', 'Nguyen Van An', '1960/12/12', 'Nu', 'Nhan vien', '3000000',  '20', 'Hang Trong'),
			('215', 'Doan Tuan Minh', '1962/10/30', 'Nam', 'Pho phong', '4000000',  '20', 'Hang Buom'),
			('402', 'Lai Van Bach', '1970/05/05', 'Nam', 'Nhan vien', '3500000', '40', 'Hang Sat')

--33 Tang 10% luong cho cac nhan vien lam viec o phong 10
update NHAN_VIEN
set Luong = Luong + 0.1 * Luong
where MaDV = 10

--34 Cap nhat luong cho nhan vien ma 103 bang luong trung binh cua phong 10
update NHAN_VIEN
set Luong = (select avg(Luong) 
			from NHAN_VIEN 
			where MaDV = 10)
where MaNV = '103'

--35 Sao chep cac nhan vien phong 10, 20, 30 sang bang NV_SAOLUU
select * into NV_SAOLUU
from NHAN_VIEN
where MaDV = 10 or MaDV = 20 or MaDV = 30
select * from NV_SAOLUU

--36 Xoa cac nhan vien phong ky thuat co luong duoi 4trieu trong bang NV_SAOLUU
delete from NV_SAOLUU
where Luong < 4000000 and MaDV = (select MaDV 
									from DON_VI
									where TenDV = 'Phong Ky Thuat')
