--------------------------------------------------------------------------------------------------
-- BZDN_P4: wyszukiwanie danych.
--------------------------------------------------------------------------------------------------
--
-- W cudzys�owie " " opisane s� potrzeby informacyjne (zapytania)
-- odbiorcy - u�ytkownika ko�cowego: w�a�ciciela lub pracownika firmy.
--
-- W nawiasach ( ) podane s� mechanizmy u�yte do realizacji zapytania.
--
--------------------------------------------------------------------------------------------------
-- (1)  "Dane pracownika o podanym identyfikatorze."
--      (Wyszukiwanie dok�adne wzgl�dem klucza g��wnego (PK).)
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
-- (2)  "Wyszukiwanie danych pracownik�w, kt�rych nazwisko zawiera podany ci�g znak�w."
--      (Wyszukiwanie przybli�one wzgl�dem wzorca znakowego.)
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.Pracownik_Znajdz_Nazwisko
@Par_Nazwisko varchar(40) = '' -- Warto�� domy�lna parametru.
-- Je�eli nie zostanie przekazany wzorzec, zwr�cone zostan� wszystkie wiersze.
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
-- (3)  "Wyszukiwanie danych klient�w, kt�rych nazwisko zawiera podany ci�g 
--      znak�w na pocz�tku, ko�cu lub �rodku ci�gu znakowego nazwiska."
--      (Wyszukiwanie przybli�one wzgl�dem wzorca znakowego.)
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
-- (4)  "Wyszukiwanie danych klient�w, dla kt�rych dowolna tabela zawiera 
--      podany ci�g znak�w"
--      (Wyszukiwanie przybli�one wzgl�dem wzorca znakowego.)
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
-- (5)  "Lista danych kategorii, kt�rych cena mie�ci si� w podanym przedziale 'od-do'
--      uporz�dkowana alfabetycznie wzgl�dem nazwy."
--      (Wyszukiwanie przybli�one przedzia�owe wzgl�dem p�l liczbowych.)
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
-- (6)  "Wykaz wypo�ycze� zawartych w podanym okresie 'od-do'."
--      (Wyszukiwanie przybli�one przedzia�owe wzgl�dem p�l typu "date", "time" oraz "datetime".)
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
-- (7)  "Zestawienie wypo�ycze�, kt�re s� w trakcie lub samoch�d nie zosta� zwr�cny,
--      uporz�dkowanych od najbardziej do najmniej pilnego - wzgl�dem terminu zwrotu i
--		daty bie��cej."
--      (Wyszukiwanie przybli�one przedzia�owe p�l typu "date", "time" oraz "datetime".)
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
-- (8)  "Wyszukiwanie wypo�ycze�, d�u�szych ni� podana liczba dni, sortuj�c od najd�u�szych"
--      (Wyszukiwanie przybli�one wzgl�dem daty i wbudowanych funkcji.)
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
-- (9)  "Wy�wietlanie samochod�w, kt�re s� dost�pne lub nie wed�ug wskazanego parametru"
--		(Wyszukiwanie przybli�one wzgl�dem p�l typu bit)
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
-- (10)  "Wyszukiwanie klient�w, kt�rzy dokonali wypo�yczenia za kwot�
--       wi�ksz� niz podana."
--       (Wyszukiwanie przybli�one p�l typu money.)
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
-- (11)  "Wy�wietlanie zam�wie� z�o�onych w przeci�gu ostatnich N dni."
--       (Wyszukiwanie przybli�one z wykorzystaniem funkcji w krauzuli WHERE.)
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
-- (12)  "Ilu klient�w firmy mieszka w poszczeg�lnych miejscowo�ciach
--       Wy�wietlone powinny by� wy��cznie nazwy miejscowo�ci, w kt�rych
--       mieszka przynajmniej podana liczba klient�w."
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
-- (13)  "Wy�wietl nazwy marek z liczbami i �rednimi cenami samochod�w nal꿹cych 
--       do nich.
--       W wyniku maj� zosta� zwr�cone tylko dane marek niepustych czyli takich
--       do kt�rych nale�y przynajmniej jeden samoch�d."
--       (Wielokrotne z��czanie tabel + grupowanie wierszy + r�ne funkcje agreguj�ce.)
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
-- (14)  "Zestawienie danych klient�w wraz z liczbami z�o�onych przez nich zam�wie� i ich ��cznymi
--       warto�ciami - z podanego okresu. Lista uporz�dkowana malej�co wzgl�dem liczby warto�ci zam�wie�.
--       Powinny by� wy�wietlane tylko wiersze, w kt�rych suma warto�ci zam�wie� jest niemniejsza od
--		 podanego progu	oraz istnieje cena ostateczna."
--       (Wyszukiwanie przybli�one przedzia�owe + z��czenie tabel + grupowanie i agregowanie wierszy.)
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
-- (15)  "Ranking pracownik�w, kt�rzy obs�u�yli najwi�cej zam�wie� w podanym okresie,
--       jednak nie mniej ni� podany pr�b minimalny."
--       (Z��czanie tabel + grupowanie i agregowanie wierszy.)
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
-- (16)  "Lista marek samochod�w, kt�re cieszy�y si� najwi�ksz� popularno�ci�
--       w�r�d kupuj�cych w danym okresie."
--       (Z��czanie tabel + grupowanie i agregowanie wierszy.)
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
-- (17)  "Lista us�ug kt�re nie by�y dodawane do wypo�ycza� w podanym okresie."
--       (Stosowanie podzapyta�.)
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
-- (18)  "Kompletne dane wypo�yczenia: zar�wno samochodu, ubezpieczenia jak i us�ug."
--       (Suma wierszy - UNION + tabela po�rednia.)
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
-- (19)  "Wy�wietl dane klient�w zawieraj�cy podany wzorzec w wybranej kolumnie."
--       (Dynamiczny kod SQL +  wyszukiwanie przybli�one wzorca w kolumnie znakowej.)
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