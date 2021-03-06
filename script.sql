USE [NangCao]
GO
/****** Object:  Table [dbo].[DangKyCungCap]    Script Date: 2/20/2017 9:17:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKyCungCap](
	[MaDKCC] [nchar](10) NOT NULL,
	[MaNhaCC] [nchar](10) NULL,
	[MaLoaiDV] [nchar](10) NULL,
	[DongXe] [nchar](10) NULL,
	[MaMP] [nchar](10) NULL,
	[NgayBatDauCungCap] [date] NULL,
	[NgayKetThucCungCap] [date] NULL,
	[SoLuongXeDangKy] [int] NULL,
 CONSTRAINT [PK_DangKyCungCap] PRIMARY KEY CLUSTERED 
(
	[MaDKCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DongXe]    Script Date: 2/20/2017 9:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongXe](
	[DongXe] [nchar](10) NOT NULL,
	[HangXe] [nchar](10) NULL,
	[SoChoNgoi] [int] NULL,
 CONSTRAINT [PK_DongXe] PRIMARY KEY CLUSTERED 
(
	[DongXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiDV]    Script Date: 2/20/2017 9:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDV](
	[MaLoaiDV] [nchar](10) NOT NULL,
	[TenLoaiDV] [nchar](50) NULL,
 CONSTRAINT [PK_LoaiDV] PRIMARY KEY CLUSTERED 
(
	[MaLoaiDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MucPhi]    Script Date: 2/20/2017 9:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MucPhi](
	[MaMP] [nchar](10) NOT NULL,
	[DonGia] [int] NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_MucPhi] PRIMARY KEY CLUSTERED 
(
	[MaMP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 2/20/2017 9:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNhaCC] [nchar](10) NOT NULL,
	[TenNhaCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDT] [nchar](10) NULL,
	[MaSoThue] [int] NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNhaCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[DangKyCungCap] ([MaDKCC], [MaNhaCC], [MaLoaiDV], [DongXe], [MaMP], [NgayBatDauCungCap], [NgayKetThucCungCap], [SoLuongXeDangKy]) VALUES (N'DK002     ', N'NCC001    ', N'DV002     ', N'Hiace     ', N'MP01      ', CAST(0x5D3B0B00 AS Date), CAST(0x11410B00 AS Date), 5)
INSERT [dbo].[DangKyCungCap] ([MaDKCC], [MaNhaCC], [MaLoaiDV], [DongXe], [MaMP], [NgayBatDauCungCap], [NgayKetThucCungCap], [SoLuongXeDangKy]) VALUES (N'DK004     ', N'NCC005    ', N'DV001     ', N'Grand     ', N'MP03      ', CAST(0x1F3C0B00 AS Date), CAST(0x66400B00 AS Date), 8)
INSERT [dbo].[DangKyCungCap] ([MaDKCC], [MaNhaCC], [MaLoaiDV], [DongXe], [MaMP], [NgayBatDauCungCap], [NgayKetThucCungCap], [SoLuongXeDangKy]) VALUES (N'DK005     ', N'NCC002    ', N'DV002     ', N'Vios      ', N'MP01      ', CAST(0xB13A0B00 AS Date), CAST(0x1F3C0B00 AS Date), 1)
INSERT [dbo].[DangKyCungCap] ([MaDKCC], [MaNhaCC], [MaLoaiDV], [DongXe], [MaMP], [NgayBatDauCungCap], [NgayKetThucCungCap], [SoLuongXeDangKy]) VALUES (N'DK006     ', N'NCC003    ', N'DV003     ', N'Hiace     ', N'MP04      ', CAST(0xB13A0B00 AS Date), CAST(0x66400B00 AS Date), 9)
INSERT [dbo].[DongXe] ([DongXe], [HangXe], [SoChoNgoi]) VALUES (N'Forte     ', N'KIA       ', 5)
INSERT [dbo].[DongXe] ([DongXe], [HangXe], [SoChoNgoi]) VALUES (N'Grand     ', N'Huyndai   ', 7)
INSERT [dbo].[DongXe] ([DongXe], [HangXe], [SoChoNgoi]) VALUES (N'Hiace     ', N'Toyota    ', 16)
INSERT [dbo].[DongXe] ([DongXe], [HangXe], [SoChoNgoi]) VALUES (N'Starex    ', N'Huyndai   ', 7)
INSERT [dbo].[DongXe] ([DongXe], [HangXe], [SoChoNgoi]) VALUES (N'Vios      ', N'Toyota    ', 5)
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'DV001     ', N'Dịch vụ taxi                                      ')
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'DV002     ', N'Dịch vụ xe buýt công cộng                         ')
INSERT [dbo].[LoaiDV] ([MaLoaiDV], [TenLoaiDV]) VALUES (N'DV003     ', N'Dịch vụ cho thuê theo hợp đồng                    ')
INSERT [dbo].[MucPhi] ([MaMP], [DonGia], [MoTa]) VALUES (N'MP01      ', 10000, N'Áp dụng từ 1/2015')
INSERT [dbo].[MucPhi] ([MaMP], [DonGia], [MoTa]) VALUES (N'MP02      ', 15000, N'Áp dụng từ 2/2015')
INSERT [dbo].[MucPhi] ([MaMP], [DonGia], [MoTa]) VALUES (N'MP03      ', 20000, N'Áp dụng từ 1/2010')
INSERT [dbo].[MucPhi] ([MaMP], [DonGia], [MoTa]) VALUES (N'MP04      ', 25000, N'Áp dụng từ 2/2011')
INSERT [dbo].[NhaCungCap] ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) VALUES (N'NCC001    ', N'Cty TNHH Toàn Pháp', N'Hai Chau', N'051113354 ', 154224)
INSERT [dbo].[NhaCungCap] ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) VALUES (N'NCC002    ', N'Cty Cổ Phần Đông Du', N'Thanh khue', N'051113355 ', 154200)
INSERT [dbo].[NhaCungCap] ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) VALUES (N'NCC003    ', N'Ông Nguyễn Văn A', N'Hoa Thuan', N'0511133546', 848155)
INSERT [dbo].[NhaCungCap] ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) VALUES (N'NCC004    ', N'Cty Cổ Phần Toàn Cầu Xanh', N'Hai Chau', N'0511133547', 131515)
INSERT [dbo].[NhaCungCap] ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) VALUES (N'NCC005    ', N'Cty TNHH AMA', N'Thanh Khue', N'0511133548', 483374)
INSERT [dbo].[NhaCungCap] ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) VALUES (N'NCC006    ', N'Bà Trần Thị Bích Vân', N'Lien Chieu', N'0511133549', 348832)
ALTER TABLE [dbo].[DangKyCungCap]  WITH CHECK ADD  CONSTRAINT [FK_DangKyCungCap_DongXe] FOREIGN KEY([DongXe])
REFERENCES [dbo].[DongXe] ([DongXe])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DangKyCungCap] CHECK CONSTRAINT [FK_DangKyCungCap_DongXe]
GO
ALTER TABLE [dbo].[DangKyCungCap]  WITH CHECK ADD  CONSTRAINT [FK_DangKyCungCap_LoaiDV] FOREIGN KEY([MaLoaiDV])
REFERENCES [dbo].[LoaiDV] ([MaLoaiDV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DangKyCungCap] CHECK CONSTRAINT [FK_DangKyCungCap_LoaiDV]
GO
ALTER TABLE [dbo].[DangKyCungCap]  WITH CHECK ADD  CONSTRAINT [FK_DangKyCungCap_MucPhi] FOREIGN KEY([MaMP])
REFERENCES [dbo].[MucPhi] ([MaMP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DangKyCungCap] CHECK CONSTRAINT [FK_DangKyCungCap_MucPhi]
GO
ALTER TABLE [dbo].[DangKyCungCap]  WITH CHECK ADD  CONSTRAINT [FK_DangKyCungCap_NhaCungCap] FOREIGN KEY([MaNhaCC])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DangKyCungCap] CHECK CONSTRAINT [FK_DangKyCungCap_NhaCungCap]
GO
