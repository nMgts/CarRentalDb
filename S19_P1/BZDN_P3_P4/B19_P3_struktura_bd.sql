--------------------------------------------------------------
-- BZDN_P3: budowanie struktury bd w jêzyku T-SQL DDL.
--------------------------------------------------------------

--------------------------------------------------------------
-- Definicje tabel.
--------------------------------------------------------------

CREATE TABLE dbo.Klient
(
	IdKlient int NOT NULL,
	Imie varchar(20) NOT NULL,
	Nazwisko varchar(40) NOT NULL,
	Nazwa varchar(40) NULL,
	Miejscowosc varchar(30) NOT NULL,
	Ulica varchar(50) NULL,
	NrDomu varchar(10) NOT NULL,
	NrLokalu varchar(10) NULL,
	KodPocztowy nchar(6) NOT NULL,
	Poczta varchar(50) NOT NULL,
	NrTelefonu nchar(15) NOT NULL,
	AdresMail varchar(30) NOT NULL,
	Uwagi varchar(1000) NULL
);
GO

CREATE TABLE dbo.Pracownik
(
	IdPracownik int NOT NULL,
	Imie varchar(20) NOT NULL,
	Nazwisko varchar(40) NOT NULL,
	Stanowisko varchar(40) NOT NULL,
	NrTelefonu nchar(15) NOT NULL,
	AdresMail varchar(30) NOT NULL
);
GO

CREATE TABLE dbo.Wypozyczenie
(
	IdWypozyczenie int NOT NULL,
	IdKlient int NOT NULL,
	IdSamochod int NOT NULL,
	IdPracownik int NOT NULL,
	IdUbezpieczenie int NOT NULL,
	SposobPlatnosci varchar(25) NOT NULL,
	DataWypozyczenia datetime NOT NULL,
	TerminZwrotu datetime NOT NULL,
	DataZwrotu datetime NULL,
	CenaPrzewidywana money NOT NULL,
	CenaOstateczna money NULL,
	StatusWypozyczenia bit NOT NULL,
	Uwagi varchar(1000) NULL
);
GO

CREATE TABLE dbo.Uprawnienia
(
	KategoriaPrawaJazdy varchar(4) NOT NULL,
	KategoriaOpis varchar(150) NOT NULL
);
GO

CREATE TABLE dbo.KlientUprawnienia
(
	IdKlientUprawnienia int NOT NULL,
	IdKlient int NOT NULL,
	KategoriaPrawaJazdy varchar(4) NOT NULL
);
GO

CREATE TABLE dbo.Ubezpieczenie
(
	IdUbezpieczenie int NOT NULL,
	Nazwa varchar(30) NOT NULL,
	Cena money NOT NULL,
	Opis varchar(2000) NOT NULL
);
GO

CREATE TABLE dbo.Platnosc
(
	SposobPlatnosci varchar(25) NOT NULL
);
GO

CREATE TABLE dbo.Samochod
(
	IdSamochod int NOT NULL,
	Kategoria varchar(20) NOT NULL,
	Model varchar(20) NOT NULL,
	Dostepnosc bit NOT NULL,
	IloscDrzwi int NOT NULL,
	Rocznik int NOT NULL,
	TypSilnika varchar(15) NOT NULL,
	InformacjeDodatkowe varchar(1000) NULL
);
GO

CREATE TABLE dbo.Usluga
(
	IdUsluga int NOT NULL,
	Nazwa varchar(30) NOT NULL,
	Cena money NOT NULL,
	Opis varchar(2000) NOT NULL
);
GO

CREATE TABLE dbo.WypozyczenieUsluga
(
	IdWypozyczenieUsluga int NOT NULL,
	IdWypozyczenie int NOT NULL,
	IdUsluga int NOT NULL,
	Uwagi varchar(2000) NULL
);
GO

CREATE TABLE dbo.Kategoria
(
	Kategoria varchar(20) NOT NULL,
	Cena money NOT NULL,
	Opis varchar(1000) NOT NULL
);
GO

CREATE TABLE dbo.Model
(
	Model varchar(20) NOT NULL,
	Marka varchar(20) NOT NULL
);
GO

CREATE TABLE dbo.Marka
(
	Marka varchar(20) NOT NULL
);
GO

--------------------------------------------------------------
-- Definicje kluczy g³ównych (PRIMARY KEY).
--------------------------------------------------------------

ALTER TABLE dbo.Klient
ADD CONSTRAINT PK_Klient
PRIMARY KEY (IdKlient);
GO

ALTER TABLE dbo.Pracownik
ADD CONSTRAINT PK_Pracownik
PRIMARY KEY (IdPracownik);
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT PK_Wypozyczenie
PRIMARY KEY (IdWypozyczenie);
GO

ALTER TABLE dbo.Uprawnienia
ADD CONSTRAINT PK_Uprawnnienia
PRIMARY KEY (KategoriaPrawaJazdy);
GO

ALTER TABLE dbo.KlientUprawnienia
ADD CONSTRAINT PK_KlientUprawnienia
PRIMARY KEY (IdKlientUprawnienia);
GO

ALTER TABLE dbo.Ubezpieczenie
ADD CONSTRAINT PK_Ubezpieczenie
PRIMARY KEY (IdUbezpieczenie);
GO

ALTER TABLE dbo.Platnosc
ADD CONSTRAINT PK_Platnosc
PRIMARY KEY (SposobPlatnosci);
GO

ALTER TABLE dbo.Samochod
ADD CONSTRAINT PK_Samochod
PRIMARY KEY (IdSamochod);
GO

ALTER TABLE dbo.Usluga
ADD CONSTRAINT PK_Usluga
PRIMARY KEY (IdUsluga);
GO

ALTER TABLE dbo.WypozyczenieUsluga
ADD CONSTRAINT PK_WypozyczenieUsluga
PRIMARY KEY (IdWypozyczenieUsluga);
GO

ALTER TABLE dbo.Kategoria
ADD CONSTRAINT PK_Kategoria
PRIMARY KEY (Kategoria);
GO

ALTER TABLE dbo.Model
ADD CONSTRAINT PK_Model
PRIMARY KEY (Model);
GO

ALTER TABLE dbo.Marka
ADD CONSTRAINT PK_Marka
PRIMARY KEY (Marka);
GO

--------------------------------------------------------------
-- Definicje kluczy obcych (FOREIGN KEY).
--------------------------------------------------------------

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT FK_Wypozyczenie_Klient
FOREIGN KEY (IdKlient)
REFERENCES dbo.Klient(IdKlient);
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT FK_Wypozyczenie_Pracownik
FOREIGN KEY (IdPracownik)
REFERENCES dbo.Pracownik(IdPracownik);
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT FK_Wypozyczenie_Ubezpieczenie
FOREIGN KEY (IdUbezpieczenie)
REFERENCES dbo.Ubezpieczenie(IdUbezpieczenie);
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT FK_Wypozyczenie_Platnosc
FOREIGN KEY (SposobPlatnosci)
REFERENCES dbo.Platnosc(SposobPlatnosci);
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT FK_Wypozyczenie_Samochod
FOREIGN KEY (IdSamochod)
REFERENCES dbo.Samochod(IdSamochod);
GO

ALTER TABLE dbo.KlientUprawnienia
ADD CONSTRAINT FK_Klient_Klient_Uprawnienia
FOREIGN KEY (IdKlient)
REFERENCES dbo.Klient(IdKlient);
GO

ALTER TABLE dbo.KlientUprawnienia
ADD CONSTRAINT FK_KlientUprawnienia_Uprawnienia
FOREIGN KEY (KategoriaPrawaJazdy)
REFERENCES dbo.Uprawnienia(KategoriaPrawaJazdy);
GO

ALTER TABLE dbo.WypozyczenieUsluga
ADD CONSTRAINT FK_WypozyczenieUsluga_Wypozyczenie
FOREIGN KEY (IdWypozyczenie)
REFERENCES dbo.Wypozyczenie(IdWypozyczenie);
GO

ALTER TABLE dbo.WypozyczenieUsluga
ADD CONSTRAINT FK_WypozyczenieUsluga_Usluga
FOREIGN KEY (IdUsluga)
REFERENCES dbo.Usluga(IdUsluga);
GO

ALTER TABLE dbo.Samochod
ADD CONSTRAINT FK_Samochod_Kategoria
FOREIGN KEY (Kategoria)
REFERENCES dbo.Kategoria(Kategoria);
GO

ALTER TABLE dbo.Samochod
ADD CONSTRAINT FK_Samochod_Model
FOREIGN KEY (Model)
REFERENCES dbo.Model(Model);
GO

ALTER TABLE dbo.Model
ADD CONSTRAINT FK_Model_Marka
FOREIGN KEY (Marka)
REFERENCES dbo.Marka(Marka);
GO

--------------------------------------------------------------
-- Definicje ograniczeñ CHECK.
--------------------------------------------------------------

ALTER TABLE dbo.Klient
ADD CONSTRAINT CK_Klient_KodPocztowy
CHECK (KodPocztowy LIKE '[0-9][0-9]-[0-9][0-9][0-9]');
GO

ALTER TABLE dbo.Klient
ADD CONSTRAINT CK_Klient_NrTelefonu
CHECK ((NrTelefonu LIKE '+[0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]')
OR (NrTelefonu LIKE '+[0-9][0-9] [0-9][0-9] [0-9][0-9][0-9][0-9] [0-9][0-9][0-9]'));
GO

ALTER TABLE dbo.Pracownik
ADD CONSTRAINT CK_Pracownik_NrTelefonu
CHECK ((NrTelefonu LIKE '+[0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]')
OR (NrTelefonu LIKE '+[0-9][0-9] [0-9][0-9] [0-9][0-9][0-9][0-9] [0-9][0-9][0-9]'));
GO

ALTER TABLE dbo.Klient
ADD CONSTRAINT CK_Klient_AdresMail
CHECK ((AdresMail LIKE '%_@%_.[a-z][a-z]%') 
AND (AdresMail NOT LIKE '% %'));
GO

ALTER TABLE dbo.Pracownik
ADD CONSTRAINT CK_Pracownik_AdresMail
CHECK ((AdresMail LIKE '%_@%_.[a-z][a-z]%') 
AND (AdresMail NOT LIKE '% %'));
GO

ALTER TABLE dbo.Klient
ADD CONSTRAINT CK_Klient_Imie
CHECK ((Imie NOT LIKE '%[0-9]%') 
AND (ASCII(UPPER(SUBSTRING(Imie, 1, 1))) = ASCII(SUBSTRING(Imie, 1, 1))));
GO

ALTER TABLE dbo.Pracownik
ADD CONSTRAINT CK_Pracownik_Imie
CHECK ((Imie NOT LIKE '%[0-9]%') 
AND (ASCII(UPPER(SUBSTRING(Imie, 1, 1))) = ASCII(SUBSTRING(Imie, 1, 1))));
GO

ALTER TABLE dbo.Klient
ADD CONSTRAINT CK_Klient_Nazwisko
CHECK ((Nazwisko NOT LIKE '%[0-9]%') 
AND (ASCII(UPPER(SUBSTRING(Nazwisko, 1, 1))) = ASCII(SUBSTRING(Nazwisko, 1, 1))));
GO

ALTER TABLE dbo.Pracownik
ADD CONSTRAINT CK_Pracownik_Nazwisko
CHECK ((Nazwisko NOT LIKE '%[0-9]%') 
AND (ASCII(UPPER(SUBSTRING(Nazwisko, 1, 1))) = ASCII(SUBSTRING(Nazwisko, 1, 1))));
GO

ALTER TABLE dbo.Klient
ADD CONSTRAINT CK_Klient_Poczta
CHECK ((Poczta NOT LIKE '%[0-9]%') 
AND (ASCII(UPPER(SUBSTRING(Poczta, 1, 1))) = ASCII(SUBSTRING(Poczta, 1, 1))));
GO

ALTER TABLE dbo.Klient
ADD CONSTRAINT CK_Klient_Miejscowosc
CHECK ((Miejscowosc NOT LIKE '%[0-9]%') 
AND (ASCII(UPPER(SUBSTRING(Miejscowosc, 1, 1))) = ASCII(SUBSTRING(Miejscowosc, 1, 1))));
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT CK_Wypozyczenie_DataZwrotu
CHECK (DataWypozyczenia <= DataZwrotu);
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT CK_Wypozyczenie_TerminZwrotu
CHECK (DataWypozyczenia <= TerminZwrotu);
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT CK_Wypozyczenie_CenaPrzewidywana
CHECK (CenaPrzewidywana >= 0);
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT CK_Wypozyczenie_CenaOstateczna
CHECK (CenaOstateczna >= 0);
GO

ALTER TABLE dbo.Samochod
ADD CONSTRAINT CK_Samochod_Rocznik
CHECK (rocznik >= 1900 AND rocznik <= YEAR(GETDATE()));
GO

ALTER TABLE dbo.Samochod
ADD CONSTRAINT CK_Samochod_IloscDrzwi
CHECK (IloscDrzwi >= 0 AND IloscDrzwi <= 5);
GO

ALTER TABLE dbo.Usluga
ADD CONSTRAINT CK_Usluga_Cena
CHECK (Cena >= 0);
GO

ALTER TABLE dbo.Kategoria
ADD CONSTRAINT CK_Kategoria_Cena
CHECK (Cena >= 0);
GO

--------------------------------------------------------------------
-- Definicje ograniczeñ CHECK (CK), s³u¿¹cych wymuszaniu 1NF.
--------------------------------------------------------------------

-- Regu³y ograniczaj¹ce mo¿liwoœæ wprowadzania zbiorów i ci¹gów wartoœci
-- w polach tekstowych typu "varchar(n)", "char(n)".

-- Zak³adamy, ¿e ka¿de pole otwarte (np. "Opis", "Uwagi") stanowi pojedynczy 
-- opis tekstowy, który spe³nia warunki 1NF i nie musi byæ objêty ograniczeniami.
--

ALTER TABLE dbo.Klient
ADD CONSTRAINT CK_Klient_1NF
CHECK ((Imie NOT LIKE '%[ -@]%')
	AND (Nazwisko NOT LIKE '%[!-@]%')
	AND (Nazwa NOT LIKE '%[,;:+=!@#$()/]%')
	AND (Ulica NOT LIKE '%[,;:+=!@#$()/]%')
	AND (NrDomu NOT LIKE '%[ -@]%')
	AND (NrLokalu NOT LIKE '%[.,;:+=!@#$()]%')
	AND (Miejscowosc NOT LIKE '%[!-@]%')
	AND (Poczta NOT LIKE '%[!-@]%'));
GO

ALTER TABLE dbo.Pracownik
ADD CONSTRAINT CK_Pracownik_1NF
CHECK ((Imie NOT LIKE '%[ -@]%')
	AND (Nazwisko NOT LIKE '%[!-@]%')
	AND (Stanowisko NOT LIKE '%[,;:=!@#$()/]%]%'));
GO

ALTER TABLE dbo.Uprawnienia
ADD CONSTRAINT CK_Uprawnienia_1NF
CHECK (KategoriaPrawaJazdy NOT LIKE '%[ .,;:=!@#$()/]%');
GO

ALTER TABLE dbo.Ubezpieczenie
ADD CONSTRAINT CK_Ubezpieczenie_1NF
CHECK (Nazwa NOT LIKE '%[!-@]%');
GO

ALTER TABLE dbo.Platnosc
ADD CONSTRAINT CK_Platnosc_1NF
CHECK (SposobPlatnosci NOT LIKE '%[!-@]%');
GO

ALTER TABLE dbo.Samochod
ADD CONSTRAINT CK_Samochod_1NF
CHECK (TypSilnika NOT LIKE '%[!-@]%');
GO

ALTER TABLE dbo.Kategoria
ADD CONSTRAINT CK_Kategoria_1NF
CHECK (Kategoria NOT LIKE '%[,;:=!@#$()]%]%');
GO

ALTER TABLE dbo.Marka
ADD CONSTRAINT CK_Marka_1NF
CHECK (Marka NOT LIKE '%[!-@]%');
GO

ALTER TABLE dbo.Model
ADD CONSTRAINT CK_Model_1NF
CHECK (Model NOT LIKE '%[.,;:=!@#$()]%');
GO

ALTER TABLE dbo.Usluga
ADD CONSTRAINT CK_Usluga_1NF
CHECK (Nazwa NOT LIKE '%[.,;:=!@#$()]%');
GO

--------------------------------------------------------------
-- Definicje ograniczeñ UNIQUE.
--------------------------------------------------------------


ALTER TABLE dbo.Ubezpieczenie
ADD CONSTRAINT UN_Ubezpieczenie_Nazwa
UNIQUE (Nazwa);
GO

ALTER TABLE dbo.Usluga
ADD CONSTRAINT UN_Usluga_Nazwa
UNIQUE (Nazwa);
GO

--------------------------------------------------------------
-- Definicje wartoœci domyœlnych DEFAULT.
--------------------------------------------------------------

ALTER TABLE dbo.Klient
ADD CONSTRAINT DF_Klient_Miejscowosc
DEFAULT ('Kalisz') FOR Miejscowosc;
GO

ALTER TABLE dbo.Klient
ADD CONSTRAINT DF_Klient_KodPocztowy
DEFAULT ('62-800') FOR KodPocztowy;
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT DF_Wypozyczenie_CenaPrzewidywana
DEFAULT (0) FOR CenaPrzewidywana;
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT DF_Wypozyczenie_CenaOstateczna
DEFAULT (0) FOR CenaOstateczna;
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT DF_Wypozyczenie_DataWypozyczenia
DEFAULT (GETDATE()) FOR DataWypozyczenia;
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT DF_Wypozyczenie_TerminZwrotu
DEFAULT (DATEADD(DAY, 1, GETDATE())) FOR TerminZwrotu;
GO

ALTER TABLE dbo.Wypozyczenie
ADD CONSTRAINT DF_Wypozyczenie_SposobPlatnosci
DEFAULT ('BLIK') FOR SposobPlatnosci;
GO

ALTER TABLE dbo.Samochod
ADD CONSTRAINT DF_Samochod_Dostepnossc
DEFAULT (1) FOR Dostepnosc;
GO

--------------------------------------------------------------
-- Koniec skryptu.
--------------------------------------------------------------