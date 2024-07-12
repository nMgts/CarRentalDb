---------------------------------------------------------------------------------------------------
-- SRBD_C3: Transakcje i wspó³bie¿noœæ.
---------------------------------------------------------------------------------------------------
-- Skrypt testowania mechanizmów wspó³bie¿noœci procesów.
---------------------------------------------------------------------------------------------------

CREATE OR ALTER VIEW dbo.v_lock_info
AS
SELECT	request_session_id AS [request_sess_id],		-- identyfikator sesji procesu, który zg³osi³ ¿¹danie blokady
		resource_database_id AS [res_db_id],			-- identyfikator bazy danych
		SUBSTRING(DB.[name], 1, 20) AS [res_db_name],	-- nazwa bazy danych
		SUBSTRING(resource_type, 1, 10) AS [res_type],	-- rodzaj blokowanego zasobu
		ISNULL(CONVERT(varchar(12), OBJ.[object_id]), '') AS [object_id], -- identyfikator obiektu objêtego blokad¹
		SUBSTRING(ISNULL(OBJ.[name], ''), 1, 20) AS [object_name],	-- nazwa obiektu lub typ blokowanego obiektu
		SUBSTRING(resource_description, 1, 20) AS [res_description],-- opis blokowanego zasobu
		SUBSTRING(request_mode, 1, 5) AS [request_mode],			-- ¿¹dany tryb blokady
		SUBSTRING(request_status, 1, 5) AS [request_status],		-- status obs³ugi ¿¹dania
		SUBSTRING(request_owner_type, 1, 30) AS [request_owner_type]-- typ procesu, który zg³osi³ ¿¹danie blokady

FROM sys.dm_tran_locks AS LOCK
	INNER JOIN sys.sysdatabases AS DB
	ON LOCK.resource_database_id = DB.[dbid]
		LEFT OUTER JOIN sys.objects AS OBJ
		ON LOCK.resource_associated_entity_id = OBJ.[object_id]
WHERE (OBJ.[name] IS NULL) -- pominiêcie blokad obiektów systemowych oraz bie¿¹cego widoku
	  OR ((OBJ.[name] NOT LIKE 'sys%') AND (OBJ.[name] NOT LIKE 'v_lock_info%')); 
GO

---------------------------------------------------------------------------------------------------
-- (Zad.8a1) Stan blokad zasobów przed uruchomieniem transakcji.
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
request_sess_id - Numer sesji lub procesu, który uzyska³ dostêp.
res_db_id: Identyfikator bazy danych, do której odnosi siê blokada (17).
res_db_name: Nazwa bazy danych (S19_P2).
res_type: Rodzaj zasobu, w tym przypadku baza danych (DATABASE).
object_id, object_name: Identyfikator i nazwê obiektu na który na³o¿ona jest blokada, w tym przypadku 
wskazuj¹ NULL, poniewa¿ blokada jest na poziomie bazy danych, a nie konkretnego obiektu.
res_description - Opis zasobu.
request_mode: Rodzaj blokady, tutaj S oznacza blokadê wspó³dzielon¹ (Shared).
request_status: Status blokady, w tym przypadku blokada zosta³a przyznana (GRANT).
request_owner_type: Typ w³aœciciela blokady, w tym przypadku wspólna przestrzeñ robocza transakcji (SHARED_TRANSACTION_WORKSPACE).

Te blokady s¹ typowe w przypadku równoczesnego dostêpu do wspólnego obszaru transakcji w celu utrzymania integralnoœci transakcyjnej
w systemie bazodanowym. Blokady wspó³dzielone s¹ zwykle stosowane, gdy kilka sesji czyta dane jednoczeœnie, a nie ma koniecznoœci
blokowania innych sesji do odczytu. Blokady zapisu s¹ u¿ywane, gdy sesja zmienia dane, co mo¿e prowadziæ do konfliktów, gdy kilka
sesji próbuje je modyfikowaæ jednoczeœnie.
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
Sesja o identyfikatorze 51 uzyska³a ekskluzywn¹ blokadê klucza (Exclusive Lock) na kluczu o wartoœci (fa7126f111a4). 
Blokada ekskluzywna oznacza, ¿e ¿adna inna sesja nie mo¿e równoczeœnie uzyskaæ blokady na tym kluczu. W tym przypadku, 
blokada ta mo¿e dotyczyæ transakcji, co oznacza, ¿e ¿adna inna sesja nie bêdzie mog³a modyfikowaæ lub uzyskiwaæ dostêpu 
do tego konkretnego klucza, dopóki sesja 51 nie zakoñczy swojej transakcji.

Podobnie, sesja 51 uzyska³a tak¿e blokadê intencji ekskluzywnej na obiekcie o identyfikatorze 1061578820 (Kategoria) 
oraz blokadê intencji ekskluzywnej na stronie o identyfikatorze 1:600. Blokada intencji ekskluzywnej sugeruje, ¿e sesja 
ma zamiar uzyskaæ blokady ekskluzywne na ni¿szych poziomach obiektu (obiekt Kategoria) i strony w ramach tej samej transakcji.

Sesja 66 uzyska³a takie same blokady (jedynie inny klucz), przez co transakcja wykonywana w sesji 66 musia³a poczekaæ na
wykonanie transakcji w sesji 51.

W skrócie, blokady ekskluzywne uniemo¿liwiaj¹ innym sesjom równoczesny dostêp do zasobu, chroni¹c go przed równoczesnymi 
modyfikacjami i zapewniaj¹c spójnoœæ danych.
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
Po wykonaniu transakcji stan blokad wróci³ do poprzedniej formy.
*/

---------------------------------------------------------------------------------------------------
-- (Zad.8b) Monitorowanie stanu blokad za pomoc¹ funkcji Activity Monitor.
---------------------------------------------------------------------------------------------------

-- Zrzut ekranu "ActivityMonitor.jpg" znajduje siê w folderze "testy_wspolbieznosc".

/*
TASK STATE: SUSPEND wskazuje, ¿e zadanie (task) jest zawieszone lub wstrzymane. 
COMMAND: WAITFOR oznacza, ¿e jest to komenda WAITFOR.

Komenda WAITFOR jest u¿ywana do zatrzymania bie¿¹cego zadania (w¹tku) przez okreœlony
okres czasu lub do momentu spe³nienia okreœlonego warunku. 
*/

---------------------------------------------------------------------------------------------------
-- (Zad.8c) Monitorowanie stanu blokad za pomoc¹ funkcji raportów.
---------------------------------------------------------------------------------------------------

-- Plik "raport.pdf" znajduje siê w folderze "testy_wspolbieznosc".

/*
Za pomoc¹ funkcji raportów mo¿emy odczytaæ, informacje tj. ID, nazwa hosta, czas zalogowania 
sesji w której wykonywana jest transakcja. ID i nazwê transakcji oraz liczbê za³o¿onych blokad.
Widzimy tak¿e, ¿e typ transakcji to "Full Transaction" oraz poziom izolacji to "Read Commited".

Transaction Type: Full Transaction:
- Oznacza, ¿e transakcja jest pe³n¹ transakcj¹, co oznacza, ¿e obejmuje jedno lub wiêcej zapytañ SQL,
a baza danych utrzymuje pe³n¹ spójnoœæ danych przed, w trakcie i po zakoñczeniu transakcji.
- Pe³na transakcja jest atomowa, czyli albo wszystkie operacje w transakcji zostan¹ wykonane, albo 
¿adna z nich. Jeœli wyst¹pi b³¹d w trakcie transakcji, to zostanie ona wycofana, a zmiany wprowadzone 
do tej pory zostan¹ anulowane.

Isolation Level: Read Committed:
- W poziomie izolacji "Read Committed" inne transakcje mog¹ odczytywaæ dane z tabeli jedynie po tym, 
jak zostan¹ one zatwierdzone. Jeœli dana transakcja dokonuje zmiany w danych, to inne transakcje nie 
zobacz¹ tych zmian do momentu zatwierdzenia zmian przez tê transakcjê.
- Poziom izolacji "Read Committed" zapewnia pewien stopieñ izolacji, ale nie jest on najbardziej 
restrykcyjny. Inne poziomy izolacji, takie jak "Serializable", oferuj¹ wy¿szy stopieñ izolacji kosztem
wydajnoœci.

Mo¿emy przejrzeæ równie¿ na co na³o¿one zosta³y blokady oraz ich tryb ¿¹dania.
*/

---------------------------------------------------------------------------------------------------
-- (Zad.8d) Monitorowanie stanu blokad za pomoc¹ programu SQL Server Profiler.
---------------------------------------------------------------------------------------------------

-- Plik "trace_1.trc" znajduje siê w folderze "testy_wspolbieznosc".

---------------------------------------------------------------------------------------------------
-- (Zad.9) Sprawdzenie dzia³ania wspó³bie¿noœci przy ró¿nych ustawieniach 
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

-- procedura wykonana prawid³owo

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

-- proces (51) procedura wykonana prawid³owo
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

-- proces (51) procedura wykonana prawid³owo
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

-- proces (51) procedura wykonana prawid³owo
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

-- procedura wykonana prawid³owo

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
-- proces (66) procedura wykonana prawid³owo
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

-- procedura wykonana prawid³owo

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
-- proces (66) procedura wykonana prawid³owo
*/

/*
Ró¿nice miêdzy stopniami izolacji transakcji dotycz¹ tego, w jaki sposób transakcje zarz¹dzaj¹
dostêpem do danych i blokadami, co ma wp³yw na wspó³bie¿noœæ, spójnoœæ danych i wydajnoœæ systemu.

1. READ UNCOMMITTED:
- Brak blokad do odczytu (NOLOCK): Transakcja ignoruje blokady, co oznacza, ¿e mo¿e odczytywaæ
  dane, które s¹ aktualnie modyfikowane przez inne transakcje.
- Brak zapewnionej spójnoœci (Dirty Reads): Mo¿e prowadziæ do odczytywania danych, które zosta³y 
  tymczasowo zmienione i nie zosta³y jeszcze potwierdzone.
2. READ COMMITTED:
- Blokady do odczytu (WITH (UPDLOCK, HOLDLOCK), SELECT): Transakcja blokuje dane do momentu 
  ich potwierdzenia (komitu) przez inna transakcjê, co eliminuje tzw. "dirty reads".
- Zapewniona spójnoœæ (No Dirty Reads): Nie pozwala na odczytanie tymczasowo zmienionych danych 
  przed zakoñczeniem innej transakcji.
3. REPEATABLE READ:
- Bloki odczytu (WITH (UPDLOCK, HOLDLOCK), SELECT): Transakcja blokuje dane na czas trwania 
  transakcji, uniemo¿liwiaj¹c innym transakcjom wprowadzenie zmian w tych danych.
- Zapewniona spójnoœæ (No Dirty Reads, No Nonrepeatable Reads): Eliminuje "dirty reads" i 
  "nonrepeatable reads", ale mo¿e pozostawiæ miejsce dla "phantom reads" (wyst¹pienia nowych 
  rekordów spe³niaj¹cych kryteria zapytania).
4. SERIALIZABLE:
- Bloki zapisu (WITH (UPDLOCK, HOLDLOCK), INSERT, UPDATE, DELETE): Transakcja blokuje dane do 
  zapisu, uniemo¿liwiaj¹c równoczesne zapisywanie przez inne transakcje.
- Zapewniona spójnoœæ (No Dirty Reads, No Nonrepeatable Reads, No Phantom Reads): Eliminuje 
  wszystkie rodzaje niejednoznacznoœci, ale mo¿e prowadziæ do znacznego blokowania i wp³ywaæ 
  na wydajnoœæ systemu.
*/

---------------------------------------------------------------------------------------------------
-- (Zad.11*) Wywo³anie zakleszczenia (ang. deadlock) procesów wspó³bie¿nych.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- Stan blokad zasobów podczas równoleg³ego uruchomienia
-- koliduj¹cych ze sob¹ transakcji z poziomu dwóch procesów.
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
request_sess_id 51, res_db_id 17: Sesja 51 uzyska³a blokadê SHARED_TRANSACTION_WORKSPACE na poziomie ca³ej bazy danych S19_P2. 
Oznacza to, ¿e ta sesja jest zaanga¿owana w transakcjê, która mo¿e wp³ywaæ na ca³¹ bazê danych.

2. Blokada na kluczu:
request_sess_id 51, res_db_id 17, res_type KEY, object_id 30b7763ed433: Sesja 51 uzyska³a ekskluzywn¹ blokadê (X) na kluczu o 
wartoœci (30b7763ed433). Blokada ta dotyczy transakcji i oznacza, ¿e ¿adna inna sesja nie mo¿e równoczeœnie uzyskaæ blokady na 
tym kluczu.

3. Blokada na obiekcie:
request_sess_id 51, res_db_id 17, res_type OBJECT, object_id 1029578706, object_name Usluga: Sesja 51 uzyska³a blokadê intencji 
ekskluzywnej (IX) na obiekcie o identyfikatorze 1029578706 (Usluga). Blokada ta chroni obiekt przed równoczesnymi modyfikacjami 
innych sesji.

4. Blokada na stronie:
request_sess_id 51, res_db_id 17, res_type PAGE, object_id 1:584: Sesja 51 uzyska³a blokadê intencji ekskluzywnej (IX) na stronie
o identyfikatorze 1:584. Blokada ta mo¿e chroniæ stronê przed równoczesnymi modyfikacjami innych sesji.

W przypadku sesji o identyfikatorze 66 mo¿na zauwa¿yæ podobne blokady, obejmuj¹ce ró¿ne zasoby w bazie danych, co sugeruje, ¿e sesja 
ta równie¿ jest aktywna w transakcji. Wa¿ne jest zauwa¿enie, ¿e blokady te mog¹ wp³ywaæ na wspó³bie¿noœæ operacji w bazie danych i 
mog¹ prowadziæ do sytuacji zakleszczenia (deadlock), zw³aszcza gdy inne sesje próbuj¹ uzyskaæ blokady na tych samych zasobach.
*/

/*
Obserwacja

Zakleszczenie procesów wyst¹pi³o wy³¹cznie przy równoleg³ym odwo³aniu do identycznych zasobów (tych samych tabel i wierszy) 
z poziomu transakcji "_WU" oraz "_UW" z odwrócon¹ kolejnoœci¹ dostêpu do tabel. Je¿eli transakcje równoleg³e odwo³ywa³y siê do innych 
wierszy w tych samych tabelach - do zakleszczenia nie dochodzi³o.

Wniosek: zarz¹dzanie procesami równoleg³ymi w systemie baz danych Microsoft SQL Server efektywnie zabezpiecza przed ich kolizjami
i zakleszczeniami nawet w przypadku skrzy¿owanego odwo³ania do tych samych tabel - z wyj¹tkiem przypadku odwo³ania do identycznych wierszy.
*/

---------------------------------------------------------------------------------------------------
-- Koniec.
---------------------------------------------------------------------------------------------------