--------------------------------------------------------------
-- BZDN_P3: programowanie operacji CRUD oraz transakcji.
--------------------------------------------------------------

--------------------------------------------------------------
-- Kolejnoœæ wstawiania danych do bazy.
--------------------------------------------------------------

/*
	(1) [Klient], [Pracownik], [Uprawnienia], [Ubezpieczenie], [Platnosc],
	[Usluga], [Kategoria], [Marka].

	(2) [KlientUprawnienia], [Model].

	(3) [Samochod].

	(4) [Wypozyczenie].

	(5) [WypozyczenieUsluga]
*/

--------------------------------------------------------------
-- Kolejnoœæ usuwania danych z bazy.
--------------------------------------------------------------

/*
	(1) [WypozyczenieUsluga], [KlientUprawnienia].

	(2) [Wypozyczenie], [Usluga], [Uprawnienia].

	(3) [Samochod], [Ubezpieczenie], [Platnosc], [Pracownik], [Klient]

	(4) [Kategoria], [Model]

	(5) [Marka]
*/

--------------------------------------------------------------
-- Definicje procedur przechowywanych z poleceniam:
-- INSERT, UPDATE, DELETE.
--------------------------------------------------------------

--------------------------------------------------------------
-- Tabela [Klient].
--------------------------------------------------------------

CREATE PROCEDURE dbo.Klient_Wstaw
@Par_IdKlient int,
@Par_Imie varchar(20),
@Par_Nazwisko varchar(40),
@Par_Nazwa varchar(40),
@Par_Miejscowosc varchar(30),
@Par_Ulica varchar(50),
@Par_NrDomu varchar(10),
@Par_NrLokalu varchar(10),
@Par_KodPocztowy nchar(6),
@Par_Poczta varchar(50),
@Par_NrTelefonu nchar(15),
@Par_AdresMail varchar(30),
@Par_Uwagi varchar(1000)
AS
BEGIN
INSERT dbo.Klient
(IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi)
VALUES
(@Par_IdKlient, @Par_Imie, @Par_Nazwisko, @Par_Nazwa, @Par_Miejscowosc, @Par_Ulica, @Par_NrDomu, @Par_NrLokalu, @Par_KodPocztowy, @Par_Poczta, @Par_NrTelefonu, @Par_AdresMail, @Par_Uwagi);
END;
GO

/*
-- Przyk³adowe wywo³anie procedury.

SELECT *
FROM dbo.Klient;
GO

-- Wariant I.

EXECUTE dbo.Klient_Wstaw
@Par_IdKlient = 11,
@Par_Imie = 'Micha³',
@Par_Nazwisko = 'Lesicki',
@Par_Nazwa = NULL,
@Par_Ulica = 'Górnoœl¹ska',
@Par_NrDomu = '18',
@Par_NrLokalu = '4',
@Par_Miejscowosc = 'Kalisz',
@Par_KodPocztowy = '62-800',
@Par_Poczta = 'Kalisz',
@Par_NrTelefonu = '+48 524 400 299',
@Par_AdresMail = 'm.lesicki@nomail.com',
@Par_Uwagi = '';
GO

-- Wariant II (skrócony).

EXECUTE dbo.Klient_Wstaw 11, 'Micha³', 'Lesicki', NULL, 'Górnoœl¹ska', '18', '4', 'Kalisz', '62-800', 'Kalisz', '+48 524 400 299', 'm.lesicki@nomail.com', '';
GO
*/

CREATE PROCEDURE dbo.Klient_Modyfikuj
@Par_IdKlient int,
@Par_Imie varchar(20),
@Par_Nazwisko varchar(40),
@Par_Nazwa varchar(40),
@Par_Miejscowosc varchar(30),
@Par_Ulica varchar(50),
@Par_NrDomu varchar(10),
@Par_NrLokalu varchar(10),
@Par_KodPocztowy nchar(6),
@Par_Poczta varchar(50),
@Par_NrTelefonu nchar(15),
@Par_AdresMail varchar(30),
@Par_Uwagi varchar(1000)
AS
BEGIN
UPDATE dbo.Klient
SET Imie = @Par_Imie,
	Nazwisko = @Par_Nazwisko,
	Nazwa = @Par_Nazwa,
	Miejscowosc = @Par_Miejscowosc,
	Ulica = @Par_Ulica,
	NrDomu = @Par_NrDomu, 
	NrLokalu = @Par_NrLokalu,
	KodPocztowy = @Par_KodPocztowy,
	Poczta = @Par_Poczta,
	NrTelefonu = @Par_NrTelefonu,
	AdresMail = @Par_AdresMail,
	Uwagi = @Par_Uwagi
WHERE IdKlient = @Par_IdKlient;
END;
GO

/* 
-- Przyk³adowe wywo³anie procedury.

-- Wariant I.

EXECUTE dbo.Klient_Modyfikuj
@Par_IdKlient = 11,
@Par_Imie = 'Micha³',
@Par_Nazwisko = 'Lesicki',
@Par_Nazwa = 'Firma',
@Par_Miejscowosc = 'Kalisz',
@Par_Ulica = 'Górnoœl¹ska',
@Par_NrDomu = '18',
@Par_NrLokalu = '4',
@Par_KodPocztowy = '62-800',
@Par_Poczta = 'Kalisz',
@Par_NrTelefonu = '+48 629 100 200',
@Par_AdresMail = 'm.lesicki@nomail.com',
@Par_Uwagi = '';
GO
*/

CREATE PROCEDURE dbo.Klient_Usun
@Par_IdKlient int
AS
BEGIN
DELETE dbo.Klient
WHERE IdKlient = @Par_IdKlient;
END;
GO

/*
-- Przyk³adowe wywo³anie procedury.

-- Wariant I.

EXECUTE dbo.Klient_Usun
@Par_IdKlient = 11;
GO
*/

--------------------------------------------------------------
-- Tabela [Pracownik].
--------------------------------------------------------------

CREATE PROCEDURE dbo.Pracownik_Wstaw
@Par_IdPracownik int,
@Par_Imie varchar(20),
@Par_Nazwisko varchar(40),
@Par_Stanowisko varchar(40),
@Par_NrTelefonu nchar(15),
@Par_AdresMail varchar(30)
AS
BEGIN
INSERT dbo.Pracownik
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(@Par_IdPracownik, @Par_Imie, @Par_Nazwisko, @Par_Stanowisko, @Par_NrTelefonu, @Par_AdresMail);
END;
GO

/*
SELECT *
FROM dbo.Pracownik;
GO

EXECUTE dbo.Pracownik_Wstaw
@Par_IdPracownik = 11,
@Par_Imie = 'Marcin',
@Par_Nazwisko = 'Dêbicki',
@Par_Stanowisko = 'Sprzedawca',
@Par_NrTelefonu = '+48 500 200 321',
@Par_AdresMail = 'marcin.debicki@firma.pl';
GO
*/

CREATE PROCEDURE dbo.Pracownik_Modyfikuj
@Par_IdPracownik int,
@Par_Imie varchar(20),
@Par_Nazwisko varchar(40),
@Par_Stanowisko varchar(40),
@Par_NrTelefonu nchar(15),
@Par_AdresMail varchar(30)
AS
BEGIN
UPDATE dbo.Pracownik
SET Imie = @Par_Imie,
	Nazwisko = @Par_Nazwisko,
	Stanowisko = @Par_Stanowisko,
	NrTelefonu = @Par_NrTelefonu,
	AdresMail = @Par_AdresMail
WHERE IdPracownik = @Par_IdPracownik;
END;
GO

/*
SELECT *
FROM dbo.Pracownik;
GO

EXECUTE dbo.Pracownik_Modyfikuj
@Par_IdPracownik = 11,
@Par_Imie = 'Marcin',
@Par_Nazwisko = 'Dêbicki',
@Par_Stanowisko = 'Kierowca', --< zmiana stanowiska pracy
@Par_NrTelefonu = '+48 500 200 321',
@Par_AdresMail = 'marcin.debicki@firma.pl';
GO
*/

CREATE PROCEDURE dbo.Pracownik_Usun
@Par_IdPracownik int
AS
BEGIN
DELETE dbo.Pracownik
WHERE IdPracownik = @Par_IdPracownik;
END;
GO

/*
SELECT *
FROM dbo.Pracownik;
GO

EXECUTE dbo.Pracownik_Usun
@Par_IdPracownik = 11;
GO
*/

--------------------------------------------------------------
-- Tabela [Uprawnienia].
--------------------------------------------------------------

CREATE PROCEDURE dbo.Uprawnienia_Wstaw
@Par_KategoriaPrawaJazdy varchar(7),
@Par_KategoriaOpis varchar(150)
AS
BEGIN
INSERT dbo.Uprawnienia
(KategoriaPrawaJazdy, KategoriaOpis)
VALUES
(@Par_KategoriaPrawaJazdy, @Par_KategoriaOpis);
END;
GO

/*
SELECT *
FROM dbo.Uprawnienia;
GO

EXECUTE dbo.Uprawnienia_Wstaw
@Par_KategoriaPrawaJazdy = 'TRAMWAJ',
@Par_KategoriaOpis = 'Uprawnienia do kierowania tramwajem';
GO
*/

CREATE PROCEDURE dbo.Uprawnienia_Modyfikuj
@Par_KategoriaPrawaJazdy varchar(7),
@Par_KategoriaOpis varchar(150)
AS
BEGIN
UPDATE dbo.Uprawnienia
SET KategoriaOpis = @Par_KategoriaOpis
WHERE KategoriaPrawaJazdy = @Par_KategoriaPrawaJazdy;
END;
GO

/*
SELECT *
FROM dbo.Uprawnienia;
GO

EXECUTE dbo.Uprawnienia_Modyfikuj
@Par_KategoriaPrawaJazdy = 'TRAMWAJ',
@Par_KategoriaOpis = 'TRAMWAJ';
GO
*/

CREATE PROCEDURE dbo.Uprawnienia_Usun
@Par_KategoriaPrawaJazdy varchar(7)
AS
BEGIN
DELETE dbo.Uprawnienia
WHERE KategoriaPrawaJazdy = @Par_KategoriaPrawaJazdy;
END;
GO

/*
SELECT *
FROM dbo.Uprawnienia;
GO

EXECUTE dbo.Uprawnienia_Usun
@Par_KategoriaPrawaJazdy = 'TRAMWAJ';
GO
*/

--------------------------------------------------------------
-- Tabela [Ubezpieczenie].
--------------------------------------------------------------

CREATE PROCEDURE dbo.Ubezpieczenie_Wstaw
@Par_IdUbezpieczenie int,
@Par_Nazwa varchar(30),
@Par_Cena money,
@Par_Opis varchar(2000)
AS
BEGIN
INSERT dbo.Ubezpieczenie
(IdUbezpieczenie, Nazwa, Cena, Opis)
VALUES
(@Par_IdUbezpieczenie, @Par_Nazwa, @Par_Cena, @Par_Opis);
END;
GO

/*
SELECT *
FROM dbo.Ubezpieczenie;
GO

EXECUTE dbo.Ubezpieczenie_Wstaw
@Par_IdUbezpieczenie = 6,
@Par_Nazwa = 'Podstawowe-',
@Par_Cena = 0,
@Par_Opis = 'OC';
GO
*/

CREATE PROCEDURE dbo.Ubezpieczenie_Modyfikuj
@Par_IdUbezpieczenie int,
@Par_Nazwa varchar(30),
@Par_Cena money,
@Par_Opis varchar(2000)
AS
BEGIN
UPDATE dbo.Ubezpieczenie
SET Nazwa = @Par_Nazwa,
	Cena = @Par_Cena,
	Opis = @Par_Opis
WHERE IdUbezpieczenie = @Par_IdUbezpieczenie;
END;
GO

/*
SELECT *
FROM dbo.Ubezpieczenie;
GO

EXECUTE dbo.Ubezpieczenie_Modyfikuj
@Par_IdUbezpieczenie = 6,
@Par_Nazwa = 'Podstawowe-',
@Par_Cena = 0,
@Par_Opis = 'OC, AC';
GO
*/

CREATE PROCEDURE dbo.Ubezpieczenie_Usun
@Par_IdUbezpieczenie int
AS
BEGIN
DELETE dbo.Ubezpieczenie
WHERE IdUbezpieczenie = @Par_IdUbezpieczenie;
END;
GO

/*
SELECT *
FROM dbo.Ubezpieczenie;
GO

EXECUTE dbo.Ubezpieczenie_Usun
@Par_IdUbezpieczenie = 6;
GO
*/

--------------------------------------------------------------
-- Tabela [Platnosc].
--------------------------------------------------------------

CREATE PROCEDURE dbo.Platnosc_Wstaw
@Par_SposobPlatnosci varchar(20)
AS
BEGIN
INSERT dbo.Platnosc
(SposobPlatnosci)
VALUES
(@Par_SposobPlatnosci);
END;
GO

/*
SELECT *
FROM dbo.Platnosc;
GO

EXECUTE dbo.Platnosc_Wstaw
@Par_SposobPlatnosci = 'Krypto';
GO
*/

CREATE PROCEDURE dbo.Platnosc_Modyfikuj
@Par_SposobPlatnosci varchar(20),
@Par_NowySposobPlatnosci varchar(20)
AS
BEGIN
UPDATE dbo.Platnosc
SET SposobPlatnosci = @Par_NowySposobPlatnosci
WHERE SposobPlatnosci = @Par_SposobPlatnosci;
END;
GO

/*
SELECT *
FROM dbo.Platnosc;
GO

EXECUTE dbo.Platnosc_Modyfikuj
@Par_SposobPlatnosci = 'Krypto',
@Par_NowySposobPlatnosci = 'Krypto waluty';
GO
*/

CREATE PROCEDURE dbo.Platnosc_Usun
@Par_SposobPlatnosci varchar(20)
AS
BEGIN
DELETE dbo.Platnosc
WHERE SposobPlatnosci = @Par_SposobPlatnosci;
END;
GO

/*
SELECT *
FROM dbo.Platnosc;
GO

EXECUTE dbo.Platnosc_Usun
@Par_SposobPlatnosci = 'Krypto waluty';
GO
*/

--------------------------------------------------------------
-- Tabela [Usluga].
--------------------------------------------------------------

CREATE PROCEDURE dbo.Usluga_Wstaw
@Par_IdUsluga int,
@Par_Nazwa varchar(30),
@Par_Cena money,
@Par_Opis varchar(2000)
AS
BEGIN
INSERT dbo.Usluga
(IdUsluga, Nazwa, Cena, Opis)
VALUES
(@Par_IdUsluga, @Par_Nazwa, @Par_Cena, @Par_Opis);
END;
GO

/*
SELECT *
FROM dbo.Usluga;
GO

EXECUTE dbo.Usluga_Wstaw
@Par_IdUsluga = 11,
@Par_Nazwa = 'Mycie',
@Par_Cena = 40.00,
@Par_Opis = 'Brak koniecznoœci mycia auta przed oddaniem';
GO
*/

CREATE PROCEDURE dbo.Usluga_Modyfikuj
@Par_IdUsluga int,
@Par_Nazwa varchar(30),
@Par_Cena money,
@Par_Opis varchar(2000)
AS
BEGIN
UPDATE dbo.Usluga
SET Nazwa = @Par_Nazwa,
	Cena = @Par_Cena,
	Opis = @Par_Opis
WHERE IdUsluga = @Par_IdUsluga;
END;
GO

/*
SELECT *
FROM dbo.Usluga;
GO

EXECUTE dbo.Usluga_Modyfikuj
@Par_IdUsluga = 11,
@Par_Nazwa = 'Mycie',
@Par_Cena = 50.00,
@Par_Opis = 'Brak koniecznoœci mycia i tankowania auta przed oddaniem.';
GO
*/

CREATE PROCEDURE dbo.Usluga_Usun
@Par_IdUsluga int
AS
BEGIN
DELETE dbo.Usluga
WHERE IdUsluga = @Par_IdUsluga;
END;
GO

/*
SELECT *
FROM dbo.Usluga;
GO

EXECUTE dbo.Usluga_Usun
@Par_IdUsluga = 11;
GO
*/

--------------------------------------------------------------
-- Tabela [Kategoria].
--------------------------------------------------------------

CREATE PROCEDURE dbo.Kategoria_Wstaw
@Par_Kategoria varchar(20),
@Par_Cena money,
@Par_Opis varchar(1000)
AS
BEGIN
INSERT dbo.Kategoria
(Kategoria, Cena, Opis)
VALUES
(@Par_Kategoria, @Par_Cena, @Par_Opis);
END;
GO

/*
SELECT *
FROM dbo.Kategoria;
GO

EXECUTE dbo.Kategoria_Wstaw
@Par_Kategoria = 'Klasyki',
@Par_Cena = 400,
@Par_Opis = '400 za godzinê';
GO
*/

CREATE PROCEDURE dbo.Kategoria_Modyfikuj
@Par_Kategoria varchar(20),
@Par_Cena money,
@Par_Opis varchar(1000)
AS
BEGIN
UPDATE dbo.Kategoria
SET Cena = @Par_Cena,
	Opis = @Par_Opis
WHERE Kategoria = @Par_Kategoria;
END;
GO

/*
SELECT *
FROM dbo.Kategoria;
GO

EXECUTE dbo.Kategoria_Modyfikuj
@Par_Kategoria = 'Klasyki',
@Par_Cena = 350,
@Par_Opis = '350 za godznê';
GO
*/

CREATE PROCEDURE dbo.Kategoria_Usun
@Par_Kategoria varchar(20)
AS
BEGIN
DELETE dbo.Kategoria
WHERE Kategoria = @Par_Kategoria;
END;
GO

/*
SELECT *
FROM dbo.Kategoria;
GO

EXECUTE dbo.Kategoria_Usun
@Par_Kategoria = 'Klasyki';
GO
*/

--------------------------------------------------------------
-- Tabela [Marka].
--------------------------------------------------------------

CREATE PROCEDURE dbo.Marka_Wstaw
@Par_Marka varchar(20)
AS
BEGIN
INSERT dbo.Marka
(Marka)
VALUES
(@Par_Marka);
END;
GO

/*
SELECT *
FROM dbo.Marka;
GO

EXECUTE dbo.Marka_Wstaw
@Par_Marka = 'Volkswagen';
GO
*/

CREATE PROCEDURE dbo.Marka_Modyfikuj
@Par_Marka varchar(20),
@Par_NowaMarka varchar(20)
AS
BEGIN
UPDATE dbo.Marka
SET Marka = @Par_NowaMarka
WHERE Marka = @Par_Marka;
END;
GO

/*
SELECT *
FROM dbo.Marka;
GO

EXECUTE dbo.Marka_Modyfikuj
@Par_Marka = 'Volkswagen',
@Par_NowaMarka = 'Nissan';
GO
*/

CREATE PROCEDURE dbo.Marka_Usun
@Par_Marka varchar(20)
AS
BEGIN
DELETE dbo.Marka
WHERE Marka = @Par_Marka;
END;
GO

/*
SELECT *
FROM dbo.Marka;
GO

EXECUTE dbo.Marka_Usun
@Par_Marka = 'Nissan';
GO
*/

--------------------------------------------------------------
-- Tabela [KlientUprawnienia].
--------------------------------------------------------------

CREATE PROCEDURE dbo.KlientUprawnienia_Wstaw
@Par_IdKlientUprawnienia int,
@Par_IdKlient int,
@Par_KategoriaPrawaJazdy varchar(4)
AS
BEGIN
INSERT dbo.KlientUprawnienia
(IdKlientUprawnienia, IdKlient, KategoriaPrawaJazdy)
VALUES
(@Par_IdKlientUprawnienia, @Par_IdKlient, @Par_KategoriaPrawaJazdy);
END;
GO

/*
SELECT *
FROM dbo.KlientUprawnienia;
GO

EXECUTE dbo.KlientUprawnienia_Wstaw
@Par_IdKlientUprawnienia = 11,
@Par_IdKlient = 9,
@Par_KategoriaPrawaJazdy = 'B';
GO
*/

CREATE PROCEDURE dbo.KlientUprawnienia_Modyfikuj
@Par_IdKlientUprawnienia int,
@Par_IdKlient int,
@Par_KategoriaPrawaJazdy varchar(4)
AS
BEGIN
UPDATE dbo.KlientUprawnienia
SET IdKlient = @Par_IdKlient,
	KategoriaPrawaJazdy = @Par_KategoriaPrawaJazdy
WHERE IdKlientUprawnienia = @Par_IdKlientUprawnienia;
END;
GO

/*
SELECT *
FROM dbo.KlientUprawnienia;
GO

EXECUTE dbo.KlientUprawnienia_Modyfikuj
@Par_IdKlientUprawnienia = 11,
@Par_IdKlient = 9,
@Par_KategoriaPrawaJazdy = 'A';
GO
*/

CREATE PROCEDURE dbo.KlientUprawnienia_Usun
@Par_IdKlientUprawnienia int
AS
BEGIN
DELETE dbo.KlientUprawnienia
WHERE IdKlientUprawnienia = @Par_IdKlientUprawnienia;
END;
GO

/*
SELECT *
FROM dbo.KlientUprawnienia;
GO

EXECUTE dbo.KlientUprawnienia_Usun
@Par_IdKlientUprawnienia = 11;
GO
*/

--------------------------------------------------------------
-- Tabela [Model].
--------------------------------------------------------------

CREATE PROCEDURE dbo.Model_Wstaw
@Par_Model varchar(20),
@Par_Marka varchar(20)
AS
BEGIN
INSERT dbo.Model
(Model, Marka)
VALUES
(@Par_Model, @Par_Marka);
END;
GO

/*
SELECT *
FROM dbo.Model;
GO

EXECUTE dbo.Model_Wstaw
@Par_Model = 'Seria 3',
@Par_Marka = 'Audi';
GO
*/

CREATE PROCEDURE dbo.Model_Modyfikuj
@Par_Model varchar(20),
@Par_Marka varchar(20)
AS
BEGIN
UPDATE dbo.Model
SET Marka = @Par_Marka
WHERE Model = @Par_Model;
END;
GO

/*
SELECT *
FROM dbo.Model;
GO

EXECUTE dbo.Model_Modyfikuj
@Par_Marka = "BMW",
@Par_Model = 'Seria 3';
GO
*/

CREATE PROCEDURE dbo.Model_Usun
@Par_Model varchar(20)
AS
BEGIN
DELETE dbo.Model
WHERE Model = @Par_Model;
END;
GO

/*
SELECT *
FROM dbo.Model;
GO

EXECUTE dbo.Model_Usun
@Par_Model = 'Seria 3';
GO
*/

--------------------------------------------------------------
-- Tabela [Samochod].
--------------------------------------------------------------

CREATE PROCEDURE dbo.Samochod_Wstaw
@Par_IdSamochod int,
@Par_Kategoria varchar(20),
@Par_Model varchar(20),
@Par_Dostepnosc bit,
@Par_IloscDrzwi int,
@Par_Rocznik int,
@Par_TypSilnika varchar(15),
@Par_InformacjeDodatkowe varchar(1000)
AS
BEGIN
INSERT dbo.Samochod
(IdSamochod, Kategoria, Model, Dostepnosc, IloscDrzwi, Rocznik, TypSilnika, InformacjeDodatkowe)
VALUES
(@Par_IdSamochod, @Par_Kategoria, @Par_Model, @Par_Dostepnosc, @Par_IloscDrzwi, @Par_Rocznik, @Par_TypSilnika, @Par_InformacjeDodatkowe);
END;
GO

/*
SELECT *
FROM dbo.Samochod;
GO

EXECUTE dbo.Samochod_Wstaw
@Par_IdSamochod = 11,
@Par_Kategoria = 'Premium',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = 'BMW 740d xDrive';
GO
*/

CREATE PROCEDURE dbo.Samochod_Modyfikuj
@Par_IdSamochod int,
@Par_Kategoria varchar(20),
@Par_Model varchar(20),
@Par_Dostepnosc bit,
@Par_IloscDrzwi int,
@Par_Rocznik int,
@Par_TypSilnika varchar(15),
@Par_InformacjeDodatkowe varchar(1000)
AS
BEGIN
UPDATE dbo.Samochod
SET Kategoria = @Par_Kategoria,
	Model = @Par_Model,
	Dostepnosc = @Par_Dostepnosc,
	IloscDrzwi = @Par_IloscDrzwi,
	Rocznik = @Par_Rocznik,
	TypSilnika = @Par_TypSilnika,
	InformacjeDodatkowe = @Par_InformacjeDodatkowe
WHERE IdSamochod = @Par_IdSamochod;
END;
GO

/*
SELECT *
FROM dbo.Samochod;
GO

EXECUTE dbo.Samochod_Modyfikuj
@Par_IdSamochod = 11,
@Par_Kategoria = 'Premium',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 0,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = 'BMW 740d xDrive';
GO
*/

CREATE PROCEDURE dbo.Samochod_Usun
@Par_IdSamochod int
AS
BEGIN
DELETE dbo.Samochod
WHERE IdSamochod = @Par_IdSamochod;
END;
GO

/*
SELECT *
FROM dbo.Samochod;
GO

EXECUTE dbo.Samochod_Usun
@Par_IdSamochod = 11;
GO
*/

--------------------------------------------------------------
-- Tabela [Wypozyczenie].
--------------------------------------------------------------

CREATE PROCEDURE dbo.Wypozyczenie_Wstaw
@Par_IdWypozyczenie int,
@Par_IdKlient int,
@Par_IdSamochod int,
@Par_IdPracownik int,
@Par_IdUbezpieczenie int,
@Par_SposobPlatnosci varchar(20),
@Par_DataWypozyczenia datetime,
@Par_TerminZwrotu datetime,
@Par_DataZwrotu datetime,
@Par_CenaPrzewidywana money,
@Par_CenaOstateczna money,
@Par_StatusWypozyczenia bit,
@Par_Uwagi varchar(1000)
AS
BEGIN
INSERT dbo.Wypozyczenie
(IdWypozyczenie, IdKlient, IdSamochod, IdPracownik, IdUbezpieczenie, SposobPlatnosci, DataWypozyczenia, TerminZwrotu, DataZwrotu, CenaPrzewidywana, CenaOstateczna, StatusWypozyczenia, Uwagi)
VALUES
(@Par_IdWypozyczenie, @Par_IdKlient, @Par_IdSamochod, @Par_IdPracownik, @Par_IdUbezpieczenie, @Par_SposobPlatnosci, @Par_DataWypozyczenia, @Par_TerminZwrotu, @Par_DataZwrotu, @Par_CenaPrzewidywana, @Par_CenaOstateczna, @Par_StatusWypozyczenia,@Par_Uwagi);
END;
GO

/*
SELECT *
FROM dbo.Wypozyczenie;
GO

EXECUTE dbo.Wypozyczenie_Wstaw
@Par_IdWypozyczenie = 11,
@Par_IdKlient = 1,
@Par_IdSamochod = 1,
@Par_IdPracownik = 1,
@Par_IdUbezpieczenie = 1,
@Par_SposobPlatnosci = 'BLIK',
@Par_DataWypozyczenia = '2020-06-22 11:00',
@Par_TerminZwrotu = '2020-06-26 12:00',
@Par_DataZwrotu = '2020-06-26 12:00',
@Par_CenaPrzewidywana = 6000,
@Par_CenaOstateczna = 6500,
@Par_StatusWypozyczenia = 0,
@Par_Uwagi = 'SpóŸnienie, kara 500z³';
GO
*/

CREATE PROCEDURE dbo.Wypozyczenie_Modyfikuj
@Par_IdWypozyczenie int,
@Par_IdKlient int,
@Par_IdSamochod int,
@Par_IdPracownik int,
@Par_IdUbezpieczenie int,
@Par_SposobPlatnosci varchar(20),
@Par_DataWypozyczenia datetime,
@Par_TerminZwrotu datetime,
@Par_DataZwrotu datetime,
@Par_CenaPrzewidywana money,
@Par_CenaOstateczna money,
@Par_StatusWypozyczenia bit,
@Par_Uwagi varchar(1000)
AS
BEGIN
UPDATE dbo.Wypozyczenie
SET IdKlient = @Par_IdKlient,
	IdSamochod = @Par_IdSamochod,
	IdPracownik = @Par_IdPracownik,
	IdUbezpieczenie = @Par_IdUbezpieczenie,
	SposobPlatnosci = @Par_SposobPlatnosci,
	DataWypozyczenia = @Par_DataWypozyczenia,
	TerminZwrotu = @Par_TerminZwrotu,
	DataZwrotu = @Par_DataZwrotu,
	CenaPrzewidywana = @Par_CenaPrzewidywana,
	CenaOstateczna = @Par_CenaOstateczna,
	StatusWypozyczenia = @Par_StatusWypozyczenia,
	Uwagi = @Par_Uwagi
WHERE IdWypozyczenie = @Par_IdWypozyczenie;
END;
GO

/*
SELECT *
FROM dbo.Wypozyczenie;
GO

EXECUTE dbo.Wypozyczenie_Modyfikuj
@Par_IdWypozyczenie = 11,
@Par_IdKlient = 1,
@Par_IdSamochod = 1,
@Par_IdPracownik = 1,
@Par_IdUbezpieczenie = 1,
@Par_SposobPlatnosci = 'Gotówka',
@Par_DataWypozyczenia = '2020-06-22 11:00',
@Par_TerminZwrotu = '2020-06-26 12:00',
@Par_DataZwrotu = '2020-06-26 12:00',
@Par_CenaPrzewidywana = 6000,
@Par_CenaOstateczna = 6500,
@Par_StatusWypozyczenia = 0,
@Par_Uwagi = 'SpóŸnienie, kara 500z³';
GO
*/

CREATE PROCEDURE dbo.Wypozyczenie_Usun
@Par_IdWypozyczenie int
AS
BEGIN
DELETE dbo.Wypozyczenie
WHERE IdWypozyczenie = @Par_IdWypozyczenie;
END;
GO

/*
SELECT *
FROM dbo.Wypozyczenie;
GO

EXECUTE dbo.Wypozyczenie_Usun
@Par_IdWypozyczenie = 11;
GO
*/

--------------------------------------------------------------
-- Tabela [WypozyczenieUsluga].
--------------------------------------------------------------

CREATE PROCEDURE dbo.WypozyczenieUsluga_Wstaw
@Par_IdWypozyczenieUsluga int,
@Par_IdWypozyczenie int,
@Par_IdUsluga int,
@Par_Uwagi varchar(2000)
AS
BEGIN
INSERT dbo.WypozyczenieUsluga
(IdWypozyczenieUsluga, IdWypozyczenie, IdUsluga, Uwagi)
VALUES
(@Par_IdWypozyczenieUsluga, @Par_IdWypozyczenie, @Par_IdUsluga, @Par_Uwagi);
END;
GO

/*
SELECT *
FROM dbo.WypozyczenieUsluga;
GO

EXECUTE dbo.WypozyczenieUsluga_Wstaw
@Par_IdWypozyczenieUsluga = 11,
@Par_IdWypozyczenie = 1,
@Par_IdUsluga = 1,
@Par_Uwagi = '';
GO
*/

CREATE PROCEDURE dbo.WypozyczenieUsluga_Modyfikuj
@Par_IdWypozyczenieUsluga int,
@Par_IdWypozyczenie int,
@Par_IdUsluga int,
@Par_Uwagi varchar(2000)
AS
BEGIN
UPDATE dbo.WypozyczenieUsluga
SET IdWypozyczenie = @Par_IdWypozyczenie,
	IdUsluga = @Par_IdUsluga,
	Uwagi = @Par_Uwagi
WHERE IdWypozyczenieUsluga = @Par_IdWypozyczenieUsluga;
END;
GO

/*
SELECT *
FROM dbo.Usluga;
GO

EXECUTE dbo.WypozyczenieUsluga_Modyfikuj
@Par_IdWypozyczenieUsluga = 11,
@Par_IdWypozyczenie = 1,
@Par_IdUsluga = 2,
@Par_Uwagi = '';
GO
*/

CREATE PROCEDURE dbo.WypozyczenieUsluga_Usun
@Par_IdWypozyczenieUsluga int
AS
BEGIN
DELETE dbo.WypozyczenieUsluga
WHERE IdWypozyczenieUsluga = @Par_IdWypozyczenieUsluga;
END;
GO

/*
SELECT *
FROM dbo.WypozyczenieUsluga;
GO

EXECUTE dbo.WypozyczenieUsluga_Usun
@Par_IdWypozyczenieUsluga = 11;
GO
*/

--------------------------------------------------------------
-- TRANSAKCJE.
--------------------------------------------------------------

--------------------------------------------------------------
-- (1) Prosta archiwizacja danych z tabeli [Pracownik].
--------------------------------------------------------------

-- Tabela - archiwum danych pracowników.

CREATE TABLE dbo.Pracownik_Kopia
(
	IdPracownik int NOT NULL PRIMARY KEY, 
	Imie varchar(20) NOT NULL,
	Nazwisko varchar(40) NOT NULL,
	Stanowisko varchar(40) NOT NULL, 
	NrTelefonu nchar(15) NOT NULL, 
	AdresMail varchar(60) NOT NULL
);
GO

CREATE PROCEDURE dbo.Pracownik_Archiwizuj
@Par_IdPracownik int
AS
BEGIN
-- Przerwanie bloku transakcji po wyst¹pieniu b³êdu czasu wykonania.
SET XACT_ABORT ON;
BEGIN TRANSACTION
-- (1) Kopiowanie wiersza z danymi pracownika.
INSERT dbo.Pracownik_Kopia
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
SELECT IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail
FROM dbo.Pracownik
WHERE IdPracownik = @Par_IdPracownik;

-- WAITFOR DELAY '00:00:10' -- Przerwanie wykonywania skryptu.

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
SELECT *
FROM dbo.Pracownik;
GO

SELECT *
FROM dbo.Pracownik_Kopia;
GO

EXECUTE dbo.Pracownik_Archiwizuj
@Par_IdPracownik = 10;
GO
*/

--------------------------------------------------------------
-- (2) Monitorowanie zmian cen kategorii samochodów.
--------------------------------------------------------------

-- Tabela przechowuj¹ca historiê zmian cen kategorii samochodów.

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
SELECT *
FROM dbo.Kategoria;
GO

SELECT *
FROM dbo.Kategoria_CenaHistoria;
GO

EXECUTE dbo.Kategoria_ZmienCene
@Par_Kategoria = 'Ekonomiczna',
@Par_Cena = 75;
GO
*/

--------------------------------------------------------------
-- (3) Elastyczne zarz¹dzanie s³ownikami - makrooperacja.
--------------------------------------------------------------

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

IF (@@ERROR <> 0)
BEGIN
	RAISERROR('Wstawienie danych samochodu nie powiod³o siê.',16,1);
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

--------------------------------------------------------------
-- Koniec.
--------------------------------------------------------------