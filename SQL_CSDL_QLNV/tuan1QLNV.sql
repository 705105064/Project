create database QLNV
use QLNV
go

create table DON_VI (
	MaDV		int primary key not null,
	TenDV		nvarchar(30) not null,
	MaTDV		int not null,
	NgayBD		date,
)

create table NHAN_VIEN(
	MaNV		int primary key not null,--khoa chinh
	HoTen		nvarchar(30) not null,
	NgaySinh	date not null,
	GioiTinh	nvarchar(5),
	ChucVu		nvarchar(30) not null,
	Luong		int,
	MaDV		int foreign key references DON_VI (MaDV),--khoa ngoai
)

create table DIA_DIEM_DV (
	MaDV		int not null,
	DiaDiem		nvarchar(30) not null,
	foreign key (MaDV) references DON_VI (MaDV),
	primary key (MaDV, DiaDiem),
)

create table DU_AN (
	MaDA		int primary key not null,
	TenDA		nvarchar(30) not null,
	DiaDiemDA	nvarchar(30) not null,
	MaDV		int foreign key references DON_VI (MaDV),
)

create table LAM_VIEC (
	MaNV		int not null,
	MaDA		int not null,
	SoGio		int not null,
	primary key (MaNV, MaDA),
	foreign key (MaNV) references NHAN_VIEN (MaNV),
	foreign key (MaDA) references DU_AN (MaDA),
)

create table PHU_THUOC (
	MaNV		int not null,
	Ho_ten		nvarchar(30) not null,
	NgaySinh	date null,
	GioiTinh	nvarchar(5) null,
	QuanHe		nvarchar(30) not null,
	foreign key (MaNV) references NHAN_VIEN (MaNV),
	primary key (MaNV, Ho_ten),
)

insert into DON_VI (MaDV, TenDV, MaTDV, NgayBD) 
	values ('10', 'Phong Ky Thuat', '100', '2017/01/01');
insert into DON_VI (MaDV, TenDV, MaTDV, NgayBD) 
	values ('20', 'Phong Ke Toan', '210', '2019/02/01');
insert into DON_VI (MaDV, TenDV, MaTDV, NgayBD) 
	values ('30', 'To Hanh Chinh Tong Hop', '310', '2017/06/01');
insert into DON_VI (MaDV, TenDV, MaTDV, NgayBD) 
	values ('40', 'Phong To Chuc Can Bo', '401', '2018/08/01');


insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV)
	values ('100', 'Nguyen Xuan Son', '1980/12/31', 'Nam', 'Truong Phong', '6500000', '10');
insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV)
	values ('101', 'Tran Dan Thu', '1982/10/10', 'Nu', 'Pho Phong', '7500000', '10');
insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV)
	values ('103', 'Dang Lan Anh', '1970/08/23', 'Nu', 'Nhan vien', '3000000', '10');
insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV)
	values ('105', 'Nguyen Van Tung', '1979/07/12', 'Nam', 'Lai xe', '2000000', '10');
insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV)
	values ('210', 'Nguyen Thu Ha', '1988/11/11', 'Nu', 'To Truong', '3500000', '20');
insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV)
	values ('221', 'Do Huu Ngoc', '1990/02/14', 'Nam', 'Nhan vien', '3000000', '20');
insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV)
	values ('233', 'Nguyen Van Thao', '1991/10/20', 'Nam', 'Nhan vien', '2000000', '20');
insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV)
	values ('310', 'Bui Nhat Nam', '1987/08/01', 'Nam', 'Truong phong', '5000000', '30');
insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV)
	values ('311', 'Ngo Thanh Binh', '1990/09/18', 'Nu', 'Nhan vien', '3500000', '30');
insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV)
	values ('312', 'Nguyen Hong Lan', '1990/03/09', 'Nu', 'Nhan vien', '3000000', '30');
insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV)
	values ('315', 'Phan Ai Ngan', '1995/05/08', 'Nu', 'Nhan vien', '2500000', '30');
insert into NHAN_VIEN (MaNV, HoTen, NgaySinh, GioiTinh, ChucVu, Luong, MaDV)
	values ('401', 'Nguyen Van Dinh', '1992/03/06', 'Nam', 'Truong phong', '5000000', '40');


insert into DIA_DIEM_DV (MaDV, DiaDiem)
	values ('10', '23 Lo Duc');
insert into DIA_DIEM_DV (MaDV, DiaDiem)
	values ('10', '15 Cau Giay');
insert into DIA_DIEM_DV (MaDV, DiaDiem)
	values ('10', '61 Hai Ba Trung');
insert into DIA_DIEM_DV (MaDV, DiaDiem)
	values ('20', '11 Tran Binh Trong');
insert into DIA_DIEM_DV (MaDV, DiaDiem)
	values ('20', '144 Xuan Thuy');
insert into DIA_DIEM_DV (MaDV, DiaDiem)
	values ('30', '221 Ly Thuong Kiet');
insert into DIA_DIEM_DV (MaDV, DiaDiem)
	values ('40', '33 Hang Bai');


insert into DU_AN (MaDA, TenDA, DiaDiemDA, MaDV)
	values ('1', 'San pham A', 'Ha Noi', '10');
insert into DU_AN (MaDA, TenDA, DiaDiemDA, MaDV)
	values ('2', 'San pham B', 'Nam Dinh', '10');
insert into DU_AN (MaDA, TenDA, DiaDiemDA, MaDV)
	values ('3', 'San pham C', 'Nam Dinh', '40');
insert into DU_AN (MaDA, TenDA, DiaDiemDA, MaDV)
	values ('4', 'San Pham D', 'Ha Noi', '30');
insert into DU_AN (MaDA, TenDA, DiaDiemDA, MaDV)
	values ('5', 'Tin hoc hoa', 'Hai Phong', '40');


insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('100', '1', '20');
insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('100', '2', '15');
insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('101', '2', '25');
insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('103', '1', '10')
insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('103', '2', '20');
insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('210', '4', '25');
insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('221', '4', '30');
insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('233', '4', '30');
insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('310', '3', '10');
insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('310', '5', '15');
insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('311', '3', '30');
insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('311', '5', '20');
insert into LAM_VIEC (MaNV, MaDA, SoGio)
	values ('312', '5', '20');


insert into PHU_THUOC (MaNV, Ho_ten, NgaySinh, GioiTinh, QuanHe)
	values ('100', 'Nguyen Hong Ha', '01/12/1999', 'Nu', 'Con gai');
insert into PHU_THUOC (MaNV, Ho_ten, NgaySinh, GioiTinh, QuanHe)
	values ('100', 'Nguyen Huy Binh', '2000/12/12', 'Nam', 'Con trai');
insert into PHU_THUOC (MaNV, Ho_ten, NgaySinh, GioiTinh, QuanHe)
	values ('100', 'Ngo Mai Lan', '1983/08/13', 'Nu', 'Vo');
insert into PHU_THUOC (MaNV, Ho_ten, NgaySinh, GioiTinh, QuanHe)
	values ('101', 'Nguyen Van Thanh', '1979/07/08', 'Nam', 'Chong');
insert into PHU_THUOC (MaNV, Ho_ten, NgaySinh, GioiTinh, QuanHe)
	values ('101', 'Nguyen Thi Hien', '1998/10/10', 'Nu', 'Con gai');
insert into PHU_THUOC (MaNV, Ho_ten, NgaySinh, GioiTinh, QuanHe)
	values ('103', 'Nguyen Van Minh', '1992/05/14', 'Nam', 'Con trai');
insert into PHU_THUOC (MaNV, Ho_ten, NgaySinh, GioiTinh, QuanHe)
	values ('210', 'Nguyen Quang Hai', '2016/10/12', 'Nam', 'Con trai');
insert into PHU_THUOC (MaNV, Ho_ten, NgaySinh, GioiTinh, QuanHe)
	values ('310', 'Bui Minh Hoang', '2007/08/01', 'Nam', 'Con trai');
insert into PHU_THUOC (MaNV, Ho_ten, NgaySinh, GioiTinh, QuanHe)
	values ('310', 'Bui Minh Hong', '2015/08/10', 'Nam', 'Con trai');
