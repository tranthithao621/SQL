﻿/* Câu 1 */
create view V_NhaCungCap
as 
select NhaCungCap.MaNhaCC,NhaCungCap.TenNhaCC,NhaCungCap.DiaChi,NhaCungCap.SoDT, NhaCungCap.MaSoThue
from NhaCungCap INNER JOIN DangKyCungCap ON NhaCungCap.MaNhaCC = DangKyCungCap.MaNhaCC
where Diachi ='Lien Chieu' AND NgayBatDauCungCap >'2015-11-20'

drop view V_NhaCungCap

update V_NhaCungCap set Diachi ='Thanh khue' where DiaChi='Lien Chieu'
/**/

/* Câu 2 */
create proc sp_1
(	
	@TenDongXe nchar(10)
)
as
begin
	delete DongXe where DongXe.DongXe=@TenDongXe
end

drop proc sp_1

execute sp_1 'Escape'    

/**/

/* Câu 2b */
create proc sp_2
(	
	@MaDCKK nchar(10),
	@MaNhaCC nchar(10),
	@MaLoaiDV nchar(10),
	@DongXe nchar(10),
	@MaMP nchar(10),
	@NgayBatDauCungCap date,
	@NgayKetThucCungCap date,
	@SoLuongChoNgoi int
)as
begin
	if( @MaDCKK in (select DangKyCungCap.MaDKCC from DangKyCungCap ) )
		print N'Mã nhà cung đả tồn tại'

	else if(@MaNhaCC not in (select NhaCungCap.MaNhaCC from NhaCungCap))
		print N'Mã nhà cung cấp không tồn tại'

	else if(@MaLoaiDV not in (select LoaiDV.MaLoaiDV from LoaiDV))
		print N'Mã loại dịch vụ không tồn tại'
	else if(@DongXe not in (select DongXe from DongXe))
		print N'Mã dòng xe không tồn tại'
	else if(@MaMP not in (select MaMP from MucPhi))
		print N'Mã mức phí không tồn tại'
	else if(@SoLuongChoNgoi <=0)
		print N'Số chổ ngồi phải lớn hơn 0'
	else
		begin
			insert into DangKyCungCap values (@MaDCKK,@MaNhaCC,@MaLoaiDV,@DongXe,@MaMP,@NgayBatDauCungCap,@NgayBatDauCungCap,@SoLuongChoNgoi)
			print N'Thêm thành công'
		end
end

drop proc sp_2

execute sp_2 'DK002','NCC001','DV002','Hiace','MP01','05-10-2016','05-10-2017',05
/**/

/* Câu 3 */

create Trigger Trigger_1
on DangKyCungCap
for delete
as
begin
	declare @MaDKCC nchar(10)
	declare @So int
	select @MaDKCC =MaDKCC from inserted
	print @MaDKCC
	if(@MaDKCC not in (select DangKyCungCap.MaDKCC from DangKyCungCap))
		begin
			print N'Mã đăng kí không hợp lê'
			rollback transaction
		end
	else
		begin
			select @So=COUNT(MaDKCC) from DangKyCungCap
			print @So
		end
		
end

delete from DangKyCungCap where MaDKCC ='DK009'

drop Trigger Trigger_1

/**/

/* Câu 3b*/


create Trigger Trigger_2
on DangKyCungCap
for update
as 
begin
	declare @NgayKetThucCungCap date
	declare @MaDKCC nchar(10)
	select @NgayKetThucCungCap = NgayKetThucCungCap from inserted
	select @MaDKCC = MaDKCC from inserted
	if(year(@NgayKetThucCungCap)-4 > (select YEAR(NgayBatDauCungCap) from DangKyCungCap where MaDKCC=@MaDKCC))
		begin
			print N'Ngày kết thúc cung cấp phải nhỏ hơn 4 năm so với ngày bắt đầu đăng kí '
			rollback transaction
		end
	else if(year(@NgayKetThucCungCap)-4 = (select YEAR(NgayBatDauCungCap) from DangKyCungCap where MaDKCC=@MaDKCC))
		begin
			if(MONTH(@NgayKetThucCungCap) > (select MONTH(NgayBatDauCungCap) from DangKyCungCap where MaDKCC=@MaDKCC))
				begin
					print N'Ngày kết thúc cung cấp phải nhỏ hơn 4 năm so với ngày bắt đầu đăng kí '
					rollback transaction
				end
			else if(MONTH(@NgayKetThucCungCap) = (select MONTH(NgayBatDauCungCap) from DangKyCungCap where MaDKCC=@MaDKCC))
				begin
					if(DAY(@NgayKetThucCungCap) > (select DAY(NgayBatDauCungCap) from DangKyCungCap where MaDKCC=@MaDKCC))
						begin
							print N'Ngày kết thúc cung cấp phải nhỏ hơn 4 năm so với ngày bắt đầu đăng kí '
							rollback transaction
						end
					
				end	
		end
end	

update DangKyCungCap SET NgayKetThucCungCap ='2020-05-09' WHERE MaDKCC='DK002'

drop Trigger Trigger_2
/**/

/* Câu 4a *
create function func1()
returns int
begin 
	declare @Tong int
	select @Tong = COUNT (DangKyCungCap.DongXe) 
	FROM DangKyCungCap INNER JOIN MucPhi ON DangKyCungCap.MaMP = MucPhi.MaMP
	WHERE MucPhi.DonGia=10000
	return @Tong
end


drop function func1
**/


/* Câu 4b */
create function func2(@MaNCC nchar(10))
returns int
begin
	declare @NgayBatDauDangKy date
	declare @NgayKetThucCungCap date
	declare @Ngay int
	select @Ngay = DATEDIFF(day, NgayBatDauCungCap,NgayKetThucCungCap) from DangKyCungCap where MaNhaCC='NCC002'
	print @Ngay
end

/* Câu 5 */
create proc Sp_Xe
as
begin
	declare contro cursor
	for select DongXe from DangKyCungCap where MaLoaiDV in( select MaLoaiDV from LoaiDV 
	where TenLoaiDV=N'Dịch vụ cho thuê theo hợp đồng') AND YEAR(NgayBatDauCungCap)>=2015 AND YEAR(NgayBatDauCungCap)<2016
	open contro
	declare @DongXe nchar(10)
	begin try
	begin transaction del
	fetch next from contro
	into @DongXe
	while @@FETCH_STATUS=0
		begin
			delete DangKyCungCap where DangKyCungCap.DongXe=@DongXe AND MaLoaiDV in( select MaLoaiDV from LoaiDV 
			where TenLoaiDV=N'Dịch vụ cho thuê theo hợp đồng') AND YEAR(NgayBatDauCungCap)>=2015 AND YEAR(NgayBatDauCungCap)<2016
			delete DongXe where DongXe=@DongXe
			fetch next from contro
			into @DongXe
		end
		commit tran del
	end try
	begin catch
		rollback tran del
	end catch
	close contro
	deallocate contro
end


DROP PROC Sp_Xe

execute Sp_Xe