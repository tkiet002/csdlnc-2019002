﻿USE master
GO
IF EXISTS(SELECT NAME FROM SYSDATABASES WHERE NAME='DB2')
	DROP DATABASE DB2
CREATE DATABASE DB2
go
USE DB2
GO

CREATE TABLE MATHANG(
	MSMH	CHAR(10)		NOT NULL PRIMARY KEY,
	TENMH	NVARCHAR(50)	NULL,
	DONGIA	FLOAT			NULL,
	DVT		NCHAR(10)		NULL,
	
);

CREATE TABLE CT_HOADON(
	MSHD	CHAR(10)	NOT NULL,
	MSMH	CHAR(10)	NOT NULL,
	SOLUONG	INT			NULL,
	CONSTRAINT	PK_CT_HOADON PRIMARY KEY(MSHD ,MSMH)
);

CREATE TABLE KHACHHANG(
	MSKH		CHAR(10)		NOT NULL,
	TENKH		NVARCHAR(50)	NULL,
	DIACHI		NVARCHAR(50)	NULL,
	DIENTHOAI	NVARCHAR(50)	NULL,
	CONSTRAINT PK_KHACHHANG PRIMARY KEY(MSKH)
);

CREATE TABLE HOADON(
	MSHD		CHAR(10)		NOT NULL,
	NGAYHD		DATETIME		NULL,
	MSKH		CHAR(10)		NOT NULL,
	MSNV		CHAR(10)		NOT NULL
	CONSTRAINT PK_HOADON	PRIMARY KEY(MSHD)
);

CREATE TABLE NHANVIEN(
	MSNV		CHAR(10)		NOT NULL,
	TENNV		NVARCHAR(50)	NULL,
	DIACHI		NVARCHAR(50)	NULL,
	CMND		CHAR(15)		NOT NULL,
	DIENTHOAI	CHAR(12)		NULL,
	NGAYSINH	DATETIME		NULL,
	CONSTRAINT PK_NHANVIEN PRIMARY KEY (MSNV)
);


ALTER TABLE HOADON
	ADD	CONSTRAINT FK_HOADON_NHANVIEN	FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV),
		CONSTRAINT FK_HOADON_KHACHHANG	FOREIGN KEY(MSKH)	REFERENCES KHACHHANG(MSKH)

ALTER TABLE CT_HOADON
	ADD	CONSTRAINT FK_CTHOADON_MATHANG FOREIGN KEY (MSMH) REFERENCES MATHANG(MSMH),
		CONSTRAINT FK_CTHOADON_HOADON FOREIGN KEY(MSHD)	REFERENCES HOADON(MSHD)

ALTER TABLE CT_HOADON
		DROP CONSTRAINT FK_CTHOADON_HOADON
ALTER TABLE CT_HOADON
		DROP CONSTRAINT FK_CTHOADON_MATHANG

USE [DB2]
GO
INSERT [dbo].[MATHANG] ([MSMH], [TENMH], [DONGIA], [DVT]) VALUES (N'1         ', N'HDD20', 10, N'Cái       ')
INSERT [dbo].[MATHANG] ([MSMH], [TENMH], [DONGIA], [DVT]) VALUES (N'2         ', N'hdd40', 20, N'Cái       ')
INSERT [dbo].[MATHANG] ([MSMH], [TENMH], [DONGIA], [DVT]) VALUES (N'3         ', N'mbph', 10, N'Cái       ')
INSERT [dbo].[MATHANG] ([MSMH], [TENMH], [DONGIA], [DVT]) VALUES (N'4         ', N'SDD512', 15, N'Cái       ')
INSERT [dbo].[KHACHHANG] ([MSKH], [TENKH], [DIACHI], [DIENTHOAI]) VALUES (N'1         ', N'Nguyễn Văn A', N'16/11 Bùi Thị Xuân F3 Tân Bình', N'0903648211')
INSERT [dbo].[KHACHHANG] ([MSKH], [TENKH], [DIACHI], [DIENTHOAI]) VALUES (N'2         ', N'Nguyễn Văn B', N'16/11 Lạc Long Quân F12 TB', N'0903648154')
INSERT [dbo].[KHACHHANG] ([MSKH], [TENKH], [DIACHI], [DIENTHOAI]) VALUES (N'3         ', N'Nguyễn Văn M', N'16/11 Huỳnh Văn Bánh F3 PN', N'0903648218')
INSERT [dbo].[KHACHHANG] ([MSKH], [TENKH], [DIACHI], [DIENTHOAI]) VALUES (N'4         ', N'Nguyễn Văn C', N'16/11 Bùi Thị Xuân F3 TB', N'0903649812')
INSERT [dbo].[NHANVIEN] ([MSNV], [TENNV], [DIACHI], [CMND], [DIENTHOAI], [NGAYSINH]) VALUES (N'1         ', N'Phạm Văn Thiện', N'16 BTX F3 TB', N'5632987546     ', N'0903648214  ', CAST(N'1985-09-09 00:00:00.000' AS DateTime))
INSERT [dbo].[NHANVIEN] ([MSNV], [TENNV], [DIACHI], [CMND], [DIENTHOAI], [NGAYSINH]) VALUES (N'2         ', N'Nguyễn Đinh Hoàng ', N'16 BTX F3 TB', N'5672917546     ', N'0903648252  ', CAST(N'1980-05-17 00:00:00.000' AS DateTime))
INSERT [dbo].[NHANVIEN] ([MSNV], [TENNV], [DIACHI], [CMND], [DIENTHOAI], [NGAYSINH]) VALUES (N'3         ', N'Nguyễn Trung Kiên', N'16 BTX F3 TB', N'5632981746     ', N'0903649872  ', CAST(N'1979-10-16 00:00:00.000' AS DateTime))
INSERT [dbo].[NHANVIEN] ([MSNV], [TENNV], [DIACHI], [CMND], [DIENTHOAI], [NGAYSINH]) VALUES (N'4         ', N'Nguyễn Thái Hòa ', N'12/65 Thu Duc', N'1832987546     ', N'0903606542  ', CAST(N'1981-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MSHD], [NGAYHD], [MSKH], [MSNV]) VALUES (N'1         ', CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'1         ', N'1         ')
INSERT [dbo].[HOADON] ([MSHD], [NGAYHD], [MSKH], [MSNV]) VALUES (N'2         ', CAST(N'2019-01-02 00:00:00.000' AS DateTime), N'2         ', N'2         ')
INSERT [dbo].[HOADON] ([MSHD], [NGAYHD], [MSKH], [MSNV]) VALUES (N'3         ', CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'1         ', N'2         ')
INSERT [dbo].[HOADON] ([MSHD], [NGAYHD], [MSKH], [MSNV]) VALUES (N'4         ', CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'1         ', N'1         ')
INSERT [dbo].[CT_HOADON] ([MSHD], [MSMH], [SOLUONG]) VALUES (N'1         ', N'1         ', 1)
INSERT [dbo].[CT_HOADON] ([MSHD], [MSMH], [SOLUONG]) VALUES (N'1         ', N'3         ', 2)
INSERT [dbo].[CT_HOADON] ([MSHD], [MSMH], [SOLUONG]) VALUES (N'2         ', N'1         ', 1)
INSERT [dbo].[CT_HOADON] ([MSHD], [MSMH], [SOLUONG]) VALUES (N'2         ', N'2         ', 3)
INSERT [dbo].[CT_HOADON] ([MSHD], [MSMH], [SOLUONG]) VALUES (N'2         ', N'4         ', 1)
INSERT [dbo].[CT_HOADON] ([MSHD], [MSMH], [SOLUONG]) VALUES (N'3         ', N'2         ', 4)
INSERT [dbo].[CT_HOADON] ([MSHD], [MSMH], [SOLUONG]) VALUES (N'4         ', N'1         ', 6)
INSERT [dbo].[CT_HOADON] ([MSHD], [MSMH], [SOLUONG]) VALUES (N'4         ', N'2         ', 15)
INSERT [dbo].[CT_HOADON] ([MSHD], [MSMH], [SOLUONG]) VALUES (N'4         ', N'3         ', 10)

--cau 1.


SELECT * FROM NHANVIEN
SELECT * FROM HOADON
SELECT * FROM CT_HOADON
SELECT * FROM MATHANG
SELECT * FROM KHACHHANG

/*
Thực hành CSDLNC FIT - NTT University

3.5. Đứng tại Server1 (DB1), thực hiện công việc sau trên Server2 (DB2)
Câu 1: Liệt kê các hóa đơn sau ngày 01/01/2019.
*/

/*
Câu 2: Liệt kê các hóa đơn của khách hàng có tên ‘Nguyễn Văn A’.
Câu 3: Liệt kê các chi tiết hóa đơn của khách hàng tên ‘Nguyễn Văn A’ mua mặt hàng ‘HDD20’
Câu 4: Hãy làm các công việc trên Server1(DB1) và so sánh thời gian thực hiện Server2(DB2).
Câu 5: Cập nhật số điện thoại khách hàng có mskh=4 với số điện thoại mới: 0908258003
Câu 6: Cập nhật dây chuyền mskh = 2 và mshd = 2 với mshd mới là 5 trên 2 table HOADON và
CT_HOADON
Câu 7: Tạo Stored Procedure thêm khách hàng mới vào Database DB1 và DB2
Câu 8: Tạo Stored Procedure và Trigger xóa khách hàng trên Database DB1, DB2 theo mskh và
các hóa đơn liên quan đến khách hàng.
Câu 9: Xóa dây chuyền các HOADON có MSHD=5 trên 2 table HOADON và CT_HOADON
*/