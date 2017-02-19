/* Câu 1
create view V_Khachhang
as 
select KhachHang.MaKH,KhachHang.TenKH,KhachHang.Email,KhachHang.DiaChi,DonHang.MaDH,DonHang.NgayDat
from KhachHang inner join DonHang on KhachHang.MaKH = DonHang.MaKH 
where KhachHanG.DiaChi='Da Nang' AND DonHang.NgayDat < '2015-06-15'


update V_Khachhang set NgayDat ='2015-05-15' where NgayDat ='2014-05-15'

drop view V_Khachhang

*/

/* Câu 2a

create proc Sp_1
(
	@MaSP  varchar(10)
) as
begin
	delete from SanPham where SanPham.MaSP = @MaSP
end

execute  sp_1 'SP001'

drop proc Sp_1
*/

/* Câu 2b 
create proc Sp_2
(
	@MaDH varchar(10),
	@MaSP varchar(10),
	@SoLuong int,
	@Tongtien int
)as

begin
	if(@SoLuong <=0 or @Tongtien <=0)
		begin 
			print N'Số lương và Tổng tiền phải lớn hơn 0'

		end
	if(@MaDH not in (select DonHang.MaDH from DonHang))
		begin 
			print N'Mã đơn hàng phải trùng mới mã đơn hàng trong bảng đơn hàng'

		end
	if(@MaSP not in (select SanPham.MaSP from SanPham))
	begin 
			print N'Mã sản phẩm phải trùng mới mã sản phẩm trong bảng sản phẩm'

		end
	if(@MaDH in (select ChiTietDongHang.MaDH from ChiTietDongHang) AND @MaSP in (select ChiTietDongHang.MaSP from ChiTietDongHang))
		begin
			print N' Mã đơn hàng đả trùng AND Mã sản phầm đả trùng'
		end
	else
		begin
			
			insert into ChiTietDongHang values (@MaDH,@MaSP,@SoLuong,@Tongtien)
			print N'Thêm thành công'
		end
end

execute Sp_2 'DH004','SP002',10,300000

drop proc Sp_2

*/

/* Câu 3

create trigger Trigger_1 
on ChiTietDongHang
for insert
as 
begin
	update SanPham
	set SoLuong=SanPham.SoLuong- inserted.SoLuong
	from SanPham inner join inserted on SanPham.MaSP= inserted.MaSP
end

insert into ChiTietDongHang values('DH004','SP001',10,300)

drop trigger Trigger_1 
*/

/* Câu 5 */

alter proc Sp_SanPham
as
begin
	declare contro cursor
	for select ChiTietDongHang.MaDH,ChiTietDongHang.MaSP  from ChiTietDongHang
	declare @MaDH varchar(50)
	declare @MaSP varchar(50)
	open contro
	fetch next from contro
	into @MaDH, @MaSP
	while @@FETCH_STATUS=0
		begin
			delete from ChiTietDongHang where MaDH= @MaDH AND MaSP=@MaSP
			delete from DonHang where DonHang.MaDH=@MaDH
			delete from SanPham where SanPham.MaSP=@MaSP
			fetch next from contro
			into @MaDH, @MaSP
		end
	close contro
	deallocate contro
end



execute Sp_SanPham