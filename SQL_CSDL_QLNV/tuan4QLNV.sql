use QLNV
---tuan 4: Truy van tren nhieu bang

--1 đưa ra mã NV, họ tên, tên đơn vị của các nhân viên
select MaNV, HoTen, TenDV
from NHAN_VIEN as NV, DON_VI as DV
where  NV.MaDV = DV.MaDV 

--2 Đưa ra mã NV, họ tên, ngày sinh và địa chỉ của các nhân viên làm việc cho phòng kỹ thuật
select MaNV, HoTen, NgaySinh, DiaChi
from NHAN_VIEN as NV, DON_VI as DV
where NV.MaDV = DV.MaDV and TenDV = 'Phong Ky Thuat'

--3 Đưa ra mã nhân viên, tên đơn vị của nhân viên có họ tên là 'Nguyễn Văn Tùng'
select MaNV, TenDV
from NHAN_VIEN as NV, DON_VI as DV
where NV.MaDV = DV.MaDV and HoTen = 'Nguyen Van Tung'

--4 Với mọi dự án ở Hà Nội,  đưa ra tên dự án, mã đơn vị quản lí dự án đó và họ tên, địa chỉ của trưởng phòng quản lí dự án đó.
select TenDA, DA.MaDV, HoTen, DiaChi
from NHAN_VIEN as NV, DON_VI as DV, DU_AN as DA
where NV.MaNV = DV.MaTDV and DV.MaDV = DA.MaDV 
	and DiaDiemDA = 'Ha Noi'

--5 Đưa ra tên của nhân viên chưa có người phụ thuộc.
select HoTen, MaNV
from NHAN_VIEN
where MaNV in
			((select MaNV
			from NHAN_VIEN)
			except --loai tru nhung
			(select MaNV
			from PHU_THUOC))

--6 Đưa ra tên của các nhân viên thuộc phòng có mã đơn vị 10  tham gia dự án  “Sản phẩm A” hơn 10  tiếng.
select HoTen
from NHAN_VIEN as NV, DU_AN as DA, LAM_VIEC as LV
where NV.MaNV = LV.MaNV and LV.MaDA = DA.MaDA
	and TenDA = 'San Pham A' and SoGio > 10 and NV.MaDV = 10

--7.Đưa ra tên của các nhân viên có cùng tên với người phụ thuộc của  chính nhân viên đó.
select Ten
from NHAN_VIEN as NV , PHU_THUOC as PT
where REVERSE(left(reverse(PT.Ho_ten),charindex(' ',reverse(PT.Ho_ten)))) = NV.Ten

--8 Đưa ra mã nhân viên, họ tên của các nhân viên được quản lí trực tiếp bởi nhân viên Bùi Nhật Nam
select MaNV, HoTen
from NHAN_VIEN 
where MaDV = 
			(select MaDV 
			from DON_VI
			where MaTDV =
						(select MaNV
						from NHAN_VIEN
						where HoTen = 'Bui Nhat Nam'))
	and HoTen != 'Bui Nhat Nam'

--9 Đưa ra mã dự án, tên dự án chưa có nhân viên tham gia
select MaDA, TenDA
from DU_AN
where MaDA not in (select MaDA
					from LAM_VIEC)

--10 Đưa ra tên các nhân viên chưa tham gia dự án nào.
select HoTen
from NHAN_VIEN
where MaNV in ((select MaNV
				from NHAN_VIEN)
				except
				(select MaNV
				from DU_AN))
		
--11 Đưa ra tên các phòng chưa quản lý dự án nào.
select TenDV
from DON_VI
where MaDV in ((select MaDV
				from DON_VI)
				except
				(select MaDV
				from DU_AN))

--12 Đưa ra tên các dự án mà nhân viên Đặng Lan Anh đã tham gia.
select TenDA
from DU_AN 
where MaDA in (select MaDA 
				from LAM_VIEC
				where MaNV = (select MaNV
							from NHAN_VIEN
							where HoTen = 'Dang Lan Anh'))

--13 Đưa ra tên các nhân viên tham gia dự án ‘Tin học hóa’.
select HoTen
from NHAN_VIEN as NV, DU_AN as DA, LAM_VIEC as LV
where NV.MaNV = LV.MaNV and DA.MaDA = LV.MaDA
	and TenDA = 'Tin Hoc Hoa'

--14 Đưa ra tên các các dự án do phòng Kỹ thuật quản lý.
select TenDA
from DU_AN
where MaDV = (Select MaDV
				from DON_VI
				where TenDV = 'Phong Ky Thuat')

--15 Đưa ra mã nhân viên, họ tên của các nhân viên phòng Kế toán đã tham gia vào dự án sản phẩm A.
select MaNV, HoTen
from NHAN_VIEN
where MaDV = (select MaDV
				from DON_VI
				where TenDV = 'Phong Ky Thuat')
	and MaNV in (select MaNV
					from LAM_VIEC
					where MaDA = (Select MaDA
									from DU_AN
									where TenDA = 'San Pham A'))


--16 Đưa ra họ tên người quản lý của các nhân viên.
select HoTen
from NHAN_VIEN 
where MaNV in (Select MaTDV
				from DON_VI)

--17 Bổ sung cột Địa chỉ cho bảng PHU_THUOC. Đưa ra nhân viên có địa chỉ cùng với địa chỉ của người phụ thuộc. 
alter table PHU_THUOC
	add DiaChi nvarchar(20)

update PHU_THUOC
set DiaChi = 'Pho Co'
where MaNV = 100

update PHU_THUOC
set DiaChi = 'Ha Dong'
where MaNV = 101

update PHU_THUOC
set DiaChi = 'Hoan Kiem'
where MaNV = 103

update PHU_THUOC
set DiaChi = 'Dong Anh'
where MaNV = 210

update PHU_THUOC
set DiaChi = 'Nam Tu Liem'
where MaNV = 310

select * from NHAN_VIEN
where DiaChi in (select DiaChi
				from PHU_THUOC)

--18 Đưa ra tên của các dự án mà nhân viên có tên là Anh tham gia hoặc là trưởng phòng quản lí dự án đó.
select TenDA
from DU_AN
where MaDA in (select MaDA
				from LAM_VIEC
				where MaNV = (select MaNV	
								from NHAN_VIEN
								where Ten = ' Anh'))
	or MaDV = (select MaDV	
				from NHAN_VIEN
				where Ten = ' Anh')

--19 Đưa ra tên của các dự án mà nhân viên có tên là Nam tham gia và là trưởng phòng quản lí dự án đó.
select TenDA
from DU_AN
where MaDA in (select MaDA	
				from LAM_VIEC as LV, DON_VI as DV
				where DV.MaTDV = LV.MaNV and MaTDV in (select MaNV	
														from NHAN_VIEN
														where Ten = ' Nam'))
		and MaDV = (select MaDV
					from NHAN_VIEN
					where Ten = ' Nam')
					
--20 Đưa ra tên của các dự án mà nhân viên có họ là Nguyễn là trưởng phòng quản lí dự án đó nhưng không tham gia.
select TenDA
from DU_AN as DA
where DA.MaDV in (select DV.MaDV
				from DON_VI as DV, NHAN_VIEN as NV
				where DV.MaDV = NV.MaDV 
					and MaTDV in ((select MaTDV
								from DON_VI)
								except
								(select MaNV
								from LAM_VIEC))
						and left(HoTen, charindex(' ', HoTen) - 1) = 'Nguyen')
	
	

