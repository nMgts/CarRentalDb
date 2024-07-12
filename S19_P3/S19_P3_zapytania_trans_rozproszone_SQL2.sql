---------------------------------------------------------------------------------------------------------------------------
-- SRBD_C5: zapytania rozproszone i transakcje 2PC.
---------------------------------------------------------------------------------------------------------------------------
-- Dokumentacja testowania
---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- Zad.2a. Utworzenie s³ownika oddzia³ów firmy.
---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE dbo.Oddzial
(
	IdOddzial int NOT NULL PRIMARY KEY,
	OddzialNazwa varchar(50) NOT NULL,
	OddzialMiasto varchar(50) NOT NULL,
	SerwerNazwa varchar(100) NOT NULL,
	OddzialOpis varchar(100) NULL,
	OddzialLokalny bit NOT NULL
);
GO

INSERT dbo.Oddzial
(IdOddzial, OddzialNazwa, OddzialMiasto, SerwerNazwa, OddzialOpis, OddzialLokalny)
VALUES
(1, 'centrala', 'Kalisz', 'SQL1', 'centrala', 0),
(2, 'sklep', 'Kraków', 'SQL2', 'sklep', 1),
(3, 'sklep i serwis', 'Warszawa', 'SQL3', 'sklep i serwis', 0);
GO

/*
SELECT *
FROM dbo.Oddzial;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- Identyfikatory oddzia³ówdodane s¹do tabel [Klient] oraz [Pracownik] jako klucze obce wskazuj¹ce na tabelê [Oddzial].
---------------------------------------------------------------------------------------------------------------------------

ALTER TABLE dbo.Klient
ADD IdOddzial int NULL;
GO

ALTER TABLE dbo.Pracownik
ADD IdOddzial int NULL;
GO

ALTER TABLE dbo.Samochod
ADD IdOddzial int NULL;
GO

ALTER TABLE dbo.Klient
ADD CONSTRAINT FK_Klient_Oddzial
FOREIGN KEY (IdOddzial)
REFERENCES dbo.Oddzial(IdOddzial);
GO

ALTER TABLE dbo.Pracownik
ADD CONSTRAINT FK_Pracownik_Oddzial
FOREIGN KEY (IdOddzial)
REFERENCES dbo.Oddzial(IdOddzial);
GO

ALTER TABLE dbo.Samochod
ADD CONSTRAINT FK_Samochod_Oddzial
FOREIGN KEY (IdOddzial)
REFERENCES dbo.Oddzial(IdOddzial);
GO

UPDATE dbo.Klient
SET IdOddzial = 2;
GO

UPDATE dbo.Pracownik
SET IdOddzial = 2;
GO

UPDATE dbo.Samochod
SET IdOddzial = 2;
GO

SELECT *
FROM dbo.Klient;
GO

SELECT *
FROM dbo.Pracownik;
GO

SELECT *
FROM dbo.Samochod;
GO

---------------------------------------------------------------------------------------------------------------------------
-- (TR3) Obs³uga wypo¿yczeñ z uwzglêdnieniem bie¿¹cej dostêpnoœci samochodu w oddziale lokalnym oraz zdalnym.
---------------------------------------------------------------------------------------------------------------------------

-- Nowa tabela [Przeniesienie], przechowuk¹ca informacjê o tym, do którego
-- oddzia³u ma byæ dostarczony samochód.
--
CREATE TABLE dbo.Przeniesienie
(
	IdPrzeniesienie int NOT NULL PRIMARY KEY IDENTITY (1,1),
	DataGodzPolecenia datetime NOT NULL,
	DataGodzOdbioru datetime NULL,
	IdOddzialZam int NOT NULL,
	IdSamochod int NOT NULL,
	Uwagi varchar(100) NULL
);
GO

ALTER TABLE dbo.Przeniesienie
ADD CONSTRAINT FK_Przeniesienie_Oddzial
FOREIGN KEY(IdOddzialZam)
REFERENCES dbo.Oddzial(IdOddzial);
GO

ALTER TABLE dbo.Przeniesienie
ADD CONSTRAINT FK_Przeniesienie_Samochod
FOREIGN KEY(IdSamochod)
REFERENCES dbo.Samochod(IdSamochod);
GO

---------------------------------------------------------------------------------------------------------------------------
-- Oznaczenie wiersza jako nieaktywnego na serwerze lokalnym.
-- (Procedura wyzwalana typu INSTEAD OF.)
---------------------------------------------------------------------------------------------------------------------------
-- Nie ma potrzeby realizowania tej zmiany do serwera zdalnego, poniewa¿ zostanie ona tam przes³ana przez procedur¹
-- wyzwalan¹ obs³uguj¹c¹ operacjê UPDATE.
---------------------------------------------------------------------------------------------------------------------------


ALTER TABLE dbo.Samochod
ADD Aktywny bit NULL;
GO

UPDATE dbo.Samochod
SET Aktywny = 1;
GO

---------------------------------------------------------------------------------------------------------------------------
-- Koniec.
---------------------------------------------------------------------------------------------------------------------------