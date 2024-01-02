use QLNV
--tuan 5
--1.	Cho biết tổng số nhân viên của phòng Kỹ thuật.
select count(MaNV)
from NHAN_VIEN as NV, DON_VI as DV
where NV.MaDV = DV.MaDV and TenDV = 'Phong Ky Thuat'

--2.	Cho biết lương lớn nhất, lương nhỏ nhất và trung bình lương của các nhân viên trong phòng Kỹ thuật.
select max(Luong) as Max_Luong,
		min(Luong) as Min_Luong,
		AVG(Luong) as TB_Luong
from NHAN_VIEN as NV, DON_VI as DV
where NV.MaDV = DV.MaDV and TenDV = 'Phong Ky Thuat'

--3.	Cho biết những nhân viên phòng Kỹ thuật có lương lớn hơn lương trung bình của phòng.
select MaNV
from NHAN_VIEN 
where Luong > (Select AVG(Luong) 
				from NHAN_VIEN as NV, DON_VI as DV
				where TenDV = 'Phong Ky Thuat')
	and MaDV = (select MaDV
				from DON_VI
				where TenDV = 'Phong Ky Thuat')
--4.	Cho biết tổng số nhân viên có lương từ 3 triệu trở lên.
select count(MaNV)
from NHAN_VIEN
where Luong >= 3000000

--5.	Với mỗi phòng, cho biết mã đơn vị, tổng số nhân viên và trung bình lương
select MaDV, count(MaNV) as TongNV, AVG(Luong) as TB_Luong
from NHAN_VIEN 
group by MaDV

--6.	Đưa ra danh sách các nhân viên có lương lớn hơn trung bình lương của phòng họ.
select MaNV
from NHAN_VIEN
where Luong > (select AVG(NV.Luong)
				from NHAN_VIEN as NV
				where NV.MaDV = NHAN_VIEN.MaDV 
				group by NV.MaDV)

--7. Cho biết các nhân viên có lương lớn nhất trong công ty.
select MaNV
from NHAN_VIEN
where Luong = (select Max(Luong)
				from NHAN_VIEN)

--8.	 Cho biết mã dự án, tên dự án của các dự án nhiều nhân viên tham gia nhất.
select MaDA, TenDA
from DU_AN
where MaDA in (select MaDA
				from LAM_VIEC 
				group by MaDA
				having count(MaNV) >= all (select count(MaNV)
											from LAM_VIEC 
											group by MaDA))
			
--9 Cho biết mã dự án, tên dự án có tổng số giờ công lớn nhất.
select LV.MaDA, DA.TenDA, sum(LV.SoGio) as TongSoGio
from LAM_VIEC as LV, DU_AN as DA
where LV.MaDA = DA.MaDA
group by LV.MaDA, DA.TenDA
having sum(LV.SoGio) >=  ALL(select sum(SoGio)
							from LAM_VIEC
							group by MaDA)

--10 Cho biết nhân viên nào có nhiều người phụ thuộc nhất.
select MaNV
from PHU_THUOC
group by MaNV
having count(MaNV) >= all (select count(MaNV)
							from PHU_THUOC 
							group by MaNV)

--11.	Cho biết tên phòng có bình quân thu nhập thấp nhất.
select TenDV
from DON_VI as DV, NHAN_VIEN as NV
where DV.MaDV = NV.MaDV
group by DV.TenDV
having avg(NV.Luong) <= all (select avg(NV2.Luong)
							from NHAN_VIEN as NV2
							group by NV2.MaDV)

--12.	Cho biết tên của tất cả các đơn vị có lương trung bình cao nhất.
select DV.TenDV
from DON_VI as DV, NHAN_VIEN as NV1
where DV.MaDV = NV1.MaDV
group by DV.TenDV
having AVG(NV1.Luong) >= ALL (select avg(nv2.Luong)
								from NHAN_VIEN as NV2
								group by MaDV)
											

select * from NHAN_VIEN
--13.	Cho biết mỗi phòng quản lý bao nhiêu dự án, sắp xếp danh sách theo số dự án tăng dần
select MaDV, count(MaDA) as So_DA
from DU_AN 
group by MaDV
order by count(MaDA) ASC

--14.	Với mỗi dự án, cho biết mã dự án, tên dự án, tổng số nhân viên tham gia dự án và tổng số giờ công.
select LV.MaDA, TenDA, count(MaNV) as TongSoNV, sum(SoGio) as TongSoGio
from DU_AN DA, LAM_VIEC LV
where DA.MaDA = LV.MaDA
group by LV.MaDA, DA.TenDA

--15.Với mỗi dự án có hơn hai nhân viên tham gia, cho biết mã dự án, tên dự án và số nhân viên viên tham gia dự án.
select LV.MaDA, TenDA, count(MaNV) as SoNV
from DU_AN DA, LAM_VIEC LV
where DA.MaDA = LV.MaDA
group by LV.MaDA, TenDA
having count(MaNV) > 2

--16. Cho biết tên đơn vị, tổng số nhân viên của phòng có trung bình lương của nhân viên lớn hơn 3 triệu
select TenDV
from DON_VI 
where MaDV in (select MaDV
				from NHAN_VIEN
				group by MaDV
				having avg(Luong) > 3000000)

--17 Với mỗi nhân viên, cho biết mã số nhân viên, họ tên và tổng số người phụ thuộc của nhân viên đó.
select PT.MaNV, HoTen, count(PT.MaNV) as So_Nguoi_PT
from PHU_THUOC PT, NHAN_VIEN NV
where PT.MaNV = NV.MaNV
group by PT.MaNV, HoTen

--18 Cho biết mỗi nhân viên tham gia bao nhiêu dự án và tổng số giờ làm. Sắp xếp danh sách này theo số dự án giảm dần, nếu số dự án trùng nhau thì sắp xếp theo tổng số giờ làm giảm dần.
select LV.MaNV, count(MaDA) as SoDA, sum(SoGio) as TongSoGio
from LAM_VIEC as LV
group by LV.MaNV
order by count(MaDA) DESC, sum(SoGio) ASC

--19.Tìm họ tên, lương và đơn vị của những nhân viên có lương đạt trên mức lương trung bình của tất cả nhân viên, đồng thời cho biết số chênh lệch này.
select MaNV, HoTen, Luong, MaDV, (Luong - (select avg(Luong) from NHAN_VIEN)) as ChenhLech
from NHAN_VIEN
where Luong > (select avg(Luong)
				from NHAN_VIEN)

--20 Tìm họ tên và lương của những nhân viên có lương cao hơn lương mọi nhân viên thuộc đơn vị có mã 20.
select HoTen, Luong, MaDV
from NHAN_VIEN
where Luong > (select max(Luong)
				from NHAN_VIEN
				where MaDV = 20)
	and MaDV != 20

--21.Cho biết thông tin về nhân viên có lương cao hơn ít nhất một nhân viên làm ở phòng Kế toán.
select * from NHAN_VIEN 
where Luong > (select min(Luong)
				from NHAN_VIEN NV, DON_VI DV
				where NV.MaDV = DV.MaDV and TenDV = 'Phong Ke Toan')
	and MaDV != (select MaDV	
				from DON_VI
				where TenDV = 'Phong Ke Toan')

