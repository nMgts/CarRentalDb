---------------------------------------------------------------------
-- SRBD_C6: replikacja danych.
---------------------------------------------------------------------

-- Pobranie wierszy z tabeli w bazie lokalnej.
--
SELECT *
FROM dbo.Kategoria;
GO

-- Pobranie wierszy z tabeli w bazie zdalnej - poprzez serwer po³¹czony "LS_SQL2"
--
SELECT *
FROM LS_SQL2.S19_C6.dbo.Kategoria;
GO

-- Modyikacja wiersza z tabeli [Kategoria] na serwerze lokalnym SQL1.
--
UPDATE dbo.Kategoria
SET Cena = 240
WHERE Kategoria = 'Dostawcze';
GO

-- Pobranie wierszy z tabeli w bazie lokalnej.
--
SELECT *
FROM dbo.Marka;
GO

-- Pobranie wierszy z tabeli w bazie zdalnej - poprzez serwer po³¹czony "LS_SQL2"
--
SELECT *
FROM LS_SQL2.S19_C6.dbo.Marka;
GO

-- Wstawienie wiersza do tabeli [Marka] w bazie lokalnej.
--
INSERT dbo.Marka
(Marka)
VALUES
('Ferrari'),
('Alfa Romeo');
GO

-- Pobranie wierszy z tabeli w bazie lokalnej.
--
SELECT *
FROM dbo.Model;
GO

-- Pobranie wierszy z tabeli w bazie zdalnej - poprzez serwer po³¹czony "LS_SQL2"
--
SELECT *
FROM LS_SQL2.S19_C6.dbo.Model;
GO

-- Wstawienie wiersza do tabeli [Model] w bazie lokalnej.
--
INSERT dbo.Model
(Model, Marka)
VALUES
('488', 'Ferrari'),
('California F1 DCT', 'Ferrari');
GO

-- Usuniêcie wiersza z tabeli [Model] w bazie lokalnej.
--
DELETE dbo.Model
WHERE Model = '488';
GO

-- Pobranie wierszy z tabeli w bazie lokalnej.
--
SELECT *
FROM dbo.Samochod;
GO

-- Pobranie wierszy z tabeli w bazie zdalnej - poprzez serwer po³¹czony "LS_SQL2"
--
SELECT *
FROM LS_SQL2.S19_C6.dbo.Samochod;
GO

-- Pobranie wierszy z tabeli w bazie lokalnej.
--
SELECT *
FROM dbo.Usluga;
GO

-- Pobranie wierszy z tabeli w bazie zdalnej - poprzez serwer po³¹czony "LS_SQL2"
--
SELECT *
FROM LS_SQL2.S19_C6.dbo.Usluga;
GO

-- Pobranie wierszy z tabeli w bazie lokalnej.
--
SELECT *
FROM dbo.Ubezpieczenie;
GO

-- Pobranie wierszy z tabeli w bazie zdalnej - poprzez serwer po³¹czony "LS_SQL2"
--
SELECT *
FROM LS_SQL2.S19_C6.dbo.Ubezpieczenie;
GO

-- Pobranie wierszy z tabeli w bazie lokalnej.
--
SELECT *
FROM dbo.Uprawnienia;
GO

-- Pobranie wierszy z tabeli w bazie zdalnej - poprzez serwer po³¹czony "LS_SQL2"
--
SELECT *
FROM LS_SQL2.S19_C6.dbo.Uprawnienia;
GO

-- Pobranie wierszy z tabeli w bazie lokalnej.
--
SELECT *
FROM dbo.Platnosc;
GO

-- Pobranie wierszy z tabeli w bazie zdalnej - poprzez serwer po³¹czony "LS_SQL2"
--
SELECT *
FROM LS_SQL2.S19_C6.dbo.Platnosc;
GO