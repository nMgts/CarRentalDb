/****** Scripting replication configuration. Script Date: 02.01.2024 06:13:41 ******/
/****** Please Note: For security reasons, all password parameters were scripted with either NULL or an empty string. ******/

/****** Installing the server as a Distributor. Script Date: 02.01.2024 06:13:41 ******/
use master
exec sp_adddistributor @distributor = N'DESKTOP-I1C60C0\SQL1', @password = N''
GO
exec sp_adddistributiondb @database = N'distribution', @data_folder = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL1\MSSQL\Data', @log_folder = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL1\MSSQL\Data', @log_file_size = 2, @min_distretention = 0, @max_distretention = 72, @history_retention = 48, @deletebatchsize_xact = 5000, @deletebatchsize_cmd = 2000, @security_mode = 1
GO

use [distribution] 
if (not exists (select * from sysobjects where name = 'UIProperties' and type = 'U ')) 
	create table UIProperties(id int) 
if (exists (select * from ::fn_listextendedproperty('SnapshotFolder', 'user', 'dbo', 'table', 'UIProperties', null, null))) 
	EXEC sp_updateextendedproperty N'SnapshotFolder', N'C:\RepData', 'user', dbo, 'table', 'UIProperties' 
else 
	EXEC sp_addextendedproperty N'SnapshotFolder', N'C:\RepData', 'user', dbo, 'table', 'UIProperties'
GO

exec sp_adddistpublisher @publisher = N'DESKTOP-I1C60C0\SQL1', @distribution_db = N'distribution', @security_mode = 1, @working_directory = N'C:\RepData', @trusted = N'false', @thirdparty_flag = 0, @publisher_type = N'MSSQLSERVER'
GO
