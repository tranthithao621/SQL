

select Nhanvien.MaNV, Nhanvien.HotenNV ,case when Quequan is null then N'Cõi trên xuống'else Quequan end from Nhanvien

select  Nhanvien.MaNV, Nhanvien.HotenNV from Banhang inner join Nhanvien on Banhang.MaNV= Nhanvien.MaNV INNER JOIN Sanpham on Banhang.MaSP = Sanpham.MaSP WHERE (Sanpham.TenSP='OMO' ) 
UNION
(select  Nhanvien.MaNV, Nhanvien.HotenNV from Nhanvien where MaNV not in(select MaNV from Banhang))





