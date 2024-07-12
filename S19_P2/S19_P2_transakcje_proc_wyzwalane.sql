---------------------------------------------------------------------------------------------------
-- SRBD_P2: transakcje i wspó³bie¿noœæ.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- Zad.2. Definicje transakcji.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- T1. Archiwizowanie danych pracownika.
---------------------------------------------------------------------------------------------------

CREATE TABLE dbo.Pracownik_Kopia
(
	IdPracownik int NOT NULL PRIMARY KEY, 
	Imie varchar(20) NOT NULL,
	Nazwisko varchar(40) NOT NULL,
	Stanowisko varchar(40) NOT NULL, 
	NrTelefonu nchar(15) NOT NULL, 
	AdresMail varchar(60) NOT NULL,
	DataArchiwizacji datetime NOT NULL --<-- Nowe pole.
);
GO

ALTER PROCEDURE dbo.Pracownik_Archiwizuj
@Par_IdPracownik int
AS
BEGIN
-- Przerwanie bloku transakcji po wyst¹pieniu b³êdu czasu wykonania.
SET XACT_ABORT ON;
BEGIN TRANSACTION
-- (1) Kopiowanie wiersza z danymi pracownika.
INSERT dbo.Pracownik_Kopia
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail, DataArchiwizacji)
SELECT IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail, GETDATE()
FROM dbo.Pracownik
WHERE IdPracownik = @Par_IdPracownik;

WAITFOR DELAY '00:00:22' -- Przerwanie wykonywania skryptu.

-- (2) Usuniêcie wiersza z tabeli Ÿród³owej. 
DELETE dbo.Pracownik
WHERE IdPracownik = @Par_IdPracownik;

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Archiwizacja danych pracownika nie powiod³a siê.', 16, 1);
	ROLLBACK TRANSACTION
END
	COMMIT TRANSACTION
END;
GO

/*
INSERT dbo.Pracownik
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(12, 'Cris', 'Cononovitch', 'gwiazdor', '+48 500 300 500', 'cris.cononovitch@firma.pl');
GO
*/

/*
EXECUTE dbo.Pracownik_Archiwizuj
@Par_IdPracownik = 12;
GO
*/

---------------------------------------------------------------------------------------------------
-- T2. Rejestrowanie zmian cen kategorii w czasie.
---------------------------------------------------------------------------------------------------

CREATE TABLE dbo.Kategoria_CenaHistoria
(
	IdKategoriaCenaHistoria int NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Kategoria varchar(20) NOT NULL,
	DataGodzZmiany datetime NOT NULL,
	CenaPoprzednia money NULL,
	CenaNowa money NOT NULL
);
GO

CREATE PROCEDURE dbo.Kategoria_ZmienCene
@Par_Kategoria varchar(20),
@Par_Cena money
AS
BEGIN
-- Przerwanie bloku transakcji po wyst¹pieniu b³êdu czasu wykonania.
SET XACT_ABORT ON;

DECLARE @Var_CenaPoprzednia money;

-- (1) Pobranie poprzedniej ceny kategorii.
SELECT @Var_CenaPoprzednia = Cena
FROM dbo.Kategoria
WHERE Kategoria = @Par_Kategoria;

BEGIN TRANSACTION
-- (2) Modyfikacja danych kategorii.
UPDATE dbo.Kategoria
SET Cena = @Par_Cena
WHERE Kategoria = @Par_Kategoria;

WAITFOR DELAY '00:00:15';

-- (3) Zapisanie wiersza w tabeli historii zmian cen kategorii pod warunkiem, ¿e
-- ta kategoria istnieje, a jego cena faktycznie uleg³a zmianie.
IF (@Var_CenaPoprzednia IS NOT NULL AND @Var_CenaPoprzednia <> @Par_Cena)
	INSERT dbo.Kategoria_CenaHistoria
	(Kategoria, DataGodzZmiany, CenaPoprzednia, CenaNowa)
	VALUES
	(@Par_Kategoria, GETDATE(), @Var_CenaPoprzednia, @Par_Cena);

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Modyfikacja danych kategorii nie powiod³a siê.', 16, 1);
	ROLLBACK TRANSACTION
END
	COMMIT TRANSACTION
END;
GO

/*
EXECUTE dbo.Kategoria_ZmienCene
@Par_Kategoria = 'Ekonomiczna',
@Par_Cena = 75;
GO
*/

---------------------------------------------------------------------------------------------------
-- T3. Synchronizacja danych wypo¿yczenia, dodanej us³ugi oraz us³ugi.
-- (a) Dodawanie us³ugi do wypo¿yczenia.
---------------------------------------------------------------------------------------------------

-- Dodanie pola Dostepnosc do tabeli [Usluga].
-- Dostêpnoœæ okreœla liczbê mo¿liwoœci wykonania us³ugi (np. dostêpni szoferzy do us³ugi
-- "VIP Chauffer Experience"), dostêpnoœæ mo¿e przyjmowaæ wartoœæ NULL, oznacza to ¿e dane
-- us³uga mo¿e byæ przydzielana do wypo¿yczenia zawsze.
--
ALTER TABLE dbo.Usluga
ADD Dostepnosc int NULL;
GO

UPDATE dbo.Usluga
SET Dostepnosc = 4
WHERE IdUsluga IN (6, 8, 9);
GO

CREATE PROCEDURE dbo.WypozyczenieUsluga_Dodaj
@Par_IdWypozyczenieUsluga int,
@Par_IdWypozyczenie int,
@Par_IdUsluga int,
@Par_Uwagi varchar(2000)
AS
BEGIN

SET XACT_ABORT ON;

BEGIN TRANSACTION

DECLARE @Var_Dostepnosc int,
		@Var_Cena money;

SELECT @Var_Cena = Cena
FROM dbo.Usluga
WHERE IdUsluga = @Par_IdUsluga;

-- Zablokowanie mo¿liwoœci wstawienia ponownie tej samej us³ugi do danego zamówienia.
IF EXISTS (
    SELECT 1
    FROM dbo.WypozyczenieUsluga
    WHERE IdWypozyczenie = @Par_IdWypozyczenie
    AND IdUsluga = @Par_IdUsluga
)
BEGIN
    RAISERROR('Dana us³uga ju¿ istnieje w danym wypo¿yczeniu', 16, 1);
    ROLLBACK TRANSACTION;
    RETURN;
END

SELECT @Var_Dostepnosc = Dostepnosc
FROM dbo.Usluga
WHERE IdUsluga = @Par_IdUsluga;

IF (@Var_Dostepnosc IS NULL OR @Var_Dostepnosc > 0)
BEGIN

-- (1) Zwiêkszenie ³¹cznej wartoœci przewidywanej wypo¿yczenia w tabeli [Wypozyczenie].
UPDATE dbo.Wypozyczenie
SET CenaPrzewidywana = CenaPrzewidywana + @Var_Cena
WHERE IdWypozyczenie = @Par_IdWypozyczenie;

-- WAITFOR DELAY '00:00:15';

-- (2) Zmniejszenie dostêpnoœci us³ugi
IF (@Var_Dostepnosc IS NOT NULL)
	UPDATE dbo.Usluga
	SET Dostepnosc = Dostepnosc - 1
	WHERE IdUsluga = @Par_IdUsluga;

-- (3) Wstawienie wiersza do tabeli [WypozyczenieUsluga]
INSERT dbo.WypozyczenieUsluga
(IdWypozyczenieUsluga, IdWypozyczenie, IdUsluga, Uwagi)
VALUES
(@Par_IdWypozyczenieUsluga, @Par_IdWypozyczenie, @Par_IdUsluga, @Par_Uwagi);

END

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Dodanie nowej us³ugi do wypo¿yczenia nie powiod³o siê', 16, 1);
	ROLLBACK TRANSACTION
END
ELSE
	COMMIT TRANSACTION;
END;
GO

/*
SELECT *
FROM dbo.wypozyczenie;
GO

SELECT *
FROM dbo.WypozyczenieUsluga;
GO

SELECT *
FROM dbo.Usluga;
GO

EXECUTE dbo.WypozyczenieUsluga_Dodaj
@Par_IdWypozyczenieUsluga = 11,
@Par_IdWypozyczenie = 3,
@Par_IdUsluga = 9,
@Par_Uwagi = 'Brak';
GO
*/

---------------------------------------------------------------------------------------------------
-- T3. Synchronizacja danych wypo¿yczenia, dodanej us³ugi oraz us³ugi.
-- (b) Usuwanie us³ugi z wypo¿yczenia.
---------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.WypozyczenieUsluga_Skasuj
@Par_IdWypozyczenieUsluga int
AS
BEGIN
-- Przerywanie bloku transakcyjnego po wyst¹pieniu
-- b³êdu czasu wykonania (ang. runtime error).
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @Var_IdWypozyczenie int,
		@Var_IdUsluga int,
		@Var_Uwagi varchar(2000),
		@Var_Cena money,
		@Var_Dosteposc int;

SELECT @Var_IdWypozyczenie = IdWypozyczenie,
	   @Var_IdUsluga = IdUsluga,
	   @Var_Uwagi = Uwagi
FROM dbo.WypozyczenieUsluga
WHERE IdWypozyczenieUsluga = @Par_IdWypozyczenieUsluga;

SELECT @Var_Cena = Cena,
	   @Var_Dosteposc = Dostepnosc
FROM dbo.Usluga
WHERE IdUsluga = @Var_IdUsluga;

-- (1) Zmniejszenie przewidywanej ceny w tabeli [Wypozyczenie].
UPDATE dbo.Wypozyczenie
SET CenaPrzewidywana = CenaPrzewidywana - @Var_Cena
WHERE IdWypozyczenie = @Var_IdWypozyczenie;

-- WAITFOR DELAY '00:00:15';

-- (2) Usuniêcie wiersza z tabeli [WypozyczenieUsluga].
DELETE dbo.WypozyczenieUsluga
WHERE IdWypozyczenieUsluga = @Par_IdWypozyczenieUsluga;

-- (3) Zwiêkszenie dostêpnoœci w tabeli [Us³uga].
IF (@Var_Dosteposc IS NOT NULL)
	UPDATE dbo.Usluga
	SET Dostepnosc = @Var_Dosteposc + 1
	WHERE IdUsluga = @Var_IdUsluga;

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Usuniêcie us³ugi z wypo¿yczenia nie powiod³o siê.', 16, 1);
	ROLLBACK TRANSACTION
END
ELSE
	COMMIT TRANSACTION

END;
GO

/*
SELECT *
FROM dbo.wypozyczenie;
GO

SELECT *
FROM dbo.WypozyczenieUsluga;
GO

SELECT *
FROM dbo.Usluga;
GO

EXECUTE dbo.WypozyczenieUsluga_Skasuj
@Par_IdWypozyczenieUsluga = 11,
GO
*/

---------------------------------------------------------------------------------------------------
-- T4. Dodanie nowego wypo¿yczenia.
-- Synchronizacja danych wypo¿yczenia, oraz samochodu.
---------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Wypozyczenie_Dodaj
@Par_IdWypozyczenie int,
@Par_IdKlient int,
@Par_IdSamochod int,
@Par_IdPracownik int,
@Par_IdUbezpieczenie int,
@Par_SposobPlatnosci varchar(25),
@Par_DataWypozyczenia datetime,
@Par_TerminZwrotu datetime,
@Par_DataZwrotu datetime,
@Par_Uwagi varchar(1000)
AS
BEGIN
-- Przerywanie bloku transakcyjnego po wyst¹pieniu
-- b³êdu czasu wykonania (ang. runtime error).
SET XACT_ABORT ON;
BEGIN TRANSACTION

DECLARE @Var_Dostepnosc bit,
		@Var_CenaSamochodu money,
		@Var_CenaUbezpieczenia money,
		@Var_CenaPrzewidywana money,
		@Var_CenaOstateczna money,
		@Var_StatusWypozyczenia bit,
		@Var_RoznicaGodzin float,
		@Var_RoznicaDni float;

SELECT @Var_Dostepnosc = Dostepnosc,
	   @Var_CenaSamochodu = Cena
FROM dbo.Samochod
	INNER JOIN dbo.Kategoria
	ON Samochod.Kategoria = Kategoria.Kategoria
WHERE IdSamochod = @Par_IdSamochod;

SELECT @Var_CenaUbezpieczenia = Cena
FROM dbo.Ubezpieczenie
WHERE IdUbezpieczenie = @Par_IdUbezpieczenie;

SET @Var_RoznicaGodzin = DATEDIFF(hour, @Par_DataWypozyczenia, @Par_TerminZwrotu);
SET @Var_RoznicaDni = @Var_RoznicaGodzin / 24.0;

SET @Var_CenaPrzewidywana = @Var_CenaSamochodu * @Var_RoznicaDni + @Var_CenaUbezpieczenia;

IF (@Par_DataZwrotu IS NOT NULL)
BEGIN
    SET @Var_CenaOstateczna = @Var_CenaPrzewidywana;
    SET @Var_StatusWypozyczenia = 0;
END
ELSE
BEGIN
    SET @Var_CenaOstateczna = NULL;
    SET @Var_StatusWypozyczenia = 1;
END;

IF (@Var_Dostepnosc = 0)
BEGIN
    RAISERROR('Samochód jest niedostêpny', 16, 1);
    ROLLBACK TRANSACTION;
    RETURN;
END

-- (1) Zmiana dostêpnoœci samochodu na niedostêpny.
UPDATE dbo.Samochod
SET Dostepnosc = 0
WHERE IdSamochod = @Par_IdSamochod;

-- WAITFOR DELAY '00:00:15';

-- (2) Dodanie nowego wypo¿yczenia
INSERT dbo.Wypozyczenie
(IdWypozyczenie, IdKlient, IdSamochod, IdPracownik, IdUbezpieczenie, SposobPlatnosci, DataWypozyczenia, TerminZwrotu, DataZwrotu, CenaPrzewidywana, CenaOstateczna, StatusWypozyczenia, Uwagi)
VALUES
(@Par_IdWypozyczenie, @Par_IdKlient, @Par_IdSamochod, @Par_IdPracownik, @Par_IdUbezpieczenie, @Par_SposobPlatnosci, @Par_DataWypozyczenia, @Par_TerminZwrotu, @Par_DataZwrotu, @Var_CenaPrzewidywana, @Var_CenaOstateczna, @Var_StatusWypozyczenia, @Par_Uwagi);

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Dodanie nowego wypo¿yczenia nie powiod³o siê.',16 , 1);
	ROLLBACK TRANSACTION
END
ELSE
	COMMIT TRANSACTION

END;
GO

/*
SELECT *
FROM dbo.Wypozyczenie;
GO

SELECT IdSamochod, Model, Cena, Dostepnosc
FROM dbo.Samochod
	INNER JOIN dbo.Kategoria
	ON Samochod.Kategoria = Kategoria.Kategoria;
GO

SELECT *
FROM dbo.Ubezpieczenie;
GO

EXECUTE dbo.Wypozyczenie_Dodaj
@Par_IdWypozyczenie = 11,
@Par_IdKlient = 3,
@Par_IdSamochod = 1,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Karta',
@Par_DataWypozyczenia = '2023-11-11 11:00:00',
@Par_TerminZwrotu = '2023-11-13 17:00:00',
@Par_DataZwrotu = NULL,
@Par_Uwagi = NULL;
GO
*/

---------------------------------------------------------------------------------------------------
-- T5. Elastyczne zarz¹dzanie s³ownikami - makrooperacja.
---------------------------------------------------------------------------------------------------
-- G³ówna zasada dzia³ania: je¿eli w s³owniku nie widnieje dana wartoœæ,
-- jest ona do niej dodawana.
---------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Samochod_Wstaw_Makro
@Par_IdSamochod int,
@Par_Kategoria varchar(20),
@Par_Marka varchar(20),
@Par_Model varchar(20),
@Par_Dostepnosc bit,
@Par_IloscDrzwi int,
@Par_Rocznik int,
@Par_TypSilnika varchar(15),
@Par_InformacjeDodatkowe varchar(1000)
AS
BEGIN
-- Przerywanie bloku transakcyjnego po wyst¹pieniu
-- b³êdu czasu wykonania (ang. runtime error).
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @Var_Marka varchar(20),
		@Var_Model varchar(20);

-- Próba pobrania identyfikatora marki o podanej nazwie.
SELECT @Var_Marka = Marka
FROM dbo.Marka
WHERE Marka = @Par_Marka;

-- Je¿eli taka marka nie istnieje, zwrócona zosta³a wartoœæ NULL.
IF (@Var_Marka IS NULL)
BEGIN
	INSERT dbo.Marka
	(Marka)
	VALUES
	(@Par_Marka);

	SELECT @Var_Marka = @Par_Marka;
END

-- Próba pobrania identyfikatora modelu o podanej nazwie.
SELECT @Var_Model = Model
FROM dbo.Model
WHERE Model = @Par_Model;

-- Je¿eli taki model nie istnieje, zwrócona zosta³a wartoœæ NULL.
IF (@Var_Model IS NULL)
BEGIN
	INSERT dbo.Model
	(Model, Marka)
	VALUES
	(@Par_Model, @Var_Marka);

	SELECT @Var_Model = @Par_Model;
END

-- Wstawienie danych nowego samochodu.
INSERT dbo.Samochod
(IdSamochod, Kategoria, Model, Dostepnosc, IloscDrzwi, Rocznik, TypSilnika, InformacjeDodatkowe)
VALUES
(@Par_IdSamochod, @Par_Kategoria, @Var_Model, @Par_Dostepnosc, @Par_IloscDrzwi, @Par_Rocznik, @Par_TypSilnika, @Par_InformacjeDodatkowe);

-- WAITFOR DELAY '00:00:15';

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Wstawienie danych samochodu nie powiod³o siê.', 16, 1);
	ROLLBACK TRANSACTION
END
ELSE
	COMMIT TRANSACTION
END;
GO

/*
SELECT *
FROM dbo.Samochod;
GO

SELECT *
FROM dbo.Marka;
GO

SELECT *
FROM dbo.Model;
GO

EXECUTE dbo.Samochod_Wstaw_Makro
@Par_IdSamochod = 12,
@Par_Kategoria = 'Sportowe',
@Par_Marka = 'Nissan',
@Par_Model = 'GTR',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 2,
@Par_Rocznik = 2015,
@Par_TypSilnika = 'Benzyna',
@Par_InformacjeDodatkowe = 'NISSAN GT-R R35 Premium Edition 4WD 3.8';
GO
*/

---------------------------------------------------------------------------------------------------
-- T6. Zaawansowane archiwizowanie pe³nych danych klienta, jego wypo¿yczeñ i dodanych us³ug
-- w formacie XML.
---------------------------------------------------------------------------------------------------

CREATE TABLE dbo.Klient_Kopia
(
    IdArchiwalne int IDENTITY(1,1) PRIMARY KEY,
    DaneXML XML NOT NULL,
    DataArchiwizacji DATETIME DEFAULT GETDATE()
);
GO

CREATE PROCEDURE dbo.Klient_Archiwizuj
@Par_IdKlient int
AS
BEGIN
-- Przerywanie bloku transakcyjnego po wyst¹pieniu
-- b³êdu czasu wykonania (ang. runtime error).
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @Var_DaneXML XML

SET @Var_DaneXML = (
	SELECT Klient.*,
		   Uprawnienia.*,
		   Wypozyczenie.*,
		   Samochod.Model,
		   Model.Marka,
		   Ubezpieczenie.*,
		   Usluga.*
	FROM dbo.Klient
		LEFT JOIN dbo.KlientUprawnienia
		ON Klient.IdKlient = KlientUprawnienia.IdKlient
			LEFT JOIN dbo.Uprawnienia
			ON KlientUprawnienia.KategoriaPrawaJazdy = Uprawnienia.KategoriaPrawaJazdy
		LEFT JOIN dbo.Wypozyczenie
		ON Klient.IdKlient = Wypozyczenie.IdKlient
			LEFT JOIN dbo.Samochod
			ON Wypozyczenie.IdSamochod = Samochod.IdSamochod
				LEFT JOIN dbo.Model
				ON Samochod.Model = Model.Model
			LEFT JOIN dbo.Ubezpieczenie
			ON Wypozyczenie.IdUbezpieczenie = Ubezpieczenie.IdUbezpieczenie
			LEFT JOIN dbo.WypozyczenieUsluga
			ON Wypozyczenie.IdWypozyczenie = WypozyczenieUsluga.IdWypozyczenie
				LEFT JOIN dbo.Usluga
				ON WypozyczenieUsluga.IdUsluga = Usluga.IdUsluga
	WHERE Klient.IdKlient = @Par_IdKlient
	FOR XML PATH('DaneArchiwalne'), ROOT('Archiwum')
);

-- Wstawianie danych do tabeli archiwalnej
INSERT INTO dbo.Klient_Kopia
VALUES
(@Var_DaneXML, GETDATE());

-- Usuniêcie powi¹zanych informacji
DELETE FROM dbo.WypozyczenieUsluga 
WHERE IdWypozyczenie IN (SELECT IdWypozyczenie FROM dbo.Wypozyczenie WHERE IdKlient = @Par_IdKlient);
DELETE FROM dbo.Wypozyczenie 
WHERE IdKlient = @Par_IdKlient;
DELETE FROM dbo.KlientUprawnienia
WHERE IdKlient = @Par_IdKlient;

-- WAITFOR DELAY '00:00:15';

-- Usuwanie klienta z tabeli.
DELETE FROM dbo.Klient
WHERE IdKlient = @Par_IdKlient;

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Archiwizacja danych klienta nie powiod³a siê.', 16, 1);
	ROLLBACK TRANSACTION
END
ELSE
	COMMIT TRANSACTION

END;
GO

/*
EXECUTE dbo.Klient_Archiwizuj
@Par_IdKlient = 5;
GO
*/

---------------------------------------------------------------------------------------------------
-- (Zad.4) Programowanie i testowanie procedur wyzwalanych (ang. triggers).
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
-- W1. Unikalnoœæ pola opcjonalnego "NIP" w tabeli [Klient].
-- Procedura wyzwalana typu AFTER.
---------------------------------------------------------------------------------------------------

ALTER TABLE dbo.Klient
ADD NIP char(10) NULL;
GO

/*
SELECT *
FROM dbo.Klient;
GO
*/

CREATE TRIGGER dbo.tr_Klient_A_IU
ON dbo.Klient
AFTER INSERT, UPDATE
AS
BEGIN
DECLARE @Var_NIP char(10);

SELECT @Var_NIP = NIP
FROM [inserted]; -- tabela z kopi¹ wiersza wstawianego do tabeli [Klient].

IF (@Var_NIP IS NOT NULL)
AND ((SELECT COUNT(*)
	  FROM dbo.Klient
	  WHERE NIP = @Var_NIP) > 1)
BEGIN
	RAISERROR('Numer NIP musi byæ unikalny', 16, 1);
	ROLLBACK TRANSACTION
END
END;
GO

/*
UPDATE dbo.Klient
SET NIP = '111122223'
WHERE IdKlient = 1;
GO

UPDATE dbo.Klient
SET NIP = '111122223'
WHERE IdKlient = 2;
GO
*/

---------------------------------------------------------------------------------------------------
-- W2. Wycofanie niedozwolonej operacji usuwania zrealizowanego wypo¿yczenia.
-- Procedura wyzwalana typu INSTEAD OF.
---------------------------------------------------------------------------------------------------

CREATE TRIGGER dbo.tr_Wypozyczenie_I_D
ON dbo.Wypozyczenie
INSTEAD OF DELETE
AS
BEGIN

DECLARE @Var_IdWypozyczenie int;

SELECT @Var_IdWypozyczenie = IdWypozyczenie
FROM [deleted];

IF EXISTS (
    SELECT 1
    FROM [deleted]
    WHERE StatusWypozyczenia = 0
)
    RAISERROR('Nie mo¿na usun¹æ zrealizowanego wypo¿yczenia.', 16, 1);
ELSE
    DELETE FROM dbo.Wypozyczenie
    WHERE IdWypozyczenie = @Var_IdWypozyczenie;
END;
GO

/*
DELETE FROM dbo.Wypozyczenie
WHERE IdWypozyczenie = 2;
GO
*/

---------------------------------------------------------------------------------------------------
-- W3. "Miêkkie" usuwanie wierszy - oznaczanie ich jako nieaktywnych.
-- Procedura wyzwalana typu INSTEAD OF.
---------------------------------------------------------------------------------------------------

-- Wprowadzenie dodatkowej kolumny [Aktywny] do tabeli [Klient],
-- oznaczaj¹cej status wiersza: "1" - aktywny; "0" - usuniêty.
--
ALTER TABLE dbo.Klient
ADD Aktywny bit NULL;
GO

/*
UPDATE dbo.Klient
SET Aktywny = 1;
GO
*/

CREATE TRIGGER dbo.tr_Klient_I_D
ON dbo.Klient
INSTEAD OF DELETE
AS
BEGIN

DECLARE @Var_IdKlient int;

SELECT @Var_IdKlient = IdKlient
FROM [deleted]; -- Tabela z kopi¹ wiersza usuniêtego z tabeli [Klient].

UPDATE dbo.Klient
SET Aktywny = 0
WHERE IdKlient = @Var_IdKlient;

END;
GO

-- Widok zwracaj¹cy wy³¹cznie wiersze nieusuniête.
--
CREATE VIEW dbo.Klienci_Aktywni
AS
SELECT IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi, NIP
FROM dbo.Klient
WHERE Aktywny = 1;
GO

/*
SELECT *
FROM dbo.Klienci_Aktywni;
GO
*/

---------------------------------------------------------------------------------------------------
-- W4. Zabezpieczenie schematy bazy danych przed niedozwolonymi modyfikacjami.
-- Procedura wyzwalana DDL.
---------------------------------------------------------------------------------------------------

CREATE TRIGGER tr_ZabezpieczenieSchematu
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    RAISERROR('Nie mo¿esz modyfikowaæ struktury tabel.', 16, 1)
    ROLLBACK;
END;

/*
CREATE TABLE A 
(
	Id int NOT NULL
);
GO
*/

---------------------------------------------------------------------------------------------------
-- (Zad.11*) Wywo³anie zakleszczenia (ang. deadlock) procesów wspó³bie¿nych.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- Procedura "dbo.WypozyczenieUsluga_Dodaj_WU".
--
-- Modyfikacja tabel: [Wypozyczenie] --> [Usluga].
---------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.WypozyczenieUsluga_Dodaj_WU
@Par_IdWypozyczenieUsluga int,
@Par_IdWypozyczenie int,
@Par_IdUsluga int,
@Par_CenaWypozyczenia money,
@Par_Uwagi varchar(2000)
AS
BEGIN

SET XACT_ABORT ON;

BEGIN TRANSACTION

DECLARE @Var_Dostepnosc int;

SELECT @Var_Dostepnosc = Dostepnosc
FROM dbo.Usluga
WHERE IdUsluga = @Par_IdUsluga;

IF (@Var_Dostepnosc IS NULL OR @Var_Dostepnosc > 0)
BEGIN

-- (1) Zwiêkszenie ³¹cznej wartoœci przewidywanej wypo¿yczenia w tabeli [Wypozyczenie].
UPDATE dbo.Wypozyczenie
SET CenaPrzewidywana = CenaPrzewidywana + @Par_CenaWypozyczenia
WHERE IdWypozyczenie = @Par_IdWypozyczenie;

WAITFOR DELAY '00:00:15';

-- (2) Zmniejszenie dostêpnoœci us³ugi
IF (@Var_Dostepnosc IS NOT NULL)
	UPDATE dbo.Usluga
	SET Dostepnosc = Dostepnosc - 1
	WHERE IdUsluga = @Par_IdUsluga;

-- (3) Wstawienie wiersza do tabeli [WypozyczenieUsluga]
INSERT dbo.WypozyczenieUsluga
(IdWypozyczenieUsluga, IdWypozyczenie, IdUsluga, Uwagi)
VALUES
(@Par_IdWypozyczenieUsluga, @Par_IdWypozyczenie, @Par_IdUsluga, @Par_Uwagi);

END

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Dodanie nowej us³ugi do wypo¿yczenia nie powiod³o siê', 16, 1);
	ROLLBACK TRANSACTION
END
ELSE
	COMMIT TRANSACTION;
END;
GO

/*
EXECUTE dbo.WypozyczenieUsluga_Dodaj_WU
@Par_IdWypozyczenieUsluga = 11,
@Par_IdWypozyczenie = 3,
@Par_IdUsluga = 9,
@Par_CenaWypozyczenia = 1000.00,
@Par_Uwagi = 'Brak';
GO
*/

---------------------------------------------------------------------------------------------------
-- Procedura "dbo.WypozyczenieUsluga_Dodaj_UW".
--
-- Modyfikacja tabel: [Usluga] --> [Wypozyczenie].
---------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.WypozyczenieUsluga_Dodaj_UW
@Par_IdWypozyczenieUsluga int,
@Par_IdWypozyczenie int,
@Par_IdUsluga int,
@Par_CenaWypozyczenia money,
@Par_Uwagi varchar(2000)
AS
BEGIN

SET XACT_ABORT ON;

BEGIN TRANSACTION

DECLARE @Var_Dostepnosc int;

SELECT @Var_Dostepnosc = Dostepnosc
FROM dbo.Usluga
WHERE IdUsluga = @Par_IdUsluga;

IF (@Var_Dostepnosc IS NULL OR @Var_Dostepnosc > 0)
BEGIN

-- (1) Zmniejszenie dostêpnoœci us³ugi
IF (@Var_Dostepnosc IS NOT NULL)
	UPDATE dbo.Usluga
	SET Dostepnosc = Dostepnosc - 1
	WHERE IdUsluga = @Par_IdUsluga;

WAITFOR DELAY '00:00:15';

-- (2) Zwiêkszenie ³¹cznej wartoœci przewidywanej wypo¿yczenia w tabeli [Wypozyczenie].
UPDATE dbo.Wypozyczenie
SET CenaPrzewidywana = CenaPrzewidywana + @Par_CenaWypozyczenia
WHERE IdWypozyczenie = @Par_IdWypozyczenie;

-- (3) Wstawienie wiersza do tabeli [WypozyczenieUsluga]
INSERT dbo.WypozyczenieUsluga
(IdWypozyczenieUsluga, IdWypozyczenie, IdUsluga, Uwagi)
VALUES
(@Par_IdWypozyczenieUsluga, @Par_IdWypozyczenie, @Par_IdUsluga, @Par_Uwagi);

END

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Dodanie nowej us³ugi do wypo¿yczenia nie powiod³o siê', 16, 1);
	ROLLBACK TRANSACTION
END
ELSE
	COMMIT TRANSACTION;
END;
GO

/*
EXECUTE dbo.WypozyczenieUsluga_Dodaj_UW
@Par_IdWypozyczenieUsluga = 12,
@Par_IdWypozyczenie = 3,
@Par_IdUsluga = 9,
@Par_CenaWypozyczenia = 1000.00,
@Par_Uwagi = 'Brak';
GO
*/

---------------------------------------------------------------------------------------------------
-- Uruchomienie procedury "dbo.WypozyczenieUsluga_Dodaj_UW"
-- z poziomu procesu 1 (spid = 51).
---------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.WypozyczenieUsluga_Skasuj 12;
GO
*/

/*
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
*/

/*
EXECUTE dbo.WypozyczenieUsluga_Dodaj_UW
@Par_IdWypozyczenieUsluga = 12,
@Par_IdWypozyczenie = 3,
@Par_IdUsluga = 9,
@Par_CenaWypozyczenia = 1000.00,
@Par_Uwagi = 'Brak';
GO
*/

/*
(1 row affected)

(1 row affected)

(1 row affected)
*/

---------------------------------------------------------------------------------------------------
-- Koniec.
---------------------------------------------------------------------------------------------------