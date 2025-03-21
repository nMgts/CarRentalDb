use [S19_P3]
exec sp_replicationdboption @dbname = N'S19_P3', @optname = N'publish', @value = N'true'
GO
-- Adding the snapshot publication
use [S19_P3]
exec sp_addpublication @publication = N'S19_P3_snapshot_repl', @description = N'Snapshot publication of database ''S19_P3'' from Publisher ''DESKTOP-I1C60C0\SQL1''.', @sync_method = N'native', @retention = 0, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'snapshot', @status = N'active', @independent_agent = N'true', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1
GO


exec sp_addpublication_snapshot @publication = N'S19_P3_snapshot_repl', @frequency_type = 8, @frequency_interval = 126, @frequency_relative_interval = 1, @frequency_recurrence_factor = 1, @frequency_subday = 1, @frequency_subday_interval = 1, @active_start_time_of_day = 60000, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = N'DESKTOP-I1C60C0\User', @job_password = null, @publisher_security_mode = 0, @publisher_login = N'sa', @publisher_password = N''


use [S19_P3]
exec sp_addarticle @publication = N'S19_P3_snapshot_repl', @article = N'Kategoria', @source_owner = N'dbo', @source_object = N'Kategoria', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509D, @identityrangemanagementoption = N'manual', @destination_table = N'Kategoria', @destination_owner = N'dbo', @vertical_partition = N'false'
GO




use [S19_P3]
exec sp_addarticle @publication = N'S19_P3_snapshot_repl', @article = N'Marka', @source_owner = N'dbo', @source_object = N'Marka', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509D, @identityrangemanagementoption = N'manual', @destination_table = N'Marka', @destination_owner = N'dbo', @vertical_partition = N'false'
GO




use [S19_P3]
exec sp_addarticle @publication = N'S19_P3_snapshot_repl', @article = N'Model', @source_owner = N'dbo', @source_object = N'Model', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509D, @identityrangemanagementoption = N'manual', @destination_table = N'Model', @destination_owner = N'dbo', @vertical_partition = N'false'
GO




use [S19_P3]
exec sp_addarticle @publication = N'S19_P3_snapshot_repl', @article = N'Platnosc', @source_owner = N'dbo', @source_object = N'Platnosc', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509D, @identityrangemanagementoption = N'manual', @destination_table = N'Platnosc', @destination_owner = N'dbo', @vertical_partition = N'false'
GO




use [S19_P3]
exec sp_addarticle @publication = N'S19_P3_snapshot_repl', @article = N'Samochod', @source_owner = N'dbo', @source_object = N'Samochod', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509D, @identityrangemanagementoption = N'manual', @destination_table = N'Samochod', @destination_owner = N'dbo', @vertical_partition = N'true'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'S19_P3_snapshot_repl', @article = N'Samochod', @column = N'IdSamochod', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'S19_P3_snapshot_repl', @article = N'Samochod', @column = N'Kategoria', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'S19_P3_snapshot_repl', @article = N'Samochod', @column = N'Model', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'S19_P3_snapshot_repl', @article = N'Samochod', @column = N'IloscDrzwi', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'S19_P3_snapshot_repl', @article = N'Samochod', @column = N'Rocznik', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'S19_P3_snapshot_repl', @article = N'Samochod', @column = N'TypSilnika', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'S19_P3_snapshot_repl', @article = N'Samochod', @column = N'InformacjeDodatkowe', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'S19_P3_snapshot_repl', @article = N'Samochod', @column = N'Aktywny', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'S19_P3_snapshot_repl', @article = N'Samochod', @view_name = N'SYNC_Samochod_1__82', @filter_clause = null, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO




use [S19_P3]
exec sp_addarticle @publication = N'S19_P3_snapshot_repl', @article = N'Ubezpieczenie', @source_owner = N'dbo', @source_object = N'Ubezpieczenie', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509D, @identityrangemanagementoption = N'manual', @destination_table = N'Ubezpieczenie', @destination_owner = N'dbo', @vertical_partition = N'false'
GO




use [S19_P3]
exec sp_addarticle @publication = N'S19_P3_snapshot_repl', @article = N'Uprawnienia', @source_owner = N'dbo', @source_object = N'Uprawnienia', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509D, @identityrangemanagementoption = N'manual', @destination_table = N'Uprawnienia', @destination_owner = N'dbo', @vertical_partition = N'false'
GO




use [S19_P3]
exec sp_addarticle @publication = N'S19_P3_snapshot_repl', @article = N'Usluga', @source_owner = N'dbo', @source_object = N'Usluga', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509D, @identityrangemanagementoption = N'manual', @destination_table = N'Usluga', @destination_owner = N'dbo', @vertical_partition = N'true'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'S19_P3_snapshot_repl', @article = N'Usluga', @column = N'IdUsluga', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'S19_P3_snapshot_repl', @article = N'Usluga', @column = N'Nazwa', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'S19_P3_snapshot_repl', @article = N'Usluga', @column = N'Cena', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'S19_P3_snapshot_repl', @article = N'Usluga', @column = N'Opis', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'S19_P3_snapshot_repl', @article = N'Usluga', @view_name = N'SYNC_Usluga_1__82', @filter_clause = null, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO




