---------------------------------------------------------------------------------------------------------------------------
-- SRBD_C5: zapytania rozproszone i transakcje 2PC.
---------------------------------------------------------------------------------------------------------------------------
-- Dokumentacja testowania
---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- Zad.2a. Utworzenie s�ownika oddzia��w firmy.
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
(1, 'centrala', 'Kalisz', 'SQL1', 'centrala', 1),
(2, 'sklep', 'Krak�w', 'SQL2', 'sklep', 0),
(3, 'sklep i serwis', 'Warszawa', 'SQL3', 'sklep i serwis', 0);
GO

/*
SELECT *
FROM dbo.Oddzial;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- Identyfikatory oddzia��w dodane s� do tabel [Klient], [Samochod] i [Pracownik] jako klucze obce wskazuj�ce na tabel� [Oddzial].
---------------------------------------------------------------------------------------------------------------------------

ALTER TABLE dbo.Klient
ADD IdOddzial int NULL;
GO

ALTER TABLE dbo.Pracownik
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

UPDATE dbo.Klient
SET IdOddzial = 1;
GO

UPDATE dbo.Pracownik
SET IdOddzial = 1;
GO

---------------------------------------------------------------------------------------------------------------------------
-- Zad.3. Zapytania rozproszone.
---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- (ZR1a) Wszyscy pracownicy zatrudnieni w dw�ch oddzia�ach firmy. (Suma wierszyz dw�ch tabel bez powt�rze� - operator UNION.)
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Pracownicy_Wszyscy_RBD
AS
BEGIN
SELECT IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail
FROM dbo.Pracownik

UNION

SELECT IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail
FROM LS_SQL2.S19_P3.dbo.Pracownik

ORDER BY NAZWISKO ASC, Imie ASC
END;
GO

/*
EXECUTE dbo.Pracownicy_Wszyscy_RBD;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR1b) Wszyscy pracownicy z dw�ch oddzia��w firmy ze wskazaniem oddzia�u, w kt�rym s� zatrudnieni. (Suma wierszy z dw�ch 
--	      tabel z powt�rzeniami - operator UNION ALL. Z��czenia z tabel� s�ownikaoddzia��w w celu ustalenia lokalizacji wierszy.)
---------------------------------------------------------------------------------------------------------------------------
-- W z��czeniach zdalnych konieczne jest u�ycie alias�w zamiast 4-cz�onowych nazw obiekt�wna serwerze po��czonym, poniewa�
-- niedopuszczalne by�oby odw�anie do kolumn tabel poprzez nazwy 5-cz�onowe.
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Pracownicy_Wszyscy_Oddzialy_RBD
AS
BEGIN
SELECT Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail, OddzialMiasto
FROM dbo.Pracownik
	INNER JOIN dbo.Oddzial
	ON dbo.Pracownik.IdOddzial = dbo.Oddzial.IdOddzial

UNION ALL

SELECT Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail, OddzialMiasto
FROM LS_SQL2.S19_P3.dbo.Pracownik AS ZP
	INNER JOIN LS_SQL2.S19_P3.dbo.Oddzial AS ZO
	ON ZP.IdOddzial = ZO.IdOddzial

ORDER BY NAZWISKO ASC, Imie ASC, OddzialMiasto ASC;
END;
GO

/*
EXECUTE dbo.Pracownicy_Wszyscy_Oddzialy_RBD;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR2) Pracownicy zatrudnieni jednocze�nie w dw�ch oddzia�ach firmy. (Przekr�j, cz�� wsp�lna dw�ch tabel - operator INSERECT).
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Pracownicy_Wspolni_RBD
AS
BEGIN
SELECT IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail
FROM dbo.Pracownik

INTERSECT

SELECT IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail
FROM LS_SQL2.S19_P3.dbo.Pracownik

ORDER BY NAZWISKO ASC, Imie ASC
END;
GO

/*
EXECUTE dbo.Pracownicy_Wspolni_RBD;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR3a) Pracownicy zatrudnieni tylko w lokalnym oddziale firmy. (R�nica dw�ch tabel - operator EXCEPT.)
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Pracownicy_Lokalni_RBD
AS
BEGIN
SELECT IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail
FROM dbo.Pracownik

EXCEPT

SELECT IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail
FROM LS_SQL2.S19_P3.dbo.Pracownik

ORDER BY NAZWISKO ASC, Imie ASC
END;
GO

/*
EXECUTE dbo.Pracownicy_Lokalni_RBD;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR3b) Pracownicy zatrudnieni tylko w zdalnym oddziale firmy. (R�nica dw�ch tabel - operator EXCEPT.)
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Pracownicy_Zdalni_RBD
AS
BEGIN
SELECT IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail
FROM LS_SQL2.S19_P3.dbo.Pracownik

EXCEPT

SELECT IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail
FROM dbo.Pracownik

ORDER BY NAZWISKO ASC, Imie ASC
END;
GO

/*
EXECUTE dbo.Pracownicy_Zdalni_RBD;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR4a) Wyszukiwanie klient�w zarejestrowanych w dw�ch oddzia�ach firmy - wzgl�dem wzorca znakowego w nazwiksu.
--	      (Suma wierszy z powt�rzeniami - operator UNION ALL.)
---------------------------------------------------------------------------------------------------------------------------
-- Lokalizacja wierszy ustalana jest przy u�yciu kolumny wirtualnej "Oddzia�". Jest to rozwi�zanie proste, ale ma�o elastyczne
-- - przeniesienie tej procedury na inny serwer wymaga modyfikacji kodu.
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Klient_Znajdz_RBD
@Par_Nazwisko varchar(40) = ''
AS
BEGIN
SELECT IdKlient, Imie, Nazwisko, Miejscowosc, AdresMail, 'Kalisz' AS [Oddzial]
FROM dbo.Klient
WHERE Nazwisko LIKE '%' + LTRIM(RTRIM(@Par_Nazwisko)) + '%'

UNION ALL

SELECT IdKlient, Imie, Nazwisko, Miejscowosc, AdresMail, 'Krak�w' AS [Oddzial]
FROM LS_SQL2.S19_P3.dbo.Klient
WHERE Nazwisko LIKE '%' + LTRIM(RTRIM(@Par_Nazwisko)) + '%'

ORDER BY Nazwisko ASC, Imie ASC, [Oddzial] ASC;
END;
GO

/*
EXECUTE dbo.Klient_Znajdz_RBD
@Par_Nazwisko = '';
GO

EXECUTE dbo.Klient_Znajdz_RBD
@Par_Nazwisko = '   n   ';
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR4b) Wyszukiwanie klient�w zarejestrowanych w dw�ch oddzia�ach firmy - wzgl�dem wzorca znakowego w nazwiksu.
--	      (Suma wierszy z powt�rzeniami - operator UNION ALL.)
---------------------------------------------------------------------------------------------------------------------------
-- Lokalizacja wierszy ustalana jest poprzez z��czenie ze s�ownikiem oddzia��w [Oddzial].
-- Jest to rozwi�zanie elastyczne, poniewa� przy odpowiedniej konfiguracji serwer�w bazy rozproszonej mo�na u�y� tej
-- procedury w wielu oddzia�ach bez modyfikacji kodu.
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Klient_Znajdz_Oddzialy_RBD
@Par_Nazwisko varchar(40) = ''
AS
BEGIN
SELECT IdKlient, Imie, Nazwisko, Miejscowosc, AdresMail,
	   OddzialNazwa + ' ' + OddzialMiasto AS [Lokalizacja]
FROM dbo.Klient
	INNER JOIN dbo.Oddzial
	ON dbo.Klient.IdOddzial = dbo.Oddzial.IdOddzial
WHERE Nazwisko LIKE '%' + LTRIM(RTRIM(@Par_Nazwisko)) + '%'

UNION ALL

SELECT IdKlient, Imie, Nazwisko, Miejscowosc, AdresMail,
	   OddzialNazwa + ' ' + OddzialMiasto AS [Lokalizacja]
FROM LS_SQL2.S19_P3.dbo.Klient AS ZK
	INNER JOIN LS_SQL2.S19_P3.dbo.Oddzial AS ZO
	ON ZK.IdOddzial = ZO.IdOddzial

WHERE Nazwisko LIKE '%' + LTRIM(RTRIM(@Par_Nazwisko)) + '%'

ORDER BY Nazwisko ASC, Imie ASC, [Lokalizacja] ASC;
END;
GO

/*
EXECUTE dbo.Klient_Znajdz_Oddzialy_RBD
@Par_Nazwisko = '';
GO

EXECUTE dbo.Klient_Znajdz_Oddzialy_RBD
@Par_Nazwisko = '   n   ';
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR5) �ledzenie dost�pno�ci samochod�w w oddzia�ach. Zwracane s� dane wybranego samochodu lub samochod�w (domy�lnie). 
--		 (Suma tabel z powt�rzeniami - operator UNION ALL.)
---------------------------------------------------------------------------------------------------------------------------
-- Procedura zosta�a sparametryzowana w taki spos�b, aby mo�na by�o j� wdro�y� w ka�dym oddziale bazyrozproszonej - bez
-- wi�kszych modyfikacji kodu.
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Samochod_Dostepnosc_RBD
@Par_IdSamochod int,
@Par_IdOddzialLokalny int,
@Par_IdOddzialZdalny int
AS
BEGIN
DECLARE @Var_OddzialLokalny_Miasto varchar(50),
		@Var_OddzialZdalny_Miasto varchar(50);

SELECT @Var_OddzialLokalny_Miasto = OddzialMiasto
FROM dbo.Oddzial
WHERE IdOddzial = @Par_IdOddzialLokalny;

SELECT @Var_OddzialZdalny_Miasto = OddzialMiasto
FROM dbo.Oddzial
WHERE IdOddzial = @Par_IdOddzialZdalny;

SELECT IdSamochod, Kategoria, Marka, Samochod.Model, Rocznik, @Var_OddzialLokalny_Miasto AS [OddzialFirmy], Dostepnosc
FROM dbo.Samochod
	INNER JOIN dbo.Model
	ON dbo.Samochod.Model = Model.Model
WHERE (IdSamochod = @Par_IdSamochod) OR (@Par_IdSamochod IS NULL)

UNION ALL

SELECT IdSamochod, Kategoria, Marka, ZS.Model, Rocznik, @Var_OddzialZdalny_Miasto AS [OddzialFirmy], Dostepnosc
FROM LS_SQL2.S19_P3.dbo.Samochod AS ZS
	INNER JOIN LS_SQL2.S19_P3.dbo.Model AS ZM
	ON ZS.Model = ZM.Model
WHERE (IdSamochod = @Par_IdSamochod) OR (@Par_IdSamochod IS NULL)

ORDER BY Model ASC, Marka ASC, [OddzialFirmy] ASC;

END;
GO

/*
EXECUTE dbo.Samochod_Dostepnosc_RBD
@Par_IdSamochod = NULL,
@Par_IdOddzialLokalny = 1,
@Par_IdOddzialZdalny = 2;
GO

EXECUTE dbo.Samochod_Dostepnosc_RBD
@Par_IdSamochod = 5,
@Par_IdOddzialLokalny = 1,
@Par_IdOddzialZdalny = 2
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR6a) Liczba i warto�� wypo�ycze� poszczeg�lnych klient�w realizowanych w dw�dz oddzia�ach firmy: SQL1 i SQL2.
--		  (Globalne zapytanie statystyczne z wykorzystaniem tabeli po�redniej.)
---------------------------------------------------------------------------------------------------------------------------
-- Zapytanie realizowane jest dwustopniowa: (1) najpierw z��czane i sumowane s� wiersze z obu serwer�w (tabela po�rednia -
-- zbi�r wierszy oznaczony aliasem "Wyp_RBD"), a nast�pnie (2) na tym zbiorze wykonywane jest grupowanie i agregowanie wierszy.
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Klienci_Wypozyczenia_RBD_TP
@Par_DataOd date = '1900-01-01',
@Par_DataDo date = '2200-12-31',
@Par_MinWartosc money = 0.00
AS
BEGIN
-- Zapytanie wewn�trzne - agregacja wierszy z tabeli po�redniej
SELECT Wyp_RBD.IdKlient, Wyp_RBD.Imie, Wyp_RBD.Nazwisko, Wyp_RBD.Miejscowosc,
	   COUNT(*) AS [LiczbaWyp],
	   SUM(CASE
			WHEN Wyp_RBD.CenaOstateczna IS NULL
			THEN Wyp_RBD.CenaPrzewidywana
			ELSE ISNULL(Wyp_RBD.CenaOstateczna, 0) END)
	   AS [LacznaWartosc]
FROM
-- Zapytanie wewn�trzne - tabela po�rednia, ��cz�ca wiersze z dw�ch serwer�w
(SELECT dbo.Klient.IdKlient, Imie, Nazwisko, Miejscowosc, CenaPrzewidywana, CenaOstateczna
FROM dbo.Klient
	INNER JOIN dbo.Wypozyczenie
	ON dbo.Klient.IdKlient = dbo.Wypozyczenie.IdKlient
WHERE (DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo)

UNION ALL

SELECT ZK.IdKlient, Imie, Nazwisko, Miejscowosc, CenaPrzewidywana, CenaOstateczna
FROM LS_SQL2.S19_P3.dbo.Klient AS ZK
	INNER JOIN LS_SQL2.S19_P3.dbo.Wypozyczenie AS ZW
	ON ZK.IdKlient = ZW.IdKlient
WHERE DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo) AS Wyp_RBD

-- Ci�g dalszy zapytania zewn�trznego - agreguj�cego.
GROUP BY Wyp_RBD.IdKlient, Wyp_RBD.Imie, Wyp_RBD.Nazwisko, Wyp_RBD.Miejscowosc
HAVING SUM(CenaOstateczna) >= @Par_MinWartosc
ORDER BY [LacznaWartosc] DESC, [LiczbaWyp] DESC, Wyp_RBD.Nazwisko ASC;

END;
GO

/*
EXECUTE dbo.Klienci_Wypozyczenia_RBD_TP;
GO

EXECUTE dbo.Klienci_Wypozyczenia_RBD_TP
@Par_DataOd = '2022-12-31',
@Par_DataDo = '2023-06-12',
@Par_MinWartosc = 500.00;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR6b) Liczba i warto�� zam�wie� poszczeg�lnych klient�w realizowanych w dw�ch oddzia�ach firmy: SQL1 i SQL2.
--		  (Globalne zapytanie statystczne z wykorzystaniem tabeli CTE.)
---------------------------------------------------------------------------------------------------------------------------
-- Jest to pytanie analogiczne do "Klienci_Wypozyczenia_RBD_TP", ale realizowane przy u�yciu wygodniejszego mechanizmu
-- - tabeli typu CTE (ang. common table expression). Zapytanie realizowane jest dwustopniowo: (1) najpierw z��czane
-- i sumowane s�wiersze z obu serwer�w (tabela CTE o nazwie "KlienciWypRBP_CTE" - w istocie jest to widok),
-- a nast�pnie (2) w tabeli CTE wykonywane jest grupowanie i agregowanie wierszy.
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Klienci_Wypozyczenia_RBD_CTE
@Par_DataOd date = '1900-01-01',
@Par_DataDo date = '2200-12-31',
@Par_MinWartosc money = 0.00
AS
BEGIN
-- Pierwsza cz�� - definicja tabeli (ang. common table expression)
-- ��cz�cej dane z dw�ch serwer�w.
WITH KlienciWypRBD_CTE(IdKlient, Imie, Nazwisko, Miejscowosc, CenaPrzewidywana, CenaOstateczna)
AS
(SELECT dbo.Klient.IdKlient, Imie, Nazwisko, Miejscowosc, CenaPrzewidywana, CenaOstateczna
FROM dbo.Klient
	INNER JOIN dbo.Wypozyczenie
	ON dbo.Klient.IdKlient = dbo.Wypozyczenie.IdKlient
WHERE (DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo)

UNION ALL

SELECT ZK.IdKlient, Imie, Nazwisko, Miejscowosc, CenaPrzewidywana, CenaOstateczna
FROM LS_SQL2.S19_P3.dbo.Klient AS ZK
	INNER JOIN LS_SQL2.S19_P3.dbo.Wypozyczenie AS ZW
	ON ZK.IdKlient = ZW.IdKlient
WHERE DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo)

SELECT IdKlient, Imie, Nazwisko, Miejscowosc, 
	   COUNT(*) AS [LiczbaWyp],
	   	   SUM(CASE
			WHEN CenaOstateczna IS NULL
			THEN CenaPrzewidywana
			ELSE ISNULL(CenaOstateczna, 0) END)
	   AS [LacznaWartosc]
FROM KlienciWypRBD_CTE
GROUP BY IdKlient, Imie, Nazwisko, Miejscowosc
HAVING SUM(CenaOstateczna) >= @Par_MinWartosc
ORDER BY [LacznaWartosc] DESC, [LiczbaWyp] DESC, Nazwisko ASC;

END;
GO

/*
EXECUTE dbo.Klienci_Wypozyczenia_RBD_CTE;
GO

EXECUTE dbo.Klienci_Wypozyczenia_RBD_CTE
@Par_DataOd = '2022-12-31',
@Par_DataDo = '2023-06-12',
@Par_MinWartosc = 500.00;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR7) Popularno�� samochod�w poszczeg�lnych marek w zadanym okresie - we wszystkich oddzia�ach firmy.
--		  (Globalne zapytanie statystycze z wykorzystaniem tabeli CTE.)
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Marki_Popularnosc_RBD_CTE
@Par_DataOd date = '1900-01-01',
@Par_DataDo date = '2200-12-31',
@Par_MinWartosc money = 0.00
AS
BEGIN
-- Pierwsza cz�� - definicja tabeli (ang. common table expression)
-- ��cz�cej dane z dw�ch serwer�w.
WITH MarWypRBD_CTE(Marka, Wartosc)
AS
(SELECT Marka, Cena
FROM dbo.Model
	INNER JOIN dbo.Samochod
	ON dbo.Samochod.Model = dbo.Model.Model
		INNER JOIN dbo.Wypozyczenie
		ON dbo.Wypozyczenie.IdSamochod = dbo.Samochod.IdSamochod
		INNER JOIN dbo.Kategoria
		ON dbo.Kategoria.Kategoria = dbo.Samochod.Kategoria
WHERE (DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo)

UNION ALL

SELECT Marka, Cena
FROM LS_SQL2.S19_P3.dbo.Model AS ZM
	INNER JOIN dbo.Samochod AS ZS
	ON ZS.Model = ZM.Model
		INNER JOIN dbo.Wypozyczenie AS ZW
		ON ZW.IdSamochod = ZS.IdSamochod
		INNER JOIN dbo.Kategoria AS ZK
		ON ZK.Kategoria = ZS.Kategoria
WHERE (DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo))

SELECT Marka, COUNT(*) AS [LiczbaWyp], SUM(Wartosc) AS [LacznaWartosc]
FROM MarWypRBD_CTE
GROUP BY Marka
HAVING SUM(Wartosc) >= @Par_MinWartosc
ORDER BY [LacznaWartosc] DESC, [LiczbaWyp] DESC, Marka ASC;

END;
GO

/*
EXECUTE dbo.Marki_Popularnosc_RBD_CTE;
GO

EXECUTE dbo.Marki_Popularnosc_RBD_CTE
@Par_DataOd = '2022-12-31',
@Par_DataDo = '2023-06-12',
@Par_MinWartosc = 500.00;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR8) Popularno�� us�ug w zadanym okresie - we wszystkich oddzia�ach firmy.
--		  (Globalne zapytanie statystycze z wykorzystaniem tabeli CTE.)
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Uslugi_Popularnosc_RBD_CTE
@Par_DataOd date = '1900-01-01',
@Par_DataDo date = '2200-12-31',
@Par_MinWartosc money = 0.00
AS
BEGIN
-- Pierwsza cz�� - definicja tabeli (ang. common table expression)
-- ��cz�cej dane z dw�ch serwer�w.
WITH UslWypRBD_CTE(UslugaNazwa, Wartosc)
AS
(SELECT Nazwa, Cena
FROM dbo.Usluga
	INNER JOIN dbo.WypozyczenieUsluga
	ON dbo.WypozyczenieUsluga.IdUsluga = dbo.Usluga.IdUsluga
		INNER JOIN dbo.Wypozyczenie
		ON dbo.Wypozyczenie.IdWypozyczenie = dbo.WypozyczenieUsluga.IdWypozyczenie
WHERE (DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo)

UNION ALL

SELECT Nazwa, Cena
FROM LS_SQL2.S19_P3.dbo.Usluga AS ZU
	INNER JOIN dbo.WypozyczenieUsluga AS ZWU
	ON ZWU.IdUsluga = ZU.IdUsluga
		INNER JOIN dbo.Wypozyczenie AS ZW
		ON ZW.IdWypozyczenie = ZWU.IdWypozyczenie
WHERE (DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo))

SELECT UslugaNazwa, COUNT(*) AS [LiczbaWyp], SUM(Wartosc) AS [LacznaWartosc]
FROM UslWypRBD_CTE
GROUP BY UslugaNazwa
HAVING SUM(Wartosc) >= @Par_MinWartosc
ORDER BY [LacznaWartosc] DESC, [LiczbaWyp] DESC, UslugaNazwa ASC;

END;
GO

/*
EXECUTE dbo.Uslugi_Popularnosc_RBD_CTE;
GO

EXECUTE dbo.Uslugi_Popularnosc_RBD_CTE
@Par_DataOd = '2022-12-31',
@Par_DataDo = '2023-06-12',
@Par_MinWartosc = 500.00;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (TR1) Aktualizacja danych samochodow na dw�ch serwerach.
---------------------------------------------------------------------------------------------------------------------------
-- Zgodnie z za�o�eniami projektowymi, dane samochod�w powinny by� synchronizowane w celu ujednolcenia oferty firmy we 
-- wszystkich oddzia�ach. Transakcj� t� nie jest jednak obj�te uzgadnianie dost�pno�ci samochod�w, kt�re mo�e by� r�ne
-- w poszczeg�lnych oddzia�ach.
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Samochod_Zmien_RBD
@Par_IdSamochod int, 
@Par_Kategoria varchar(20), 
@Par_Model varchar(20), 
@Par_IloscDrzwi int, 
@Par_Rocznik int, 
@Par_TypSilnika varchar(15), 
@Par_InformacjeDodatkowe varchar(1000)
AS
BEGIN
SET XACT_ABORT ON;
BEGIN DISTRIBUTED TRANSACTION
-- (1) Polecenie realizowane na serwerze lokalnym.
UPDATE dbo.Samochod
SET Kategoria = @Par_Kategoria, 
	Model = @Par_Model, 
	IloscDrzwi = @Par_IloscDrzwi, 
	Rocznik = @Par_Rocznik, 
	TypSilnika = @Par_TypSilnika, 
	InformacjeDodatkowe = @Par_InformacjeDodatkowe
WHERE IdSamochod = @Par_IdSamochod;

-- (2) Polecenie realizowane na serwerze zdalnym.
-- Odwo�anie poprzez obiekt serwera po��czonego (ang. linked server) o nazwie "LS_SQL2".
UPDATE LS_SQL2.S19_P3.dbo.Samochod
SET Kategoria = @Par_Kategoria, 
	Model = @Par_Model, 
	IloscDrzwi = @Par_IloscDrzwi, 
	Rocznik = @Par_Rocznik, 
	TypSilnika = @Par_TypSilnika, 
	InformacjeDodatkowe = @Par_InformacjeDodatkowe
WHERE IdSamochod = @Par_IdSamochod;

IF (@@ERROR <> 0)
	ROLLBACK TRANSACTION;
ELSE
	COMMIT TRANSACTION;
END;
GO

/*
SELECT *
FROM dbo.Samochod;
GO

SELECT *
FROM LS_SQL2.S19_P3.dbo.Samochod;
GO
*/

/*
EXECUTE dbo.Samochod_Zmien_RBD
@Par_IdSamochod = 1,
@Par_Kategoria = 'Premium', 
@Par_Model = 'Seria 7', 
@Par_IloscDrzwi = 5, 
@Par_Rocznik = 2023, 
@Par_TypSilnika = 'Benzyna', 
@Par_InformacjeDodatkowe = 'BMW 740d xDrive';
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (TR2) Kopiowanie danych klienta z bazy zdalnej do lokalnej.
---------------------------------------------------------------------------------------------------------------------------
-- Scenariusz: klient przychodzi do oddzia�u lokalnego i informuje, �e ju� wypo�ycza� samoch�d w innym oddziale naszej firmy
-- (nieanonimowo). Ewentualnie klient podaje swoje dane, a pracownik sprawdza czy nie zosta�y one ju� wprowadzone do systemu.
-- Je�eli tak, s� one kopiowane z oddzia�u zdalnego do bazy lokalnej.
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Klient_Kopiuj_RBD
@Par_Imie varchar(30),
@Par_Nazwisko varchar(40), 
@Par_AresMail varchar(30), 
@Par_Kopiuj_ID bit = 0
AS
BEGIN
SET XACT_ABORT ON;
BEGIN DISTRIBUTED TRANSACTION

DECLARE @Var_IdKlient_Zdalny int,
		@Var_IdKlient_Lokalny int,
		@Var_IdOddzial_Lokalny int

-- Sprawzenie, czy w bazie zdalnej istnieje wiersz z danymi klienta.
SELECT @Var_IdKlient_Zdalny = IdKlient
FROM LS_SQL2.S19_P3.dbo.Klient
WHERE (Imie = @Par_Imie) AND (Nazwisko = @Par_Nazwisko) AND (AdresMail = @Par_AresMail)

-- Sprawzenie, czy w bazie lokalnej istnieje wiersz z danymi klienta.
SELECT @Var_IdKlient_Lokalny = IdKlient
FROM dbo.Klient
WHERE (Imie = @Par_Imie) AND (Nazwisko = @Par_Nazwisko) AND (AdresMail = @Par_AresMail)

-- Kopiowanie danych zostanie wykonane tylko w�wczas, je�eli nie ma ich jeszcze w bazie lokalnej.
IF (@Var_IdKlient_Zdalny IS NOT NULL) AND (@Var_IdKlient_Lokalny IS NULL)
BEGIN
	IF (@Par_Kopiuj_ID = 1) -- Je�eli dane klienta maj� by� zapisane w wierszu o takim samym ID.
	BEGIN
		-- Sprawdzeni, czy w bazie lokalnej istnieje wiersz o ID zdalnego.
		IF EXISTS (SELECT * FROM dbo.Klient WHERE IdKlient = @Var_IdKlient_Zdalny)
			-- Je�eli insnieje, nie mo�na go nadpisywa� (to mo�e by� inny klient).
			-- Wiersz zostanie zapisany z nowym identyfikatorem.
			SELECT @Var_IdKlient_Lokalny = MAX(IdKlient) + 1
			FROM dbo.Klient;
		ELSE
			-- W przeciwnym razie mo�na zapisa� dane klienta ze zdalnym ID.
			SET @Var_IdKlient_Lokalny = @Var_IdKlient_Zdalny
	END -- (@Par_Kopiuj_ID = 1)
	ELSE -- Je�eli dane klienta maj�by� zapisane w wierzu o nowaej warto�ci ID.
		SELECT @Var_IdKlient_Lokalny = MAX(IdKlient) + 1
		FROM dbo.Klient;

	-- Ustalenie identyfikatora lokalnego oddzia�u firmy.
	SELECT @Var_IdOddzial_Lokalny = IdOddzial
	FROM dbo.Oddzial
	WHERE OddzialLokalny = 1;

	-- W�a�ciwe kopiowanie danych klienta z bazy zdalnej do lokalnej.
	INSERT dbo.Klient
	(IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi, IdOddzial)
	SELECT @Var_IdKlient_Lokalny, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi, @Var_IdOddzial_Lokalny
	FROM LS_SQL2.S19_P3.dbo.Klient
	WHERE IdKlient = @Var_IdKlient_Zdalny;
END -- IF - je�eli dane kliena maj� by� skopiowane

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Skopiowanie danych klienta z bazy zdalnej nie powiod�o si�',16,1);
	ROLLBACK TRANSACTION;
END
ELSE
	COMMIT TRANSACTION;
END;
GO

/*
SELECT *
FROM dbo.Klient;
GO

SELECT *
FROM LS_SQL2.S19_P3.dbo.Klient;
GO
*/

/*
EXECUTE dbo.Klient_Kopiuj_RBD
@Par_Imie =
@Par_Nazwisko =
@Par_AresMail =
@Par_Kopiuj_ID = 1;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (TR3) Obs�uga wypo�ycze� z uwzgl�dnieniem bie��cej dost�pno�ci samochodu w oddziale lokalnym oraz zdalnym.
---------------------------------------------------------------------------------------------------------------------------

-- Nowa tabela [Przeniesienie], przechowuk�ca informacj� o tym, do kt�rego
-- oddzia�u ma by� dostarczony samoch�d.
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
-- Synchronizacja danych wypo�yczenia, wypo�yczonego samochodu oraz samochodu: w bazie lokalnej i zdalnej - zgodnie
-- z dost�pno�ci� samochodu
-- Wypo�yczanie samochodu.
--
-- Zak�adamy, �e dane samochodu przechowywane we wszystkich oddzia�ach s� identyczne (replikowane) - z wyj�tkiem ich dost�pno�ci.
---------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Wypozyczenie_Dodaj_RBD
@Par_IdWypozyczenie int,
@Par_IdKlient int,
@Par_IdSamochod int,
@Par_IdPracownik int,
@Par_IdUbezpieczenie int,
@Par_SposobPlatnosci varchar(25),
@Par_DataWypozyczenia datetime,
@Par_TerminZwrotu datetime,
@Par_Uwagi varchar(1000),
@Par_IdOddzialLokalny int
AS
BEGIN

SET XACT_ABORT ON;
BEGIN DISTRIBUTED TRANSACTION

DECLARE @Var_Dostepnosc_Lokalna int,
		@Var_Dostepnosc_Zdalna int,
		@Var_Dostepnosc int

DECLARE @Var_CenaSamochodu money,
		@Var_CenaUbezpieczenia money,
		@Var_CenaPrzewidywana money,
		@Var_RoznicaGodzin float,
		@Var_RoznicaDni float;

SET @Var_Dostepnosc = 1;

-- (1) Sprawdzenie dost�pno�ci samochodu w oddziale lokalnym.
SELECT @Var_Dostepnosc_Lokalna = Dostepnosc
FROM dbo.Samochod
WHERE IdSamochod = @Par_IdSamochod;

-- (2) Je�eli samoch�d jest niedost�pny w oddziale lokalnym.
IF (@Var_Dostepnosc_Lokalna = 0)
BEGIN

	-- Kierowane jest zapytanie o dost�pno�� w oddziale zdalnym.
	SELECT @Var_Dostepnosc_Zdalna = Dostepnosc
	FROM LS_SQL2.S19_P3.dbo.Samochod
	WHERE IdSamochod = @Par_IdSamochod;

	-- (3) Je�eli samoch�d nie jest dost�pny w �adnym z dw�ch oddzia��w.
	IF (@Var_Dostepnosc_Zdalna = 0)
	BEGIN
		SET @Var_Dostepnosc = 0;
		PRINT 'Samochod niedost�pny w �adnym z oddzia��w.';
	END
	ELSE
	BEGIN
		INSERT LS_SQL2.S19_P3.dbo.Przeniesienie
		(DataGodzPolecenia, DataGodzOdbioru, IdOddzialZam, IdSamochod, Uwagi)
		VALUES
		(GETDATE(), NULL, @Par_IdOddzialLokalny, @Par_IdSamochod, NULL);

		UPDATE LS_SQL2.S19_P3.dbo.Samochod
		SET Dostepnosc = 0
		WHERE IdSamochod = @Par_IdSamochod;
	END
END -- IF (@Var_Dostepnosc_Lokalna = 0)
ELSE
BEGIN
	UPDATE dbo.Samochod
	SET Dostepnosc = 0
	WHERE IdSamochod = @Par_IdSamochod;
END

IF (@Var_Dostepnosc = 1)
BEGIN
	SELECT @Var_CenaSamochodu = Cena
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

	INSERT dbo.Wypozyczenie
	(IdWypozyczenie, IdKlient, IdSamochod, IdPracownik, IdUbezpieczenie, SposobPlatnosci, DataWypozyczenia, TerminZwrotu, DataZwrotu, CenaPrzewidywana, CenaOstateczna, StatusWypozyczenia, Uwagi)
	VALUES
	(@Par_IdWypozyczenie, @Par_IdKlient, @Par_IdSamochod, @Par_IdPracownik, @Par_IdUbezpieczenie, @Par_SposobPlatnosci, @Par_DataWypozyczenia, @Par_TerminZwrotu, NULL, @Var_CenaPrzewidywana, NULL, 1, @Par_Uwagi);
END

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Dodanie nowego wypo�yczenia nie powiod�o si�',16,1);
	ROLLBACK TRANSACTION;
END
ELSE
	COMMIT TRANSACTION;
END;
GO

/*
SELECT *
FROM dbo.Samochod;
GO

SELECT *
FROM LS_SQL2.S19_P3.dbo.Samochod;
GO

SELECT *
FROM dbo.Wypozyczenie;
GO

SELECT *
FROM LS_SQL2.S19_P3.dbo.Przeniesienie;
GO

EXECUTE dbo.Wypozyczenie_Dodaj_RBD
@Par_IdWypozyczenie = 11,
@Par_IdKlient = 3,
@Par_IdSamochod = 8,
@Par_IdPracownik = 3,
@Par_IdUbezpieczenie = 2,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-12-11 00:00',
@Par_TerminZwrotu = '2023-12-11 00:00',
@Par_Uwagi = '',
@Par_IdOddzialLokalny = 1;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- Pomocniczna procedura zwracaj�ca dane przeniesie� samochod�w.
--

CREATE PROCEDURE dbo.Przeniesienia_RBD
@Par_DataGodzOd datetime = '1900-01-01 00:00',
@Par_DataGodzDo datetime = '2200-12-31 23:59',
@Par_IdOddzialLokalny int,
@Par_IdOddzialZdalny int
AS
BEGIN
DECLARE @Var_OddzialLokalny_Miasto varchar(50),
		@Var_OddzialZdalny_Miasto varchar(50);
-- Pobranie nazw miastze s�ownika oddzia��w - zgodnie z warto�ciami parametr�w.
SELECT @Var_OddzialLokalny_Miasto = OddzialMiasto
FROM dbo.Oddzial
WHERE IdOddzial = @Par_IdOddzialLokalny;

SELECT @Var_OddzialZdalny_Miasto = OddzialMiasto
FROM dbo.Oddzial
WHERE IdOddzial = @Par_IdOddzialZdalny;

SELECT @Var_OddzialLokalny_Miasto AS [Z], OddzialMiasto AS [Do], IdPrzeniesienie, 
		DataGodzPolecenia, DataGodzOdbioru, dbo.Samochod.IdSamochod, dbo.Samochod.Model, 
		dbo.Model.Marka, dbo.Samochod.Rocznik, Uwagi
FROM dbo.Przeniesienie
	INNER JOIN dbo.Samochod
	ON dbo.Samochod.IdSamochod = dbo.Przeniesienie.IdSamochod
		INNER JOIN dbo.Model
		ON dbo.Model.Model = dbo.Samochod.Model
	INNER JOIN dbo.Oddzial
	ON dbo.Przeniesienie.IdOddzialZam = dbo.Oddzial.IdOddzial
WHERE DataGodzPolecenia BETWEEN @Par_DataGodzOd AND @Par_DataGodzDo

UNION ALL

SELECT @Var_OddzialZdalny_Miasto AS [Z], OddzialMiasto AS [do], IdPrzeniesienie, 
		DataGodzPolecenia, DataGodzOdbioru, ZS.IdSamochod,ZS.Model, ZM.Marka, 
		ZS.Rocznik, Uwagi
FROM LS_SQL2.S19_P3.dbo.Przeniesienie AS ZP
	INNER JOIN dbo.Samochod AS ZS
	ON ZS.IdSamochod = ZP.IdSamochod
		INNER JOIN dbo.Model AS ZM
		ON ZM.Model = ZS.Model
	INNER JOIN dbo.Oddzial AS ZO
	ON ZP.IdOddzialZam = ZO.IdOddzial
WHERE DataGodzPolecenia BETWEEN @Par_DataGodzOd AND @Par_DataGodzDo
ORDER BY DataGodzPolecenia DESC, IdPrzeniesienie ASC, OddzialMiasto ASC;
END;
GO

/*
EXECUTE dbo.Przeniesienia_RBD
@Par_DataGodzOd = '2023-12-01 00:00',
@Par_DataGodzDo = '2023-12-31 23:59',
@Par_IdOddzialLokalny = 1,
@Par_IdOddzialZdalny = 2;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (TR4) Automatyczna replikacja danych produkt�w z jednego oddzia�u do drugiego.
--		 (Procedury wyzwalane + transakcje rozproszone 2PC.)
---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- (TR4a) Kopiowanie wiersza nowo dodanego z serwera lokalnego do zdalnego.
--		  (Procedura wyzwalana typu AFTR + transakcja 2PC.)
---------------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER dbo.tr_Samochod_A_I_RBD
ON dbo.Samochod
AFTER INSERT
AS
BEGIN

INSERT LS_SQL2.S19_P3.dbo.Samochod
(IdSamochod, Kategoria, Model, Dostepnosc, IloscDrzwi, Rocznik, TypSilnika, InformacjeDodatkowe, Aktywny)
SELECT IdSamochod, Kategoria, Model, Dostepnosc, IloscDrzwi, Rocznik, TypSilnika, InformacjeDodatkowe, Aktywny
from [inserted];

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Zapiasanie danych samochodu nie powiod�osi�.', 16, 1);
	ROLLBACK TRANSACTION;
END;
END;
GO

/*
SELECT *
FROM dbo.Kategoria;
GO

SELECT *
FROM dbo.Model;
GO

SELECT *
FROM dbo.Samochod;
GO

SELECT *
FROM LS_SQL2.S19_P3.dbo.Samochod;
GO
*/

/*
INSERT dbo.Samochod
(IdSamochod, Kategoria, Model, Dostepnosc, IloscDrzwi, Rocznik, TypSilnika, InformacjeDodatkowe, Aktywny)
VALUES
(11, 'Super Luxury', 'Cullinan', 1, 5, 2023, 'Diesel', 'Rolls-Royce Cullinan Black Badge', 1);
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- (TR4b) Aktualizowanie wiersza na serwerze zdalnym po wyst�pieniu zmiany na serwerze lokalnym.
--		  (Procedura wyzwalana typu AFTER + transajcha 2PC.)
---------------------------------------------------------------------------------------------------------------------------
-- Procedura nie replikuje dost�pno�ci samochodu, poniewa� mo�e ona by� r�na w poszczeg�lnych oddzia�ach firmy.
-- Natomiast kopiowany jest status wiersza, kt�ry oznacza, czy jest on aktywny, czy nie (archiwalny)
-- - zast�puj�c fizyczne usuni�cie.
---------------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER dbo.tr_Samochod_A_U_RBD
ON dbo.Samochod
AFTER UPDATE
AS
BEGIN
DECLARE @Var_IdSamochod int, 
		@Var_Kategoria varchar(20), 
		@Var_Model varchar(20),  
		@Var_IloscDrzwi int, 
		@Var_Rocznik int, 
		@Var_TypSilnika varchar(15), 
		@Var_InformacjeDodatkowe varchar(1000), 
		@Var_Aktywny bit

SELECT @Var_IdSamochod = IdSamochod, 
	   @Var_Kategoria = Kategoria, 
	   @Var_Model = Model, 
	   @Var_IloscDrzwi = IloscDrzwi,
	   @Var_Rocznik = Rocznik, 
	   @Var_TypSilnika = TypSilnika, 
	   @Var_InformacjeDodatkowe = InformacjeDodatkowe, 
	   @Var_Aktywny = Aktywny
from [inserted];


UPDATE LS_SQL2.S19_P3.dbo.Samochod
SET Kategoria = @Var_Kategoria, 
	Model = @Var_Model, 
	IloscDrzwi = @Var_IloscDrzwi, 
	Rocznik = @Var_Rocznik, 
	TypSilnika = @Var_TypSilnika, 
	InformacjeDodatkowe = @Var_InformacjeDodatkowe, 
	Aktywny = @Var_Aktywny
WHERE IdSamochod = @Var_IdSamochod;

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Zmodyfikowanie danych samochodu nie powiod�osi�.', 16, 1);
	ROLLBACK TRANSACTION;
END;
END;
GO

/*
SELECT *
FROM dbo.Kategoria;
GO

SELECT *
FROM dbo.Model;
GO

SELECT *
FROM dbo.Samochod;
GO

SELECT *
FROM LS_SQL2.S19_P3.dbo.Samochod;
GO
*/

/*
UPDATE dbo.Samochod
SET Rocznik = 2022
WHERE IdSamochod = 11;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- Oznaczenie wiersza jako nieaktywnego na serwerze lokalnym.
-- (Procedura wyzwalana typu INSTEAD OF.)
---------------------------------------------------------------------------------------------------------------------------
-- Nie ma potrzeby realizowania tej zmiany do serwera zdalnego, poniewa� zostanie ona tam przes�ana przez procedur�
-- wyzwalan� obs�uguj�c� operacj� UPDATE.
---------------------------------------------------------------------------------------------------------------------------

ALTER TABLE dbo.Samochod
ADD Aktywny bit NULL;
GO

UPDATE dbo.Samochod
SET Aktywny = 1;
GO

CREATE TRIGGER dbo.tr_Samochod_I_D_RBD
ON dbo.Samochod
INSTEAD OF DELETE
AS
BEGIN

DECLARE @Var_IdSamochod int;

SELECT @Var_IdSamochod = IdSamochod
FROM [deleted];

UPDATE dbo.Samochod
SET Aktywny = 0
WHERE IdSamochod = @Var_IdSamochod;

END;
GO

/*
SELECT *
FROM dbo.Kategoria;
GO

SELECT *
FROM dbo.Model;
GO

SELECT *
FROM dbo.Samochod;
GO

SELECT *
FROM LS_SQL2.S19_P3.dbo.Samochod;
GO
*/

/*
DELETE dbo.Samochod
WHERE IdSamochod = 11;
GO
*/

---------------------------------------------------------------------------------------------------------------------------
-- Koniec.
---------------------------------------------------------------------------------------------------------------------------