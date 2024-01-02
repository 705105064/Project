use QLNV
--tuan 6: khung nhin va index
--1. Tạo khung nhìn có tên NV_DA để đưa ra danh sách các nhân viên chưa tham gia dự án nào
create view NV_DA
as
select MaNV, HoTen
from NHAN_VIEN
where MaNV in ((select MaNV	
				from NHAN_VIEN)
				except
				(select MaNV
				from LAM_VIEC))

select * from NV_DA

--2.Tạo khung nhìn có tên P_DA đưa ra danh sách các phòng có quản lý dự án, và thống kê số dự án được quản lý bởi mỗi phòng.
create view P_DA
as
select MaDV, count(MaDV) as SoDA
from DU_AN
group by MaDV

select * from P_DA

--3.Tạo khung nhìn có tên NV_TRE để đưa ra danh sách các nhân có độ tuổi dưới 35. Sau đó dựa trên khung nhìn thực hiện các công việc sau:
create view NV_TRE
as
select * from NHAN_VIEN
where (datediff(year, NgaySinh, getdate()) + 1) < 35

select * from NV_TRE
--4.Đưa ra danh sách các nhân viên có độ tuổi từ 25 đến 30.
select * from NV_TRE
where (datediff(year, NgaySinh, getdate()) + 1) <= 30 and
		(datediff(year, NgaySinh, getdate()) + 1) >= 25

	

--5.Chèn thêm một số nhân viên (trong đó có một số nhân viên tuổi dưới 35, và một số nhân viên tuổi trên 35) vào view NV_TRE
insert into NV_TRE 
	values ('320', 'Nguyen Van An', '1985/05/05', 'Nam', 'Nhan Vien', '3000000', '30', 'Hang Bac', ' An', 'Nguyen Van');
insert into NV_TRE 
	values ('107', 'Nguyen Thi Thu', '1989/05/10', 'Nu', 'Nhan Vien','3500000', '10', 'Hang Trong', ' Thu', 'Nguyen Thi');
insert into NV_TRE
	values ('109', 'Nguyen Van Tinh', '1995/10/10', 'Nam', 'Nhan Vien', '5000000', '10', 'Ha Dong', ' Tinh', 'Nguyen Van');
insert into NV_TRE
	values ('405', 'Nguyen Phan Ai Van', '1994/05/05', 'Nu', 'Nhan Vien', '4000000', '40', 'Hang Bac', ' Van', 'Nguyen Phan Ai');
insert into NV_TRE 
	values ('402', 'Bui Dinh Tuan', '1992/05/05', 'Nam', 'Nhan Vien', '4000000', '40', 'Hang Bac', ' Tuan', 'Bui Dinh');
insert into NV_TRE  
	values ('408', 'Nguyen Van Nam', '1980/10/05', 'Nam','Nhan Vien', '6000000', '40', 'Nam Tu Liem', ' Hai', 'Nguyen Van');


select * from NV_TRE
select * from NHAN_VIEN

--6.Sửa thông tin địa chỉ của một số nhân viên trên view NV_TRE
update NV_TRE
	set DiaChi = 'Hai Duong'
	where MaNV = 408

update NV_TRE
	set DiaChi = 'Bac Giang'
	where MaNV = 402

update NV_TRE
	set DiaChi = 'Ha Noi'
	where MaNV = 320

--7.Tăng lương 20% cho nhân viên nữ và 15% cho nhân viên nam trên view NV_TRE
update NV_TRE
	set Luong = Luong + Luong * 0.2
	where GioiTinh = 'Nu'
update NV_TRE
	set Luong = Luong + Luong * 0.15
	where GioiTinh = 'Nam'
--8. Xoá nhân viên có lương dưới 2000000 trên view NV_TRE.
delete from NV_TRE
	where Luong < 5000000

--9. Xóa view NV_TRE sau đó tạo lại view này với mệnh đề With check option và thực hiện các câu lệnh Insert, Update, Delete trên view này.
-- xóa view NV_TRE
drop view NV_TRE

--Tạo lại view NV_TRE với mệnh đề with check option
create view NV_TRE
as
select * from NHAN_VIEN
where (datediff(year, NgaySinh, getdate()) + 1) < 35
with check option;

--insert
insert into NV_TRE 
	values ('320', 'Nguyen Van An', '1985/05/05', 'Nam', 'Nhan Vien', '3000000', '30', 'Hang Bac', ' An', 'Nguyen Van');
insert into NV_TRE 
	values ('107', 'Nguyen Thi Thu', '1989/05/10', 'Nu', 'Nhan Vien','3500000', '10', 'Hang Trong', ' Thu', 'Nguyen Thi');
insert into NV_TRE
	values ('109', 'Nguyen Van Tinh', '1995/10/10', 'Nam', 'Nhan Vien', '5000000', '10', 'Ha Dong', ' Tinh', 'Nguyen Van');
insert into NV_TRE
	values ('405', 'Nguyen Phan Ai Van', '1994/05/05', 'Nu', 'Nhan Vien', '4000000', '40', 'Hang Bac', ' Van', 'Nguyen Phan Ai');
insert into NV_TRE 
	values ('402', 'Bui Dinh Tuan', '1992/05/05', 'Nam', 'Nhan Vien', '4000000', '40', 'Hang Bac', ' Tuan', 'Bui Dinh');
insert into NV_TRE  
	values ('408', 'Nguyen Van Nam', '1980/10/05', 'Nam','Nhan Vien', '6000000', '40', 'Nam Tu Liem', ' Hai', 'Nguyen Van');
	
select * from NV_TRE
select * from NHAN_VIEN
--update
update NV_TRE
	set DiaChi = 'Hai Duong'
	where MaNV = 408

update NV_TRE
	set DiaChi = 'Bac Giang'
	where MaNV = 402

update NV_TRE
	set DiaChi = 'Ha Noi'
	where MaNV = 320

--delete
delete from NV_TRE
	where Luong < 5000000

--10. Viết truy vấn lồng nhau thực hiện các yêu cầu ở bài thực hành tuần 5
		--Cho biết tổng số nhân viên của phòng Kỹ thuật.
				select count(MaNV) as TongNV
				from NV_TRE 
				where MaDV = (select MaDV
								from DON_VI
								where TenDV = 'Phong Ky Thuat')

		--Cho biết lương lớn nhất, lương nhỏ nhất và trung bình lương của các nhân viên trong phòng Kỹ thuật.
				select min(Luong) as MinLuong, max(Luong) as MaxLuong, AVG(Luong) as TB_Luong
				from NV_TRE
				where MaDV = (select MaDV
								from DON_VI
								where TenDV = 'Phong Ky Thuat')
		--Cho biết những nhân viên phòng Kỹ thuật có lương lớn hơn lương trung bình của phòng.
				select MaNV, HoTen, Luong
				from NV_TRE
				where Luong > all (select AVG(Luong)
									from NV_TRE
									group by MaDV)
					and MaDV = (select MaDV
								from DON_VI
								where TenDV = 'Phong Ky Thuat')
		--Cho biết tổng số nhân viên có lương từ 3 triệu trở lên.
				select count(MaNV) as So_NV
				from NV_TRE
				where Luong >= 3000000

				select * from NV_TRE

		--Với mỗi phòng, cho biết mã đơn vị, tổng số nhân viên và trung bình lương.
				select MaDV, count(MaNV) as SoNV, AVG(Luong) as TBLuong
				from NV_TRE
				group by MaDV

		--Đưa ra danh sách các nhân viên có lương lớn hơn trung bình lương của phòng họ.
				select MaNV, HoTen
				from NV_TRE
				where Luong > (select avg(Luong)
								from NV_TRE as NVT
								where NVT.MaDV = NV_TRE.MaDV
								group by NVT.MaDV)
		--Cho biết các nhân viên có lương lớn nhất trong công ty.
				select MaNV, HoTen, Luong
				from NV_TRE 
				where Luong = (select Max(Luong)
								from NV_TRE)

		--Cho biết mã dự án, tên dự án của các dự án nhiều nhân viên tham gia nhất.
				select MaDA, TenDA
				from DU_AN
				where MaDA in (select MaDA
								from LAM_VIEC
								group by MaDA
								having count(MaNV) >= all (select count(MaNV)
															from LAM_VIEC
															group by MaDA))
			select count(MaNV) as tongNV
			from LAM_VIEC
			group by MaDA
		--Cho biết mã dự án, tên dự án có tổng số giờ công lớn nhất.
				select MaDA, TenDA
				from DU_AN
				where MaDA in (select MaDA
								from LAM_VIEC
								group by MaDA
								having sum(SoGio) >= all (select sum(SoGio)
														from LAM_VIEC
														group by MaDA))

				select sum(SoGio), MaDA
				from LAM_VIEC
				group by MaDA

		--Cho biết nhân viên nào có nhiều người phụ thuộc nhất.
				select MaNV, HoTen
				from NHAN_VIEN
				where MaNV = (select MaNV
								from PHU_THUOC
								group by MaNV
								having count(MaNV) >= all (select count(MaNV)
															from PHU_THUOC
															group by MaNV))

		--Cho biết tên phòng có bình quân thu nhập thấp nhất.
				select TenDV
				from DON_VI
				where MaDV = (select MaDV
								from NHAN_VIEN
								group by MaDV
								having avg(Luong) <= all (select AVG(Luong)
															from NHAN_VIEN
															group by MaDV))
		--Cho biết tên của tất cả các đơn vị có lương trung bình cao nhất
				select TenDV
				from DON_VI
				where MaDV = (select MaDV
								from NHAN_VIEN
								group by MaDV
								having avg(Luong) >= all (select AVG(Luong)
															from NHAN_VIEN
															group by MaDV))
		--Cho biết mỗi phòng quản lý bao nhiêu dự án, sắp xếp danh sách theo số dự án tăng dần.
				select MaDV, count(MaDA) as SoDA
				from DU_AN
				group by MaDV
				order by count(MaDA) ASC
		--Với mỗi dự án, cho biết mã dự án, tên dự án, tổng số nhân viên tham gia dự án và tổng số giờ công.
				select LV.MaDA, TenDA, count(MaNV) as TongNV, Sum(SoGio) as TongGioCong
				from LAM_VIEC LV, DU_AN DA
				where LV.MaDA = DA.MaDA
				group by LV.MaDA, TenDA
		--Với mỗi dự án có hơn hai nhân viên tham gia, cho biết mã dự án, tên dự án và số nhân viên viên tham gia dự án.
				select LV.MaDA, TenDA, count(MaNV) as SoNV
				from LAM_VIEC LV, DU_AN DA
				where LV.MaDA = DA.MaDA
				group by LV.MaDA, TenDA
				having count(MaNV) > 2

		--Cho biết tên đơn vị, tổng số nhân viên của phòng có trung bình lương của nhân viên lớn hơn 3 triệu
				select TenDV, count(MaNV) as SoNV , AVG(Luong) as TBLuong
				from DON_VI DV, NHAN_VIEN NV
				where DV.MaDV = NV.MaDV
				group by NV.MaDV, TenDV
				having avg(Luong) > 3000000

		--Với mỗi nhân viên, cho biết mã số nhân viên, họ tên và tổng số người phụ thuộc của nhân viên đó.
				select PT.MaNV, HoTen, count(PT.MaNV) as SoPT
				from NHAN_VIEN NV, PHU_THUOC PT
				where NV.MaNV = PT.MaNV
				group by PT.MaNV, HoTen

		--Cho biết mỗi nhân viên tham gia bao nhiêu dự án và tổng số giờ làm. Sắp xếp danh sách này theo số dự án giảm dần, nếu số dự án trùng nhau thì sắp xếp theo tổng số giờ làm giảm dần.
				select MaNV, Count(MaDA) as SoDA, sum(SoGio) as TongSoGio
				from LAM_VIEC
				group by MaNV
				order by count(MaDA) DESC, sum(SoGio) DESC
		--Tìm họ tên, lương và đơn vị của những nhân viên có lương đạt trên mức lương trung bình của tất cả nhân viên, đồng thời cho biết số chênh lệch này.
				select HoTen, luong, MaDV, (Luong - (select AVG(Luong) 
													from NHAN_VIEN))  as chenhLech
				from NHAN_VIEN
				where luong > (select AVG(Luong)
								from NHAN_VIEN)
		--Tìm họ tên và lương của những nhân viên có lương cao hơn lương mọi nhân viên thuộc đơn vị có mã 20.
				select HoTen, Luong
				from NHAN_VIEN
				where Luong > (select Max(Luong)
								from NHAN_VIEN
								where MaDV = 20)
		--Cho biết thông tin về nhân viên có lương cao hơn ít nhất một nhân viên làm ở phòng Kế toán. 
				select MaNV, HoTen
				from NHAN_VIEN
				where Luong > (select Min(Luong)
								from NHAN_VIEN
								where MaDV = (select MaDV
												from DON_VI
												where TenDV = 'Phong Ke Toan'))

