use QLNV
--tuan 7: Bang Tam, Bien Bang, ...

--1.Sử dụng một bảng tạm để lưu thông tin mã nhân viên, họ tên, ngày sinh, lương, 
--và mã đơn vị của các nhân viên.
--Một bảng tạm để lưu thông tin về các phòng ban có địa điểm ở Hà nội.
select MaNV, HoTen, NgaySinh, Luong, MaDV
into #NV1
from NHAN_VIEN


select MaDV
into #Phong_Ban
from DIA_DIEM_DV
where DiaDiem = 'Ha Noi'

--2.Viết tập lệnh thực hiện: chừng nào lương của nhân viên còn nhỏ hơn mức lương của người có lương cao nhất 
--thì tăng lương cho nhân viên thêm 200 000 (thực hiện trên các bảng tạm).
declare @maxLuong int;
set @maxLuong = (select Max(Luong)
				from #NV1)
while  (select min(Luong) from #NV1) < @maxLuong
begin 
	update #NV1
	set Luong = Luong + 20000
	where Luong < @maxLuong
end;

select * from #NV1
select * from NHAN_VIEN
--3.Viết tập lệnh thực hiện: chừng nào trung bình lương của các nhân viên còn nhỏ hơn 5 triệu
--thì tăng thêm 1 triệu cho những nhân viên có lương dưới 6 triệu, 
--cho đến khi lương của người cao nhất lớn hơn 8 triệu thì dừng (thực hiện trên các bảng tạm).
declare @tbLuong int;
set @tbLuong  = (select AVG(Luong)
				from #NV1)
while @tbLuong < 5000000
begin
	update #NV1
	set Luong = Luong + 1000000
	where Luong < 6000000
	if (select max(Luong) from #NV1) > 8000000
		break;
end;

--4.Viết thủ tục không có tham số hiển thị thông tin của những nhân viên làm ở phòng Kỹ thuật gồm: 
--mã nhân viên, họ tên nhân viên, tên dự án mà nhân viên tham gia.
create proc NVPhong
as
select MaNV, HoTen, TenDA
from NHAN_VIEN, DU_AN
where NHAN_VIEN.MaDV = DU_AN.MaDV and NHAN_VIEN.MaDV = (select MaDV 
														from DON_VI 
														where TenDV = 'Phòng Kỹ Thuật')

exec NVPhong

--5. Viết thủ tục hiển thị thông tin: mã nhân viên, họ tên nhân viên, tên dự án 
--mà nhân viên tham gia của những nhân viên thuộc phòng mà tên phòng là tham số truyền vào.

create proc NV1
		@tenPhong nvarchar(20)
as
select MaNV, HoTen, tenDA
from NHAN_VIEN NV, DU_AN DA
where NV.MaDV = DA.MaDV and NV.MaDV = (select MaDV 
										from DON_VI
										where TenDV = @tenPhong)
	and MaNV in (select MaNV
				from LAM_VIEC)
				
exec NV1 'Phong Ky Thuat'


--6.Viết thủ tục trả về lương cao nhất và tên nhân viên có lương cao nhất 
--của phòng với tên phòng được truyền vào qua tham số
create proc MaxLuong
		@TenPhong nvarchar(20)
as
select HoTen, Luong
from NHAN_VIEN
where Luong = (select max(Luong)
				from NHAN_VIEN)
	and MaDV = (select MaDV
				from DON_VI
				where TenDV = @TenPhong)

exec MaxLuong 'Phong Ky Thuat'


