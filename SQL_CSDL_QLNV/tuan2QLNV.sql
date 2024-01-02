use QLNV
--1 Bo sung cot dia chi vào bang NHAN_VIEN và nhap du lieu
alter table NHAN_VIEN
	add DiaChi nvarchar(20)

update NHAN_VIEN 
set DiaChi = 'Pho Co'
where MaNV = '100';
update NHAN_VIEN 
set DiaChi =('Hoan Kiem')
where MaNV = '101';
update NHAN_VIEN 
set DiaChi =('Hai Bà Tr?ng')
where MaNV = '103';
update NHAN_VIEN 
set DiaChi =('Ha Dong')
where MaNV = '105';
update NHAN_VIEN 
set DiaChi =('Nam Tu Liem')
where MaNV = '210';
update NHAN_VIEN 
set DiaChi =('Ha Dong')
where MaNV = '221';
update NHAN_VIEN 
set DiaChi =('Son Tay')
where MaNV = '233';
update NHAN_VIEN 
set DiaChi =('Pho Co')
where MaNV = '310';
update NHAN_VIEN 
set DiaChi =('Dong Anh')
where MaNV = '311';
update NHAN_VIEN 
set DiaChi =('Tay Ho')
where MaNV = '312';
update NHAN_VIEN 
set DiaChi =('Ha Dong')
where MaNV = '315';
update NHAN_VIEN 
set DiaChi =('Ha Dong')
where MaNV = '401';

--2 Tách cot HoTen trong bang NHAN_VIEN thành 2 cot HoDem và Ten voi du lieu chuyen tuong ung vào 2 cot này
alter table NHAN_VIEN add Ten nvarchar(10)
alter table NHAN_VIEN add HoDem nvarchar(20)

update NHAN_VIEN
set Ten = REVERSE(left(reverse(NHAN_VIEN.HoTen),charindex(' ',reverse(NHAN_VIEN.HoTen))))

update NHAN_VIEN
set HoDem = REVERSE(substring(reverse(NHAN_VIEN.HoTen),charindex(' ',reverse(NHAN_VIEN.HoTen),0)+1,100))

select *from NHAN_VIEN

--3 Bo sung các ràng buoc cho các cot trong các luoc do
alter table DON_VI     --Tên don vi trong bang DON_VI là duy nhat.
	add UNIQUE(TenDV)

alter table NHAN_VIEN		--Truong luong trong bang NHAN_VIEN >=0 và nhan giá tri moc tinh là 0.
	add check(Luong >= 0)

alter table NHAN_VIEN 
	add default(0) for Luong

alter table NHAN_VIEN		--Truong MaDV trong bang NHAN_VIEN tham chieu den MaD trong bang DON_VI và cho phép cap nhat và xoá tham chieu t? ??ng.
	add foreign key(MaDV) references DON_VI(MaDV) on delete cascade
	
	--Truong MaNV, MaDA trong b?ng LAM_VIEC lan luott tham chieu den các truong MaNV trong bang NHAN_VIEN và MaDA trong bang DU_AN. Các tham chieu này cho phép cap nhat và xoá t? ??ng
alter table LAM_VIEC
	add foreign key (MaNV) references NHAN_VIEN(MaNV) on delete cascade

alter table LAM_VIEC
	add foreign key (MaDA) references DU_AN(MaDA) on delete cascade

alter table DU_AN  --Truong MaDV trong bang DU_AN tham chieu den cot MaDV trong bang DON_VI.
	add foreign key (MaDV) references DON_VI (MaDV)

--4 Hien thi tat ca thông tin cua bang NHAN_VIEN
Select * from NHAN_VIEN

--5 Hien thi hodem, tên, mă nhân viên, ngày sinh cua tat ca các nhân viên
Select HoDem, Ten, MaNV, NgaySinh
from NHAN_VIEN

--6 Hien thi ho tên (ho dem và tên ghép thành mot cot), mă so nhân viên, tuoi cua các nhân viên
select HoDem + ' ' + Ten as HoTen, MaNV, year(GETDATE()) - year(NgaySinh) as Tuoi
from NHAN_VIEN

--7 Hien thi thông tin cua 5 nhân viên dau tiên trong bang NHAN_VIEN
select Top(5) * from NHAN_VIEN

--8 Hien thi mă nhân viên cua các nhân viên tham gia vào các du án. Neu ket qua có thông tin trùng nhau (m?t nhân viên có th? tham gia nhi?u d? án nên mă nhân viên xu?t hi?n nhi?u l?n) th́ ch? ??a ra m?t giá tr? ??i di?n (lo?i b? trùng l?p)
select distinct MaNV
from LAM_VIEC
group by MaNV

--9 dua ra danh sách các nhân viên có luong lon hon 4 trieu dong
select * from NHAN_VIEN
where Luong > '4000000'

--10 dua ra danh sách các nhân viên có tuoi lon hon 65
select * from NHAN_VIEN
where year(getdate()) - year(NgaySinh) > 65

--11 ??a ra danh sách các nhân viên n? có l??ng t? 3 tri?u tr? lên.
select * from NHAN_VIEN
where Luong > 3000000 and GioiTinh = 'Nu'

--12 dua ra danh sách các nhân viên nu có luong tu 3 trieu trolên,  hoac các nhân viên nam có luong tu 4 trieu tro lên.
select * from NHAN_VIEN
where (Luong > 3000000 and GioiTinh = 'Nu') or (Luong > 4000000 and GioiTinh = 'Nam')

--13 dua ra danh dách các nhân viên làm viec o các pḥong 10,30,40.
select * from NHAN_VIEN
where MaDV = 10 or MaDV = 30 or MaDV = 40

--14 dua ra danh sách các nhân viên có ngày sinh tu 1/1/1980 den 31/12/1990
select * from NHAN_VIEN
where NgaySinh between '1980/1/1' and '1990/12/31'

--15 dua ra danh sách các nhân viên có dia chi o pho co (dia chi có chu Hàng)
SELECT *FROM NHAN_VIEN
WHERE DiaChi LIKE '%Hàng%'
