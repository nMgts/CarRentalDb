--------------------------------------------------------------------
-- SRBD_P1: projekt systemu bezpieczeñstwa bazy danych. 
--------------------------------------------------------------------

--------------------------------------------------------------------
-- I Zapytanie zwracaj¹ce wykaz tabel i procedur przechowywanych
-- (w³asnych - zdefiniowanych przez programistê).
--------------------------------------------------------------------

SELECT [object_id], [name], [type_desc]
FROM sys.objects
WHERE (([type] = 'U') AND ([name] NOT LIKE 'sys%'))
		OR ([type] = 'V')
		OR (([type] = 'P') AND ([name] NOT LIKE 'dt_%')
		AND ([name] NOT LIKE 'sp_%'))
ORDER BY [type] DESC, [name] ASC;
GO

/*
object_id   name                                                                                                                             type_desc
----------- -------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------
1250103494  Klienci_Aktywni                                                                                                                  VIEW
1061578820  Kategoria                                                                                                                        USER_TABLE
658101385   Kategoria_CenaHistoria                                                                                                           USER_TABLE
901578250   Klient                                                                                                                           USER_TABLE
1138103095  Klient_Kopia                                                                                                                     USER_TABLE
965578478   KlientUprawnienia                                                                                                                USER_TABLE
1093578934  Marka                                                                                                                            USER_TABLE
1077578877  Model                                                                                                                            USER_TABLE
1346103836  Oddzial                                                                                                                          USER_TABLE
997578592   Platnosc                                                                                                                         USER_TABLE
917578307   Pracownik                                                                                                                        USER_TABLE
1026102696  Pracownik_Kopia                                                                                                                  USER_TABLE
1602104748  Przeniesienie                                                                                                                    USER_TABLE
1013578649  Samochod                                                                                                                         USER_TABLE
981578535   Ubezpieczenie                                                                                                                    USER_TABLE
949578421   Uprawnienia                                                                                                                      USER_TABLE
1029578706  Usluga                                                                                                                           USER_TABLE
933578364   Wypozyczenie                                                                                                                     USER_TABLE
1045578763  WypozyczenieUsluga                                                                                                               USER_TABLE
290100074   Kategoria_Modyfikuj                                                                                                              SQL_STORED_PROCEDURE
306100131   Kategoria_Usun                                                                                                                   SQL_STORED_PROCEDURE
274100017   Kategoria_Wstaw                                                                                                                  SQL_STORED_PROCEDURE
690101499   Kategoria_ZmienCene                                                                                                              SQL_STORED_PROCEDURE
786101841   Kategoria_Znajdz_Cena                                                                                                            SQL_STORED_PROCEDURE
930102354   Klienci_Wypozyczenia                                                                                                             SQL_STORED_PROCEDURE
1522104463  Klienci_Wypozyczenia_RBD_CTE                                                                                                     SQL_STORED_PROCEDURE
1506104406  Klienci_Wypozyczenia_RBD_TP                                                                                                      SQL_STORED_PROCEDURE
1186103266  Klient_Archiwizuj                                                                                                                SQL_STORED_PROCEDURE
866102126   Klient_CenaWypozyczenia                                                                                                          SQL_STORED_PROCEDURE
1586104691  Klient_Kopiuj_RBD                                                                                                                SQL_STORED_PROCEDURE
898102240   Klient_Miejscowosci                                                                                                              SQL_STORED_PROCEDURE
2099048     Klient_Modyfikuj                                                                                                                 SQL_STORED_PROCEDURE
770101784   Klient_Szukaj                                                                                                                    SQL_STORED_PROCEDURE
18099105    Klient_Usun                                                                                                                      SQL_STORED_PROCEDURE
2133582639  Klient_Wstaw                                                                                                                     SQL_STORED_PROCEDURE
754101727   Klient_Znajdz_Nazwisko                                                                                                           SQL_STORED_PROCEDURE
1794105432  Klient_Znajdz_Oddzialy_RBD                                                                                                       SQL_STORED_PROCEDURE
1474104292  Klient_Znajdz_RBD                                                                                                                SQL_STORED_PROCEDURE
1010102639  Klient_Znajdz_Wzorzec                                                                                                            SQL_STORED_PROCEDURE
386100416   KlientUprawnienia_Modyfikuj                                                                                                      SQL_STORED_PROCEDURE
402100473   KlientUprawnienia_Usun                                                                                                           SQL_STORED_PROCEDURE
370100359   KlientUprawnienia_Wstaw                                                                                                          SQL_STORED_PROCEDURE
338100245   Marka_Modyfikuj                                                                                                                  SQL_STORED_PROCEDURE
354100302   Marka_Usun                                                                                                                       SQL_STORED_PROCEDURE
322100188   Marka_Wstaw                                                                                                                      SQL_STORED_PROCEDURE
962102468   Marki_Popularnosc                                                                                                                SQL_STORED_PROCEDURE
1538104520  Marki_Popularnosc_RBD_CTE                                                                                                        SQL_STORED_PROCEDURE
434100587   Model_Modyfikuj                                                                                                                  SQL_STORED_PROCEDURE
450100644   Model_Usun                                                                                                                       SQL_STORED_PROCEDURE
418100530   Model_Wstaw                                                                                                                      SQL_STORED_PROCEDURE
194099732   Platnosc_Modyfikuj                                                                                                               SQL_STORED_PROCEDURE
210099789   Platnosc_Usun                                                                                                                    SQL_STORED_PROCEDURE
178099675   Platnosc_Wstaw                                                                                                                   SQL_STORED_PROCEDURE
1442104178  Pracownicy_Lokalni_RBD                                                                                                           SQL_STORED_PROCEDURE
946102411   Pracownicy_Ranking                                                                                                               SQL_STORED_PROCEDURE
1426104121  Pracownicy_Wspolni_RBD                                                                                                           SQL_STORED_PROCEDURE
1714105147  Pracownicy_Wszyscy_Oddzialy_RBD                                                                                                  SQL_STORED_PROCEDURE
1410104064  Pracownicy_Wszyscy_RBD                                                                                                           SQL_STORED_PROCEDURE
1458104235  Pracownicy_Zdalni_RBD                                                                                                            SQL_STORED_PROCEDURE
642101328   Pracownik_Archiwizuj                                                                                                             SQL_STORED_PROCEDURE
50099219    Pracownik_Modyfikuj                                                                                                              SQL_STORED_PROCEDURE
66099276    Pracownik_Usun                                                                                                                   SQL_STORED_PROCEDURE
34099162    Pracownik_Wstaw                                                                                                                  SQL_STORED_PROCEDURE
722101613   Pracownik_Znajdz_Id                                                                                                              SQL_STORED_PROCEDURE
738101670   Pracownik_Znajdz_Nazwisko                                                                                                        SQL_STORED_PROCEDURE
2002106173  Przeniesienia_RBD                                                                                                                SQL_STORED_PROCEDURE
850102069   Samochod_Dostepnosc                                                                                                              SQL_STORED_PROCEDURE
1490104349  Samochod_Dostepnosc_RBD                                                                                                          SQL_STORED_PROCEDURE
482100758   Samochod_Modyfikuj                                                                                                               SQL_STORED_PROCEDURE
498100815   Samochod_Usun                                                                                                                    SQL_STORED_PROCEDURE
466100701   Samochod_Wstaw                                                                                                                   SQL_STORED_PROCEDURE
706101556   Samochod_Wstaw_Makro                                                                                                             SQL_STORED_PROCEDURE
1570104634  Samochod_Zmien_RBD                                                                                                               SQL_STORED_PROCEDURE
914102297   Samochody_Marki                                                                                                                  SQL_STORED_PROCEDURE
146099561   Ubezpieczenie_Modyfikuj                                                                                                          SQL_STORED_PROCEDURE
162099618   Ubezpieczenie_Usun                                                                                                               SQL_STORED_PROCEDURE
130099504   Ubezpieczenie_Wstaw                                                                                                              SQL_STORED_PROCEDURE
98099390    Uprawnienia_Modyfikuj                                                                                                            SQL_STORED_PROCEDURE
114099447   Uprawnienia_Usun                                                                                                                 SQL_STORED_PROCEDURE
82099333    Uprawnienia_Wstaw                                                                                                                SQL_STORED_PROCEDURE
242099903   Usluga_Modyfikuj                                                                                                                 SQL_STORED_PROCEDURE
978102525   Usluga_Niedodawane                                                                                                               SQL_STORED_PROCEDURE
258099960   Usluga_Usun                                                                                                                      SQL_STORED_PROCEDURE
226099846   Usluga_Wstaw                                                                                                                     SQL_STORED_PROCEDURE
1554104577  Uslugi_Popularnosc_RBD_CTE                                                                                                       SQL_STORED_PROCEDURE
818101955   Wypozyczenie_Aktualne                                                                                                            SQL_STORED_PROCEDURE
1106102981  Wypozyczenie_Dodaj                                                                                                               SQL_STORED_PROCEDURE
1986106116  Wypozyczenie_Dodaj_RBD                                                                                                           SQL_STORED_PROCEDURE
530100929   Wypozyczenie_Modyfikuj                                                                                                           SQL_STORED_PROCEDURE
882102183   Wypozyczenie_N_OstatnichDni                                                                                                      SQL_STORED_PROCEDURE
834102012   Wypozyczenie_Szukaj_Okres                                                                                                        SQL_STORED_PROCEDURE
546100986   Wypozyczenie_Usun                                                                                                                SQL_STORED_PROCEDURE
514100872   Wypozyczenie_Wstaw                                                                                                               SQL_STORED_PROCEDURE
994102582   Wypozyczenie_Zestawienie                                                                                                         SQL_STORED_PROCEDURE
802101898   Wypozyczenie_Znajdz_Daty                                                                                                         SQL_STORED_PROCEDURE
1074102867  WypozyczenieUsluga_Dodaj                                                                                                         SQL_STORED_PROCEDURE
1282103608  WypozyczenieUsluga_Dodaj_UW                                                                                                      SQL_STORED_PROCEDURE
578101100   WypozyczenieUsluga_Modyfikuj                                                                                                     SQL_STORED_PROCEDURE
1090102924  WypozyczenieUsluga_Skasuj                                                                                                        SQL_STORED_PROCEDURE
594101157   WypozyczenieUsluga_Usun                                                                                                          SQL_STORED_PROCEDURE
562101043   WypozyczenieUsluga_Wstaw                                                                                                         SQL_STORED_PROCEDURE

(101 rows affected)
*/

------------------------------------------------------------
-- Utworzenie nowego konta serwerowego "S19_test".
------------------------------------------------------------

CREATE LOGIN S19_test WITH PASSWORD = 'test', DEFAULT_DATABASE = S19_P1;
GO

------------------------------------------------------------
-- II Dodawanie i usuwanie konta testowego z poszczególnych ról.
------------------------------------------------------------

-- Rola "Administratorzy".
ALTER ROLE Administratorzy ADD MEMBER S19_test;
GO
ALTER ROLE Administratorzy DROP MEMBER S19_test;
GO

-- Rola "PracownicyAdm".
ALTER ROLE PracownicyAdm ADD MEMBER S19_test;
GO
ALTER ROLE PracownicyAdm DROP MEMBER S19_test;
GO

-- Rola "Sprzedawcy".
ALTER ROLE Sprzedawcy ADD MEMBER S19_test;
GO
ALTER ROLE Sprzedawcy DROP MEMBER S19_test;
GO

-- Rola "Klienci".
ALTER ROLE Klienci ADD MEMBER S19_test;
GO
ALTER ROLE Klienci DROP MEMBER S19_test;
GO

-- Rola "Goscie".
ALTER ROLE Goscie ADD MEMBER S19_test;
GO
ALTER ROLE Goscie DROP MEMBER S19_test;
GO

------------------------------------------------------------
-- III Polecenia testuj¹ce dostêp do obiektów bazy danych i wyniki testowania.
------------------------------------------------------------

------------------------------------------------------------
-- Rola Administratorzy.
------------------------------------------------------------

-- Tabela [Kategoria]

SELECT *
FROM dbo.Kategoria;
GO

/*
Msg 229, Level 14, State 5, Line 164
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Kategoria
(Kategoria, Cena, Opis)
VALUES
('Bardzo szybkie', 3000.00, '');
GO

/*
Msg 229, Level 14, State 5, Line 173
The INSERT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Kategoria
SET Cena = 1000.00
WHERE Kategoria = 'Rodzinna';
GO

/*
Msg 229, Level 14, State 5, Line 184
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 184
The UPDATE permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Kategoria
WHERE Kategoria = 'Rodzinna';
GO

/*
Msg 229, Level 14, State 5, Line 196
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 196
The DELETE permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Kategoria_CenaHistoria]

SELECT *
FROM dbo.Kategoria_CenaHistoria;
GO

/*
Msg 229, Level 14, State 5, Line 209
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Kategoria_CenaHistoria
(IdKategoriaCenaHistoria, Kategoria, DataGodzZmiany, CenaPoprzednia, CenaNowa)
VALUES
(100, 'ABC', '12-12-2023', 50, 100);
GO

/*
Msg 229, Level 14, State 5, Line 218
The INSERT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Kategoria_CenaHistoria
SET Kategoria = 'AC'
WHERE IdKategoriaCenaHistoria = 1;
GO

/*
Msg 229, Level 14, State 5, Line 229
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 229
The UPDATE permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Kategoria_CenaHistoria
WHERE IdKategoriaCenaHistoria = 1;
GO

/*
Msg 229, Level 14, State 5, Line 241
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 241
The DELETE permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Klient]

SELECT *
FROM dbo.Klient;
GO

/*
Msg 229, Level 14, State 5, Line 253
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Klient
(IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi)
VALUES
(102, 'Jan', 'Janiak', 'Janiaki Company', 'Janki', 'Jan Paw³a', '2', '2a', '62-800', 'Janki', '+48-123-432-123', 'janjan@gmail.com', '');
GO

/*
Msg 229, Level 14, State 5, Line 262
The INSERT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Klient
SET Imie = 'Andrzejek'
WHERE IdKlient = 1;
GO

/*
Msg 229, Level 14, State 5, Line 273
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 273
The UPDATE permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Klient
WHERE IdKlient = 1;
GO

/*
Msg 229, Level 14, State 5, Line 285
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 285
The DELETE permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [KlientUprawnienia]
SELECT *
FROM dbo.KlientUprawnienia;
GO

/*
Msg 229, Level 14, State 5, Line 297
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.KlientUprawnienia
(IdKlientUprawnienia, IdKlient, KategoriaPrawaJazdy)
VALUES
(100, 1, 'A');
GO

/*
Msg 229, Level 14, State 5, Line 306
The INSERT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.KlientUprawnienia
SET IdKlient = 4
WHERE IdKlientUprawnienia = 1;
GO

/*
Msg 229, Level 14, State 5, Line 317
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 317
The UPDATE permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.KlientUprawnienia
WHERE IdKlientUprawnienia = 1;
GO

/*
Msg 229, Level 14, State 5, Line 329
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 329
The DELETE permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Marka]

SELECT *
FROM dbo.Marka;
GO

/*
Msg 229, Level 14, State 5, Line 343
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Marka
(Marka)
VALUES
('Subaru');
GO

/*
Msg 229, Level 14, State 5, Line 352
The INSERT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Marka
SET Marka = 'Mercedesek'
WHERE Marka = 'Mercedes';
GO

/*
Msg 229, Level 14, State 5, Line 363
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 363
The UPDATE permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Marka
WHERE Marka = 'Mercedes';
GO

/*
Msg 229, Level 14, State 5, Line 375
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 375
The DELETE permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Model]

SELECT *
FROM dbo.Model;
GO

/*
Msg 229, Level 14, State 5, Line 388
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Model
(Model, Marka)
VALUES
('RS3', 'Audi');
GO

/*
Msg 229, Level 14, State 5, Line 397
The INSERT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Model
SET Marka = 'BMW'
WHERE Model = 'A4';
GO

/*
Msg 229, Level 14, State 5, Line 408
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 408
The UPDATE permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Model
WHERE Model = 'A4';
GO

/*
Msg 229, Level 14, State 5, Line 420
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 420
The DELETE permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Platnosc]

SELECT *
FROM dbo.Platnosc;
GO

/*
Msg 229, Level 14, State 5, Line 433
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Platnosc
(SposobPlatnosci)
VALUES
('Na zeszyt');
GO

/*
Msg 229, Level 14, State 5, Line 442
The INSERT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Platnosc
SET SposobPlatnosci = 'Na zeszyt'
WHERE SposobPlatnosci = 'Karta';
GO

/*
Msg 229, Level 14, State 5, Line 453
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 453
The UPDATE permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Platnosc
WHERE SposobPlatnosci = 'Karta';
GO

/*
Msg 229, Level 14, State 5, Line 465
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 465
The DELETE permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

-- Tabel [Pracownik]

SELECT *
FROM dbo.Pracownik;
GO

/*
Msg 229, Level 14, State 5, Line 478
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Pracownik
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(100, 'Jan', 'Janiak', 'Sprzedawca', '+48-123-234-345', 'janjan@gmail.com');
GO

/*
Msg 229, Level 14, State 5, Line 487
The INSERT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Pracownik
SET Imie = 'Mareczek'
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 498
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 498
The UPDATE permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Pracownik
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 510
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 510
The DELETE permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Pracownik_Kopia]

SELECT *
FROM dbo.Pracownik_Kopia;
GO

/*
Msg 229, Level 14, State 5, Line 523
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Pracownik_Kopia
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(100, 'Jan', 'Janiak', 'Sprzedawca', '+48-123-234-234', 'janjan@gmail.com');
GO

/*
Msg 229, Level 14, State 5, Line 532
The INSERT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Pracownik_Kopia
SET Imie = 'Janek'
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 543
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 543
The UPDATE permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Pracownik_Kopia
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 555
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 555
The DELETE permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Samochod]

SELECT *
FROM dbo.Samochod;
GO

/*
Msg 229, Level 14, State 5, Line 568
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Samochod
(IdSamochod, Kategoria, Model, Dostepnosc, IloscDrzwi, Rocznik, TypSilnika, InformacjeDodatkowe)
VALUES
(100, 'Sportowe', 'A4', 1, 5, 2023, 'Diesel', '');
GO

/*
Msg 229, Level 14, State 5, Line 577
The INSERT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Samochod
SET InformacjeDodatkowe = 'trochê porysowany'
WHERE IdSamochod = 1;
GO

/*
Msg 229, Level 14, State 5, Line 588
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 588
The UPDATE permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Samochod
WHERE IdSamochod = 1;
GO

/*
Msg 229, Level 14, State 5, Line 600
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 600
The DELETE permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Ubezpieczenie]

SELECT *
FROM dbo.Ubezpieczenie;
GO

/*
Msg 229, Level 14, State 5, Line 613
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Ubezpieczenie
(IdUbezpieczenie, Nazwa, Cena, Opis)
VALUES
(100, 'Ubezpieczenie od kradzie¿y', 200, '');
GO

/*
Msg 229, Level 14, State 5, Line 622
The INSERT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Ubezpieczenie
SET Cena = 101
WHERE IdUbezpieczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 633
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 633
The UPDATE permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Ubezpieczenie
WHERE IdUbezpieczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 645
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 645
The DELETE permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

-- Tabela Uprawnienia

SELECT *
FROM dbo.Uprawnienia;
GO

/*
Msg 229, Level 14, State 5, Line 658
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Uprawnienia
(KategoriaPrawaJazdy, KategoriaOpis)
VALUES
('J', 'Dla czo³gistów');
GO

/*
Msg 229, Level 14, State 5, Line 667
The INSERT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Uprawnienia
SET KategoriaOpis = 'aa'
WHERE KategoriaPrawaJazdy = 'A';
GO

/*
Msg 229, Level 14, State 5, Line 678
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 678
The UPDATE permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Uprawnienia
WHERE KategoriaPrawaJazdy = 'A';
GO

/*
Msg 229, Level 14, State 5, Line 690
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 690
The DELETE permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Usluga]

SELECT *
FROM dbo.Usluga;
GO

/*
Msg 229, Level 14, State 5, Line 703
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Usluga
(IdUsluga, Nazwa, Cena, Opis)
VALUES
(100, 'Powietrze premium do opon', 1000, '');
GO

/*
Msg 229, Level 14, State 5, Line 712
The INSERT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Usluga
SET Cena = 101
WHERE IdUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 723
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 723
The UPDATE permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Usluga
WHERE IdUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 735
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 735
The DELETE permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Wypozyczenie]

SELECT *
FROM dbo.Wypozyczenie;
GO

/*
Msg 229, Level 14, State 5, Line 748
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Wypozyczenie
(IdWypozyczenie, IdKlient, IdSamochod, IdPracownik, IdUbezpieczenie, SposobPlatnosci, DataWypozyczenia, TerminZwrotu, DataZwrotu, CenaPrzewidywana, CenaOstateczna, StatusWypozyczenia, Uwagi)
VALUES
(111, 1, 1, 1, 1, 'Karta', '12-12-2023', '01-01-2024', '01-01-2024', 1999, 1999, 1, '');
GO

/*
Msg 229, Level 14, State 5, Line 757
The INSERT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Wypozyczenie
SET IdKlient = 3
WHERE IdWypozyczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 768
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 768
The UPDATE permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Wypozyczenie
WHERE IdWypozyczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 780
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 780
The DELETE permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [WypozyczenieUsluga]

SELECT *
FROM dbo.WypozyczenieUsluga;
GO

/*
Msg 229, Level 14, State 5, Line 793
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.WypozyczenieUsluga
(IdWypozyczenieUsluga, IdWypozyczenie, IdUsluga, Uwagi)
VALUES
(101, 1, 1, 'AVC');
GO

/*
Msg 229, Level 14, State 5, Line 802
The INSERT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.WypozyczenieUsluga
SET Uwagi = '123'
WHERE IdWypozyczenieUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 813
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 813
The UPDATE permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.WypozyczenieUsluga
WHERE IdWypozyczenieUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 825
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 825
The DELETE permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

------------------------------------------------------------
-- Rola PracownicyAdm.
------------------------------------------------------------

SELECT *
FROM dbo.Kategoria;
GO

/*
Msg 229, Level 14, State 5, Line 840
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Kategoria
(Kategoria, Cena, Opis)
VALUES
('Bardzo szybkie', 3000.00, '');
GO

/*
Msg 229, Level 14, State 5, Line 849
The INSERT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Kategoria
SET Cena = 1000.00
WHERE Kategoria = 'Rodzinna';
GO

/*
Msg 229, Level 14, State 5, Line 860
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 860
The UPDATE permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Kategoria
WHERE Kategoria = 'Rodzinna';
GO

/*
Msg 229, Level 14, State 5, Line 872
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 872
The DELETE permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Kategoria_CenaHistoria]

SELECT *
FROM dbo.Kategoria_CenaHistoria;
GO

/*
Msg 229, Level 14, State 5, Line 885
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Kategoria_CenaHistoria
(IdKategoriaCenaHistoria, Kategoria, DataGodzZmiany, CenaPoprzednia, CenaNowa)
VALUES
(100, 'ABC', '12-12-2023', 50, 100);
GO

/*
Msg 229, Level 14, State 5, Line 218
The INSERT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Kategoria_CenaHistoria
SET Kategoria = 'AC'
WHERE IdKategoriaCenaHistoria = 1;
GO

/*
Msg 229, Level 14, State 5, Line 905
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 905
The UPDATE permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Kategoria_CenaHistoria
WHERE IdKategoriaCenaHistoria = 1;
GO

/*
Msg 229, Level 14, State 5, Line 917
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 917
The DELETE permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Klient]

SELECT *
FROM dbo.Klient;
GO

/*
Msg 229, Level 14, State 5, Line 930
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Klient
(IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi)
VALUES
(102, 'Jan', 'Janiak', 'Janiaki Company', 'Janki', 'Jan Paw³a', '2', '2a', '62-800', 'Janki', '+48-123-432-123', 'janjan@gmail.com', '');
GO

/*
Msg 229, Level 14, State 5, Line 939
The INSERT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Klient
SET Imie = 'Andrzejek'
WHERE IdKlient = 1;
GO

/*
Msg 229, Level 14, State 5, Line 950
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 950
The UPDATE permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Klient
WHERE IdKlient = 1;
GO

/*
Msg 229, Level 14, State 5, Line 962
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 962
The DELETE permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [KlientUprawnienia]

SELECT *
FROM dbo.KlientUprawnienia;
GO

/*
Msg 229, Level 14, State 5, Line 973
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.KlientUprawnienia
(IdKlientUprawnienia, IdKlient, KategoriaPrawaJazdy)
VALUES
(100, 1, 'A');
GO

/*
Msg 229, Level 14, State 5, Line 984
The INSERT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.KlientUprawnienia
SET IdKlient = 4
WHERE IdKlientUprawnienia = 1;
GO

/*
Msg 229, Level 14, State 5, Line 995
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 995
The UPDATE permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.KlientUprawnienia
WHERE IdKlientUprawnienia = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1007
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1007
The DELETE permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Marka]

SELECT *
FROM dbo.Marka;
GO

/*
Msg 229, Level 14, State 5, Line 1020
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Marka
(Marka)
VALUES
('Subaru');
GO

/*
Msg 229, Level 14, State 5, Line 1029
The INSERT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Marka
SET Marka = 'Mercedesek'
WHERE Marka = 'Mercedes';
GO

/*
Msg 229, Level 14, State 5, Line 1040
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1040
The UPDATE permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Marka
WHERE Marka = 'Mercedes';
GO

/*
Msg 229, Level 14, State 5, Line 1052
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1052
The DELETE permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Model]

SELECT *
FROM dbo.Model;
GO

/*
Msg 229, Level 14, State 5, Line 1065
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Model
(Model, Marka)
VALUES
('RS3', 'Audi');
GO

/*
Msg 229, Level 14, State 5, Line 1074
The INSERT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Model
SET Marka = 'BMW'
WHERE Model = 'A4';
GO

/*
Msg 229, Level 14, State 5, Line 1085
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1085
The UPDATE permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Model
WHERE Model = 'A4';
GO

/*
Msg 229, Level 14, State 5, Line 1097
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1097
The DELETE permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Platnosc]

SELECT *
FROM dbo.Platnosc;
GO

/*
Msg 229, Level 14, State 5, Line 1110
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Platnosc
(SposobPlatnosci)
VALUES
('Na zeszyt');
GO

/*
Msg 229, Level 14, State 5, Line 1119
The INSERT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Platnosc
SET SposobPlatnosci = 'Na zeszyt'
WHERE SposobPlatnosci = 'Karta';
GO

/*
Msg 229, Level 14, State 5, Line 1130
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1130
The UPDATE permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Platnosc
WHERE SposobPlatnosci = 'Karta';
GO

/*
Msg 229, Level 14, State 5, Line 1142
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1142
The DELETE permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

-- Tabel [Pracownik]

SELECT *
FROM dbo.Pracownik;
GO

/*
Msg 229, Level 14, State 5, Line 1155
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Pracownik
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(100, 'Jan', 'Janiak', 'Sprzedawca', '+48-123-234-345', 'janjan@gmail.com');
GO

/*
Msg 229, Level 14, State 5, Line 1164
The INSERT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Pracownik
SET Imie = 'Mareczek'
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1175
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1175
The UPDATE permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Pracownik
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1187
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1187
The DELETE permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Pracownik_Kopia]

SELECT *
FROM dbo.Pracownik_Kopia;
GO

/*
Msg 229, Level 14, State 5, Line 1200
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Pracownik_Kopia
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(100, 'Jan', 'Janiak', 'Sprzedawca', '+48-123-234-234', 'janjan@gmail.com');
GO

/*
Msg 229, Level 14, State 5, Line 1209
The INSERT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Pracownik_Kopia
SET Imie = 'Janek'
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1220
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1220
The UPDATE permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Pracownik_Kopia
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1232
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1232
The DELETE permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Samochod]

SELECT *
FROM dbo.Samochod;
GO

/*
Msg 229, Level 14, State 5, Line 1245
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Samochod
(IdSamochod, Kategoria, Model, Dostepnosc, IloscDrzwi, Rocznik, TypSilnika, InformacjeDodatkowe)
VALUES
(100, 'Sportowe', 'A4', 1, 5, 2023, 'Diesel', '');
GO

/*
Msg 229, Level 14, State 5, Line 1254
The INSERT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Samochod
SET InformacjeDodatkowe = 'trochê porysowany'
WHERE IdSamochod = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1265
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1265
The UPDATE permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Samochod
WHERE IdSamochod = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1277
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1277
The DELETE permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Ubezpieczenie]

SELECT *
FROM dbo.Ubezpieczenie;
GO

/*
Msg 229, Level 14, State 5, Line 1290
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Ubezpieczenie
(IdUbezpieczenie, Nazwa, Cena, Opis)
VALUES
(100, 'Ubezpieczenie od kradzie¿y', 200, '');
GO

/*
Msg 229, Level 14, State 5, Line 1299
The INSERT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Ubezpieczenie
SET Cena = 101
WHERE IdUbezpieczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1310
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1310
The UPDATE permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Ubezpieczenie
WHERE IdUbezpieczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1322
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1322
The DELETE permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

-- Tabela Uprawnienia

SELECT *
FROM dbo.Uprawnienia;
GO

/*
Msg 229, Level 14, State 5, Line 1335
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Uprawnienia
(KategoriaPrawaJazdy, KategoriaOpis)
VALUES
('J', 'Dla czo³gistów');
GO

/*
Msg 229, Level 14, State 5, Line 1344
The INSERT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Uprawnienia
SET KategoriaOpis = 'aa'
WHERE KategoriaPrawaJazdy = 'A';
GO

/*
Msg 229, Level 14, State 5, Line 1355
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1355
The UPDATE permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Uprawnienia
WHERE KategoriaPrawaJazdy = 'A';
GO

/*
Msg 229, Level 14, State 5, Line 1367
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1367
The DELETE permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Usluga]

SELECT *
FROM dbo.Usluga;
GO

/*
Msg 229, Level 14, State 5, Line 1380
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Usluga
(IdUsluga, Nazwa, Cena, Opis)
VALUES
(100, 'Powietrze premium do opon', 1000, '');
GO

/*
Msg 229, Level 14, State 5, Line 1389
The INSERT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Usluga
SET Cena = 101
WHERE IdUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1400
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1400
The UPDATE permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Usluga
WHERE IdUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1412
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1412
The DELETE permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Wypozyczenie]

SELECT *
FROM dbo.Wypozyczenie;
GO

/*
Msg 229, Level 14, State 5, Line 1425
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Wypozyczenie
(IdWypozyczenie, IdKlient, IdSamochod, IdPracownik, IdUbezpieczenie, SposobPlatnosci, DataWypozyczenia, TerminZwrotu, DataZwrotu, CenaPrzewidywana, CenaOstateczna, StatusWypozyczenia, Uwagi)
VALUES
(111, 1, 1, 1, 1, 'Karta', '12-12-2023', '01-01-2024', '01-01-2024', 1999, 1999, 1, '');
GO

/*
Msg 229, Level 14, State 5, Line 1434
The INSERT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Wypozyczenie
SET IdKlient = 3
WHERE IdWypozyczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1445
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1445
The UPDATE permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Wypozyczenie
WHERE IdWypozyczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1457
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1457
The DELETE permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [WypozyczenieUsluga]

SELECT *
FROM dbo.WypozyczenieUsluga;
GO

/*
Msg 229, Level 14, State 5, Line 1470
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.WypozyczenieUsluga
(IdWypozyczenieUsluga, IdWypozyczenie, IdUsluga, Uwagi)
VALUES
(101, 1, 1, 'AVC');
GO

/*
Msg 229, Level 14, State 5, Line 1479
The INSERT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.WypozyczenieUsluga
SET Uwagi = '123'
WHERE IdWypozyczenieUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1900
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1900
The UPDATE permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.WypozyczenieUsluga
WHERE IdWypozyczenieUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1502
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1502
The DELETE permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

------------------------------------------------------------
-- Rola Sprzedawcy.
------------------------------------------------------------

SELECT *
FROM dbo.Kategoria;
GO

/*
Msg 229, Level 14, State 5, Line 1517
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Kategoria
(Kategoria, Cena, Opis)
VALUES
('Bardzo szybkie', 3000.00, '');
GO

/*
Msg 229, Level 14, State 5, Line 1526
The INSERT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Kategoria
SET Cena = 1000.00
WHERE Kategoria = 'Rodzinna';
GO

/*
Msg 229, Level 14, State 5, Line 1537
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1537
The UPDATE permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Kategoria
WHERE Kategoria = 'Rodzinna';
GO

/*
Msg 229, Level 14, State 5, Line 1549
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1549
The DELETE permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Kategoria_CenaHistoria]

SELECT *
FROM dbo.Kategoria_CenaHistoria;
GO

/*
Msg 229, Level 14, State 5, Line 1562
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Kategoria_CenaHistoria
(IdKategoriaCenaHistoria, Kategoria, DataGodzZmiany, CenaPoprzednia, CenaNowa)
VALUES
(100, 'ABC', '12-12-2023', 50, 100);
GO

/*
Msg 229, Level 14, State 5, Line 1571
The INSERT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Kategoria_CenaHistoria
SET Kategoria = 'AC'
WHERE IdKategoriaCenaHistoria = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1582
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1582
The UPDATE permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Kategoria_CenaHistoria
WHERE IdKategoriaCenaHistoria = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1594
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1594
The DELETE permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Klient]

SELECT *
FROM dbo.Klient;
GO

/*
Msg 229, Level 14, State 5, Line 1607
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Klient
(IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi)
VALUES
(102, 'Jan', 'Janiak', 'Janiaki Company', 'Janki', 'Jan Paw³a', '2', '2a', '62-800', 'Janki', '+48-123-432-123', 'janjan@gmail.com', '');
GO

/*
Msg 229, Level 14, State 5, Line 1616
The INSERT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Klient
SET Imie = 'Andrzejek'
WHERE IdKlient = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1627
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1627
The UPDATE permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Klient
WHERE IdKlient = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1639
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1639
The DELETE permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [KlientUprawnienia]

SELECT *
FROM dbo.KlientUprawnienia;
GO

/*
Msg 229, Level 14, State 5, Line 1652
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.KlientUprawnienia
(IdKlientUprawnienia, IdKlient, KategoriaPrawaJazdy)
VALUES
(100, 1, 'A');
GO

/*
Msg 229, Level 14, State 5, Line 1661
The INSERT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.KlientUprawnienia
SET IdKlient = 4
WHERE IdKlientUprawnienia = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1672
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1672
The UPDATE permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.KlientUprawnienia
WHERE IdKlientUprawnienia = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1684
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1684
The DELETE permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Marka]

SELECT *
FROM dbo.Marka;
GO

/*
Msg 229, Level 14, State 5, Line 1697
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Marka
(Marka)
VALUES
('Subaru');
GO

/*
Msg 229, Level 14, State 5, Line 1706
The INSERT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Marka
SET Marka = 'Mercedesek'
WHERE Marka = 'Mercedes';
GO

/*
Msg 229, Level 14, State 5, Line 1717
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1717
The UPDATE permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Marka
WHERE Marka = 'Mercedes';
GO

/*
Msg 229, Level 14, State 5, Line 1729
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1729
The DELETE permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Model]

SELECT *
FROM dbo.Model;
GO

/*
Msg 229, Level 14, State 5, Line 1742
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Model
(Model, Marka)
VALUES
('RS3', 'Audi');
GO

/*
Msg 229, Level 14, State 5, Line 1751
The INSERT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Model
SET Marka = 'BMW'
WHERE Model = 'A4';
GO

/*
Msg 229, Level 14, State 5, Line 1762
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1762
The UPDATE permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Model
WHERE Model = 'A4';
GO

/*
Msg 229, Level 14, State 5, Line 1774
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1774
The DELETE permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Platnosc]

SELECT *
FROM dbo.Platnosc;
GO

/*
Msg 229, Level 14, State 5, Line 1787
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Platnosc
(SposobPlatnosci)
VALUES
('Na zeszyt');
GO

/*
Msg 229, Level 14, State 5, Line 1796
The INSERT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Platnosc
SET SposobPlatnosci = 'Na zeszyt'
WHERE SposobPlatnosci = 'Karta';
GO

/*
Msg 229, Level 14, State 5, Line 1807
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1807
The UPDATE permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Platnosc
WHERE SposobPlatnosci = 'Karta';
GO

/*
Msg 229, Level 14, State 5, Line 1819
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1819
The DELETE permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

-- Tabel [Pracownik]

SELECT *
FROM dbo.Pracownik;
GO

/*
Msg 229, Level 14, State 5, Line 1837
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Pracownik
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(100, 'Jan', 'Janiak', 'Sprzedawca', '+48-123-234-345', 'janjan@gmail.com');
GO

/*
Msg 229, Level 14, State 5, Line 1841
The INSERT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Pracownik
SET Imie = 'Mareczek'
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1852
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1852
The UPDATE permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Pracownik
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1864
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1864
The DELETE permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Pracownik_Kopia]

SELECT *
FROM dbo.Pracownik_Kopia;
GO

/*
Msg 229, Level 14, State 5, Line 1877
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Pracownik_Kopia
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(100, 'Jan', 'Janiak', 'Sprzedawca', '+48-123-234-234', 'janjan@gmail.com');
GO

/*
Msg 229, Level 14, State 5, Line 1886
The INSERT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Pracownik_Kopia
SET Imie = 'Janek'
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1897
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1897
The UPDATE permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Pracownik_Kopia
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1909
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1909
The DELETE permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Samochod]

SELECT *
FROM dbo.Samochod;
GO

/*
Msg 229, Level 14, State 5, Line 1922
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Samochod
(IdSamochod, Kategoria, Model, Dostepnosc, IloscDrzwi, Rocznik, TypSilnika, InformacjeDodatkowe)
VALUES
(100, 'Sportowe', 'A4', 1, 5, 2023, 'Diesel', '');
GO

/*
Msg 229, Level 14, State 5, Line 1931
The INSERT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Samochod
SET InformacjeDodatkowe = 'trochê porysowany'
WHERE IdSamochod = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1942
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1942
The UPDATE permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Samochod
WHERE IdSamochod = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1954
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1954
The DELETE permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Ubezpieczenie]

SELECT *
FROM dbo.Ubezpieczenie;
GO

/*
Msg 229, Level 14, State 5, Line 1967
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Ubezpieczenie
(IdUbezpieczenie, Nazwa, Cena, Opis)
VALUES
(100, 'Ubezpieczenie od kradzie¿y', 200, '');
GO

/*
Msg 229, Level 14, State 5, Line 1976
The INSERT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Ubezpieczenie
SET Cena = 101
WHERE IdUbezpieczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1987
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1987
The UPDATE permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Ubezpieczenie
WHERE IdUbezpieczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 1999
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1999
The DELETE permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

-- Tabela Uprawnienia

SELECT *
FROM dbo.Uprawnienia;
GO

/*
Msg 229, Level 14, State 5, Line 2012
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Uprawnienia
(KategoriaPrawaJazdy, KategoriaOpis)
VALUES
('J', 'Dla czo³gistów');
GO

/*
Msg 229, Level 14, State 5, Line 2021
The INSERT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Uprawnienia
SET KategoriaOpis = 'aa'
WHERE KategoriaPrawaJazdy = 'A';
GO

/*
Msg 229, Level 14, State 5, Line 2032
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2032
The UPDATE permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Uprawnienia
WHERE KategoriaPrawaJazdy = 'A';
GO

/*
Msg 229, Level 14, State 5, Line 2044
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2044
The DELETE permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Usluga]

SELECT *
FROM dbo.Usluga;
GO

/*
Msg 229, Level 14, State 5, Line 2057
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Usluga
(IdUsluga, Nazwa, Cena, Opis)
VALUES
(100, 'Powietrze premium do opon', 1000, '');
GO

/*
Msg 229, Level 14, State 5, Line 2066
The INSERT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Usluga
SET Cena = 101
WHERE IdUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2077
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2077
The UPDATE permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Usluga
WHERE IdUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2089
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2089
The DELETE permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Wypozyczenie]

SELECT *
FROM dbo.Wypozyczenie;
GO

/*
Msg 229, Level 14, State 5, Line 2103
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Wypozyczenie
(IdWypozyczenie, IdKlient, IdSamochod, IdPracownik, IdUbezpieczenie, SposobPlatnosci, DataWypozyczenia, TerminZwrotu, DataZwrotu, CenaPrzewidywana, CenaOstateczna, StatusWypozyczenia, Uwagi)
VALUES
(111, 1, 1, 1, 1, 'Karta', '12-12-2023', '01-01-2024', '01-01-2024', 1999, 1999, 1, '');
GO

/*
Msg 229, Level 14, State 5, Line 2111
The INSERT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Wypozyczenie
SET IdKlient = 3
WHERE IdWypozyczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2122
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2122
The UPDATE permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Wypozyczenie
WHERE IdWypozyczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2134
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2145
The DELETE permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [WypozyczenieUsluga]

SELECT *
FROM dbo.WypozyczenieUsluga;
GO

/*
Msg 229, Level 14, State 5, Line 2147
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.WypozyczenieUsluga
(IdWypozyczenieUsluga, IdWypozyczenie, IdUsluga, Uwagi)
VALUES
(101, 1, 1, 'AVC');
GO

/*
Msg 229, Level 14, State 5, Line 2156
The INSERT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.WypozyczenieUsluga
SET Uwagi = '123'
WHERE IdWypozyczenieUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2167
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2167
The UPDATE permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.WypozyczenieUsluga
WHERE IdWypozyczenieUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2179
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2179
The DELETE permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

------------------------------------------------------------
-- Rola Klienci.
------------------------------------------------------------

SELECT *
FROM dbo.Kategoria;
GO

/*
Msg 229, Level 14, State 5, Line 2194
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Kategoria
(Kategoria, Cena, Opis)
VALUES
('Bardzo szybkie', 3000.00, '');
GO

/*
Msg 229, Level 14, State 5, Line 2203
The INSERT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Kategoria
SET Cena = 1000.00
WHERE Kategoria = 'Rodzinna';
GO

/*
Msg 229, Level 14, State 5, Line 2214
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 1537
The UPDATE permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Kategoria
WHERE Kategoria = 'Rodzinna';
GO

/*
Msg 229, Level 14, State 5, Line 2226
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2226
The DELETE permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Kategoria_CenaHistoria]

SELECT *
FROM dbo.Kategoria_CenaHistoria;
GO

/*
Msg 229, Level 14, State 5, Line 2239
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Kategoria_CenaHistoria
(IdKategoriaCenaHistoria, Kategoria, DataGodzZmiany, CenaPoprzednia, CenaNowa)
VALUES
(100, 'ABC', '12-12-2023', 50, 100);
GO

/*
Msg 229, Level 14, State 5, Line 2248
The INSERT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Kategoria_CenaHistoria
SET Kategoria = 'AC'
WHERE IdKategoriaCenaHistoria = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2259
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2259
The UPDATE permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Kategoria_CenaHistoria
WHERE IdKategoriaCenaHistoria = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2271
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2271
The DELETE permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Klient]

SELECT *
FROM dbo.Klient;
GO

/*
Msg 229, Level 14, State 5, Line 2284
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Klient
(IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi)
VALUES
(102, 'Jan', 'Janiak', 'Janiaki Company', 'Janki', 'Jan Paw³a', '2', '2a', '62-800', 'Janki', '+48-123-432-123', 'janjan@gmail.com', '');
GO

/*
Msg 229, Level 14, State 5, Line 2293
The INSERT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Klient
SET Imie = 'Andrzejek'
WHERE IdKlient = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2304
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2304
The UPDATE permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Klient
WHERE IdKlient = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2316
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2316
The DELETE permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [KlientUprawnienia]

SELECT *
FROM dbo.KlientUprawnienia;
GO

/*
Msg 229, Level 14, State 5, Line 2329
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.KlientUprawnienia
(IdKlientUprawnienia, IdKlient, KategoriaPrawaJazdy)
VALUES
(100, 1, 'A');
GO

/*
Msg 229, Level 14, State 5, Line 2338
The INSERT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.KlientUprawnienia
SET IdKlient = 4
WHERE IdKlientUprawnienia = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2349
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2349
The UPDATE permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.KlientUprawnienia
WHERE IdKlientUprawnienia = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2361
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2361
The DELETE permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Marka]

SELECT *
FROM dbo.Marka;
GO

/*
Msg 229, Level 14, State 5, Line 2374
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Marka
(Marka)
VALUES
('Subaru');
GO

/*
Msg 229, Level 14, State 5, Line 2383
The INSERT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Marka
SET Marka = 'Mercedesek'
WHERE Marka = 'Mercedes';
GO

/*
Msg 229, Level 14, State 5, Line 2394
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2394
The UPDATE permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Marka
WHERE Marka = 'Mercedes';
GO

/*
Msg 229, Level 14, State 5, Line 2406
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2406
The DELETE permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Model]

SELECT *
FROM dbo.Model;
GO

/*
Msg 229, Level 14, State 5, Line 2419
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Model
(Model, Marka)
VALUES
('RS3', 'Audi');
GO

/*
Msg 229, Level 14, State 5, Line 2428
The INSERT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Model
SET Marka = 'BMW'
WHERE Model = 'A4';
GO

/*
Msg 229, Level 14, State 5, Line 2439
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2439
The UPDATE permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Model
WHERE Model = 'A4';
GO

/*
Msg 229, Level 14, State 5, Line 2451
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2451
The DELETE permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Platnosc]

SELECT *
FROM dbo.Platnosc;
GO

/*
Msg 229, Level 14, State 5, Line 2464
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Platnosc
(SposobPlatnosci)
VALUES
('Na zeszyt');
GO

/*
Msg 229, Level 14, State 5, Line 2473
The INSERT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Platnosc
SET SposobPlatnosci = 'Na zeszyt'
WHERE SposobPlatnosci = 'Karta';
GO

/*
Msg 229, Level 14, State 5, Line 2484
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2484
The UPDATE permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Platnosc
WHERE SposobPlatnosci = 'Karta';
GO

/*
Msg 229, Level 14, State 5, Line 2496
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2496
The DELETE permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

-- Tabel [Pracownik]

SELECT *
FROM dbo.Pracownik;
GO

/*
Msg 229, Level 14, State 5, Line 2509
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Pracownik
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(100, 'Jan', 'Janiak', 'Sprzedawca', '+48-123-234-345', 'janjan@gmail.com');
GO

/*
Msg 229, Level 14, State 5, Line 2518
The INSERT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Pracownik
SET Imie = 'Mareczek'
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2529
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2529
The UPDATE permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Pracownik
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2541
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2541
The DELETE permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Pracownik_Kopia]

SELECT *
FROM dbo.Pracownik_Kopia;
GO

/*
Msg 229, Level 14, State 5, Line 2554
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Pracownik_Kopia
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(100, 'Jan', 'Janiak', 'Sprzedawca', '+48-123-234-234', 'janjan@gmail.com');
GO

/*
Msg 229, Level 14, State 5, Line 2563
The INSERT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Pracownik_Kopia
SET Imie = 'Janek'
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2574
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2574
The UPDATE permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Pracownik_Kopia
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2586
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2586
The DELETE permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Samochod]

SELECT *
FROM dbo.Samochod;
GO

/*
Msg 229, Level 14, State 5, Line 2599
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Samochod
(IdSamochod, Kategoria, Model, Dostepnosc, IloscDrzwi, Rocznik, TypSilnika, InformacjeDodatkowe)
VALUES
(100, 'Sportowe', 'A4', 1, 5, 2023, 'Diesel', '');
GO

/*
Msg 229, Level 14, State 5, Line 2608
The INSERT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Samochod
SET InformacjeDodatkowe = 'trochê porysowany'
WHERE IdSamochod = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2619
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2619
The UPDATE permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Samochod
WHERE IdSamochod = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2631
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2631
The DELETE permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Ubezpieczenie]

SELECT *
FROM dbo.Ubezpieczenie;
GO

/*
Msg 229, Level 14, State 5, Line 2644
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Ubezpieczenie
(IdUbezpieczenie, Nazwa, Cena, Opis)
VALUES
(100, 'Ubezpieczenie od kradzie¿y', 200, '');
GO

/*
Msg 229, Level 14, State 5, Line 2653
The INSERT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Ubezpieczenie
SET Cena = 101
WHERE IdUbezpieczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2664
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2664
The UPDATE permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Ubezpieczenie
WHERE IdUbezpieczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2676
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2676
The DELETE permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

-- Tabela Uprawnienia

SELECT *
FROM dbo.Uprawnienia;
GO

/*
Msg 229, Level 14, State 5, Line 2689
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Uprawnienia
(KategoriaPrawaJazdy, KategoriaOpis)
VALUES
('J', 'Dla czo³gistów');
GO

/*
Msg 229, Level 14, State 5, Line 2698
The INSERT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Uprawnienia
SET KategoriaOpis = 'aa'
WHERE KategoriaPrawaJazdy = 'A';
GO

/*
Msg 229, Level 14, State 5, Line 2709
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2709
The UPDATE permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Uprawnienia
WHERE KategoriaPrawaJazdy = 'A';
GO

/*
Msg 229, Level 14, State 5, Line 2721
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2721
The DELETE permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Usluga]

SELECT *
FROM dbo.Usluga;
GO

/*
Msg 229, Level 14, State 5, Line 2734
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Usluga
(IdUsluga, Nazwa, Cena, Opis)
VALUES
(100, 'Powietrze premium do opon', 1000, '');
GO

/*
Msg 229, Level 14, State 5, Line 2743
The INSERT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Usluga
SET Cena = 101
WHERE IdUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2754
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2754
The UPDATE permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Usluga
WHERE IdUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2766
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2766
The DELETE permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Wypozyczenie]

SELECT *
FROM dbo.Wypozyczenie;
GO

/*
Msg 229, Level 14, State 5, Line 2779
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Wypozyczenie
(IdWypozyczenie, IdKlient, IdSamochod, IdPracownik, IdUbezpieczenie, SposobPlatnosci, DataWypozyczenia, TerminZwrotu, DataZwrotu, CenaPrzewidywana, CenaOstateczna, StatusWypozyczenia, Uwagi)
VALUES
(111, 1, 1, 1, 1, 'Karta', '12-12-2023', '01-01-2024', '01-01-2024', 1999, 1999, 1, '');
GO

/*
Msg 229, Level 14, State 5, Line 2788
The INSERT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Wypozyczenie
SET IdKlient = 3
WHERE IdWypozyczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2799
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2799
The UPDATE permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Wypozyczenie
WHERE IdWypozyczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2811
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2811
The DELETE permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [WypozyczenieUsluga]

SELECT *
FROM dbo.WypozyczenieUsluga;
GO

/*
Msg 229, Level 14, State 5, Line 2824
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.WypozyczenieUsluga
(IdWypozyczenieUsluga, IdWypozyczenie, IdUsluga, Uwagi)
VALUES
(101, 1, 1, 'AVC');
GO

/*
Msg 229, Level 14, State 5, Line 2833
The INSERT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.WypozyczenieUsluga
SET Uwagi = '123'
WHERE IdWypozyczenieUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2844
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2844
The UPDATE permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.WypozyczenieUsluga
WHERE IdWypozyczenieUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2856
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2856
The DELETE permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

------------------------------------------------------------
-- Rola Goscie.
------------------------------------------------------------

SELECT *
FROM dbo.Kategoria;
GO

/*
Msg 229, Level 14, State 5, Line 2871
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Kategoria
(Kategoria, Cena, Opis)
VALUES
('Bardzo szybkie', 3000.00, '');
GO

/*
Msg 229, Level 14, State 5, Line 2880
The INSERT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Kategoria
SET Cena = 1000.00
WHERE Kategoria = 'Rodzinna';
GO

/*
Msg 229, Level 14, State 5, Line 2891
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2891
The UPDATE permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Kategoria
WHERE Kategoria = 'Rodzinna';
GO

/*
Msg 229, Level 14, State 5, Line 2903
The SELECT permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2903
The DELETE permission was denied on the object 'Kategoria', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Kategoria_CenaHistoria]

SELECT *
FROM dbo.Kategoria_CenaHistoria;
GO

/*
Msg 229, Level 14, State 5, Line 2916
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Kategoria_CenaHistoria
(IdKategoriaCenaHistoria, Kategoria, DataGodzZmiany, CenaPoprzednia, CenaNowa)
VALUES
(100, 'ABC', '12-12-2023', 50, 100);
GO

/*
Msg 229, Level 14, State 5, Line 2925
The INSERT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Kategoria_CenaHistoria
SET Kategoria = 'AC'
WHERE IdKategoriaCenaHistoria = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2936
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2936
The UPDATE permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Kategoria_CenaHistoria
WHERE IdKategoriaCenaHistoria = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2948
The SELECT permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2948
The DELETE permission was denied on the object 'Kategoria_CenaHistoria', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Klient]

SELECT *
FROM dbo.Klient;
GO

/*
Msg 229, Level 14, State 5, Line 2961
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Klient
(IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi)
VALUES
(102, 'Jan', 'Janiak', 'Janiaki Company', 'Janki', 'Jan Paw³a', '2', '2a', '62-800', 'Janki', '+48-123-432-123', 'janjan@gmail.com', '');
GO

/*
Msg 229, Level 14, State 5, Line 2970
The INSERT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Klient
SET Imie = 'Andrzejek'
WHERE IdKlient = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2981
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2981
The UPDATE permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Klient
WHERE IdKlient = 1;
GO

/*
Msg 229, Level 14, State 5, Line 2993
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 2993
The DELETE permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [KlientUprawnienia]

SELECT *
FROM dbo.KlientUprawnienia;
GO

/*
Msg 229, Level 14, State 5, Line 3006
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.KlientUprawnienia
(IdKlientUprawnienia, IdKlient, KategoriaPrawaJazdy)
VALUES
(100, 1, 'A');
GO

/*
Msg 229, Level 14, State 5, Line 3015
The INSERT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.KlientUprawnienia
SET IdKlient = 4
WHERE IdKlientUprawnienia = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3026
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3026
The UPDATE permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.KlientUprawnienia
WHERE IdKlientUprawnienia = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3038
The SELECT permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3038
The DELETE permission was denied on the object 'KlientUprawnienia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Marka]

SELECT *
FROM dbo.Marka;
GO

/*
Msg 229, Level 14, State 5, Line 3051
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Marka
(Marka)
VALUES
('Subaru');
GO

/*
Msg 229, Level 14, State 5, Line 3060
The INSERT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Marka
SET Marka = 'Mercedesek'
WHERE Marka = 'Mercedes';
GO

/*
Msg 229, Level 14, State 5, Line 3071
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3071
The UPDATE permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Marka
WHERE Marka = 'Mercedes';
GO

/*
Msg 229, Level 14, State 5, Line 3083
The SELECT permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3090
The DELETE permission was denied on the object 'Marka', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Model]

SELECT *
FROM dbo.Model;
GO

/*
Msg 229, Level 14, State 5, Line 3096
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Model
(Model, Marka)
VALUES
('RS3', 'Audi');
GO

/*
Msg 229, Level 14, State 5, Line 3105
The INSERT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Model
SET Marka = 'BMW'
WHERE Model = 'A4';
GO

/*
Msg 229, Level 14, State 5, Line 3116
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3116
The UPDATE permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Model
WHERE Model = 'A4';
GO

/*
Msg 229, Level 14, State 5, Line 3128
The SELECT permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3128
The DELETE permission was denied on the object 'Model', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Platnosc]

SELECT *
FROM dbo.Platnosc;
GO

/*
Msg 229, Level 14, State 5, Line 3141
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Platnosc
(SposobPlatnosci)
VALUES
('Na zeszyt');
GO

/*
Msg 229, Level 14, State 5, Line 3150
The INSERT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Platnosc
SET SposobPlatnosci = 'Na zeszyt'
WHERE SposobPlatnosci = 'Karta';
GO

/*
Msg 229, Level 14, State 5, Line 3161
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3161
The UPDATE permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Platnosc
WHERE SposobPlatnosci = 'Karta';
GO

/*
Msg 229, Level 14, State 5, Line 3173
The SELECT permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3173
The DELETE permission was denied on the object 'Platnosc', database 'S19_P1', schema 'dbo'.
*/

-- Tabel [Pracownik]

SELECT *
FROM dbo.Pracownik;
GO

/*
Msg 229, Level 14, State 5, Line 3186
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Pracownik
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(100, 'Jan', 'Janiak', 'Sprzedawca', '+48-123-234-345', 'janjan@gmail.com');
GO

/*
Msg 229, Level 14, State 5, Line 3195
The INSERT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Pracownik
SET Imie = 'Mareczek'
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3206
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3206
The UPDATE permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Pracownik
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3218
The SELECT permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3218
The DELETE permission was denied on the object 'Pracownik', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Pracownik_Kopia]

SELECT *
FROM dbo.Pracownik_Kopia;
GO

/*
Msg 229, Level 14, State 5, Line 3231
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Pracownik_Kopia
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(100, 'Jan', 'Janiak', 'Sprzedawca', '+48-123-234-234', 'janjan@gmail.com');
GO

/*
Msg 229, Level 14, State 5, Line 3240
The INSERT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Pracownik_Kopia
SET Imie = 'Janek'
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3251
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3251
The UPDATE permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Pracownik_Kopia
WHERE IdPracownik = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3263
The SELECT permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3263
The DELETE permission was denied on the object 'Pracownik_Kopia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Samochod]

SELECT *
FROM dbo.Samochod;
GO

/*
Msg 229, Level 14, State 5, Line 3276
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Samochod
(IdSamochod, Kategoria, Model, Dostepnosc, IloscDrzwi, Rocznik, TypSilnika, InformacjeDodatkowe)
VALUES
(100, 'Sportowe', 'A4', 1, 5, 2023, 'Diesel', '');
GO

/*
Msg 229, Level 14, State 5, Line 3285
The INSERT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Samochod
SET InformacjeDodatkowe = 'trochê porysowany'
WHERE IdSamochod = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3296
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3296
The UPDATE permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Samochod
WHERE IdSamochod = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3308
The SELECT permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3308
The DELETE permission was denied on the object 'Samochod', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Ubezpieczenie]

SELECT *
FROM dbo.Ubezpieczenie;
GO

/*
Msg 229, Level 14, State 5, Line 3321
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Ubezpieczenie
(IdUbezpieczenie, Nazwa, Cena, Opis)
VALUES
(100, 'Ubezpieczenie od kradzie¿y', 200, '');
GO

/*
Msg 229, Level 14, State 5, Line 3330
The INSERT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Ubezpieczenie
SET Cena = 101
WHERE IdUbezpieczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3341
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3341
The UPDATE permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Ubezpieczenie
WHERE IdUbezpieczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3353
The SELECT permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3353
The DELETE permission was denied on the object 'Ubezpieczenie', database 'S19_P1', schema 'dbo'.
*/

-- Tabela Uprawnienia

SELECT *
FROM dbo.Uprawnienia;
GO

/*
Msg 229, Level 14, State 5, Line 3366
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Uprawnienia
(KategoriaPrawaJazdy, KategoriaOpis)
VALUES
('J', 'Dla czo³gistów');
GO

/*
Msg 229, Level 14, State 5, Line 3375
The INSERT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Uprawnienia
SET KategoriaOpis = 'aa'
WHERE KategoriaPrawaJazdy = 'A';
GO

/*
Msg 229, Level 14, State 5, Line 3386
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3386
The UPDATE permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Uprawnienia
WHERE KategoriaPrawaJazdy = 'A';
GO

/*
Msg 229, Level 14, State 5, Line 3398
The SELECT permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3398
The DELETE permission was denied on the object 'Uprawnienia', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Usluga]

SELECT *
FROM dbo.Usluga;
GO

/*
Msg 229, Level 14, State 5, Line 3411
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Usluga
(IdUsluga, Nazwa, Cena, Opis)
VALUES
(100, 'Powietrze premium do opon', 1000, '');
GO

/*
Msg 229, Level 14, State 5, Line 3420
The INSERT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Usluga
SET Cena = 101
WHERE IdUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3431
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3431
The UPDATE permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Usluga
WHERE IdUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3443
The SELECT permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3443
The DELETE permission was denied on the object 'Usluga', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [Wypozyczenie]

SELECT *
FROM dbo.Wypozyczenie;
GO

/*
Msg 229, Level 14, State 5, Line 3456
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.Wypozyczenie
(IdWypozyczenie, IdKlient, IdSamochod, IdPracownik, IdUbezpieczenie, SposobPlatnosci, DataWypozyczenia, TerminZwrotu, DataZwrotu, CenaPrzewidywana, CenaOstateczna, StatusWypozyczenia, Uwagi)
VALUES
(111, 1, 1, 1, 1, 'Karta', '12-12-2023', '01-01-2024', '01-01-2024', 1999, 1999, 1, '');
GO

/*
Msg 229, Level 14, State 5, Line 3465
The INSERT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.Wypozyczenie
SET IdKlient = 3
WHERE IdWypozyczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3476
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3476
The UPDATE permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.Wypozyczenie
WHERE IdWypozyczenie = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3488
The SELECT permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3488
The DELETE permission was denied on the object 'Wypozyczenie', database 'S19_P1', schema 'dbo'.
*/

-- Tabela [WypozyczenieUsluga]

SELECT *
FROM dbo.WypozyczenieUsluga;
GO

/*
Msg 229, Level 14, State 5, Line 3501
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

INSERT dbo.WypozyczenieUsluga
(IdWypozyczenieUsluga, IdWypozyczenie, IdUsluga, Uwagi)
VALUES
(101, 1, 1, 'AVC');
GO

/*
Msg 229, Level 14, State 5, Line 3510
The INSERT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

UPDATE dbo.WypozyczenieUsluga
SET Uwagi = '123'
WHERE IdWypozyczenieUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3521
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3521
The UPDATE permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

DELETE dbo.WypozyczenieUsluga
WHERE IdWypozyczenieUsluga = 1;
GO

/*
Msg 229, Level 14, State 5, Line 3533
The SELECT permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Line 3533
The DELETE permission was denied on the object 'WypozyczenieUsluga', database 'S19_P1', schema 'dbo'.
*/

------------------------------------------------------------
-- Procedury przechowywane.
------------------------------------------------------------

------------------------------------------------------------
-- Rola Administratorzy.
------------------------------------------------------------

EXECUTE dbo.Kategoria_Modyfikuj
@Par_Kategoria = 'Sportowe',
@Par_Cena = 1000.0,
@Par_Opis = '';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Kategoria_Wstaw
@Par_Kategoria = 'abc',
@Par_Cena = 100.0,
@Par_Opis = '';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Kategoria_Usun
@Par_Kategoria = 'abc';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Kategoria_ZmienCene
@Par_Kategoria = 'Sportowe',
@Par_Cena = 1001;
GO

/*
(1 row affected)

(1 row affected)
*/

EXECUTE dbo.Kategoria_Znajdz_Cena
@Par_CenaOd = 300;
GO

/*
Kategoria            Cena                  Opis
-------------------- --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Premium              300,00                Luksusowe samochody z najnowszymi funkcjami i eleganckim wykoñczeniem. Zapewniaj¹ wyj¹tkowy komfort, styl i doskona³e osi¹gi. Doskona³e do podró¿y s³u¿bowych lub specjalnych okazji.
Klasyczny/Antyk      400,00                Klasyczne samochody z przesz³oœci, które zachwycaj¹ swoim piêknym wzornictwem i duchem retro. Idealne dla mi³oœników motoryzacji i unikalnych doœwiadczeñ.
Performance          500,00                Potê¿ne samochody z wysokimi osi¹gami, które zapewniaj¹ niezwyk³e wra¿enia z jazdy. Posiadaj¹ zaawansowane systemy napêdowe i sportowe osi¹gi.
Super Luxury         600,00                Najwy¿szy poziom luksusu i presti¿u. Oferuje ekskluzywne samochody z najwy¿szym wyposa¿eniem, najnowszymi technologiami i niezrównanym komfortem.
Sportowe             1001,00               

(5 rows affected)
*/

EXECUTE dbo.Klienci_Wypozyczenia
@Par_MinWartosc = 100;
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    LiczbaWypozyczen LacznaKwota
----------- -------------------- ---------------------------------------- ------------------------------ ---------------- ---------------------
3           Aleksandra           Michalik                                 Kalisz                         3                5200,00
7           Jan                  Kowalski                                 Kalisz                         1                1000,00
1           Andrzej              Michalak                                 Kalisz                         1                700,00
2           Micha³               Mietczyñski                              Kalisz                         1                700,00
9           Marcin               Borysiuk                                 Kalisz                         1                300,00

(5 rows affected)
*/

EXECUTE dbo.Klient_CenaWypozyczenia
@Par_Cena = 700;
GO

/*
PolaczoneDane                                                 Kwota
------------------------------------------------------------- ---------------------
Aleksandra Michalik                                           800,00
Andrzej Michalak                                              700,00
Jan Kowalski                                                  1000,00
Aleksandra Michalik                                           4000,00
Micha³ Mietczyñski                                            700,00

(5 rows affected)
*/

EXECUTE dbo.Klient_Miejscowosci
@Par_MinLiczba = 2;
GO

/*
Miejscowosc                    LiczbaKlientow
------------------------------ --------------
Kalisz                         5
Konin                          2

(2 rows affected)
*/

EXECUTE dbo.Klient_Wstaw
@Par_IdKlient = 101,
@Par_Imie = 'Rafa³',
@Par_Nazwisko = 'Rafalski',
@Par_Nazwa = 'Rafa³ Company',
@Par_Miejscowosc = 'Rafa³owice',
@Par_Ulica = 'Rafalska',
@Par_NrDomu = '3',
@Par_NrLokalu = '2',
@Par_KodPocztowy = '62-800',
@Par_Poczta = 'Kalisz',
@Par_NrTelefonu = '+48 533 123 345',
@Par_AdresMail = 'rafalek@wp.pl',
@Par_Uwagi = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Klient_Modyfikuj
@Par_IdKlient = 101,
@Par_Imie = 'Rafa³ek',
@Par_Nazwisko = 'Rafalski',
@Par_Nazwa = 'Rafa³ Company',
@Par_Miejscowosc = 'Rafa³owice',
@Par_Ulica = 'Rafalska',
@Par_NrDomu = '3',
@Par_NrLokalu = '2',
@Par_KodPocztowy = '62-800',
@Par_Poczta = 'Kalisz',
@Par_NrTelefonu = '+48 533 123 345',
@Par_AdresMail = 'rafalek@wp.pl',
@Par_Uwagi = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Klient_Szukaj
@Par_Wzorzec = 'Rafa³';
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
101         Rafa³ek              Rafalski                                 Rafa³ Company                            Rafa³owice                     Rafalska                                           3          2          62-800      Kalisz                                             +48 533 123 345 rafalek@wp.pl                  brak

(1 row affected)
*/

EXECUTE dbo.Klient_Znajdz_Nazwisko
@Par_Wzorzec = 'Rafalski',
@Par_Opcja = 'P';
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
101         Rafa³ek              Rafalski                                 Rafa³ Company                            Rafa³owice                     Rafalska                                           3          2          62-800      Kalisz                                             +48 533 123 345 rafalek@wp.pl                  brak

(1 row affected)
*/

EXECUTE dbo.Klient_Znajdz_Wzorzec
@Par_Wzorzec = 'Raf',
@Par_Kolumna = 'Imie';
GO

/*
Msg 229, Level 14, State 5, Line 3718
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.KlientUprawnienia_Wstaw
@Par_IdKlientUprawnienia = 101,
@Par_IdKlient = 101,
@Par_KategoriaPrawaJazdy = 'B';
GO

/*
(1 row affected)
*/

EXECUTE dbo.KlientUprawnienia_Modyfikuj
@Par_IdKlientUprawnienia = 101,
@Par_IdKlient = 101,
@Par_KategoriaPrawaJazdy = 'C';
GO

/*
(1 row affected)
*/

EXECUTE dbo.KlientUprawnienia_Usun
@Par_IdKlientUprawnienia = 101;
GO

/*
(1 row affected)
*/

EXECUTE dbo.Klient_Usun
@Par_IdKlient = 101;
GO

/*
(1 row affected)
*/

EXECUTE dbo.Marka_Wstaw
@Par_Marka = 'Mitsubischi';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Marka_Modyfikuj
@Par_Marka = 'Mitsubischi',
@Par_NowaMarka = 'Mitsubishi';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Marka_Usun
@Par_Marka = 'Mitsubishi';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Marki_Popularnosc
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-12-31',
@Par_MinLiczba = 1,
@Par_MinWartosc = 100.0;
GO

/*
Marka                LiczbaWypozyczen WartoscWypozyczen
-------------------- ---------------- ---------------------
Porsche              4                4004,00
BMW                  3                900,00
Ford                 2                180,00
Lamborghini          1                500,00

(4 rows affected)
*/

EXECUTE dbo.Model_Wstaw
@Par_Model = 'iX3',
@Par_Marka = 'Audi';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Model_Modyfikuj
@Par_Model = 'iX3',
@Par_Marka = 'BMW';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Model_Usun
@Par_Model = 'iX3';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Platnosc_Wstaw
@Par_SposobPlatnosci = 'Na zeszyt';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Platnosc_Modyfikuj
@Par_SposobPlatnosci = 'Na zeszyt',
@Par_NowySposobPlatnosci = 'Na krechê';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Platnosc_Usun
@Par_SposobPlatnosci = 'Na krechê';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Pracownik_Wstaw
@Par_IdPracownik = 101,
@Par_Imie = 'Rafa³',
@Par_Nazwisko = 'Rafalski',
@Par_Stanowisko = 'Sprzedawca',
@Par_NrTelefonu = '+48 111 111 111',
@Par_AdresMail = 'rafalek@wp.pl';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Pracownik_Modyfikuj
@Par_IdPracownik = 101,
@Par_Imie = 'Rafa³ek',
@Par_Nazwisko = 'Rafalski',
@Par_Stanowisko = 'Sprzedawca',
@Par_NrTelefonu = '+48 111 111 111',
@Par_AdresMail = 'rafalek@wp.pl';
GO


/*
(1 row affected)
*/

EXECUTE dbo.Pracownicy_Ranking
@Par_Stanowisko = 'Sprzedawca',
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-07-12',
@Par_MinLiczba = 2;
GO

/*
Pozycja              IdPracownik Imie                 Nazwisko                                 LiczbaWypozyczen
-------------------- ----------- -------------------- ---------------------------------------- ----------------
1                    2           Mariusz              Iwaniuk                                  4
2                    3           Micha³               Kowalczyk                                3
2                    4           Marcin               Maciejuk                                 3

(3 rows affected)
*/

EXECUTE dbo.Pracownik_Znajdz_Id
@Par_IdPracownik = 101;
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
101         Rafa³ek              Rafalski                                 Sprzedawca                               +48 111 111 111 rafalek@wp.pl

(1 row affected)
*/

EXECUTE dbo.Pracownik_Znajdz_Nazwisko
@Par_Nazwisko = 'Raf';
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
101         Rafa³ek              Rafalski                                 Sprzedawca                               +48 111 111 111 rafalek@wp.pl

(1 row affected)
*/

EXECUTE dbo.Pracownik_Archiwizuj
@Par_IdPracownik = 101;
GO

/*
(1 row affected)

(1 row affected)
*/

EXECUTE dbo.Pracownik_Usun
@Par_IdPracownik = 101;
GO

/*
(0 rows affected)
*/

EXECUTE dbo.Samochod_Wstaw
@Par_IdSamochod = 101,
@Par_Kategoria = 'Sportowe',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = '';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Samochod_Modyfikuj
@Par_IdSamochod = 101,
@Par_Kategoria = 'Sportowe',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Samochod_Dostepnosc
@Par_Dostepnosc = 1;
GO

/*
IdSamochod  Kategoria            Model                IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              5           2021        Diesel          BMW 740d xDrive
3           Rodzinna             Mondeo               5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
6           Premium              A4                   5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
101         Sportowe             Seria 7              5           2023        Diesel          brak

(5 rows affected)
*/

EXECUTE dbo.Samochody_Marki;
GO

/*
Marka                LiczbaSamochodow SredniaCena
-------------------- ---------------- ---------------------
Audi                 2                240,00
BMW                  4                650,50
Ford                 2                90,00
Lamborghini          1                500,00
Porsche              1                1001,00
Rolls-Royce          1                600,00

(6 rows affected)
*/

EXECUTE dbo.Samochod_Wstaw_Makro
@Par_IdSamochod = 102,
@Par_Kategoria = 'Sportowe',
@Par_Marka = 'BMW',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Samochod_Usun
@Par_IdSamochod = 101;
GO

EXECUTE dbo.Samochod_Usun
@Par_IdSamochod = 102;
GO

/*
(1 row affected)

(1 row affected)
*/

EXECUTE dbo.Ubezpieczenie_Wstaw
@Par_IdUbezpieczenie = 101,
@Par_Nazwa = 'Ubezpieczenie od wszystkiego',
@Par_Cena = 1500.0,
@Par_Opis = '';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Ubezpieczenie_Modyfikuj
@Par_IdUbezpieczenie = 101,
@Par_Nazwa = 'Ubezpieczenie od wszystkiego',
@Par_Cena = 1501.0,
@Par_Opis = '';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Ubezpieczenie_Usun
@Par_IdUbezpieczenie = 101;
GO

/*
(1 row affected)
*/

EXECUTE dbo.Uprawnienia_Wstaw
@Par_KategoriaPrawaJazdy = 'TANK',
@Par_KategoriaOpis = 'Uprawnia do prowadzenia czo³gu do 45 ton.';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Uprawnienia_Modyfikuj
@Par_KategoriaPrawaJazdy = 'TANK',
@Par_KategoriaOpis = 'Uprawnia do prowadzenia czo³gu do 60 ton.';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Uprawnienia_Usun
@Par_KategoriaPrawaJazdy = 'TANK';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Usluga_Niedodawane
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-01-01';
GO

/*
IdUsluga    Nazwa                          Cena
----------- ------------------------------ ---------------------
6           Animal friendly                80,00
1           Pakiet clean                   50,00
8           Pakiet equipment               60,00
2           Pakiet refuel                  450,00
5           Us³uga Dostawy                 180,00
4           Us³uga Transferu Lotniskowego  400,00
3           Us³uga Wi-Fi Mobilnego         100,00
9           VIP Chauffeur Experience       1000,00

(8 rows affected)
*/

EXECUTE dbo.Usluga_Wstaw
@Par_IdUsluga = 101,
@Par_Nazwa = 'abc',
@Par_Cena = 200.00,
@Par_Opis = '';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Usluga_Modyfikuj
@Par_IdUsluga = 101,
@Par_Nazwa = 'abc',
@Par_Cena = 200.00,
@Par_Opis = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Usluga_Usun
@Par_IdUsluga = 101;
GO

/*
(1 row affected)
*/

EXECUTE dbo.Wypozyczenie_Aktualne
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-12-31';
GO

/*
IdWypozyczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            CenaPrzewidywana      PozostaloDni
-------------- ------------------------- ----------------------- ----------------------- --------------------- ------------
1              Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 1200,00               -173
4              Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 6000,00               -161
7              Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 850,00                -144

(3 rows affected)
*/

EXECUTE dbo.Wypozyczenie_N_OstatnichDni
@Par_LiczbaDni = 160;
GO

/*
IdWypozyczenie SposobPlatnosci           DataWypozyczenia        CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia
-------------- ------------------------- ----------------------- --------------------- --------------------- ------------------
7              Przelew                   2023-06-05 19:00:00.000 850,00                NULL                  1

(1 row affected)
*/

EXECUTE dbo.Wypozyczenie_Szukaj_Okres
@Par_Dni = 6;
GO

/*
IdWypozyczenie SposobPlatnosci           DataWypozyczenia        DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi                                                                                                                                                                                                                                                            IloscDni
-------------- ------------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
4              Karta                     2023-05-05 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL                                                                                                                                                                                                                                                             181
1              Gotówka                   2023-05-06 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL                                                                                                                                                                                                                                                             180
7              Przelew                   2023-06-05 19:00:00.000 NULL                    850,00                NULL                  1                  NULL                                                                                                                                                                                                                                                             150
6              BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.                                                                                                                                                                                                                                11

(4 rows affected)
*/

EXECUTE dbo.Wypozyczenie_Znajdz_Daty
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-04-04';
GO

/*
IdWypozyczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
10             Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
5              Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
8              System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
6              BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
3              BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
2              Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL

(6 rows affected)
*/

EXECUTE dbo.Wypozyczenie_Wstaw
@Par_IdWypozyczenie = 101,
@Par_IdKlient = 5,
@Par_IdSamochod = 5,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-11-02 12:00',
@Par_TerminZwrotu = '2023-11-04',
@Par_DataZwrotu = NULL,
@Par_CenaPrzewidywana = 1000.00,
@Par_CenaOstateczna = NULL,
@Par_StatusWypozyczenia = 1,
@Par_Uwagi = '';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Wypozyczenie_Modyfikuj
@Par_IdWypozyczenie = 101,
@Par_IdKlient = 5,
@Par_IdSamochod = 5,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-11-02 12:00',
@Par_TerminZwrotu = '2023-11-04',
@Par_DataZwrotu = NULL,
@Par_CenaPrzewidywana = 1000.00,
@Par_CenaOstateczna = NULL,
@Par_StatusWypozyczenia = 1,
@Par_Uwagi = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Wypozyczenie_Zestawienie
@Par_IdWypozyczenie = 101;
GO

/*
Lp                   ProduktUsluga                             Cena                  Typ
-------------------- ----------------------------------------- --------------------- -------------
1                    Lamborghini Aventador                     500,00                Samochod
2                    Ubezpieczenie max                         270,00                Ubezpieczenie

(2 rows affected)
*/

EXECUTE dbo.Wypozyczenie_Usun
@Par_IdWypozyczenie = 101;
GO

/*
(1 row affected)
*/

EXECUTE dbo.WypozyczenieUsluga_Wstaw
@Par_IdWypozyczenieUsluga = 101,
@Par_IdWypozyczenie = 1,
@Par_IdUsluga = 5,
@Par_Uwagi = '';
GO

/*
(1 row affected)
*/

EXECUTE dbo.WypozyczenieUsluga_Modyfikuj
@Par_IdWypozyczenieUsluga = 101,
@Par_IdWypozyczenie = 1,
@Par_IdUsluga = 5,
@Par_Uwagi = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.WypozyczenieUsluga_Usun
@Par_IdWypozyczenieUsluga = 101;
GO

/*
(1 row affected)
*/

------------------------------------------------------------
-- Rola PracownicyAdm.
------------------------------------------------------------


EXECUTE dbo.Kategoria_Modyfikuj
@Par_Kategoria = 'Sportowe',
@Par_Cena = 1000.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_Modyfikuj, Line 1 [Batch Start Line 4296]
The EXECUTE permission was denied on the object 'Kategoria_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_Wstaw
@Par_Kategoria = 'abc',
@Par_Cena = 100.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_Wstaw, Line 1 [Batch Start Line 4307]
The EXECUTE permission was denied on the object 'Kategoria_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_Usun
@Par_Kategoria = 'abc';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_Usun, Line 1 [Batch Start Line 4318]
The EXECUTE permission was denied on the object 'Kategoria_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_ZmienCene
@Par_Kategoria = 'Sportowe',
@Par_Cena = 1001;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_ZmienCene, Line 1 [Batch Start Line 4327]
The EXECUTE permission was denied on the object 'Kategoria_ZmienCene', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_Znajdz_Cena
@Par_CenaOd = 300;
GO

/*
Kategoria            Cena                  Opis
-------------------- --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Premium              300,00                Luksusowe samochody z najnowszymi funkcjami i eleganckim wykoñczeniem. Zapewniaj¹ wyj¹tkowy komfort, styl i doskona³e osi¹gi. Doskona³e do podró¿y s³u¿bowych lub specjalnych okazji.
Klasyczny/Antyk      400,00                Klasyczne samochody z przesz³oœci, które zachwycaj¹ swoim piêknym wzornictwem i duchem retro. Idealne dla mi³oœników motoryzacji i unikalnych doœwiadczeñ.
Performance          500,00                Potê¿ne samochody z wysokimi osi¹gami, które zapewniaj¹ niezwyk³e wra¿enia z jazdy. Posiadaj¹ zaawansowane systemy napêdowe i sportowe osi¹gi.
Super Luxury         600,00                Najwy¿szy poziom luksusu i presti¿u. Oferuje ekskluzywne samochody z najwy¿szym wyposa¿eniem, najnowszymi technologiami i niezrównanym komfortem.
Sportowe             1001,00               

(5 rows affected)
*/

EXECUTE dbo.Klienci_Wypozyczenia
@Par_MinWartosc = 100;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klienci_Wypozyczenia, Line 1 [Batch Start Line 4353]
The EXECUTE permission was denied on the object 'Klienci_Wypozyczenia', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_CenaWypozyczenia
@Par_Cena = 700;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_CenaWypozyczenia, Line 1 [Batch Start Line 4361]
The EXECUTE permission was denied on the object 'Klient_CenaWypozyczenia', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Miejscowosci
@Par_MinLiczba = 2;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Miejscowosci, Line 1 [Batch Start Line 4371]
The EXECUTE permission was denied on the object 'Klient_Miejscowosci', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Wstaw
@Par_IdKlient = 101,
@Par_Imie = 'Rafa³',
@Par_Nazwisko = 'Rafalski',
@Par_Nazwa = 'Rafa³ Company',
@Par_Miejscowosc = 'Rafa³owice',
@Par_Ulica = 'Rafalska',
@Par_NrDomu = '3',
@Par_NrLokalu = '2',
@Par_KodPocztowy = '62-800',
@Par_Poczta = 'Kalisz',
@Par_NrTelefonu = '+48 533 123 345',
@Par_AdresMail = 'rafalek@wp.pl',
@Par_Uwagi = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Wstaw, Line 1 [Batch Start Line 4380]
The EXECUTE permission was denied on the object 'Klient_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Modyfikuj
@Par_IdKlient = 101,
@Par_Imie = 'Rafa³ek',
@Par_Nazwisko = 'Rafalski',
@Par_Nazwa = 'Rafa³ Company',
@Par_Miejscowosc = 'Rafa³owice',
@Par_Ulica = 'Rafalska',
@Par_NrDomu = '3',
@Par_NrLokalu = '2',
@Par_KodPocztowy = '62-800',
@Par_Poczta = 'Kalisz',
@Par_NrTelefonu = '+48 533 123 345',
@Par_AdresMail = 'rafalek@wp.pl',
@Par_Uwagi = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Modyfikuj, Line 1 [Batch Start Line 4401]
The EXECUTE permission was denied on the object 'Klient_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Szukaj
@Par_Wzorzec = 'Rafa³';
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(0 rows affected)
*/

EXECUTE dbo.Klient_Znajdz_Nazwisko
@Par_Wzorzec = 'Rafalski',
@Par_Opcja = 'P';
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(0 rows affected)
*/

EXECUTE dbo.Klient_Znajdz_Wzorzec
@Par_Wzorzec = 'Raf',
@Par_Kolumna = 'Imie';
GO

/*
Msg 229, Level 14, State 5, Line 4447
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.KlientUprawnienia_Wstaw
@Par_IdKlientUprawnienia = 101,
@Par_IdKlient = 101,
@Par_KategoriaPrawaJazdy = 'B';
GO

/*
vel 14, State 5, Procedure dbo.KlientUprawnienia_Wstaw, Line 1 [Batch Start Line 4455]
The EXECUTE permission was denied on the object 'KlientUprawnienia_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.KlientUprawnienia_Modyfikuj
@Par_IdKlientUprawnienia = 101,
@Par_IdKlient = 101,
@Par_KategoriaPrawaJazdy = 'C';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.KlientUprawnienia_Modyfikuj, Line 1 [Batch Start Line 4466]
The EXECUTE permission was denied on the object 'KlientUprawnienia_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.KlientUprawnienia_Usun
@Par_IdKlientUprawnienia = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.KlientUprawnienia_Usun, Line 1 [Batch Start Line 4477]
The EXECUTE permission was denied on the object 'KlientUprawnienia_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Usun
@Par_IdKlient = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Usun, Line 1 [Batch Start Line 4486]
The EXECUTE permission was denied on the object 'Klient_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marka_Wstaw
@Par_Marka = 'Mitsubischi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marka_Wstaw, Line 1 [Batch Start Line 4495]
The EXECUTE permission was denied on the object 'Marka_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marka_Modyfikuj
@Par_Marka = 'Mitsubischi',
@Par_NowaMarka = 'Mitsubishi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marka_Modyfikuj, Line 1 [Batch Start Line 4504]
The EXECUTE permission was denied on the object 'Marka_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marka_Usun
@Par_Marka = 'Mitsubishi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marka_Usun, Line 1 [Batch Start Line 4514]
The EXECUTE permission was denied on the object 'Marka_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marki_Popularnosc
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-12-31',
@Par_MinLiczba = 1,
@Par_MinWartosc = 100.0;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marki_Popularnosc, Line 1 [Batch Start Line 4523]
The EXECUTE permission was denied on the object 'Marki_Popularnosc', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Model_Wstaw
@Par_Model = 'iX3',
@Par_Marka = 'Audi';
GO

/*
29, Level 14, State 5, Procedure dbo.Model_Wstaw, Line 1 [Batch Start Line 4535]
The EXECUTE permission was denied on the object 'Model_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Model_Modyfikuj
@Par_Model = 'iX3',
@Par_Marka = 'BMW';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Model_Modyfikuj, Line 1 [Batch Start Line 4545]
The EXECUTE permission was denied on the object 'Model_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Model_Usun
@Par_Model = 'iX3';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Model_Usun, Line 1 [Batch Start Line 4555]
The EXECUTE permission was denied on the object 'Model_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Platnosc_Wstaw
@Par_SposobPlatnosci = 'Na zeszyt';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Platnosc_Wstaw, Line 1 [Batch Start Line 4564]
The EXECUTE permission was denied on the object 'Platnosc_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Platnosc_Modyfikuj
@Par_SposobPlatnosci = 'Na zeszyt',
@Par_NowySposobPlatnosci = 'Na krechê';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Platnosc_Modyfikuj, Line 1 [Batch Start Line 4573]
The EXECUTE permission was denied on the object 'Platnosc_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Platnosc_Usun
@Par_SposobPlatnosci = 'Na krechê';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Platnosc_Usun, Line 1 [Batch Start Line 4583]
The EXECUTE permission was denied on the object 'Platnosc_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Wstaw
@Par_IdPracownik = 102,
@Par_Imie = 'Rafa³',
@Par_Nazwisko = 'Rafalski',
@Par_Stanowisko = 'Sprzedawca',
@Par_NrTelefonu = '+48 111 111 111',
@Par_AdresMail = 'rafalek@wp.pl';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Pracownik_Modyfikuj
@Par_IdPracownik = 102,
@Par_Imie = 'Rafa³ek',
@Par_Nazwisko = 'Rafalski',
@Par_Stanowisko = 'Sprzedawca',
@Par_NrTelefonu = '+48 111 111 111',
@Par_AdresMail = 'rafalek@wp.pl';
GO


/*
(1 row affected)
*/

EXECUTE dbo.Pracownicy_Ranking
@Par_Stanowisko = 'Sprzedawca',
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-07-12',
@Par_MinLiczba = 2;
GO

/*
Pozycja              IdPracownik Imie                 Nazwisko                                 LiczbaWypozyczen
-------------------- ----------- -------------------- ---------------------------------------- ----------------
1                    2           Mariusz              Iwaniuk                                  4
2                    3           Micha³               Kowalczyk                                3
2                    4           Marcin               Maciejuk                                 3

(3 rows affected)
*/

EXECUTE dbo.Pracownik_Znajdz_Id
@Par_IdPracownik = 102;
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
102         Rafa³ek              Rafalski                                 Sprzedawca                               +48 111 111 111 rafalek@wp.pl

(1 row affected)
*/

EXECUTE dbo.Pracownik_Znajdz_Nazwisko
@Par_Nazwisko = 'Raf';
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
102         Rafa³ek              Rafalski                                 Sprzedawca                               +48 111 111 111 rafalek@wp.pl

(1 row affected)
*/

EXECUTE dbo.Pracownik_Archiwizuj
@Par_IdPracownik = 102;
GO

/*
(1 row affected)

(1 row affected)
*/

EXECUTE dbo.Pracownik_Usun
@Par_IdPracownik = 102;
GO

/*
(0 rows affected)
*/

EXECUTE dbo.Samochod_Wstaw
@Par_IdSamochod = 101,
@Par_Kategoria = 'Sportowe',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Wstaw, Line 1 [Batch Start Line 4678]
The EXECUTE permission was denied on the object 'Samochod_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Modyfikuj
@Par_IdSamochod = 101,
@Par_Kategoria = 'Sportowe',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Modyfikuj, Line 1 [Batch Start Line 4694]
The EXECUTE permission was denied on the object 'Samochod_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Dostepnosc
@Par_Dostepnosc = 1;
GO

/*
IdSamochod  Kategoria            Model                IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              5           2021        Diesel          BMW 740d xDrive
3           Rodzinna             Mondeo               5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
6           Premium              A4                   5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic

(4 rows affected)
*/

EXECUTE dbo.Samochody_Marki;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochody_Marki, Line 1 [Batch Start Line 4725]
The EXECUTE permission was denied on the object 'Samochody_Marki', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Wstaw_Makro
@Par_IdSamochod = 102,
@Par_Kategoria = 'Sportowe',
@Par_Marka = 'BMW',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Wstaw_Makro, Line 1 [Batch Start Line 4733]
The EXECUTE permission was denied on the object 'Samochod_Wstaw_Makro', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Usun
@Par_IdSamochod = 101;
GO

EXECUTE dbo.Samochod_Usun
@Par_IdSamochod = 102;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Usun, Line 1 [Batch Start Line 4750]
The EXECUTE permission was denied on the object 'Samochod_Usun', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Usun, Line 1 [Batch Start Line 4753]
The EXECUTE permission was denied on the object 'Samochod_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Ubezpieczenie_Wstaw
@Par_IdUbezpieczenie = 101,
@Par_Nazwa = 'Ubezpieczenie od wszystkiego',
@Par_Cena = 1500.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Ubezpieczenie_Wstaw, Line 1 [Batch Start Line 4765]
The EXECUTE permission was denied on the object 'Ubezpieczenie_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Ubezpieczenie_Modyfikuj
@Par_IdUbezpieczenie = 101,
@Par_Nazwa = 'Ubezpieczenie od wszystkiego',
@Par_Cena = 1501.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Ubezpieczenie_Modyfikuj, Line 1 [Batch Start Line 4777]
The EXECUTE permission was denied on the object 'Ubezpieczenie_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Ubezpieczenie_Usun
@Par_IdUbezpieczenie = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Ubezpieczenie_Usun, Line 1 [Batch Start Line 4789]
The EXECUTE permission was denied on the object 'Ubezpieczenie_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Uprawnienia_Wstaw
@Par_KategoriaPrawaJazdy = 'TANK',
@Par_KategoriaOpis = 'Uprawnia do prowadzenia czo³gu do 45 ton.';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Uprawnienia_Wstaw, Line 1 [Batch Start Line 4798]
The EXECUTE permission was denied on the object 'Uprawnienia_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Uprawnienia_Modyfikuj
@Par_KategoriaPrawaJazdy = 'TANK',
@Par_KategoriaOpis = 'Uprawnia do prowadzenia czo³gu do 60 ton.';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Uprawnienia_Modyfikuj, Line 1 [Batch Start Line 4808]
The EXECUTE permission was denied on the object 'Uprawnienia_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Uprawnienia_Usun
@Par_KategoriaPrawaJazdy = 'TANK';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Uprawnienia_Usun, Line 1 [Batch Start Line 4817]
The EXECUTE permission was denied on the object 'Uprawnienia_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Niedodawane
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-01-01';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Niedodawane, Line 1 [Batch Start Line 4826]
The EXECUTE permission was denied on the object 'Usluga_Niedodawane', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Wstaw
@Par_IdUsluga = 101,
@Par_Nazwa = 'abc',
@Par_Cena = 200.00,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Wstaw, Line 1 [Batch Start Line 4837]
The EXECUTE permission was denied on the object 'Usluga_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Modyfikuj
@Par_IdUsluga = 101,
@Par_Nazwa = 'abc',
@Par_Cena = 200.00,
@Par_Opis = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Modyfikuj, Line 1 [Batch Start Line 4849]
The EXECUTE permission was denied on the object 'Usluga_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Usun
@Par_IdUsluga = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Usun, Line 1 [Batch Start Line 4861]
The EXECUTE permission was denied on the object 'Usluga_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Aktualne
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-12-31';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Aktualne, Line 1 [Batch Start Line 4870]
The EXECUTE permission was denied on the object 'Wypozyczenie_Aktualne', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_N_OstatnichDni
@Par_LiczbaDni = 160;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_N_OstatnichDni, Line 1 [Batch Start Line 4880]
The EXECUTE permission was denied on the object 'Wypozyczenie_N_OstatnichDni', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Szukaj_Okres
@Par_Dni = 6;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Szukaj_Okres, Line 1 [Batch Start Line 4889]
The EXECUTE permission was denied on the object 'Wypozyczenie_Szukaj_Okres', database 'S19_P1', schema 'dbo'.

*/

EXECUTE dbo.Wypozyczenie_Znajdz_Daty
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-04-04';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Znajdz_Daty, Line 1 [Batch Start Line 4899]
The EXECUTE permission was denied on the object 'Wypozyczenie_Znajdz_Daty', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Wstaw
@Par_IdWypozyczenie = 101,
@Par_IdKlient = 5,
@Par_IdSamochod = 5,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-11-02 12:00',
@Par_TerminZwrotu = '2023-11-04',
@Par_DataZwrotu = NULL,
@Par_CenaPrzewidywana = 1000.00,
@Par_CenaOstateczna = NULL,
@Par_StatusWypozyczenia = 1,
@Par_Uwagi = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Wstaw, Line 1 [Batch Start Line 4909]
The EXECUTE permission was denied on the object 'Wypozyczenie_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Modyfikuj
@Par_IdWypozyczenie = 101,
@Par_IdKlient = 5,
@Par_IdSamochod = 5,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-11-02 12:00',
@Par_TerminZwrotu = '2023-11-04',
@Par_DataZwrotu = NULL,
@Par_CenaPrzewidywana = 1000.00,
@Par_CenaOstateczna = NULL,
@Par_StatusWypozyczenia = 1,
@Par_Uwagi = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Modyfikuj, Line 1 [Batch Start Line 4930]
The EXECUTE permission was denied on the object 'Wypozyczenie_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Zestawienie
@Par_IdWypozyczenie = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Zestawienie, Line 1 [Batch Start Line 4951]
The EXECUTE permission was denied on the object 'Wypozyczenie_Zestawienie', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Usun
@Par_IdWypozyczenie = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Usun, Line 1 [Batch Start Line 4960]
The EXECUTE permission was denied on the object 'Wypozyczenie_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.WypozyczenieUsluga_Wstaw
@Par_IdWypozyczenieUsluga = 101,
@Par_IdWypozyczenie = 1,
@Par_IdUsluga = 5,
@Par_Uwagi = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.WypozyczenieUsluga_Wstaw, Line 1 [Batch Start Line 4969]
The EXECUTE permission was denied on the object 'WypozyczenieUsluga_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.WypozyczenieUsluga_Modyfikuj
@Par_IdWypozyczenieUsluga = 101,
@Par_IdWypozyczenie = 1,
@Par_IdUsluga = 5,
@Par_Uwagi = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.WypozyczenieUsluga_Modyfikuj, Line 1 [Batch Start Line 4981]
The EXECUTE permission was denied on the object 'WypozyczenieUsluga_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.WypozyczenieUsluga_Usun
@Par_IdWypozyczenieUsluga = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.WypozyczenieUsluga_Usun, Line 1 [Batch Start Line 4993]
The EXECUTE permission was denied on the object 'WypozyczenieUsluga_Usun', database 'S19_P1', schema 'dbo'.
*/

------------------------------------------------------------
-- Rola Sprzedawcy.
------------------------------------------------------------

EXECUTE dbo.Kategoria_Modyfikuj
@Par_Kategoria = 'Sportowe',
@Par_Cena = 1000.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_Modyfikuj, Line 1 [Batch Start Line 5006]
The EXECUTE permission was denied on the object 'Kategoria_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_Wstaw
@Par_Kategoria = 'abc',
@Par_Cena = 100.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_Wstaw, Line 1 [Batch Start Line 5017]
The EXECUTE permission was denied on the object 'Kategoria_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_Usun
@Par_Kategoria = 'abc';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_Usun, Line 1 [Batch Start Line 5028]
The EXECUTE permission was denied on the object 'Kategoria_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_ZmienCene
@Par_Kategoria = 'Sportowe',
@Par_Cena = 1001;
GO

/*
(1 row affected)
*/

EXECUTE dbo.Kategoria_Znajdz_Cena
@Par_CenaOd = 300;
GO

/*
Kategoria            Cena                  Opis
-------------------- --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Premium              300,00                Luksusowe samochody z najnowszymi funkcjami i eleganckim wykoñczeniem. Zapewniaj¹ wyj¹tkowy komfort, styl i doskona³e osi¹gi. Doskona³e do podró¿y s³u¿bowych lub specjalnych okazji.
Klasyczny/Antyk      400,00                Klasyczne samochody z przesz³oœci, które zachwycaj¹ swoim piêknym wzornictwem i duchem retro. Idealne dla mi³oœników motoryzacji i unikalnych doœwiadczeñ.
Performance          500,00                Potê¿ne samochody z wysokimi osi¹gami, które zapewniaj¹ niezwyk³e wra¿enia z jazdy. Posiadaj¹ zaawansowane systemy napêdowe i sportowe osi¹gi.
Super Luxury         600,00                Najwy¿szy poziom luksusu i presti¿u. Oferuje ekskluzywne samochody z najwy¿szym wyposa¿eniem, najnowszymi technologiami i niezrównanym komfortem.
Sportowe             1001,00               

(5 rows affected)
*/

EXECUTE dbo.Klienci_Wypozyczenia
@Par_MinWartosc = 100;
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    LiczbaWypozyczen LacznaKwota
----------- -------------------- ---------------------------------------- ------------------------------ ---------------- ---------------------
3           Aleksandra           Michalik                                 Kalisz                         3                5200,00
7           Jan                  Kowalski                                 Kalisz                         1                1000,00
1           Andrzej              Michalak                                 Kalisz                         1                700,00
2           Micha³               Mietczyñski                              Kalisz                         1                700,00
9           Marcin               Borysiuk                                 Kalisz                         1                300,00

(5 rows affected)
*/

EXECUTE dbo.Klient_CenaWypozyczenia
@Par_Cena = 700;
GO

/*
PolaczoneDane                                                 Kwota
------------------------------------------------------------- ---------------------
Aleksandra Michalik                                           800,00
Andrzej Michalak                                              700,00
Jan Kowalski                                                  1000,00
Aleksandra Michalik                                           4000,00
Micha³ Mietczyñski                                            700,00

(5 rows affected)
*/

EXECUTE dbo.Klient_Miejscowosci
@Par_MinLiczba = 2;
GO

/*
Miejscowosc                    LiczbaKlientow
------------------------------ --------------
Kalisz                         5
Konin                          2

(2 rows affected)
*/

EXECUTE dbo.Klient_Wstaw
@Par_IdKlient = 101,
@Par_Imie = 'Rafa³',
@Par_Nazwisko = 'Rafalski',
@Par_Nazwa = 'Rafa³ Company',
@Par_Miejscowosc = 'Rafa³owice',
@Par_Ulica = 'Rafalska',
@Par_NrDomu = '3',
@Par_NrLokalu = '2',
@Par_KodPocztowy = '62-800',
@Par_Poczta = 'Kalisz',
@Par_NrTelefonu = '+48 533 123 345',
@Par_AdresMail = 'rafalek@wp.pl',
@Par_Uwagi = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Klient_Modyfikuj
@Par_IdKlient = 101,
@Par_Imie = 'Rafa³ek',
@Par_Nazwisko = 'Rafalski',
@Par_Nazwa = 'Rafa³ Company',
@Par_Miejscowosc = 'Rafa³owice',
@Par_Ulica = 'Rafalska',
@Par_NrDomu = '3',
@Par_NrLokalu = '2',
@Par_KodPocztowy = '62-800',
@Par_Poczta = 'Kalisz',
@Par_NrTelefonu = '+48 533 123 345',
@Par_AdresMail = 'rafalek@wp.pl',
@Par_Uwagi = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Klient_Szukaj
@Par_Wzorzec = 'Rafa³';
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
101         Rafa³ek              Rafalski                                 Rafa³ Company                            Rafa³owice                     Rafalska                                           3          2          62-800      Kalisz                                             +48 533 123 345 rafalek@wp.pl                  brak

(1 row affected)
*/

EXECUTE dbo.Klient_Znajdz_Nazwisko
@Par_Wzorzec = 'Rafalski',
@Par_Opcja = 'P';
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(0 rows affected)
*/

EXECUTE dbo.Klient_Znajdz_Wzorzec
@Par_Wzorzec = 'Raf',
@Par_Kolumna = 'Imie';
GO

/*
Msg 229, Level 14, State 5, Line 5173
The SELECT permission was denied on the object 'Klient', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.KlientUprawnienia_Wstaw
@Par_IdKlientUprawnienia = 101,
@Par_IdKlient = 101,
@Par_KategoriaPrawaJazdy = 'B';
GO

/*
(1 row affected)
*/

EXECUTE dbo.KlientUprawnienia_Modyfikuj
@Par_IdKlientUprawnienia = 101,
@Par_IdKlient = 101,
@Par_KategoriaPrawaJazdy = 'C';
GO

/*
(1 row affected)
*/

EXECUTE dbo.KlientUprawnienia_Usun
@Par_IdKlientUprawnienia = 101;
GO

/*
(1 row affected)
*/

EXECUTE dbo.Klient_Usun
@Par_IdKlient = 101;
GO

/*
(1 row affected)
*/

EXECUTE dbo.Marka_Wstaw
@Par_Marka = 'Mitsubischi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marka_Wstaw, Line 1 [Batch Start Line 5217]
The EXECUTE permission was denied on the object 'Marka_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marka_Modyfikuj
@Par_Marka = 'Mitsubischi',
@Par_NowaMarka = 'Mitsubishi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marka_Modyfikuj, Line 1 [Batch Start Line 5226]
The EXECUTE permission was denied on the object 'Marka_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marka_Usun
@Par_Marka = 'Mitsubishi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marka_Usun, Line 1 [Batch Start Line 5236]
The EXECUTE permission was denied on the object 'Marka_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marki_Popularnosc
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-12-31',
@Par_MinLiczba = 1,
@Par_MinWartosc = 100.0;
GO

/*
Marka                LiczbaWypozyczen WartoscWypozyczen
-------------------- ---------------- ---------------------
Porsche              4                4004,00
BMW                  3                900,00
Ford                 2                180,00
Lamborghini          1                500,00

(4 rows affected)
*/

EXECUTE dbo.Model_Wstaw
@Par_Model = 'iX3',
@Par_Marka = 'Audi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Model_Wstaw, Line 1 [Batch Start Line 5263]
The EXECUTE permission was denied on the object 'Model_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Model_Modyfikuj
@Par_Model = 'iX3',
@Par_Marka = 'BMW';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Model_Wstaw, Line 1 [Batch Start Line 5263]
The EXECUTE permission was denied on the object 'Model_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Model_Usun
@Par_Model = 'iX3';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Model_Usun, Line 1 [Batch Start Line 5283]
The EXECUTE permission was denied on the object 'Model_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Platnosc_Wstaw
@Par_SposobPlatnosci = 'Na zeszyt';
GO

/*
ocedure dbo.Platnosc_Wstaw, Line 1 [Batch Start Line 5292]
The EXECUTE permission was denied on the object 'Platnosc_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Platnosc_Modyfikuj
@Par_SposobPlatnosci = 'Na zeszyt',
@Par_NowySposobPlatnosci = 'Na krechê';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Platnosc_Modyfikuj, Line 1 [Batch Start Line 5301]
The EXECUTE permission was denied on the object 'Platnosc_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Platnosc_Usun
@Par_SposobPlatnosci = 'Na krechê';
GO

/*
.Platnosc_Usun, Line 1 [Batch Start Line 5311]
The EXECUTE permission was denied on the object 'Platnosc_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Wstaw
@Par_IdPracownik = 102,
@Par_Imie = 'Rafa³',
@Par_Nazwisko = 'Rafalski',
@Par_Stanowisko = 'Sprzedawca',
@Par_NrTelefonu = '+48 111 111 111',
@Par_AdresMail = 'rafalek@wp.pl';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Wstaw, Line 1 [Batch Start Line 5319]
The EXECUTE permission was denied on the object 'Pracownik_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Modyfikuj -- Pracowincy powinni mieæ mo¿liwoœæ modyfikowania jedynie swoich danych.
@Par_IdPracownik = 102,
@Par_Imie = 'Rafa³ek',
@Par_Nazwisko = 'Rafalski',
@Par_Stanowisko = 'Sprzedawca',
@Par_NrTelefonu = '+48 111 111 111',
@Par_AdresMail = 'rafalek@wp.pl';
GO

/*
(0 rows affected)
*/

EXECUTE dbo.Pracownicy_Ranking
@Par_Stanowisko = 'Sprzedawca',
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-07-12',
@Par_MinLiczba = 2;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownicy_Ranking, Line 1 [Batch Start Line 5347]
The EXECUTE permission was denied on the object 'Pracownicy_Ranking', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Znajdz_Id
@Par_IdPracownik = 102;
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------

(0 rows affected)
*/

EXECUTE dbo.Pracownik_Znajdz_Nazwisko
@Par_Nazwisko = 'Raf';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Znajdz_Nazwisko, Line 1 [Batch Start Line 5370]
The EXECUTE permission was denied on the object 'Pracownik_Znajdz_Nazwisko', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Archiwizuj
@Par_IdPracownik = 102;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Archiwizuj, Line 1 [Batch Start Line 5379]
The EXECUTE permission was denied on the object 'Pracownik_Archiwizuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Usun
@Par_IdPracownik = 102;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Usun, Line 1 [Batch Start Line 5387]
The EXECUTE permission was denied on the object 'Pracownik_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Wstaw
@Par_IdSamochod = 101,
@Par_Kategoria = 'Sportowe',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Wstaw, Line 1 [Batch Start Line 5397]
The EXECUTE permission was denied on the object 'Samochod_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Modyfikuj
@Par_IdSamochod = 101,
@Par_Kategoria = 'Sportowe',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = 'brak';
GO

/*
(0 rows affected)
*/

EXECUTE dbo.Samochod_Dostepnosc
@Par_Dostepnosc = 1;
GO

/*
IdSamochod  Kategoria            Model                IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              5           2021        Diesel          BMW 740d xDrive
3           Rodzinna             Mondeo               5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
6           Premium              A4                   5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic

(4 rows affected)
*/

EXECUTE dbo.Samochody_Marki;
GO

/*
Marka                LiczbaSamochodow SredniaCena
-------------------- ---------------- ---------------------
Audi                 2                240,00
BMW                  3                533,6666
Ford                 2                90,00
Lamborghini          1                500,00
Porsche              1                1001,00
Rolls-Royce          1                600,00

(6 rows affected)
*/

EXECUTE dbo.Samochod_Wstaw_Makro
@Par_IdSamochod = 102,
@Par_Kategoria = 'Sportowe',
@Par_Marka = 'BMW',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Wstaw_Makro, Line 1 [Batch Start Line 5459]
The EXECUTE permission was denied on the object 'Samochod_Wstaw_Makro', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Usun
@Par_IdSamochod = 101;
GO

EXECUTE dbo.Samochod_Usun
@Par_IdSamochod = 102;
GO

/*
Procedure dbo.Samochod_Usun, Line 1 [Batch Start Line 5476]
The EXECUTE permission was denied on the object 'Samochod_Usun', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Usun, Line 1 [Batch Start Line 5479]
The EXECUTE permission was denied on the object 'Samochod_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Ubezpieczenie_Wstaw
@Par_IdUbezpieczenie = 101,
@Par_Nazwa = 'Ubezpieczenie od wszystkiego',
@Par_Cena = 1500.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Ubezpieczenie_Wstaw, Line 1 [Batch Start Line 5491]
The EXECUTE permission was denied on the object 'Ubezpieczenie_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Ubezpieczenie_Modyfikuj
@Par_IdUbezpieczenie = 101,
@Par_Nazwa = 'Ubezpieczenie od wszystkiego',
@Par_Cena = 1501.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Ubezpieczenie_Modyfikuj, Line 1 [Batch Start Line 5503]
The EXECUTE permission was denied on the object 'Ubezpieczenie_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Ubezpieczenie_Usun
@Par_IdUbezpieczenie = 101;
GO

/*
 229, Level 14, State 5, Procedure dbo.Ubezpieczenie_Usun, Line 1 [Batch Start Line 5514]
The EXECUTE permission was denied on the object 'Ubezpieczenie_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Uprawnienia_Wstaw
@Par_KategoriaPrawaJazdy = 'TANK',
@Par_KategoriaOpis = 'Uprawnia do prowadzenia czo³gu do 45 ton.';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Uprawnienia_Wstaw, Line 1 [Batch Start Line 5524]
The EXECUTE permission was denied on the object 'Uprawnienia_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Uprawnienia_Modyfikuj
@Par_KategoriaPrawaJazdy = 'TANK',
@Par_KategoriaOpis = 'Uprawnia do prowadzenia czo³gu do 60 ton.';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Uprawnienia_Modyfikuj, Line 1 [Batch Start Line 5534]
The EXECUTE permission was denied on the object 'Uprawnienia_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Uprawnienia_Usun
@Par_KategoriaPrawaJazdy = 'TANK';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Uprawnienia_Usun, Line 1 [Batch Start Line 5544]
The EXECUTE permission was denied on the object 'Uprawnienia_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Niedodawane
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-01-01';
GO

/*
IdUsluga    Nazwa                          Cena
----------- ------------------------------ ---------------------
6           Animal friendly                80,00
1           Pakiet clean                   50,00
8           Pakiet equipment               60,00
2           Pakiet refuel                  450,00
5           Us³uga Dostawy                 180,00
4           Us³uga Transferu Lotniskowego  400,00
3           Us³uga Wi-Fi Mobilnego         100,00
9           VIP Chauffeur Experience       1000,00

(8 rows affected)
*/

EXECUTE dbo.Usluga_Wstaw
@Par_IdUsluga = 101,
@Par_Nazwa = 'abc',
@Par_Cena = 200.00,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Wstaw, Line 1 [Batch Start Line 5573]
The EXECUTE permission was denied on the object 'Usluga_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Modyfikuj
@Par_IdUsluga = 101,
@Par_Nazwa = 'abc',
@Par_Cena = 200.00,
@Par_Opis = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Modyfikuj, Line 1 [Batch Start Line 5584]
The EXECUTE permission was denied on the object 'Usluga_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Usun
@Par_IdUsluga = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Usun, Line 1 [Batch Start Line 5597]
The EXECUTE permission was denied on the object 'Usluga_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Aktualne
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-12-31';
GO

/*
IdWypozyczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            CenaPrzewidywana      PozostaloDni
-------------- ------------------------- ----------------------- ----------------------- --------------------- ------------
1              Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 1200,00               -173
4              Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 6000,00               -161
7              Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 850,00                -144

(3 rows affected)
*/

EXECUTE dbo.Wypozyczenie_N_OstatnichDni
@Par_LiczbaDni = 160;
GO

/*
IdWypozyczenie SposobPlatnosci           DataWypozyczenia        CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia
-------------- ------------------------- ----------------------- --------------------- --------------------- ------------------
7              Przelew                   2023-06-05 19:00:00.000 850,00                NULL                  1

(1 row affected)
*/

EXECUTE dbo.Wypozyczenie_Szukaj_Okres
@Par_Dni = 6;
GO

/*
IdWypozyczenie SposobPlatnosci           DataWypozyczenia        DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi                                                                                                                                                                                                                                                            IloscDni
-------------- ------------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
4              Karta                     2023-05-05 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL                                                                                                                                                                                                                                                             181
1              Gotówka                   2023-05-06 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL                                                                                                                                                                                                                                                             180
7              Przelew                   2023-06-05 19:00:00.000 NULL                    850,00                NULL                  1                  NULL                                                                                                                                                                                                                                                             150
6              BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.                                                                                                                                                                                                                                11

(4 rows affected)
*/

EXECUTE dbo.Wypozyczenie_Znajdz_Daty
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-04-04';
GO

/*
IdWypozyczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
10             Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
5              Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
8              System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
6              BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
3              BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
2              Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL

(6 rows affected)
*/

EXECUTE dbo.Wypozyczenie_Wstaw
@Par_IdWypozyczenie = 101,
@Par_IdKlient = 5,
@Par_IdSamochod = 5,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-11-02 12:00',
@Par_TerminZwrotu = '2023-11-04',
@Par_DataZwrotu = NULL,
@Par_CenaPrzewidywana = 1000.00,
@Par_CenaOstateczna = NULL,
@Par_StatusWypozyczenia = 1,
@Par_Uwagi = '';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Wypozyczenie_Modyfikuj
@Par_IdWypozyczenie = 101,
@Par_IdKlient = 5,
@Par_IdSamochod = 5,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-11-02 12:00',
@Par_TerminZwrotu = '2023-11-04',
@Par_DataZwrotu = NULL,
@Par_CenaPrzewidywana = 1000.00,
@Par_CenaOstateczna = NULL,
@Par_StatusWypozyczenia = 1,
@Par_Uwagi = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Wypozyczenie_Zestawienie
@Par_IdWypozyczenie = 101;
GO

/*
Lp                   ProduktUsluga                             Cena                  Typ
-------------------- ----------------------------------------- --------------------- -------------
1                    Lamborghini Aventador                     500,00                Samochod
2                    Ubezpieczenie max                         270,00                Ubezpieczenie

(2 rows affected)
*/

EXECUTE dbo.Wypozyczenie_Usun
@Par_IdWypozyczenie = 101;
GO

/*
(1 row affected)
*/

EXECUTE dbo.WypozyczenieUsluga_Wstaw
@Par_IdWypozyczenieUsluga = 101,
@Par_IdWypozyczenie = 1,
@Par_IdUsluga = 5,
@Par_Uwagi = '';
GO

/*
(1 row affected)
*/

EXECUTE dbo.WypozyczenieUsluga_Modyfikuj
@Par_IdWypozyczenieUsluga = 101,
@Par_IdWypozyczenie = 1,
@Par_IdUsluga = 5,
@Par_Uwagi = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.WypozyczenieUsluga_Usun
@Par_IdWypozyczenieUsluga = 101;
GO

/*
(1 row affected)
*/

------------------------------------------------------------
-- Rola Klienci.
------------------------------------------------------------

EXECUTE dbo.Kategoria_Modyfikuj
@Par_Kategoria = 'Sportowe',
@Par_Cena = 1000.0,
@Par_Opis = '';
GO

/*
229, Level 14, State 5, Procedure dbo.Kategoria_Modyfikuj, Line 1 [Batch Start Line 5761]
The EXECUTE permission was denied on the object 'Kategoria_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_Wstaw
@Par_Kategoria = 'abc',
@Par_Cena = 100.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_Wstaw, Line 1 [Batch Start Line 5772]
The EXECUTE permission was denied on the object 'Kategoria_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_Usun
@Par_Kategoria = 'abc';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_Usun, Line 1 [Batch Start Line 5783]
The EXECUTE permission was denied on the object 'Kategoria_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_ZmienCene
@Par_Kategoria = 'Sportowe',
@Par_Cena = 1001;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_ZmienCene, Line 1 [Batch Start Line 5792]
The EXECUTE permission was denied on the object 'Kategoria_ZmienCene', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_Znajdz_Cena
@Par_CenaOd = 300;
GO

/*
Kategoria            Cena                  Opis
-------------------- --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Premium              300,00                Luksusowe samochody z najnowszymi funkcjami i eleganckim wykoñczeniem. Zapewniaj¹ wyj¹tkowy komfort, styl i doskona³e osi¹gi. Doskona³e do podró¿y s³u¿bowych lub specjalnych okazji.
Klasyczny/Antyk      400,00                Klasyczne samochody z przesz³oœci, które zachwycaj¹ swoim piêknym wzornictwem i duchem retro. Idealne dla mi³oœników motoryzacji i unikalnych doœwiadczeñ.
Performance          500,00                Potê¿ne samochody z wysokimi osi¹gami, które zapewniaj¹ niezwyk³e wra¿enia z jazdy. Posiadaj¹ zaawansowane systemy napêdowe i sportowe osi¹gi.
Super Luxury         600,00                Najwy¿szy poziom luksusu i presti¿u. Oferuje ekskluzywne samochody z najwy¿szym wyposa¿eniem, najnowszymi technologiami i niezrównanym komfortem.
Sportowe             1001,00               

(5 rows affected)
*/

EXECUTE dbo.Klienci_Wypozyczenia
@Par_MinWartosc = 100;
GO

/*
dure dbo.Klienci_Wypozyczenia, Line 1 [Batch Start Line 5818]
The EXECUTE permission was denied on the object 'Klienci_Wypozyczenia', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_CenaWypozyczenia
@Par_Cena = 700;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_CenaWypozyczenia, Line 1 [Batch Start Line 5827]
The EXECUTE permission was denied on the object 'Klient_CenaWypozyczenia', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Miejscowosci
@Par_MinLiczba = 2;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Miejscowosci, Line 1 [Batch Start Line 5835]
The EXECUTE permission was denied on the object 'Klient_Miejscowosci', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Wstaw
@Par_IdKlient = 101,
@Par_Imie = 'Rafa³',
@Par_Nazwisko = 'Rafalski',
@Par_Nazwa = 'Rafa³ Company',
@Par_Miejscowosc = 'Rafa³owice',
@Par_Ulica = 'Rafalska',
@Par_NrDomu = '3',
@Par_NrLokalu = '2',
@Par_KodPocztowy = '62-800',
@Par_Poczta = 'Kalisz',
@Par_NrTelefonu = '+48 533 123 345',
@Par_AdresMail = 'rafalek@wp.pl',
@Par_Uwagi = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Wstaw, Line 1 [Batch Start Line 5845]
The EXECUTE permission was denied on the object 'Klient_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Modyfikuj -- Klienci powinni mieæ mo¿liwoœæ modyfikowania jedynie swoich danych.
@Par_IdKlient = 101,
@Par_Imie = 'Rafa³ek',
@Par_Nazwisko = 'Rafalski',
@Par_Nazwa = 'Rafa³ Company',
@Par_Miejscowosc = 'Rafa³owice',
@Par_Ulica = 'Rafalska',
@Par_NrDomu = '3',
@Par_NrLokalu = '2',
@Par_KodPocztowy = '62-800',
@Par_Poczta = 'Kalisz',
@Par_NrTelefonu = '+48 533 123 345',
@Par_AdresMail = 'rafalek@wp.pl',
@Par_Uwagi = 'brak';
GO

/*
(0 rows affected)
*/

EXECUTE dbo.Klient_Szukaj
@Par_Wzorzec = 'Rafa³';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Szukaj, Line 1 [Batch Start Line 5886]
The EXECUTE permission was denied on the object 'Klient_Szukaj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Znajdz_Nazwisko
@Par_Wzorzec = 'Rafalski',
@Par_Opcja = 'P';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Znajdz_Nazwisko, Line 1 [Batch Start Line 5895]
The EXECUTE permission was denied on the object 'Klient_Znajdz_Nazwisko', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Znajdz_Wzorzec
@Par_Wzorzec = 'Raf',
@Par_Kolumna = 'Imie';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Znajdz_Wzorzec, Line 1 [Batch Start Line 5905]
The EXECUTE permission was denied on the object 'Klient_Znajdz_Wzorzec', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.KlientUprawnienia_Wstaw -- Klient powinien móc dodaæ tylko swoje uprawnienia.
@Par_IdKlientUprawnienia = 101,
@Par_IdKlient = 101,
@Par_KategoriaPrawaJazdy = 'B';
GO

/*
(1 row affected)
*/

EXECUTE dbo.KlientUprawnienia_Modyfikuj -- Klient powinien móc zmodyfikowaæ tylko swoje uprawnienia.
@Par_IdKlientUprawnienia = 101,
@Par_IdKlient = 101,
@Par_KategoriaPrawaJazdy = 'C';
GO

/*
(1 row affected)
*/

EXECUTE dbo.KlientUprawnienia_Usun
@Par_IdKlientUprawnienia = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.KlientUprawnienia_Usun, Line 1 [Batch Start Line 5937]
The EXECUTE permission was denied on the object 'KlientUprawnienia_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Usun -- Klient powinien móc jedynie usun¹æ samego siebie z bazy, pod warunkiem, ¿e jego historia wypo¿yczeñ jest pusta.
@Par_IdKlient = 101;
GO

/*
(0 rows affected)
*/

EXECUTE dbo.Marka_Wstaw
@Par_Marka = 'Mitsubischi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marka_Wstaw, Line 1 [Batch Start Line 5954]
The EXECUTE permission was denied on the object 'Marka_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marka_Modyfikuj
@Par_Marka = 'Mitsubischi',
@Par_NowaMarka = 'Mitsubishi';
GO

/*
Marka_Modyfikuj, Line 1 [Batch Start Line 5963]
The EXECUTE permission was denied on the object 'Marka_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marka_Usun
@Par_Marka = 'Mitsubishi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marka_Usun, Line 1 [Batch Start Line 5973]
The EXECUTE permission was denied on the object 'Marka_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marki_Popularnosc
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-12-31',
@Par_MinLiczba = 1,
@Par_MinWartosc = 100.0;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marki_Popularnosc, Line 1 [Batch Start Line 5982]
The EXECUTE permission was denied on the object 'Marki_Popularnosc', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Model_Wstaw
@Par_Model = 'iX3',
@Par_Marka = 'Audi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Model_Wstaw, Line 1 [Batch Start Line 5993]
The EXECUTE permission was denied on the object 'Model_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Model_Modyfikuj
@Par_Model = 'iX3',
@Par_Marka = 'BMW';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Model_Modyfikuj, Line 1 [Batch Start Line 6003]
The EXECUTE permission was denied on the object 'Model_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Model_Usun
@Par_Model = 'iX3';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Model_Usun, Line 1 [Batch Start Line 6013]
The EXECUTE permission was denied on the object 'Model_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Platnosc_Wstaw
@Par_SposobPlatnosci = 'Na zeszyt';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Platnosc_Wstaw, Line 1 [Batch Start Line 6023]
The EXECUTE permission was denied on the object 'Platnosc_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Platnosc_Modyfikuj
@Par_SposobPlatnosci = 'Na zeszyt',
@Par_NowySposobPlatnosci = 'Na krechê';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Platnosc_Modyfikuj, Line 1 [Batch Start Line 6032]
The EXECUTE permission was denied on the object 'Platnosc_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Platnosc_Usun
@Par_SposobPlatnosci = 'Na krechê';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Platnosc_Usun, Line 1 [Batch Start Line 6042]
The EXECUTE permission was denied on the object 'Platnosc_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Wstaw
@Par_IdPracownik = 102,
@Par_Imie = 'Rafa³',
@Par_Nazwisko = 'Rafalski',
@Par_Stanowisko = 'Sprzedawca',
@Par_NrTelefonu = '+48 111 111 111',
@Par_AdresMail = 'rafalek@wp.pl';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Wstaw, Line 1 [Batch Start Line 6051]
The EXECUTE permission was denied on the object 'Pracownik_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Modyfikuj
@Par_IdPracownik = 102,
@Par_Imie = 'Rafa³ek',
@Par_Nazwisko = 'Rafalski',
@Par_Stanowisko = 'Sprzedawca',
@Par_NrTelefonu = '+48 111 111 111',
@Par_AdresMail = 'rafalek@wp.pl';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Modyfikuj, Line 1 [Batch Start Line 6065]
The EXECUTE permission was denied on the object 'Pracownik_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownicy_Ranking
@Par_Stanowisko = 'Sprzedawca',
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-07-12',
@Par_MinLiczba = 2;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownicy_Ranking, Line 1 [Batch Start Line 6079]
The EXECUTE permission was denied on the object 'Pracownicy_Ranking', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Znajdz_Id
@Par_IdPracownik = 102;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Znajdz_Id, Line 1 [Batch Start Line 6091]
The EXECUTE permission was denied on the object 'Pracownik_Znajdz_Id', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Znajdz_Nazwisko
@Par_Nazwisko = 'Raf';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Znajdz_Nazwisko, Line 1 [Batch Start Line 6099]
The EXECUTE permission was denied on the object 'Pracownik_Znajdz_Nazwisko', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Archiwizuj
@Par_IdPracownik = 102;
GO

/*
te 5, Procedure dbo.Pracownik_Archiwizuj, Line 1 [Batch Start Line 6108]
The EXECUTE permission was denied on the object 'Pracownik_Archiwizuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Usun
@Par_IdPracownik = 102;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Usun, Line 1 [Batch Start Line 6118]
The EXECUTE permission was denied on the object 'Pracownik_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Wstaw
@Par_IdSamochod = 101,
@Par_Kategoria = 'Sportowe',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Wstaw, Line 1 [Batch Start Line 6127]
The EXECUTE permission was denied on the object 'Samochod_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Modyfikuj
@Par_IdSamochod = 101,
@Par_Kategoria = 'Sportowe',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Modyfikuj, Line 1 [Batch Start Line 6143]
The EXECUTE permission was denied on the object 'Samochod_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Dostepnosc
@Par_Dostepnosc = 1;
GO

/*
IdSamochod  Kategoria            Model                IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              5           2021        Diesel          BMW 740d xDrive
3           Rodzinna             Mondeo               5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
6           Premium              A4                   5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic

(4 rows affected)
*/

EXECUTE dbo.Samochody_Marki;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochody_Marki, Line 1 [Batch Start Line 6174]
The EXECUTE permission was denied on the object 'Samochody_Marki', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Wstaw_Makro
@Par_IdSamochod = 102,
@Par_Kategoria = 'Sportowe',
@Par_Marka = 'BMW',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Wstaw_Makro, Line 1 [Batch Start Line 6182]
The EXECUTE permission was denied on the object 'Samochod_Wstaw_Makro', database 'S19_P1', schema 'dbo'.

*/

EXECUTE dbo.Samochod_Usun
@Par_IdSamochod = 101;
GO

EXECUTE dbo.Samochod_Usun
@Par_IdSamochod = 102;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Usun, Line 1 [Batch Start Line 6200]
The EXECUTE permission was denied on the object 'Samochod_Usun', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Usun, Line 1 [Batch Start Line 6203]
The EXECUTE permission was denied on the object 'Samochod_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Ubezpieczenie_Wstaw
@Par_IdUbezpieczenie = 101,
@Par_Nazwa = 'Ubezpieczenie od wszystkiego',
@Par_Cena = 1500.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Ubezpieczenie_Wstaw, Line 1 [Batch Start Line 6214]
The EXECUTE permission was denied on the object 'Ubezpieczenie_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Ubezpieczenie_Modyfikuj
@Par_IdUbezpieczenie = 101,
@Par_Nazwa = 'Ubezpieczenie od wszystkiego',
@Par_Cena = 1501.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Ubezpieczenie_Modyfikuj, Line 1 [Batch Start Line 6227]
The EXECUTE permission was denied on the object 'Ubezpieczenie_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Ubezpieczenie_Usun
@Par_IdUbezpieczenie = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Ubezpieczenie_Usun, Line 1 [Batch Start Line 6239]
The EXECUTE permission was denied on the object 'Ubezpieczenie_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Uprawnienia_Wstaw
@Par_KategoriaPrawaJazdy = 'TANK',
@Par_KategoriaOpis = 'Uprawnia do prowadzenia czo³gu do 45 ton.';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Uprawnienia_Wstaw, Line 1 [Batch Start Line 6248]
The EXECUTE permission was denied on the object 'Uprawnienia_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Uprawnienia_Modyfikuj
@Par_KategoriaPrawaJazdy = 'TANK',
@Par_KategoriaOpis = 'Uprawnia do prowadzenia czo³gu do 60 ton.';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Uprawnienia_Modyfikuj, Line 1 [Batch Start Line 6258]
The EXECUTE permission was denied on the object 'Uprawnienia_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Uprawnienia_Usun
@Par_KategoriaPrawaJazdy = 'TANK';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Uprawnienia_Usun, Line 1 [Batch Start Line 6268]
The EXECUTE permission was denied on the object 'Uprawnienia_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Niedodawane
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-01-01';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Niedodawane, Line 1 [Batch Start Line 6277]
The EXECUTE permission was denied on the object 'Usluga_Niedodawane', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Wstaw
@Par_IdUsluga = 101,
@Par_Nazwa = 'abc',
@Par_Cena = 200.00,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Wstaw, Line 1 [Batch Start Line 6287]
The EXECUTE permission was denied on the object 'Usluga_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Modyfikuj
@Par_IdUsluga = 101,
@Par_Nazwa = 'abc',
@Par_Cena = 200.00,
@Par_Opis = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Modyfikuj, Line 1 [Batch Start Line 6299]
The EXECUTE permission was denied on the object 'Usluga_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Usun
@Par_IdUsluga = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Usun, Line 1 [Batch Start Line 6311]
The EXECUTE permission was denied on the object 'Usluga_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Aktualne
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-12-31';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Aktualne, Line 1 [Batch Start Line 6320]
The EXECUTE permission was denied on the object 'Wypozyczenie_Aktualne', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_N_OstatnichDni
@Par_LiczbaDni = 160;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_N_OstatnichDni, Line 1 [Batch Start Line 6329]
The EXECUTE permission was denied on the object 'Wypozyczenie_N_OstatnichDni', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Szukaj_Okres
@Par_Dni = 6;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Szukaj_Okres, Line 1 [Batch Start Line 6339]
The EXECUTE permission was denied on the object 'Wypozyczenie_Szukaj_Okres', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Znajdz_Daty
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-04-04';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Znajdz_Daty, Line 1 [Batch Start Line 6348]
The EXECUTE permission was denied on the object 'Wypozyczenie_Znajdz_Daty', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Wstaw -- Klient powinien móc u¿yæ tej procedury jedynie z parametrem IdKlienta takim samym jak jego IdKlienta.
@Par_IdWypozyczenie = 101,
@Par_IdKlient = 5,
@Par_IdSamochod = 5,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-11-02 12:00',
@Par_TerminZwrotu = '2023-11-04',
@Par_DataZwrotu = NULL,
@Par_CenaPrzewidywana = 1000.00,
@Par_CenaOstateczna = NULL,
@Par_StatusWypozyczenia = 1,
@Par_Uwagi = '';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Wypozyczenie_Modyfikuj -- Klient powinien móc zmodyfikowaæ jedynie swoje bie¿¹ce wypo¿yczenia, zmieiaj¹c jedynie sposób p³atnoœci i termin zwrotu.
@Par_IdWypozyczenie = 101,
@Par_IdKlient = 5,
@Par_IdSamochod = 5,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-11-02 12:00',
@Par_TerminZwrotu = '2023-11-04',
@Par_DataZwrotu = NULL,
@Par_CenaPrzewidywana = 1000.00,
@Par_CenaOstateczna = NULL,
@Par_StatusWypozyczenia = 1,
@Par_Uwagi = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Wypozyczenie_Zestawienie
@Par_IdWypozyczenie = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Zestawienie, Line 1 [Batch Start Line 6397]
The EXECUTE permission was denied on the object 'Wypozyczenie_Zestawienie', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Usun
@Par_IdWypozyczenie = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Usun, Line 1 [Batch Start Line 6407]
The EXECUTE permission was denied on the object 'Wypozyczenie_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.WypozyczenieUsluga_Wstaw -- Klient powinien móc dodawaæ nowe us³ugi do swojego bie¿¹cego wypo¿yczenia.
@Par_IdWypozyczenieUsluga = 101,
@Par_IdWypozyczenie = 1,
@Par_IdUsluga = 5,
@Par_Uwagi = '';
GO

/*
(1 row affected)
*/

EXECUTE dbo.WypozyczenieUsluga_Modyfikuj -- Klient powienien móc dodawaæ uwagi do swoich us³ug.
@Par_IdWypozyczenieUsluga = 101,
@Par_IdWypozyczenie = 1,
@Par_IdUsluga = 5,
@Par_Uwagi = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.WypozyczenieUsluga_Usun
@Par_IdWypozyczenieUsluga = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.WypozyczenieUsluga_Usun, Line 1 [Batch Start Line 6438]
The EXECUTE permission was denied on the object 'WypozyczenieUsluga_Usun', database 'S19_P1', schema 'dbo'.
*/

------------------------------------------------------------
-- Rola Goscie.
------------------------------------------------------------

EXECUTE dbo.Kategoria_Modyfikuj
@Par_Kategoria = 'Sportowe',
@Par_Cena = 1000.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_Modyfikuj, Line 1 [Batch Start Line 6451]
The EXECUTE permission was denied on the object 'Kategoria_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_Wstaw
@Par_Kategoria = 'abc',
@Par_Cena = 100.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_Wstaw, Line 1 [Batch Start Line 6462]
The EXECUTE permission was denied on the object 'Kategoria_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_Usun
@Par_Kategoria = 'abc';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_Usun, Line 1 [Batch Start Line 6473]
The EXECUTE permission was denied on the object 'Kategoria_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_ZmienCene
@Par_Kategoria = 'Sportowe',
@Par_Cena = 1001;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Kategoria_ZmienCene, Line 1 [Batch Start Line 6482]
The EXECUTE permission was denied on the object 'Kategoria_ZmienCene', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Kategoria_Znajdz_Cena
@Par_CenaOd = 300;
GO

/*
Kategoria            Cena                  Opis
-------------------- --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Premium              300,00                Luksusowe samochody z najnowszymi funkcjami i eleganckim wykoñczeniem. Zapewniaj¹ wyj¹tkowy komfort, styl i doskona³e osi¹gi. Doskona³e do podró¿y s³u¿bowych lub specjalnych okazji.
Klasyczny/Antyk      400,00                Klasyczne samochody z przesz³oœci, które zachwycaj¹ swoim piêknym wzornictwem i duchem retro. Idealne dla mi³oœników motoryzacji i unikalnych doœwiadczeñ.
Performance          500,00                Potê¿ne samochody z wysokimi osi¹gami, które zapewniaj¹ niezwyk³e wra¿enia z jazdy. Posiadaj¹ zaawansowane systemy napêdowe i sportowe osi¹gi.
Super Luxury         600,00                Najwy¿szy poziom luksusu i presti¿u. Oferuje ekskluzywne samochody z najwy¿szym wyposa¿eniem, najnowszymi technologiami i niezrównanym komfortem.
Sportowe             1001,00               

(5 rows affected)
*/

EXECUTE dbo.Klienci_Wypozyczenia
@Par_MinWartosc = 100;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klienci_Wypozyczenia, Line 1 [Batch Start Line 6508]
The EXECUTE permission was denied on the object 'Klienci_Wypozyczenia', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_CenaWypozyczenia
@Par_Cena = 700;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_CenaWypozyczenia, Line 1 [Batch Start Line 6516]
The EXECUTE permission was denied on the object 'Klient_CenaWypozyczenia', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Miejscowosci
@Par_MinLiczba = 2;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Miejscowosci, Line 1 [Batch Start Line 6526]
The EXECUTE permission was denied on the object 'Klient_Miejscowosci', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Wstaw -- Goœæ powinien mieæ mo¿liwoœæ zarejestrowania klienta (samego siebie).
@Par_IdKlient = 101,
@Par_Imie = 'Rafa³',
@Par_Nazwisko = 'Rafalski',
@Par_Nazwa = 'Rafa³ Company',
@Par_Miejscowosc = 'Rafa³owice',
@Par_Ulica = 'Rafalska',
@Par_NrDomu = '3',
@Par_NrLokalu = '2',
@Par_KodPocztowy = '62-800',
@Par_Poczta = 'Kalisz',
@Par_NrTelefonu = '+48 533 123 345',
@Par_AdresMail = 'rafalek@wp.pl',
@Par_Uwagi = 'brak';
GO

/*
(1 row affected)
*/

EXECUTE dbo.Klient_Modyfikuj
@Par_IdKlient = 101,
@Par_Imie = 'Rafa³ek',
@Par_Nazwisko = 'Rafalski',
@Par_Nazwa = 'Rafa³ Company',
@Par_Miejscowosc = 'Rafa³owice',
@Par_Ulica = 'Rafalska',
@Par_NrDomu = '3',
@Par_NrLokalu = '2',
@Par_KodPocztowy = '62-800',
@Par_Poczta = 'Kalisz',
@Par_NrTelefonu = '+48 533 123 345',
@Par_AdresMail = 'rafalek@wp.pl',
@Par_Uwagi = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Modyfikuj, Line 1 [Batch Start Line 6555]
The EXECUTE permission was denied on the object 'Klient_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Szukaj
@Par_Wzorzec = 'Rafa³';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Szukaj, Line 1 [Batch Start Line 6576]
The EXECUTE permission was denied on the object 'Klient_Szukaj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Znajdz_Nazwisko
@Par_Wzorzec = 'Rafalski',
@Par_Opcja = 'P';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Znajdz_Nazwisko, Line 1 [Batch Start Line 6584]
The EXECUTE permission was denied on the object 'Klient_Znajdz_Nazwisko', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Znajdz_Wzorzec
@Par_Wzorzec = 'Raf',
@Par_Kolumna = 'Imie';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Znajdz_Wzorzec, Line 1 [Batch Start Line 6595]
The EXECUTE permission was denied on the object 'Klient_Znajdz_Wzorzec', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.KlientUprawnienia_Wstaw
@Par_IdKlientUprawnienia = 101,
@Par_IdKlient = 101,
@Par_KategoriaPrawaJazdy = 'B';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.KlientUprawnienia_Wstaw, Line 1 [Batch Start Line 6605]
The EXECUTE permission was denied on the object 'KlientUprawnienia_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.KlientUprawnienia_Modyfikuj
@Par_IdKlientUprawnienia = 101,
@Par_IdKlient = 101,
@Par_KategoriaPrawaJazdy = 'C';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.KlientUprawnienia_Modyfikuj, Line 1 [Batch Start Line 6616]
The EXECUTE permission was denied on the object 'KlientUprawnienia_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.KlientUprawnienia_Usun
@Par_IdKlientUprawnienia = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.KlientUprawnienia_Usun, Line 1 [Batch Start Line 6627]
The EXECUTE permission was denied on the object 'KlientUprawnienia_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Klient_Usun
@Par_IdKlient = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Klient_Usun, Line 1 [Batch Start Line 6636]
The EXECUTE permission was denied on the object 'Klient_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marka_Wstaw
@Par_Marka = 'Mitsubischi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marka_Wstaw, Line 1 [Batch Start Line 6645]
The EXECUTE permission was denied on the object 'Marka_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marka_Modyfikuj
@Par_Marka = 'Mitsubischi',
@Par_NowaMarka = 'Mitsubishi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marka_Modyfikuj, Line 1 [Batch Start Line 6654]
The EXECUTE permission was denied on the object 'Marka_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marka_Usun
@Par_Marka = 'Mitsubishi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marka_Usun, Line 1 [Batch Start Line 6663]
The EXECUTE permission was denied on the object 'Marka_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Marki_Popularnosc
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-12-31',
@Par_MinLiczba = 1,
@Par_MinWartosc = 100.0;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Marki_Popularnosc, Line 1 [Batch Start Line 6673]
The EXECUTE permission was denied on the object 'Marki_Popularnosc', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Model_Wstaw
@Par_Model = 'iX3',
@Par_Marka = 'Audi';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Model_Wstaw, Line 1 [Batch Start Line 6685]
The EXECUTE permission was denied on the object 'Model_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Model_Modyfikuj
@Par_Model = 'iX3',
@Par_Marka = 'BMW';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Model_Modyfikuj, Line 1 [Batch Start Line 6695]
The EXECUTE permission was denied on the object 'Model_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Model_Usun
@Par_Model = 'iX3';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Model_Usun, Line 1 [Batch Start Line 6704]
The EXECUTE permission was denied on the object 'Model_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Platnosc_Wstaw
@Par_SposobPlatnosci = 'Na zeszyt';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Platnosc_Wstaw, Line 1 [Batch Start Line 6714]
The EXECUTE permission was denied on the object 'Platnosc_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Platnosc_Modyfikuj
@Par_SposobPlatnosci = 'Na zeszyt',
@Par_NowySposobPlatnosci = 'Na krechê';
GO

/*
Procedure dbo.Platnosc_Modyfikuj, Line 1 [Batch Start Line 6723]
The EXECUTE permission was denied on the object 'Platnosc_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Platnosc_Usun
@Par_SposobPlatnosci = 'Na krechê';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Platnosc_Usun, Line 1 [Batch Start Line 6732]
The EXECUTE permission was denied on the object 'Platnosc_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Wstaw
@Par_IdPracownik = 102,
@Par_Imie = 'Rafa³',
@Par_Nazwisko = 'Rafalski',
@Par_Stanowisko = 'Sprzedawca',
@Par_NrTelefonu = '+48 111 111 111',
@Par_AdresMail = 'rafalek@wp.pl';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Wstaw, Line 1 [Batch Start Line 6742]
The EXECUTE permission was denied on the object 'Pracownik_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Modyfikuj
@Par_IdPracownik = 102,
@Par_Imie = 'Rafa³ek',
@Par_Nazwisko = 'Rafalski',
@Par_Stanowisko = 'Sprzedawca',
@Par_NrTelefonu = '+48 111 111 111',
@Par_AdresMail = 'rafalek@wp.pl';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Modyfikuj, Line 1 [Batch Start Line 6756]
The EXECUTE permission was denied on the object 'Pracownik_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownicy_Ranking
@Par_Stanowisko = 'Sprzedawca',
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-07-12',
@Par_MinLiczba = 2;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownicy_Ranking, Line 1 [Batch Start Line 6769]
The EXECUTE permission was denied on the object 'Pracownicy_Ranking', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Znajdz_Id
@Par_IdPracownik = 102;
GO

/*
sg 229, Level 14, State 5, Procedure dbo.Pracownik_Znajdz_Id, Line 1 [Batch Start Line 6782]
The EXECUTE permission was denied on the object 'Pracownik_Znajdz_Id', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Znajdz_Nazwisko
@Par_Nazwisko = 'Raf';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Znajdz_Nazwisko, Line 1 [Batch Start Line 6791]
The EXECUTE permission was denied on the object 'Pracownik_Znajdz_Nazwisko', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Archiwizuj
@Par_IdPracownik = 102;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Archiwizuj, Line 1 [Batch Start Line 6800]
The EXECUTE permission was denied on the object 'Pracownik_Archiwizuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Pracownik_Usun
@Par_IdPracownik = 102;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Pracownik_Usun, Line 1 [Batch Start Line 6809]
The EXECUTE permission was denied on the object 'Pracownik_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Wstaw
@Par_IdSamochod = 101,
@Par_Kategoria = 'Sportowe',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Wstaw, Line 1 [Batch Start Line 6818]
The EXECUTE permission was denied on the object 'Samochod_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Modyfikuj
@Par_IdSamochod = 101,
@Par_Kategoria = 'Sportowe',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Modyfikuj, Line 1 [Batch Start Line 6834]
The EXECUTE permission was denied on the object 'Samochod_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Dostepnosc
@Par_Dostepnosc = 1;
GO

/*
IdSamochod  Kategoria            Model                IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              5           2021        Diesel          BMW 740d xDrive
3           Rodzinna             Mondeo               5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
6           Premium              A4                   5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic

(4 rows affected)
*/

EXECUTE dbo.Samochody_Marki;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochody_Marki, Line 1 [Batch Start Line 6864]
The EXECUTE permission was denied on the object 'Samochody_Marki', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Wstaw_Makro
@Par_IdSamochod = 102,
@Par_Kategoria = 'Sportowe',
@Par_Marka = 'BMW',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2023,
@Par_TypSilnika = 'Diesel',
@Par_InformacjeDodatkowe = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Wstaw_Makro, Line 1 [Batch Start Line 6872]
The EXECUTE permission was denied on the object 'Samochod_Wstaw_Makro', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Samochod_Usun
@Par_IdSamochod = 101;
GO

EXECUTE dbo.Samochod_Usun
@Par_IdSamochod = 102;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Usun, Line 1 [Batch Start Line 6890]
The EXECUTE permission was denied on the object 'Samochod_Usun', database 'S19_P1', schema 'dbo'.
Msg 229, Level 14, State 5, Procedure dbo.Samochod_Usun, Line 1 [Batch Start Line 6893]
The EXECUTE permission was denied on the object 'Samochod_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Ubezpieczenie_Wstaw
@Par_IdUbezpieczenie = 101,
@Par_Nazwa = 'Ubezpieczenie od wszystkiego',
@Par_Cena = 1500.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Ubezpieczenie_Wstaw, Line 1 [Batch Start Line 6905]
The EXECUTE permission was denied on the object 'Ubezpieczenie_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Ubezpieczenie_Modyfikuj
@Par_IdUbezpieczenie = 101,
@Par_Nazwa = 'Ubezpieczenie od wszystkiego',
@Par_Cena = 1501.0,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Ubezpieczenie_Modyfikuj, Line 1 [Batch Start Line 6917]
The EXECUTE permission was denied on the object 'Ubezpieczenie_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Ubezpieczenie_Usun
@Par_IdUbezpieczenie = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Ubezpieczenie_Usun, Line 1 [Batch Start Line 6928]
The EXECUTE permission was denied on the object 'Ubezpieczenie_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Uprawnienia_Wstaw
@Par_KategoriaPrawaJazdy = 'TANK',
@Par_KategoriaOpis = 'Uprawnia do prowadzenia czo³gu do 45 ton.';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Uprawnienia_Wstaw, Line 1 [Batch Start Line 6938]
The EXECUTE permission was denied on the object 'Uprawnienia_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Uprawnienia_Modyfikuj
@Par_KategoriaPrawaJazdy = 'TANK',
@Par_KategoriaOpis = 'Uprawnia do prowadzenia czo³gu do 60 ton.';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Uprawnienia_Modyfikuj, Line 1 [Batch Start Line 6948]
The EXECUTE permission was denied on the object 'Uprawnienia_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Uprawnienia_Usun
@Par_KategoriaPrawaJazdy = 'TANK';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Uprawnienia_Usun, Line 1 [Batch Start Line 6957]
The EXECUTE permission was denied on the object 'Uprawnienia_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Niedodawane
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-01-01';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Niedodawane, Line 1 [Batch Start Line 6967]
The EXECUTE permission was denied on the object 'Usluga_Niedodawane', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Wstaw
@Par_IdUsluga = 101,
@Par_Nazwa = 'abc',
@Par_Cena = 200.00,
@Par_Opis = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Wstaw, Line 1 [Batch Start Line 6977]
The EXECUTE permission was denied on the object 'Usluga_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Modyfikuj
@Par_IdUsluga = 101,
@Par_Nazwa = 'abc',
@Par_Cena = 200.00,
@Par_Opis = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Modyfikuj, Line 1 [Batch Start Line 6989]
The EXECUTE permission was denied on the object 'Usluga_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Usluga_Usun
@Par_IdUsluga = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Usluga_Usun, Line 1 [Batch Start Line 7001]
The EXECUTE permission was denied on the object 'Usluga_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Aktualne
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-12-31';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Aktualne, Line 1 [Batch Start Line 7010]
The EXECUTE permission was denied on the object 'Wypozyczenie_Aktualne', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_N_OstatnichDni
@Par_LiczbaDni = 160;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_N_OstatnichDni, Line 1 [Batch Start Line 7020]
The EXECUTE permission was denied on the object 'Wypozyczenie_N_OstatnichDni', database 'S19_P1', schema 'dbo'.

*/

EXECUTE dbo.Wypozyczenie_Szukaj_Okres
@Par_Dni = 6;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Szukaj_Okres, Line 1 [Batch Start Line 7030]
The EXECUTE permission was denied on the object 'Wypozyczenie_Szukaj_Okres', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Znajdz_Daty
@Par_DataOd = '2022-01-01',
@Par_DataDo = '2023-04-04';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Znajdz_Daty, Line 1 [Batch Start Line 7039]
The EXECUTE permission was denied on the object 'Wypozyczenie_Znajdz_Daty', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Wstaw
@Par_IdWypozyczenie = 101,
@Par_IdKlient = 5,
@Par_IdSamochod = 5,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-11-02 12:00',
@Par_TerminZwrotu = '2023-11-04',
@Par_DataZwrotu = NULL,
@Par_CenaPrzewidywana = 1000.00,
@Par_CenaOstateczna = NULL,
@Par_StatusWypozyczenia = 1,
@Par_Uwagi = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Wstaw, Line 1 [Batch Start Line 7049]
The EXECUTE permission was denied on the object 'Wypozyczenie_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Modyfikuj
@Par_IdWypozyczenie = 101,
@Par_IdKlient = 5,
@Par_IdSamochod = 5,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-11-02 12:00',
@Par_TerminZwrotu = '2023-11-04',
@Par_DataZwrotu = NULL,
@Par_CenaPrzewidywana = 1000.00,
@Par_CenaOstateczna = NULL,
@Par_StatusWypozyczenia = 1,
@Par_Uwagi = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Modyfikuj, Line 1 [Batch Start Line 7070]
The EXECUTE permission was denied on the object 'Wypozyczenie_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Zestawienie
@Par_IdWypozyczenie = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Zestawienie, Line 1 [Batch Start Line 7091]
The EXECUTE permission was denied on the object 'Wypozyczenie_Zestawienie', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.Wypozyczenie_Usun
@Par_IdWypozyczenie = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.Wypozyczenie_Usun, Line 1 [Batch Start Line 7099]
The EXECUTE permission was denied on the object 'Wypozyczenie_Usun', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.WypozyczenieUsluga_Wstaw
@Par_IdWypozyczenieUsluga = 101,
@Par_IdWypozyczenie = 1,
@Par_IdUsluga = 5,
@Par_Uwagi = '';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.WypozyczenieUsluga_Wstaw, Line 1 [Batch Start Line 7108]
The EXECUTE permission was denied on the object 'WypozyczenieUsluga_Wstaw', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.WypozyczenieUsluga_Modyfikuj
@Par_IdWypozyczenieUsluga = 101,
@Par_IdWypozyczenie = 1,
@Par_IdUsluga = 5,
@Par_Uwagi = 'brak';
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.WypozyczenieUsluga_Modyfikuj, Line 1 [Batch Start Line 7120]
The EXECUTE permission was denied on the object 'WypozyczenieUsluga_Modyfikuj', database 'S19_P1', schema 'dbo'.
*/

EXECUTE dbo.WypozyczenieUsluga_Usun
@Par_IdWypozyczenieUsluga = 101;
GO

/*
Msg 229, Level 14, State 5, Procedure dbo.WypozyczenieUsluga_Usun, Line 1 [Batch Start Line 7133]
The EXECUTE permission was denied on the object 'WypozyczenieUsluga_Usun', database 'S19_P1', schema 'dbo'.
*/

------------------------------------------------------------
-- Wnioski.
------------------------------------------------------------

/*
Role "Administratorzy" i "PracownicyAdm" maj¹ dostêp EXECUTE do procedury dbo.Klient_Znajdz_Wzorzec, 
ale nadano im te¿ DENY SELECT na tabeli dbo.Klient. Mimo udzielonego dostêpu do procedury, 
procedura ta generuje dynamiczne zapytanie SQL, które wymaga dostêpu do tabeli dbo.Klient.
W takiej sytuacji, brakuj¹ce uprawnienie SELECT na tabeli uniemo¿liwia roli "Administratorzy" 
korzystanie z procedury. Aby to naprawiæ, role musia³aby równie¿ otrzymaæ uprawnienie SELECT 
do tabeli `dbo.Klient". Jednak trzeba to robiæ z rozwag¹, poniewa¿ to mo¿e otworzyæ dostêp do 
tabeli w sposób niezamierzony z punktu widzenia bezpieczeñstwa danych.
*/

/*
Wniosek: ¯adna z ról nie uprawnia do bezproœredniego u¿ywania poleceñ SELECT, INSERT, UPDATE,
DELETE, ale nadanie uprawnieñ do procedur przechowywanych, pozwoli³o uzyskaæ ten sam efekt
w sposób poœredni."

Korzyœci wynikaj¹ce z zastosowania procedur przechowywanych:

1. Izolacja kodu: Procedury przechowywane pozwalaj¹ na izolacjê i kontrolê dostêpu do kodu 
wykonywalnego w bazie danych. Mo¿emy okreœliæ, które role lub u¿ytkownicy maj¹ dostêp
do danej procedury i jakie operacje mog¹ wykonywaæ.

2. £atwa zmiana uprawnieñ: Mo¿liwoœæ elastycznego zarz¹zania uprawnieniami poprzez procedury 
przechowywane, dziêki czemu mo¿na dostosowaæ dostêp do danych dla ró¿nych u¿ytkowników lub ról 
bez koniecznoœci zmiany kodu aplikacji klienckiej.

3. Zapobieganie niew³aœciwym operacjom: Procedury przechowywane pozwalaj¹ na kontrolowanie 
i walidacjê operacji wykonywanych na danych, co mo¿e pomóc w unikniêciu niepo¿¹danych lub 
b³êdnych zmian.

4. £atwe monitorowanie i audytowanie: Mo¿liwoœæ monitorowania wywo³ania procedur przechowywanych 
oraz œledzenia, kto i kiedy korzysta z nich, co u³atwia audytowanie dzia³añ w bazie danych.
*/

------------------------------------------------------------
-- Koniec.
------------------------------------------------------------