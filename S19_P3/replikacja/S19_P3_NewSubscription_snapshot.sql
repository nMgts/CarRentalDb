-----------------BEGIN: Script to be run at Publisher 'DESKTOP-I1C60C0\SQL1'-----------------
use [S19_P3]
exec sp_addsubscription @publication = N'S19_P3_snapshot_repl', @subscriber = N'DESKTOP-I1C60C0\SQL2', @destination_db = N'S19_P3', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'S19_P3_snapshot_repl', @subscriber = N'DESKTOP-I1C60C0\SQL2', @subscriber_db = N'S19_P3', @job_login = N'DESKTOP-I1C60C0\User', @job_password = null, @subscriber_security_mode = 0, @subscriber_login = N'sa', @subscriber_password = null, @frequency_type = 64, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 20240128, @active_end_date = 99991231, @enabled_for_syncmgr = N'False', @dts_package_location = N'Distributor'
GO
-----------------END: Script to be run at Publisher 'DESKTOP-I1C60C0\SQL1'-----------------

