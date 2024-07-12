--------------------------------------------------------------------------------------------------
-- BZDN_P4: wyszukiwanie danych.
--------------------------------------------------------------------------------------------------
--
-- W cudzys³owie " " opisane s¹ potrzeby informacyjne (zapytania)
-- odbiorcy - u¿ytkownika koñcowego: w³aœciciela lub pracownika firmy.
--
-- W nawiasach ( ) podane s¹ mechanizmy u¿yte do realizacji zapytania.
--
--------------------------------------------------------------------------------------------------
-- (1)  "Dane pracownika o podanym identyfikatorze."
--      (Wyszukiwanie dok³adne wzglêdem klucza g³ównego (PK).)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Pracownik_Znajdz_Id
@Par_IdPracownik int
AS
BEGIN
SELECT IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail
FROM dbo.Pracownik
WHERE IdPracownik = @Par_IdPracownik;
END;
GO

/*
EXECUTE dbo.Pracownik_Znajdz_Id
@Par_IdPracownik = 3;
GO
*/

--------------------------------------------------------------------------------------------------
-- (2)  "Wyszukiwanie danych pracowników, których nazwisko zawiera podany ci¹g znaków."
--      (Wyszukiwanie przybli¿one wzglêdem wzorca znakowego.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Pracownik_Znajdz_Nazwisko
@Par_Nazwisko varchar(40) = '' -- Wartoœæ domyœlna parametru.
-- Je¿eli nie zostanie przekazany wzorzec, zwrócone zostan¹ wszystkie wiersze.
AS
BEGIN
SELECT IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail
FROM dbo.Pracownik
WHERE Nazwisko LIKE '%' + LTRIM(RTRIM(@Par_Nazwisko)) + '%'
ORDER BY Nazwisko ASC, Imie ASC;
END;
GO

/*
EXECUTE dbo.Pracownik_Znajdz_Nazwisko
@Par_Nazwisko = 'Kacz';
GO
*/

--------------------------------------------------------------------------------------------------
-- (3)  "Wyszukiwanie danych klientów, których nazwisko zawiera podany ci¹g 
--      znaków na pocz¹tku, koñcu lub œrodku ci¹gu znakowego nazwiska."
--      (Wyszukiwanie przybli¿one wzglêdem wzorca znakowego.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Klient_Znajdz_Nazwisko
@Par_Wzorzec varchar(40),
@Par_Opcja nchar(1)
AS
BEGIN
SELECT IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi
FROM dbo.Klient
WHERE 
CASE
WHEN @Par_Opcja = 'P' AND Nazwisko LIKE LTRIM(RTRIM(@Par_Wzorzec)) + '%' THEN 1
WHEN @Par_Opcja = 'D' AND Nazwisko LIKE '%' + LTRIM(RTRIM(@Par_Wzorzec)) + '%' THEN 1
WHEN @Par_Opcja = 'K' AND Nazwisko LIKE '%' + LTRIM(RTRIM(@Par_Wzorzec)) THEN 1
ELSE 0
END = 1
ORDER BY Nazwisko ASC, Imie ASC;
END;
GO

/*
EXECUTE dbo.Klient_Znajdz_Nazwisko
@Par_Wzorzec = ' ski ',
@Par_Opcja = 'K';
GO
*/

--------------------------------------------------------------------------------------------------
-- (4)  "Wyszukiwanie danych klientów, dla których dowolna tabela zawiera 
--      podany ci¹g znaków"
--      (Wyszukiwanie przybli¿one wzglêdem wzorca znakowego.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Klient_Szukaj
@Par_Wzorzec varchar(60)
AS
BEGIN
SELECT IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi
FROM dbo.Klient
WHERE Imie LIKE '%' + LTRIM(RTRIM(@Par_Wzorzec)) + '%' OR
	  Nazwisko LIKE '%' + LTRIM(RTRIM(@Par_Wzorzec)) + '%' OR
	  Nazwa LIKE '%' + LTRIM(RTRIM(@Par_Wzorzec)) + '%' OR
	  Miejscowosc LIKE '%' + LTRIM(RTRIM(@Par_Wzorzec)) + '%' OR
	  Ulica LIKE '%' + LTRIM(RTRIM(@Par_Wzorzec)) + '%' OR
	  Poczta LIKE '%' + LTRIM(RTRIM(@Par_Wzorzec)) + '%' OR
	  AdresMail LIKE '%' + LTRIM(RTRIM(@Par_Wzorzec)) + '%'
ORDER BY IdKlient ASC;
END;
GO

/*
EXECUTE dbo.Klient_Szukaj
@Par_Wzorzec = 'on';
GO
*/

--------------------------------------------------------------------------------------------------
-- (5)  "Lista danych kategorii, których cena mieœci siê w podanym przedziale 'od-do'
--      uporz¹dkowana alfabetycznie wzglêdem nazwy."
--      (Wyszukiwanie przybli¿one przedzia³owe wzglêdem pól liczbowych.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Kategoria_Znajdz_Cena
@Par_CenaOd money = 0.00,
@Par_CenaDo money = 1000000.00
AS
BEGIN
SELECT Kategoria, Cena, Opis
FROM dbo.Kategoria
WHERE Cena BETWEEN @Par_CenaOd AND @Par_CenaDo
ORDER BY Cena ASC, Kategoria ASC;
END;
GO

/*
EXECUTE dbo.Kategoria_Znajdz_Cena
@Par_CenaOd = 200.00,
@Par_CenaDo = 400.00;
GO
*/

--------------------------------------------------------------------------------------------------
-- (6)  "Wykaz wypo¿yczeñ zawartych w podanym okresie 'od-do'."
--      (Wyszukiwanie przybli¿one przedzia³owe wzglêdem pól typu "date", "time" oraz "datetime".)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Wypozyczenie_Znajdz_Daty
@Par_DataOd datetime = '1900-01-01 00:00',
@Par_DataDo datetime = '2200-12-31 23:59'
AS
BEGIN
SELECT IdWypozyczenie, SposobPlatnosci, DataWypozyczenia, TerminZwrotu, DataZwrotu, CenaPrzewidywana, CenaOstateczna, StatusWypozyczenia, Uwagi
FROM dbo.Wypozyczenie
WHERE DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo
ORDER BY DataWypozyczenia DESC;
END;
GO

/*
EXECUTE dbo.Wypozyczenie_Znajdz_Daty
@Par_DataOd = '2022-02-03 12:00',
@Par_DataDo = '2023-02-03 10:00';
GO
*/

--------------------------------------------------------------------------------------------------
-- (7)  "Zestawienie wypo¿yczeñ, które s¹ w trakcie lub samochód nie zosta³ zwrócny,
--      uporz¹dkowanych od najbardziej do najmniej pilnego - wzglêdem terminu zwrotu i
--		daty bie¿¹cej."
--      (Wyszukiwanie przybli¿one przedzia³owe pól typu "date", "time" oraz "datetime".)
--		(Kolumna wyliczeniowa na polach daty i czasu - wykorzystanie wbudowanych funkcji.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Wypozyczenie_Aktualne
@Par_DataOd datetime = '1900-01-01 00:00',
@Par_DataDo datetime = '2200-12-31 23:59'
AS
BEGIN
SELECT IdWypozyczenie, SposobPlatnosci, DataWypozyczenia, TerminZwrotu, CenaPrzewidywana,
	DATEDIFF(DAY, GETDATE(), TerminZwrotu) AS [PozostaloDni]
FROM dbo.Wypozyczenie
WHERE (DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo)
	AND ((Wypozyczenie.StatusWypozyczenia = 1) OR (Wypozyczenie.DataZwrotu IS NULL))
ORDER BY [PozostaloDni] ASC;
END;
GO

/*
EXECUTE dbo.Wypozyczenie_Aktualne
@Par_DataOd = '2022-02-03 12:00';
GO
*/

--------------------------------------------------------------------------------------------------
-- (8)  "Wyszukiwanie wypo¿yczeñ, d³u¿szych ni¿ podana liczba dni, sortuj¹c od najd³u¿szych"
--      (Wyszukiwanie przybli¿one wzglêdem daty i wbudowanych funkcji.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Wypozyczenie_Szukaj_Okres
@Par_Dni int
AS
BEGIN
SELECT IdWypozyczenie, SposobPlatnosci, DataWypozyczenia, DataZwrotu, CenaPrzewidywana, CenaOstateczna, StatusWypozyczenia, Uwagi,
        CASE
            WHEN DataZwrotu IS NOT NULL THEN DATEDIFF(day, DataWypozyczenia, DataZwrotu)
            ELSE DATEDIFF(day, DataWypozyczenia, GETDATE())
        END AS IloscDni
FROM dbo.Wypozyczenie
WHERE
	(DataZwrotu IS NOT NULL AND @Par_Dni <= DATEDIFF(day, DataWypozyczenia, DataZwrotu))
    OR
    (DataZwrotu IS NULL AND @Par_Dni <= DATEDIFF(day, DataWypozyczenia, GETDATE()))
ORDER BY IloscDni DESC;
END;
GO

/*
EXECUTE dbo.Wypozyczenie_Szukaj_Okres
@Par_Dni = 4;
GO
*/

--------------------------------------------------------------------------------------------------
-- (9)  "Wyœwietlanie samochodów, które s¹ dostêpne lub nie wed³ug wskazanego parametru"
--		(Wyszukiwanie przybli¿one wzglêdem pól typu bit)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Samochod_Dostepnosc
@Par_Dostepnosc bit = 0
AS
BEGIN
SELECT IdSamochod, Kategoria, Model, IloscDrzwi, Rocznik, TypSilnika, InformacjeDodatkowe
FROM dbo.Samochod
WHERE Dostepnosc = @Par_Dostepnosc;
END;
GO

/*
EXECUTE dbo.Samochod_Dostepnosc
@Par_Dostepnosc = 1;
GO
*/

--------------------------------------------------------------------------------------------------
-- (10)  "Wyszukiwanie klientów, którzy dokonali wypo¿yczenia za kwotê
--       wiêksz¹ niz podana."
--       (Wyszukiwanie przybli¿one pól typu money.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Klient_CenaWypozyczenia
@Par_Cena money
AS
BEGIN
SELECT K.Imie + ' ' + K.Nazwisko AS PolaczoneDane, W.CenaOstateczna AS Kwota
FROM dbo.Wypozyczenie AS W
INNER JOIN dbo.Klient AS K ON W.IdKlient = K.IdKlient
WHERE
W.CenaOstateczna >= @Par_Cena;
END;
GO

/*
EXECUTE dbo.Klient_CenaWypozyczenia
@Par_Cena = 500;
GO
*/

--------------------------------------------------------------------------------------------------
-- (11)  "Wyœwietlanie zamówieñ z³o¿onych w przeci¹gu ostatnich N dni."
--       (Wyszukiwanie przybli¿one z wykorzystaniem funkcji w krauzuli WHERE.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Wypozyczenie_N_OstatnichDni
@Par_LiczbaDni smallint = 30
AS
BEGIN
SELECT IdWypozyczenie, SposobPlatnosci, DataWypozyczenia, CenaPrzewidywana, CenaOstateczna, StatusWypozyczenia
FROM dbo.Wypozyczenie
WHERE DATEDIFF(DAY, DataWypozyczenia, GETDATE()) <= @Par_LiczbaDni
ORDER BY DataWypozyczenia DESC;
END;
GO

/*
EXECUTE dbo.Wypozyczenie_N_OstatnichDni
@Par_LiczbaDni = 20;
GO
*/

--------------------------------------------------------------------------------------------------
-- (12)  "Ilu klientów firmy mieszka w poszczególnych miejscowoœciach
--       Wyœwietlone powinny byæ wy³¹cznie nazwy miejscowoœci, w których
--       mieszka przynajmniej podana liczba klientów."
--       (Grupowanie i agregowanie wierszy, filtorwanie wierszy zagregowanych.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Klient_Miejscowosci
@Par_MinLiczba int = 1
AS
BEGIN
SELECT Miejscowosc, COUNT(*) AS [LiczbaKlientow]
FROM dbo.Klient
GROUP BY Miejscowosc
HAVING COUNT(*) >= @Par_MinLiczba
ORDER BY LiczbaKlientow DESC, Miejscowosc ASC;
END;
GO

/*
EXECUTE dbo.Klient_Miejscowosci
@Par_MinLiczba = 2;
GO
*/

--------------------------------------------------------------------------------------------------
-- (13)  "Wyœwietl nazwy marek z liczbami i œrednimi cenami samochodów nalê¿¹cych 
--       do nich.
--       W wyniku maj¹ zostaæ zwrócone tylko dane marek niepustych czyli takich
--       do których nale¿y przynajmniej jeden samochód."
--       (Wielokrotne z³¹czanie tabel + grupowanie wierszy + ró¿ne funkcje agreguj¹ce.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Samochody_Marki
AS
BEGIN
SELECT Marka, COUNT(*) AS [LiczbaSamochodow], AVG(Cena) AS [SredniaCena]
FROM dbo.Samochod
	INNER JOIN dbo.Model
	ON dbo.Samochod.Model = dbo.Model.Model
	INNER JOIN dbo.Kategoria
	ON dbo.Samochod.Kategoria = dbo.Kategoria.Kategoria
GROUP BY Marka
ORDER BY Marka ASC;
END;
GO

/*
EXECUTE dbo.Samochody_Marki;
GO
*/

--------------------------------------------------------------------------------------------------
-- (14)  "Zestawienie danych klientów wraz z liczbami z³o¿onych przez nich zamówieñ i ich ³¹cznymi
--       wartoœciami - z podanego okresu. Lista uporz¹dkowana malej¹co wzglêdem liczby wartoœci zamówieñ.
--       Powinny byæ wyœwietlane tylko wiersze, w których suma wartoœci zamówieñ jest niemniejsza od
--		 podanego progu	oraz istnieje cena ostateczna."
--       (Wyszukiwanie przybli¿one przedzia³owe + z³¹czenie tabel + grupowanie i agregowanie wierszy.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Klienci_Wypozyczenia
@Par_DataOd datetime = '2000-01-01',
@Par_DataDo datetime = '2100-12-12',
@Par_MinWartosc money = 0.00
AS
BEGIN
SELECT dbo.Klient.IdKlient, Imie, Nazwisko, Miejscowosc,
	COUNT (*) AS [LiczbaWypozyczen],
	SUM(CenaOstateczna) AS [LacznaKwota]
FROM dbo.Klient
	INNER JOIN dbo.Wypozyczenie
	ON dbo.Klient.IdKlient = dbo.Wypozyczenie.IdKlient
WHERE (DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo)
	AND (CenaOstateczna IS NOT NULL)
GROUP BY dbo.Klient.IdKlient, Imie, Nazwisko, Miejscowosc
HAVING SUM(CenaOstateczna) >= @Par_MinWartosc
ORDER BY LacznaKwota DESC, LiczbaWypozyczen DESC;
END;
GO

/*
EXECUTE dbo.Klienci_Wypozyczenia
@Par_DataOd = '2000-01-01',
@Par_DataDo = '2023-05-05',
@Par_MinWartosc = 700.00
*/

--------------------------------------------------------------------------------------------------
-- (15)  "Ranking pracowników, którzy obs³u¿yli najwiêcej zamówieñ w podanym okresie,
--       jednak nie mniej ni¿ podany prób minimalny."
--       (Z³¹czanie tabel + grupowanie i agregowanie wierszy.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Pracownicy_Ranking
@Par_Stanowisko varchar(40) = '',
@Par_DataOd datetime = '2000-01-01',
@Par_DataDo datetime = '2100-12-12',
@Par_MinLiczba int = 0
AS
BEGIN
SELECT DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS [Pozycja],
	dbo.Pracownik.IdPracownik, Imie, Nazwisko,
	COUNT(*) AS [LiczbaWypozyczen]
FROM dbo.Pracownik
	INNER JOIN dbo.Wypozyczenie
	ON dbo.Pracownik.IdPracownik = dbo.Wypozyczenie.IdPracownik
WHERE Stanowisko LIKE '%' + LTRIM(RTRIM(@Par_Stanowisko)) + '%' 
	AND DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo
GROUP BY dbo.Pracownik.IdPracownik, Imie, Nazwisko
HAVING COUNT(*) >= @Par_MinLiczba
ORDER BY [LiczbaWypozyczen] DESC, Nazwisko ASC;
END;
GO

/*
EXECUTE dbo.Pracownicy_Ranking
@Par_Stanowisko = 'Sprzedawca',
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2022-12-12',
@Par_MinLiczba = 1
GO
*/

--------------------------------------------------------------------------------------------------
-- (16)  "Lista marek samochodów, które cieszy³y siê najwiêksz¹ popularnoœci¹
--       wœród kupuj¹cych w danym okresie."
--       (Z³¹czanie tabel + grupowanie i agregowanie wierszy.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Marki_Popularnosc
@Par_DataOd datetime = '2000-01-01',
@Par_DataDo datetime = '2100-12-12',
@Par_MinLiczba int = 0,
@Par_MinWartosc money = 0.00
AS
BEGIN
SELECT Marka, COUNT(*) AS [LiczbaWypozyczen],
	SUM(Cena) AS [WartoscWypozyczen]
FROM dbo.Model
	INNER JOIN dbo.Samochod
	ON dbo.Model.Model = dbo.Samochod.Model
		INNER JOIN dbo.Wypozyczenie
		ON dbo.Samochod.IdSamochod = dbo.Wypozyczenie.IdSamochod
		INNER JOIN dbo.Kategoria
		ON dbo.Samochod.Kategoria = dbo.Kategoria.Kategoria
WHERE DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo
GROUP BY Marka
HAVING COUNT(*) >= @Par_MinLiczba AND SUM(cena) >= @Par_MinWartosc
ORDER BY [LiczbaWypozyczen] DESC, [WartoscWypozyczen] DESC, MARKA ASC;
END;
GO

/*
EXECUTE dbo.Marki_Popularnosc
@Par_DataOd = '2023-01-01',
@Par_DataDo = '2023-12-12',
@Par_MinLiczba= 2,
@Par_MinWartosc= 150.00
GO
*/

--------------------------------------------------------------------------------------------------
-- (17)  "Lista us³ug które nie by³y dodawane do wypo¿yczañ w podanym okresie."
--       (Stosowanie podzapytañ.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Usluga_Niedodawane
@Par_DataOd datetime = '1900-01-01 00:00',
@Par_DataDo datetime = '2100-12-31 23:59'
AS
BEGIN
SELECT IdUsluga, Nazwa, Cena
FROM dbo.Usluga
WHERE IdUsluga NOT IN (SELECT IdUsluga
					   FROM dbo.WypozyczenieUsluga
							INNER JOIN dbo.Wypozyczenie
							ON dbo.WypozyczenieUsluga.IdWypozyczenie = dbo.Wypozyczenie.IdWypozyczenie
					   WHERE DataWypozyczenia BETWEEN @Par_DataOd AND @Par_DataDo)
ORDER BY Nazwa ASC;
END;
GO

/*
EXECUTE dbo.Usluga_Niedodawane
@Par_DataOd = '2023-01-01 00:00',
@Par_DataDo = '2023-12-31 23:59';
GO
*/

--------------------------------------------------------------------------------------------------
-- (18)  "Kompletne dane wypo¿yczenia: zarówno samochodu, ubezpieczenia jak i us³ug."
--       (Suma wierszy - UNION + tabela poœrednia.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Wypozyczenie_Zestawienie
@Par_IdWypozyczenie int
AS
BEGIN
SELECT  ROW_NUMBER() OVER (ORDER BY [ProduktUsluga] ASC) AS [Lp], ProduktUsluga, Cena, Typ
FROM
(SELECT Marka + ' ' + Samochod.Model AS [ProduktUsluga], Cena, 'Samochod' AS [Typ]
FROM dbo.Samochod
	INNER JOIN dbo.Model
	ON dbo.Samochod.Model = dbo.Model.Model
	INNER JOIN dbo.Kategoria
	ON dbo.Samochod.Kategoria = dbo.Kategoria.Kategoria
	INNER JOIN dbo.Wypozyczenie
	ON dbo.Samochod.IdSamochod = dbo.Wypozyczenie.IdSamochod
WHERE IdWypozyczenie = @Par_IdWypozyczenie

UNION ALL

SELECT Nazwa AS [ProduktUsluga], Cena, 'Usluga' AS [Typ]
FROM dbo.Usluga
	INNER JOIN dbo.WypozyczenieUsluga
	ON dbo.Usluga.IdUsluga = dbo.WypozyczenieUsluga.IdUsluga
		INNER JOIN dbo.Wypozyczenie
		ON dbo.WypozyczenieUsluga.IdWypozyczenie = dbo.Wypozyczenie.IdWypozyczenie
WHERE Wypozyczenie.IdWypozyczenie = @Par_IdWypozyczenie

UNION ALL

SELECT Nazwa AS [ProduktUsluga], Cena, 'Ubezpieczenie' AS [Typ]
FROM dbo.Ubezpieczenie
	INNER JOIN dbo.Wypozyczenie
	ON dbo.Ubezpieczenie.IdUbezpieczenie = dbo.Wypozyczenie.IdUbezpieczenie
WHERE IdWypozyczenie = @Par_IdWypozyczenie) AS [Wyp]
ORDER BY [ProduktUsluga] ASC;
END;
GO

/*
EXECUTE dbo.Wypozyczenie_Zestawienie
@Par_IdWypozyczenie = 4;
GO
*/

--------------------------------------------------------------------------------------------------
-- (19)  "Wyœwietl dane klientów zawieraj¹cy podany wzorzec w wybranej kolumnie."
--       (Dynamiczny kod SQL +  wyszukiwanie przybli¿one wzorca w kolumnie znakowej.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Klient_Znajdz_Wzorzec
@Par_Wzorzec varchar(100) = '',
@Par_Kolumna varchar(30)
AS
BEGIN
DECLARE @Var_SQL varchar(500);

SET @Var_SQL = '
SELECT IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi
FROM dbo.Klient
WHERE ' + @Par_Kolumna + ' LIKE ' + CHAR(39) + '%' + LTRIM(RTRIM(@Par_Wzorzec)) +'%' + CHAR(39)
+ ' ORDER BY ' + @Par_Kolumna + ' ASC;';
EXECUTE(@Var_SQL);
END;
GO

/*
EXECUTE dbo.Klient_Znajdz_Wzorzec
@Par_Wzorzec = 'M',
@Par_Kolumna = 'Imie';
GO
*/

--------------------------------------------------------------------------------------------------
-- Koniec.
--------------------------------------------------------------------------------------------------