---------------------------------------------------------------------------------------------------
-- SRBD_C3: Transakcje i wsp�bie�no��.
---------------------------------------------------------------------------------------------------
-- Skrypt testowania mechanizm�w wsp�bie�no�ci proces�w.
---------------------------------------------------------------------------------------------------

CREATE OR ALTER VIEW dbo.v_lock_info
AS
SELECT	request_session_id AS [request_sess_id],		-- identyfikator sesji procesu, kt�ry zg�osi� ��danie blokady
		resource_database_id AS [res_db_id],			-- identyfikator bazy danych
		SUBSTRING(DB.[name], 1, 20) AS [res_db_name],	-- nazwa bazy danych
		SUBSTRING(resource_type, 1, 10) AS [res_type],	-- rodzaj blokowanego zasobu
		ISNULL(CONVERT(varchar(12), OBJ.[object_id]), '') AS [object_id], -- identyfikator obiektu obj�tego blokad�
		SUBSTRING(ISNULL(OBJ.[name], ''), 1, 20) AS [object_name],	-- nazwa obiektu lub typ blokowanego obiektu
		SUBSTRING(resource_description, 1, 20) AS [res_description],-- opis blokowanego zasobu
		SUBSTRING(request_mode, 1, 5) AS [request_mode],			-- ��dany tryb blokady
		SUBSTRING(request_status, 1, 5) AS [request_status],		-- status obs�ugi ��dania
		SUBSTRING(request_owner_type, 1, 30) AS [request_owner_type]-- typ procesu, kt�ry zg�osi� ��danie blokady

FROM sys.dm_tran_locks AS LOCK
	INNER JOIN sys.sysdatabases AS DB
	ON LOCK.resource_database_id = DB.[dbid]
		LEFT OUTER JOIN sys.objects AS OBJ
		ON LOCK.resource_associated_entity_id = OBJ.[object_id]
WHERE (OBJ.[name] IS NULL) -- pomini�cie blokad obiekt�w systemowych oraz bie��cego widoku
	  OR ((OBJ.[name] NOT LIKE 'sys%') AND (OBJ.[name] NOT LIKE 'v_lock_info%')); 
GO

---------------------------------------------------------------------------------------------------
-- (Zad.8a1) Stan blokad zasob�w przed uruchomieniem transakcji.
---------------------------------------------------------------------------------------------------

SELECT *
FROM dbo.v_lock_info
ORDER BY request_sess_id ASC, res_type ASC;
GO

/*
request_sess_id res_db_id   res_db_name          res_type   object_id    object_name          res_description      request_mode request_status request_owner_type
--------------- ----------- -------------------- ---------- ------------ -------------------- -------------------- ------------ -------------- ------------------------------
51              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
54              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
60              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE

(4 rows affected)
*/


/*
request_sess_id - Numer sesji lub procesu, kt�ry uzyska� dost�p.
res_db_id: Identyfikator bazy danych, do kt�rej odnosi si� blokada (17).
res_db_name: Nazwa bazy danych (S19_P2).
res_type: Rodzaj zasobu, w tym przypadku baza danych (DATABASE).
object_id, object_name: Identyfikator i nazw� obiektu na kt�ry na�o�ona jest blokada, w tym przypadku 
wskazuj� NULL, poniewa� blokada jest na poziomie bazy danych, a nie konkretnego obiektu.
res_description - Opis zasobu.
request_mode: Rodzaj blokady, tutaj S oznacza blokad� wsp�dzielon� (Shared).
request_status: Status blokady, w tym przypadku blokada zosta�a przyznana (GRANT).
request_owner_type: Typ w�a�ciciela blokady, w tym przypadku wsp�lna przestrze� robocza transakcji (SHARED_TRANSACTION_WORKSPACE).

Te blokady s� typowe w przypadku r�wnoczesnego dost�pu do wsp�lnego obszaru transakcji w celu utrzymania integralno�ci transakcyjnej
w systemie bazodanowym. Blokady wsp�dzielone s� zwykle stosowane, gdy kilka sesji czyta dane jednocze�nie, a nie ma konieczno�ci
blokowania innych sesji do odczytu. Blokady zapisu s� u�ywane, gdy sesja zmienia dane, co mo�e prowadzi� do konflikt�w, gdy kilka
sesji pr�buje je modyfikowa� jednocze�nie.
*/

SELECT *
FROM sys.tables;
GO

/*
name                                                                                                                             object_id   principal_id schema_id   parent_object_id type type_desc                                                    create_date             modify_date             is_ms_shipped is_published is_schema_published lob_data_space_id filestream_data_space_id max_column_id_used lock_on_bulk_load uses_ansi_nulls is_replicated has_replication_filter is_merge_published is_sync_tran_subscribed has_unchecked_assembly_data text_in_row_limit large_value_types_out_of_row is_tracked_by_cdc lock_escalation lock_escalation_desc                                         is_filetable is_memory_optimized durability durability_desc                                              temporal_type temporal_type_desc                                           history_table_id is_remote_data_archive_enabled is_external history_retention_period history_retention_period_unit history_retention_period_unit_desc is_node is_edge data_retention_period data_retention_period_unit data_retention_period_unit_desc ledger_type ledger_type_desc                                             ledger_view_id is_dropped_ledger_table
-------------------------------------------------------------------------------------------------------------------------------- ----------- ------------ ----------- ---------------- ---- ------------------------------------------------------------ ----------------------- ----------------------- ------------- ------------ ------------------- ----------------- ------------------------ ------------------ ----------------- --------------- ------------- ---------------------- ------------------ ----------------------- --------------------------- ----------------- ---------------------------- ----------------- --------------- ------------------------------------------------------------ ------------ ------------------- ---------- ------------------------------------------------------------ ------------- ------------------------------------------------------------ ---------------- ------------------------------ ----------- ------------------------ ----------------------------- ---------------------------------- ------- ------- --------------------- -------------------------- ------------------------------- ----------- ------------------------------------------------------------ -------------- -----------------------
Pracownik_Kopia                                                                                                                  610101214   NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:39:44.323 2023-11-11 04:50:50.290 0             0            0                   0                 NULL                     7                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Kategoria_CenaHistoria                                                                                                           658101385   NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:39:44.330 2023-11-11 04:39:44.330 0             0            0                   0                 NULL                     5                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Klient                                                                                                                           901578250   NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.907 2023-11-11 06:57:39.810 0             0            0                   0                 NULL                     15                 0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Pracownik                                                                                                                        917578307   NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.913 2023-11-11 04:38:46.103 0             0            0                   0                 NULL                     6                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Wypozyczenie                                                                                                                     933578364   NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.917 2023-11-12 00:05:39.357 0             0            0                   0                 NULL                     13                 0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Uprawnienia                                                                                                                      949578421   NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.920 2023-11-11 04:38:46.107 0             0            0                   0                 NULL                     2                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
KlientUprawnienia                                                                                                                965578478   NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.920 2023-11-11 04:38:46.013 0             0            0                   0                 NULL                     3                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Ubezpieczenie                                                                                                                    981578535   NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.923 2023-11-11 04:38:46.123 0             0            0                   0                 NULL                     4                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Platnosc                                                                                                                         997578592   NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.927 2023-11-11 04:38:46.110 0             0            0                   0                 NULL                     1                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Samochod                                                                                                                         1013578649  NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.930 2023-11-11 04:38:46.137 0             0            0                   0                 NULL                     8                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Usluga                                                                                                                           1029578706  NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.937 2023-11-11 05:01:03.420 0             0            0                   0                 NULL                     5                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
WypozyczenieUsluga                                                                                                               1045578763  NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.940 2023-11-11 04:38:46.017 0             0            0                   0                 NULL                     4                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Kategoria                                                                                                                        1061578820  NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.943 2023-11-11 04:38:46.113 0             0            0                   0                 NULL                     3                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Model                                                                                                                            1077578877  NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.947 2023-11-11 04:38:46.120 0             0            0                   0                 NULL                     2                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Marka                                                                                                                            1093578934  NULL         1           0                U    USER_TABLE                                                   2023-11-11 04:38:45.950 2023-11-11 04:38:46.117 0             0            0                   0                 NULL                     1                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
Klient_Kopia                                                                                                                     1234103437  NULL         1           0                U    USER_TABLE                                                   2023-11-11 23:31:00.750 2023-11-11 23:31:00.750 0             0            0                   1                 NULL                     3                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0
sysdiagrams                                                                                                                      1330103779  NULL         1           0                U    USER_TABLE                                                   2023-11-12 03:33:16.870 2023-11-12 03:33:16.870 0             0            0                   1                 NULL                     5                  0                 1               0             0                      0                  0                       0                           0                 0                            0                 0               TABLE                                                        0            0                   0          SCHEMA_AND_DATA                                              0             NON_TEMPORAL_TABLE                                           NULL             0                              0           NULL                     NULL                          NULL                               0       0       -1                    -1                         INFINITE                        0           NON_LEDGER_TABLE                                             NULL           0

(17 rows affected)
*/

---------------------------------------------------------------------------------------------------
-- (Zad.8a2) Stan blokad podczas uruchomienia transakcji - z poziomu innego procesu.
---------------------------------------------------------------------------------------------------

SELECT *
FROM dbo.v_lock_info
ORDER BY request_sess_id ASC, res_type ASC;
GO

/*
request_sess_id res_db_id   res_db_name          res_type   object_id    object_name          res_description      request_mode request_status request_owner_type
--------------- ----------- -------------------- ---------- ------------ -------------------- -------------------- ------------ -------------- ------------------------------
51              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
51              17          S19_P2               KEY                                          (11ea04af99f6)       X            GRANT          TRANSACTION
51              17          S19_P2               OBJECT     610101214    Pracownik_Kopia                           IX           GRANT          TRANSACTION
51              17          S19_P2               PAGE                                         1:792                IX           GRANT          TRANSACTION
54              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
60              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               KEY                                          (29cf3326f583)       X            GRANT          TRANSACTION
66              17          S19_P2               OBJECT     610101214    Pracownik_Kopia                           IX           GRANT          TRANSACTION
66              17          S19_P2               PAGE                                         1:792                IX           GRANT          TRANSACTION

(10 rows affected)
*/


/*
Sesja o identyfikatorze 51 uzyska�a ekskluzywn� blokad� klucza (Exclusive Lock) na kluczu o warto�ci (fa7126f111a4). 
Blokada ekskluzywna oznacza, �e �adna inna sesja nie mo�e r�wnocze�nie uzyska� blokady na tym kluczu. W tym przypadku, 
blokada ta mo�e dotyczy� transakcji, co oznacza, �e �adna inna sesja nie b�dzie mog�a modyfikowa� lub uzyskiwa� dost�pu 
do tego konkretnego klucza, dop�ki sesja 51 nie zako�czy swojej transakcji.

Podobnie, sesja 51 uzyska�a tak�e blokad� intencji ekskluzywnej na obiekcie o identyfikatorze 1061578820 (Kategoria) 
oraz blokad� intencji ekskluzywnej na stronie o identyfikatorze 1:600. Blokada intencji ekskluzywnej sugeruje, �e sesja 
ma zamiar uzyska� blokady ekskluzywne na ni�szych poziomach obiektu (obiekt Kategoria) i strony w ramach tej samej transakcji.

Sesja 66 uzyska�a takie same blokady (jedynie inny klucz), przez co transakcja wykonywana w sesji 66 musia�a poczeka� na
wykonanie transakcji w sesji 51.

W skr�cie, blokady ekskluzywne uniemo�liwiaj� innym sesjom r�wnoczesny dost�p do zasobu, chroni�c go przed r�wnoczesnymi 
modyfikacjami i zapewniaj�c sp�jno�� danych.
*/

---------------------------------------------------------------------------------------------------
-- (Zad.8a3) Stan blokad po wykonaniu transakcji - z poziomu innego procesu.
---------------------------------------------------------------------------------------------------

SELECT *
FROM dbo.v_lock_info
ORDER BY request_sess_id ASC, res_type ASC;
GO

/*
request_sess_id res_db_id   res_db_name          res_type   object_id    object_name          res_description      request_mode request_status request_owner_type
--------------- ----------- -------------------- ---------- ------------ -------------------- -------------------- ------------ -------------- ------------------------------
51              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
54              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
60              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
*/


/*
Po wykonaniu transakcji stan blokad wr�ci� do poprzedniej formy.
*/

---------------------------------------------------------------------------------------------------
-- (Zad.8b) Monitorowanie stanu blokad za pomoc� funkcji Activity Monitor.
---------------------------------------------------------------------------------------------------

-- Zrzut ekranu "ActivityMonitor.jpg" znajduje si� w folderze "testy_wspolbieznosc".

/*
TASK STATE: SUSPEND wskazuje, �e zadanie (task) jest zawieszone lub wstrzymane. 
COMMAND: WAITFOR oznacza, �e jest to komenda WAITFOR.

Komenda WAITFOR jest u�ywana do zatrzymania bie��cego zadania (w�tku) przez okre�lony
okres czasu lub do momentu spe�nienia okre�lonego warunku. 
*/

---------------------------------------------------------------------------------------------------
-- (Zad.8c) Monitorowanie stanu blokad za pomoc� funkcji raport�w.
---------------------------------------------------------------------------------------------------

-- Plik "raport.pdf" znajduje si� w folderze "testy_wspolbieznosc".

/*
Za pomoc� funkcji raport�w mo�emy odczyta�, informacje tj. ID, nazwa hosta, czas zalogowania 
sesji w kt�rej wykonywana jest transakcja. ID i nazw� transakcji oraz liczb� za�o�onych blokad.
Widzimy tak�e, �e typ transakcji to "Full Transaction" oraz poziom izolacji to "Read Commited".

Transaction Type: Full Transaction:
- Oznacza, �e transakcja jest pe�n� transakcj�, co oznacza, �e obejmuje jedno lub wi�cej zapyta� SQL,
a baza danych utrzymuje pe�n� sp�jno�� danych przed, w trakcie i po zako�czeniu transakcji.
- Pe�na transakcja jest atomowa, czyli albo wszystkie operacje w transakcji zostan� wykonane, albo 
�adna z nich. Je�li wyst�pi b��d w trakcie transakcji, to zostanie ona wycofana, a zmiany wprowadzone 
do tej pory zostan� anulowane.

Isolation Level: Read Committed:
- W poziomie izolacji "Read Committed" inne transakcje mog� odczytywa� dane z tabeli jedynie po tym, 
jak zostan� one zatwierdzone. Je�li dana transakcja dokonuje zmiany w danych, to inne transakcje nie 
zobacz� tych zmian do momentu zatwierdzenia zmian przez t� transakcj�.
- Poziom izolacji "Read Committed" zapewnia pewien stopie� izolacji, ale nie jest on najbardziej 
restrykcyjny. Inne poziomy izolacji, takie jak "Serializable", oferuj� wy�szy stopie� izolacji kosztem
wydajno�ci.

Mo�emy przejrze� r�wnie� na co na�o�one zosta�y blokady oraz ich tryb ��dania.
*/

---------------------------------------------------------------------------------------------------
-- (Zad.8d) Monitorowanie stanu blokad za pomoc� programu SQL Server Profiler.
---------------------------------------------------------------------------------------------------

-- Plik "trace_1.trc" znajduje si� w folderze "testy_wspolbieznosc".

---------------------------------------------------------------------------------------------------
-- (Zad.9) Sprawdzenie dzia�ania wsp�bie�no�ci przy r�nych ustawieniach 
-- poziomu izolacji transakcji.
---------------------------------------------------------------------------------------------------

/*
Przypadek 1.
dbo.WypozyczenieUsluga_Dodaj_UW (res_sess_id 51) -> dbo.WypozyczenieUsluga_Dodaj_WU (ress_ses_id 66)
Przypadek 2.
dbo.WypozyczenieUsluga_Dodaj_WU (ress_ses_id 66) -> dbo.WypozyczenieUsluga_Dodaj_UW (res_sess_id 51)
*/

-- Ustawienie poziomu izolacji na READ COMMITTED
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT *
FROM dbo.v_lock_info
ORDER BY request_sess_id ASC, res_type ASC;
GO

/*
request_sess_id res_db_id   res_db_name          res_type   object_id    object_name          res_description      request_mode request_status request_owner_type
--------------- ----------- -------------------- ---------- ------------ -------------------- -------------------- ------------ -------------- ------------------------------
51              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
51              17          S19_P2               KEY                                          (30b7763ed433)       X            GRANT          TRANSACTION
51              17          S19_P2               OBJECT     1029578706   Usluga                                    IX           GRANT          TRANSACTION
51              17          S19_P2               PAGE                                         1:584                IX           GRANT          TRANSACTION
54              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
60              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               KEY                                          (30b7763ed433)       S            WAIT           TRANSACTION
66              17          S19_P2               OBJECT     1029578706   Usluga                                    IS           GRANT          TRANSACTION
66              17          S19_P2               PAGE                                         1:584                IS           GRANT          TRANSACTION

(10 rows affected)

-- procedura wykonana prawid�owo

request_sess_id res_db_id   res_db_name          res_type   object_id    object_name          res_description      request_mode request_status request_owner_type
--------------- ----------- -------------------- ---------- ------------ -------------------- -------------------- ------------ -------------- ------------------------------
51              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
51              17          S19_P2               KEY                                          (30b7763ed433)       X            GRANT          TRANSACTION
51              17          S19_P2               OBJECT     1029578706   Usluga                                    IX           GRANT          TRANSACTION
51              17          S19_P2               PAGE                                         1:584                IX           GRANT          TRANSACTION
54              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
60              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               KEY                                          (98ec012aa510)       X            GRANT          TRANSACTION
66              17          S19_P2               OBJECT     933578364    Wypozyczenie                              IX           GRANT          TRANSACTION
66              17          S19_P2               PAGE                                         1:640                IX           GRANT          TRANSACTION

(10 rows affected)

-- proces (51) procedura wykonana prawid�owo
-- proces (66) ofiara deadlocka
*/

-- Ustawienie poziomu izolacji na READ UNCOMMITTED
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT *
FROM dbo.v_lock_info
ORDER BY request_sess_id ASC, res_type ASC;
GO

/*
request_sess_id res_db_id   res_db_name          res_type   object_id    object_name          res_description      request_mode request_status request_owner_type
--------------- ----------- -------------------- ---------- ------------ -------------------- -------------------- ------------ -------------- ------------------------------
51              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
51              17          S19_P2               KEY                                          (30b7763ed433)       X            GRANT          TRANSACTION
51              17          S19_P2               OBJECT     1029578706   Usluga                                    IX           GRANT          TRANSACTION
51              17          S19_P2               PAGE                                         1:584                IX           GRANT          TRANSACTION
54              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
60              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               KEY                                          (98ec012aa510)       X            GRANT          TRANSACTION
66              17          S19_P2               OBJECT     933578364    Wypozyczenie                              IX           GRANT          TRANSACTION
66              17          S19_P2               PAGE                                         1:640                IX           GRANT          TRANSACTION

(10 rows affected)

-- proces (51) procedura wykonana prawid�owo
-- proces (66) ofiara deadlocka

request_sess_id res_db_id   res_db_name          res_type   object_id    object_name          res_description      request_mode request_status request_owner_type
--------------- ----------- -------------------- ---------- ------------ -------------------- -------------------- ------------ -------------- ------------------------------
51              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
51              17          S19_P2               KEY                                          (30b7763ed433)       X            GRANT          TRANSACTION
51              17          S19_P2               OBJECT     1029578706   Usluga                                    IX           GRANT          TRANSACTION
51              17          S19_P2               PAGE                                         1:584                IX           GRANT          TRANSACTION
54              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
60              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               KEY                                          (98ec012aa510)       X            GRANT          TRANSACTION
66              17          S19_P2               OBJECT     933578364    Wypozyczenie                              IX           GRANT          TRANSACTION
66              17          S19_P2               PAGE                                         1:640                IX           GRANT          TRANSACTION

(10 rows affected)

-- proces (51) procedura wykonana prawid�owo
-- proces (66) ofiara deadlocka
*/

-- Ustawienie poziomu izolacji na REPEATABLE READ
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT *
FROM dbo.v_lock_info
ORDER BY request_sess_id ASC, res_type ASC;
GO

/*
equest_sess_id res_db_id   res_db_name          res_type   object_id    object_name          res_description      request_mode request_status request_owner_type
--------------- ----------- -------------------- ---------- ------------ -------------------- -------------------- ------------ -------------- ------------------------------
51              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
51              17          S19_P2               KEY                                          (30b7763ed433)       X            GRANT          TRANSACTION
51              17          S19_P2               OBJECT     1029578706   Usluga                                    IX           GRANT          TRANSACTION
51              17          S19_P2               PAGE                                         1:584                IX           GRANT          TRANSACTION
54              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
60              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               KEY                                          (30b7763ed433)       S            WAIT           TRANSACTION
66              17          S19_P2               OBJECT     1029578706   Usluga                                    IS           GRANT          TRANSACTION
66              17          S19_P2               PAGE                                         1:584                IS           GRANT          TRANSACTION

(10 rows affected)

-- procedura wykonana prawid�owo

request_sess_id res_db_id   res_db_name          res_type   object_id    object_name          res_description      request_mode request_status request_owner_type
--------------- ----------- -------------------- ---------- ------------ -------------------- -------------------- ------------ -------------- ------------------------------
51              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
51              17          S19_P2               KEY                                          (30b7763ed433)       S            GRANT          TRANSACTION
51              17          S19_P2               KEY                                          (30b7763ed433)       X            CONVE          TRANSACTION
51              17          S19_P2               OBJECT     1029578706   Usluga                                    IX           GRANT          TRANSACTION
51              17          S19_P2               PAGE                                         1:584                IX           GRANT          TRANSACTION
54              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
60              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               KEY                                          (30b7763ed433)       S            GRANT          TRANSACTION
66              17          S19_P2               KEY                                          (98ec012aa510)       X            GRANT          TRANSACTION
66              17          S19_P2               OBJECT     1029578706   Usluga                                    IS           GRANT          TRANSACTION
66              17          S19_P2               OBJECT     933578364    Wypozyczenie                              IX           GRANT          TRANSACTION
66              17          S19_P2               PAGE                                         1:584                IS           GRANT          TRANSACTION
66              17          S19_P2               PAGE                                         1:640                IX           GRANT          TRANSACTION

(14 rows affected)

-- proces (51) ofiara deadlocka
-- proces (66) procedura wykonana prawid�owo
*/

-- Ustawienie poziomu izolacji na SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT *
FROM dbo.v_lock_info
ORDER BY request_sess_id ASC, res_type ASC;
GO

/*
request_sess_id res_db_id   res_db_name          res_type   object_id    object_name          res_description      request_mode request_status request_owner_type
--------------- ----------- -------------------- ---------- ------------ -------------------- -------------------- ------------ -------------- ------------------------------
51              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
51              17          S19_P2               KEY                                          (30b7763ed433)       X            GRANT          TRANSACTION
51              17          S19_P2               OBJECT     1029578706   Usluga                                    IX           GRANT          TRANSACTION
51              17          S19_P2               PAGE                                         1:584                IX           GRANT          TRANSACTION
54              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
60              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               KEY                                          (30b7763ed433)       S            WAIT           TRANSACTION
66              17          S19_P2               OBJECT     1029578706   Usluga                                    IS           GRANT          TRANSACTION
66              17          S19_P2               PAGE                                         1:584                IS           GRANT          TRANSACTION

(10 rows affected)

-- procedura wykonana prawid�owo

request_sess_id res_db_id   res_db_name          res_type   object_id    object_name          res_description      request_mode request_status request_owner_type
--------------- ----------- -------------------- ---------- ------------ -------------------- -------------------- ------------ -------------- ------------------------------
51              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
51              17          S19_P2               KEY                                          (30b7763ed433)       S            GRANT          TRANSACTION
51              17          S19_P2               KEY                                          (30b7763ed433)       X            CONVE          TRANSACTION
51              17          S19_P2               OBJECT     1029578706   Usluga                                    IX           GRANT          TRANSACTION
51              17          S19_P2               PAGE                                         1:584                IX           GRANT          TRANSACTION
54              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
60              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               KEY                                          (30b7763ed433)       S            GRANT          TRANSACTION
66              17          S19_P2               KEY                                          (98ec012aa510)       X            GRANT          TRANSACTION
66              17          S19_P2               OBJECT     1029578706   Usluga                                    IS           GRANT          TRANSACTION
66              17          S19_P2               OBJECT     933578364    Wypozyczenie                              IX           GRANT          TRANSACTION
66              17          S19_P2               PAGE                                         1:584                IS           GRANT          TRANSACTION
66              17          S19_P2               PAGE                                         1:640                IX           GRANT          TRANSACTION

(14 rows affected)

-- proces (51) ofiara deadlocka
-- proces (66) procedura wykonana prawid�owo
*/

/*
R�nice mi�dzy stopniami izolacji transakcji dotycz� tego, w jaki spos�b transakcje zarz�dzaj�
dost�pem do danych i blokadami, co ma wp�yw na wsp�bie�no��, sp�jno�� danych i wydajno�� systemu.

1. READ UNCOMMITTED:
- Brak blokad do odczytu (NOLOCK): Transakcja ignoruje blokady, co oznacza, �e mo�e odczytywa�
  dane, kt�re s� aktualnie modyfikowane przez inne transakcje.
- Brak zapewnionej sp�jno�ci (Dirty Reads): Mo�e prowadzi� do odczytywania danych, kt�re zosta�y 
  tymczasowo zmienione i nie zosta�y jeszcze potwierdzone.
2. READ COMMITTED:
- Blokady do odczytu (WITH (UPDLOCK, HOLDLOCK), SELECT): Transakcja blokuje dane do momentu 
  ich potwierdzenia (komitu) przez inna transakcj�, co eliminuje tzw. "dirty reads".
- Zapewniona sp�jno�� (No Dirty Reads): Nie pozwala na odczytanie tymczasowo zmienionych danych 
  przed zako�czeniem innej transakcji.
3. REPEATABLE READ:
- Bloki odczytu (WITH (UPDLOCK, HOLDLOCK), SELECT): Transakcja blokuje dane na czas trwania 
  transakcji, uniemo�liwiaj�c innym transakcjom wprowadzenie zmian w tych danych.
- Zapewniona sp�jno�� (No Dirty Reads, No Nonrepeatable Reads): Eliminuje "dirty reads" i 
  "nonrepeatable reads", ale mo�e pozostawi� miejsce dla "phantom reads" (wyst�pienia nowych 
  rekord�w spe�niaj�cych kryteria zapytania).
4. SERIALIZABLE:
- Bloki zapisu (WITH (UPDLOCK, HOLDLOCK), INSERT, UPDATE, DELETE): Transakcja blokuje dane do 
  zapisu, uniemo�liwiaj�c r�wnoczesne zapisywanie przez inne transakcje.
- Zapewniona sp�jno�� (No Dirty Reads, No Nonrepeatable Reads, No Phantom Reads): Eliminuje 
  wszystkie rodzaje niejednoznaczno�ci, ale mo�e prowadzi� do znacznego blokowania i wp�ywa� 
  na wydajno�� systemu.
*/

---------------------------------------------------------------------------------------------------
-- (Zad.11*) Wywo�anie zakleszczenia (ang. deadlock) proces�w wsp�bie�nych.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- Stan blokad zasob�w podczas r�wnoleg�ego uruchomienia
-- koliduj�cych ze sob� transakcji z poziomu dw�ch proces�w.
---------------------------------------------------------------------------------------------------

SELECT *
FROM dbo.v_lock_info
ORDER BY request_sess_id ASC, res_type ASC;
GO

/*
request_sess_id res_db_id   res_db_name          res_type   object_id    object_name          res_description      request_mode request_status request_owner_type
--------------- ----------- -------------------- ---------- ------------ -------------------- -------------------- ------------ -------------- ------------------------------
51              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
51              17          S19_P2               KEY                                          (30b7763ed433)       X            GRANT          TRANSACTION
51              17          S19_P2               OBJECT     1029578706   Usluga                                    IX           GRANT          TRANSACTION
51              17          S19_P2               PAGE                                         1:584                IX           GRANT          TRANSACTION
54              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
60              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               DATABASE                                                          S            GRANT          SHARED_TRANSACTION_WORKSPACE
66              17          S19_P2               KEY                                          (98ec012aa510)       X            GRANT          TRANSACTION
66              17          S19_P2               OBJECT     933578364    Wypozyczenie                              IX           GRANT          TRANSACTION
66              17          S19_P2               PAGE                                         1:640                IX           GRANT          TRANSACTION

(10 rows affected)
*/

/*
1. Blokada na poziomie bazy danych:
request_sess_id 51, res_db_id 17: Sesja 51 uzyska�a blokad� SHARED_TRANSACTION_WORKSPACE na poziomie ca�ej bazy danych S19_P2. 
Oznacza to, �e ta sesja jest zaanga�owana w transakcj�, kt�ra mo�e wp�ywa� na ca�� baz� danych.

2. Blokada na kluczu:
request_sess_id 51, res_db_id 17, res_type KEY, object_id 30b7763ed433: Sesja 51 uzyska�a ekskluzywn� blokad� (X) na kluczu o 
warto�ci (30b7763ed433). Blokada ta dotyczy transakcji i oznacza, �e �adna inna sesja nie mo�e r�wnocze�nie uzyska� blokady na 
tym kluczu.

3. Blokada na obiekcie:
request_sess_id 51, res_db_id 17, res_type OBJECT, object_id 1029578706, object_name Usluga: Sesja 51 uzyska�a blokad� intencji 
ekskluzywnej (IX) na obiekcie o identyfikatorze 1029578706 (Usluga). Blokada ta chroni obiekt przed r�wnoczesnymi modyfikacjami 
innych sesji.

4. Blokada na stronie:
request_sess_id 51, res_db_id 17, res_type PAGE, object_id 1:584: Sesja 51 uzyska�a blokad� intencji ekskluzywnej (IX) na stronie
o identyfikatorze 1:584. Blokada ta mo�e chroni� stron� przed r�wnoczesnymi modyfikacjami innych sesji.

W przypadku sesji o identyfikatorze 66 mo�na zauwa�y� podobne blokady, obejmuj�ce r�ne zasoby w bazie danych, co sugeruje, �e sesja 
ta r�wnie� jest aktywna w transakcji. Wa�ne jest zauwa�enie, �e blokady te mog� wp�ywa� na wsp�bie�no�� operacji w bazie danych i 
mog� prowadzi� do sytuacji zakleszczenia (deadlock), zw�aszcza gdy inne sesje pr�buj� uzyska� blokady na tych samych zasobach.
*/

/*
Obserwacja

Zakleszczenie proces�w wyst�pi�o wy��cznie przy r�wnoleg�ym odwo�aniu do identycznych zasob�w (tych samych tabel i wierszy) 
z poziomu transakcji "_WU" oraz "_UW" z odwr�con� kolejno�ci� dost�pu do tabel. Je�eli transakcje r�wnoleg�e odwo�ywa�y si� do innych 
wierszy w tych samych tabelach - do zakleszczenia nie dochodzi�o.

Wniosek: zarz�dzanie procesami r�wnoleg�ymi w systemie baz danych Microsoft SQL Server efektywnie zabezpiecza przed ich kolizjami
i zakleszczeniami nawet w przypadku skrzy�owanego odwo�ania do tych samych tabel - z wyj�tkiem przypadku odwo�ania do identycznych wierszy.
*/

---------------------------------------------------------------------------------------------------
-- Koniec.
---------------------------------------------------------------------------------------------------