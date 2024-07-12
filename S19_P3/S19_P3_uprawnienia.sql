------------------------------------------------------------------------------------------------
-- SRBD_P1: projekt systemu bezpieczeñstwa bazy danych. 
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- Utworzenie w³asnych ról bazodanowych (ang. user-defined database roles).
------------------------------------------------------------------------------------------------

CREATE ROLE Administratorzy;
CREATE ROLE PracownicyAdm;
CREATE ROLE Sprzedawcy;
CREATE ROLE Klienci;
CREATE ROLE Goscie;
GO

------------------------------------------------------------------------------------------------
-- Uprawnienia ról bazodanowych.
------------------------------------------------------------------------------------------------
-- Podczas uruchamiania procedury z oznaczeniem "/!\ Wymagany kontekst u¿ycia"
-- konieczne jest przekazanie odpowiedniego kontekstu poprzez parametry wejœciowe
-- (np. identyfikatora klienta, który mo¿e przegl¹daæ i modyfikowaæ wy³¹cznie swoje dane).
------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- Uprawnienia roli bazodanowej "Administratorzy".
------------------------------------------------------------------------------------------------

-- Zabronienie bezpoœredniego dostêpu do tabel.
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Kategoria TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Klient TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.KlientUprawnienia TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Marka TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Model TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Platnosc TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Pracownik TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Samochod TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Ubezpieczenie TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Uprawnienia TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Usluga TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Wypozyczenie TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.WypozyczenieUsluga TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Kategoria_CenaHistoria TO Administratorzy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Pracownik_Kopia TO Administratorzy;
GO

-- Przyznanie uprawnieñ do uruchamiania procedur przechowywanych.
GRANT EXECUTE ON dbo.Kategoria_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.Kategoria_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.Kategoria_Wstaw TO Administratorzy;
GRANT EXECUTE ON dbo.Kategoria_ZmienCene TO Administratorzy;
GRANT EXECUTE ON dbo.Kategoria_Znajdz_Cena TO Administratorzy;
GRANT EXECUTE ON dbo.Klienci_Wypozyczenia TO Administratorzy;
GRANT EXECUTE ON dbo.Klient_CenaWypozyczenia TO Administratorzy;
GRANT EXECUTE ON dbo.Klient_Miejscowosci TO Administratorzy;
GRANT EXECUTE ON dbo.Klient_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.Klient_Szukaj TO Administratorzy;
GRANT EXECUTE ON dbo.Klient_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.Klient_Wstaw TO Administratorzy;
GRANT EXECUTE ON dbo.Klient_Znajdz_Nazwisko TO Administratorzy;
GRANT EXECUTE ON dbo.Klient_Znajdz_Wzorzec TO Administratorzy;
GRANT EXECUTE ON dbo.KlientUprawnienia_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.KlientUprawnienia_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.KlientUprawnienia_Wstaw TO Administratorzy;
GRANT EXECUTE ON dbo.Marka_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.Marka_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.Marka_Wstaw TO Administratorzy;
GRANT EXECUTE ON dbo.Marki_Popularnosc TO Administratorzy;
GRANT EXECUTE ON dbo.Model_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.Model_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.Model_Wstaw TO Administratorzy;
GRANT EXECUTE ON dbo.Platnosc_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.Platnosc_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.Platnosc_Wstaw TO Administratorzy;
GRANT EXECUTE ON dbo.Pracownicy_Ranking TO Administratorzy;
GRANT EXECUTE ON dbo.Pracownik_Archiwizuj TO Administratorzy;
GRANT EXECUTE ON dbo.Pracownik_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.Pracownik_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.Pracownik_Wstaw TO Administratorzy;
GRANT EXECUTE ON dbo.Pracownik_Znajdz_Id TO Administratorzy;
GRANT EXECUTE ON dbo.Pracownik_Znajdz_Nazwisko TO Administratorzy;
GRANT EXECUTE ON dbo.Samochod_Dostepnosc TO Administratorzy;
GRANT EXECUTE ON dbo.Samochod_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.Samochod_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.Samochod_Wstaw TO Administratorzy;
GRANT EXECUTE ON dbo.Samochod_Wstaw_Makro TO Administratorzy;
GRANT EXECUTE ON dbo.Samochody_Marki TO Administratorzy;
GRANT EXECUTE ON dbo.Ubezpieczenie_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.Ubezpieczenie_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.Ubezpieczenie_Wstaw TO Administratorzy;
GRANT EXECUTE ON dbo.Uprawnienia_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.Uprawnienia_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.Uprawnienia_Wstaw TO Administratorzy;
GRANT EXECUTE ON dbo.Usluga_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.Usluga_Niedodawane TO Administratorzy;
GRANT EXECUTE ON dbo.Usluga_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.Usluga_Wstaw TO Administratorzy;
GRANT EXECUTE ON dbo.Wypozyczenie_Aktualne TO Administratorzy;
GRANT EXECUTE ON dbo.Wypozyczenie_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.Wypozyczenie_N_OstatnichDni TO Administratorzy;
GRANT EXECUTE ON dbo.Wypozyczenie_Szukaj_Okres TO Administratorzy;
GRANT EXECUTE ON dbo.Wypozyczenie_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.Wypozyczenie_Wstaw TO Administratorzy;
GRANT EXECUTE ON dbo.Wypozyczenie_Zestawienie TO Administratorzy;
GRANT EXECUTE ON dbo.Wypozyczenie_Znajdz_Daty TO Administratorzy;
GRANT EXECUTE ON dbo.WypozyczenieUsluga_Modyfikuj TO Administratorzy;
GRANT EXECUTE ON dbo.WypozyczenieUsluga_Usun TO Administratorzy;
GRANT EXECUTE ON dbo.WypozyczenieUsluga_Wstaw TO Administratorzy;
GO

------------------------------------------------------------------------------------------------
-- Uprawnienia roli bazodanowej "PracownicyAdm".
------------------------------------------------------------------------------------------------

-- Zabronienie bezpoœredniego dostêpu do tabel.
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Kategoria TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Klient TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.KlientUprawnienia TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Marka TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Model TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Platnosc TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Pracownik TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Samochod TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Ubezpieczenie TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Uprawnienia TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Usluga TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Wypozyczenie TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.WypozyczenieUsluga TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Kategoria_CenaHistoria TO PracownicyAdm;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Pracownik_Kopia TO PracownicyAdm;
GO

-- Przyznanie uprawnieñ do uruchamiania procedur przechowywanych.
DENY EXECUTE ON dbo.Kategoria_Modyfikuj TO PracownicyAdm;
DENY EXECUTE ON dbo.Kategoria_Usun TO PracownicyAdm;
DENY EXECUTE ON dbo.Kategoria_Wstaw TO PracownicyAdm;
DENY EXECUTE ON dbo.Kategoria_ZmienCene TO PracownicyAdm;
GRANT EXECUTE ON dbo.Kategoria_Znajdz_Cena TO PracownicyAdm;
DENY EXECUTE ON dbo.Klienci_Wypozyczenia TO PracownicyAdm;
DENY EXECUTE ON dbo.Klient_CenaWypozyczenia TO PracownicyAdm;
DENY EXECUTE ON dbo.Klient_Miejscowosci TO PracownicyAdm;
DENY EXECUTE ON dbo.Klient_Modyfikuj TO PracownicyAdm;
GRANT EXECUTE ON dbo.Klient_Szukaj TO PracownicyAdm;
DENY EXECUTE ON dbo.Klient_Usun TO PracownicyAdm;
DENY EXECUTE ON dbo.Klient_Wstaw TO PracownicyAdm;
GRANT EXECUTE ON dbo.Klient_Znajdz_Nazwisko TO PracownicyAdm;
GRANT EXECUTE ON dbo.Klient_Znajdz_Wzorzec TO PracownicyAdm;
DENY EXECUTE ON dbo.KlientUprawnienia_Modyfikuj TO PracownicyAdm;
DENY EXECUTE ON dbo.KlientUprawnienia_Usun TO PracownicyAdm;
DENY EXECUTE ON dbo.KlientUprawnienia_Wstaw TO PracownicyAdm;
DENY EXECUTE ON dbo.Marka_Modyfikuj TO PracownicyAdm;
DENY EXECUTE ON dbo.Marka_Usun TO PracownicyAdm;
DENY EXECUTE ON dbo.Marka_Wstaw TO PracownicyAdm;
DENY EXECUTE ON dbo.Marki_Popularnosc TO PracownicyAdm;
DENY EXECUTE ON dbo.Model_Modyfikuj TO PracownicyAdm;
DENY EXECUTE ON dbo.Model_Usun TO PracownicyAdm;
DENY EXECUTE ON dbo.Model_Wstaw TO PracownicyAdm;
DENY EXECUTE ON dbo.Platnosc_Modyfikuj TO PracownicyAdm;
DENY EXECUTE ON dbo.Platnosc_Usun TO PracownicyAdm;
DENY EXECUTE ON dbo.Platnosc_Wstaw TO PracownicyAdm;
GRANT EXECUTE ON dbo.Pracownicy_Ranking TO PracownicyAdm;
GRANT EXECUTE ON dbo.Pracownik_Archiwizuj TO PracownicyAdm;
GRANT EXECUTE ON dbo.Pracownik_Modyfikuj TO PracownicyAdm;
GRANT EXECUTE ON dbo.Pracownik_Usun TO PracownicyAdm;
GRANT EXECUTE ON dbo.Pracownik_Wstaw TO PracownicyAdm;
GRANT EXECUTE ON dbo.Pracownik_Znajdz_Id TO PracownicyAdm;
GRANT EXECUTE ON dbo.Pracownik_Znajdz_Nazwisko TO PracownicyAdm;
GRANT EXECUTE ON dbo.Samochod_Dostepnosc TO PracownicyAdm;
DENY EXECUTE ON dbo.Samochod_Modyfikuj TO PracownicyAdm;
DENY EXECUTE ON dbo.Samochod_Usun TO PracownicyAdm;
DENY EXECUTE ON dbo.Samochod_Wstaw TO PracownicyAdm;
DENY EXECUTE ON dbo.Samochod_Wstaw_Makro TO PracownicyAdm;
DENY EXECUTE ON dbo.Samochody_Marki TO PracownicyAdm;
DENY EXECUTE ON dbo.Ubezpieczenie_Modyfikuj TO PracownicyAdm;
DENY EXECUTE ON dbo.Ubezpieczenie_Usun TO PracownicyAdm;
DENY EXECUTE ON dbo.Ubezpieczenie_Wstaw TO PracownicyAdm;
DENY EXECUTE ON dbo.Uprawnienia_Modyfikuj TO PracownicyAdm;
DENY EXECUTE ON dbo.Uprawnienia_Usun TO PracownicyAdm;
DENY EXECUTE ON dbo.Uprawnienia_Wstaw TO PracownicyAdm;
DENY EXECUTE ON dbo.Usluga_Modyfikuj TO PracownicyAdm;
DENY EXECUTE ON dbo.Usluga_Niedodawane TO PracownicyAdm;
DENY EXECUTE ON dbo.Usluga_Usun TO PracownicyAdm;
DENY EXECUTE ON dbo.Usluga_Wstaw TO PracownicyAdm;
DENY EXECUTE ON dbo.Wypozyczenie_Aktualne TO PracownicyAdm;
DENY EXECUTE ON dbo.Wypozyczenie_Modyfikuj TO PracownicyAdm;
DENY EXECUTE ON dbo.Wypozyczenie_N_OstatnichDni TO PracownicyAdm;
DENY EXECUTE ON dbo.Wypozyczenie_Szukaj_Okres TO PracownicyAdm;
DENY EXECUTE ON dbo.Wypozyczenie_Usun TO PracownicyAdm;
DENY EXECUTE ON dbo.Wypozyczenie_Wstaw TO PracownicyAdm;
DENY EXECUTE ON dbo.Wypozyczenie_Zestawienie TO PracownicyAdm;
DENY EXECUTE ON dbo.Wypozyczenie_Znajdz_Daty TO PracownicyAdm;
DENY EXECUTE ON dbo.WypozyczenieUsluga_Modyfikuj TO PracownicyAdm;
DENY EXECUTE ON dbo.WypozyczenieUsluga_Usun TO PracownicyAdm;
DENY EXECUTE ON dbo.WypozyczenieUsluga_Wstaw TO PracownicyAdm;
GO

------------------------------------------------------------------------------------------------
-- Uprawnienia roli bazodanowej "Sprzedawcy".
------------------------------------------------------------------------------------------------

-- Zabronienie bezpoœredniego dostêpu do tabel.
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Kategoria TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Klient TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.KlientUprawnienia TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Marka TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Model TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Platnosc TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Pracownik TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Samochod TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Ubezpieczenie TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Uprawnienia TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Usluga TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Wypozyczenie TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.WypozyczenieUsluga TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Kategoria_CenaHistoria TO Sprzedawcy;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Pracownik_Kopia TO Sprzedawcy;
GO

-- Przyznanie uprawnieñ do uruchamiania procedur przechowywanych.
DENY EXECUTE ON dbo.Kategoria_Modyfikuj TO Sprzedawcy;
DENY EXECUTE ON dbo.Kategoria_Usun TO Sprzedawcy;
DENY EXECUTE ON dbo.Kategoria_Wstaw TO Sprzedawcy;
GRANT EXECUTE ON dbo.Kategoria_ZmienCene TO Sprzedawcy;
GRANT EXECUTE ON dbo.Kategoria_Znajdz_Cena TO Sprzedawcy;
GRANT EXECUTE ON dbo.Klienci_Wypozyczenia TO Sprzedawcy;
GRANT EXECUTE ON dbo.Klient_CenaWypozyczenia TO Sprzedawcy;
GRANT EXECUTE ON dbo.Klient_Miejscowosci TO Sprzedawcy;
GRANT EXECUTE ON dbo.Klient_Modyfikuj TO Sprzedawcy;
GRANT EXECUTE ON dbo.Klient_Szukaj TO Sprzedawcy;
GRANT EXECUTE ON dbo.Klient_Usun TO Sprzedawcy;
GRANT EXECUTE ON dbo.Klient_Wstaw TO Sprzedawcy;
GRANT EXECUTE ON dbo.Klient_Znajdz_Nazwisko TO Sprzedawcy;
GRANT EXECUTE ON dbo.Klient_Znajdz_Wzorzec TO Sprzedawcy;
GRANT EXECUTE ON dbo.KlientUprawnienia_Modyfikuj TO Sprzedawcy;
GRANT EXECUTE ON dbo.KlientUprawnienia_Usun TO Sprzedawcy;
GRANT EXECUTE ON dbo.KlientUprawnienia_Wstaw TO Sprzedawcy;
DENY EXECUTE ON dbo.Marka_Modyfikuj TO Sprzedawcy;
DENY EXECUTE ON dbo.Marka_Usun TO Sprzedawcy;
DENY EXECUTE ON dbo.Marka_Wstaw TO Sprzedawcy;
GRANT EXECUTE ON dbo.Marki_Popularnosc TO Sprzedawcy;
DENY EXECUTE ON dbo.Model_Modyfikuj TO Sprzedawcy;
DENY EXECUTE ON dbo.Model_Usun TO Sprzedawcy;
DENY EXECUTE ON dbo.Model_Wstaw TO Sprzedawcy;
DENY EXECUTE ON dbo.Platnosc_Modyfikuj TO Sprzedawcy;
DENY EXECUTE ON dbo.Platnosc_Usun TO Sprzedawcy;
DENY EXECUTE ON dbo.Platnosc_Wstaw TO Sprzedawcy;
DENY EXECUTE ON dbo.Pracownicy_Ranking TO Sprzedawcy;
DENY EXECUTE ON dbo.Pracownik_Archiwizuj TO Sprzedawcy;
GRANT EXECUTE ON dbo.Pracownik_Modyfikuj TO Sprzedawcy; -- /!\ Wymagany kontekst u¿ycia.
DENY EXECUTE ON dbo.Pracownik_Usun TO Sprzedawcy;
DENY EXECUTE ON dbo.Pracownik_Wstaw TO Sprzedawcy;
GRANT EXECUTE ON dbo.Pracownik_Znajdz_Id TO Sprzedawcy; -- /!\ Wymagany kontekst u¿ycia
DENY EXECUTE ON dbo.Pracownik_Znajdz_Nazwisko TO Sprzedawcy;
GRANT EXECUTE ON dbo.Samochod_Dostepnosc TO Sprzedawcy;
GRANT EXECUTE ON dbo.Samochod_Modyfikuj TO Sprzedawcy;
DENY EXECUTE ON dbo.Samochod_Usun TO Sprzedawcy;
DENY EXECUTE ON dbo.Samochod_Wstaw TO Sprzedawcy;
DENY EXECUTE ON dbo.Samochod_Wstaw_Makro TO Sprzedawcy;
GRANT EXECUTE ON dbo.Samochody_Marki TO Sprzedawcy;
DENY EXECUTE ON dbo.Ubezpieczenie_Modyfikuj TO Sprzedawcy;
DENY EXECUTE ON dbo.Ubezpieczenie_Usun TO Sprzedawcy;
DENY EXECUTE ON dbo.Ubezpieczenie_Wstaw TO Sprzedawcy;
DENY EXECUTE ON dbo.Uprawnienia_Modyfikuj TO Sprzedawcy;
DENY EXECUTE ON dbo.Uprawnienia_Usun TO Sprzedawcy;
DENY EXECUTE ON dbo.Uprawnienia_Wstaw TO Sprzedawcy;
DENY EXECUTE ON dbo.Usluga_Modyfikuj TO Sprzedawcy;
GRANT EXECUTE ON dbo.Usluga_Niedodawane TO Sprzedawcy;
DENY EXECUTE ON dbo.Usluga_Usun TO Sprzedawcy;
DENY EXECUTE ON dbo.Usluga_Wstaw TO Sprzedawcy;
GRANT EXECUTE ON dbo.Wypozyczenie_Aktualne TO Sprzedawcy;
GRANT EXECUTE ON dbo.Wypozyczenie_Modyfikuj TO Sprzedawcy;
GRANT EXECUTE ON dbo.Wypozyczenie_N_OstatnichDni TO Sprzedawcy;
GRANT EXECUTE ON dbo.Wypozyczenie_Szukaj_Okres TO Sprzedawcy;
GRANT EXECUTE ON dbo.Wypozyczenie_Usun TO Sprzedawcy;
GRANT EXECUTE ON dbo.Wypozyczenie_Wstaw TO Sprzedawcy;
GRANT EXECUTE ON dbo.Wypozyczenie_Zestawienie TO Sprzedawcy;
GRANT EXECUTE ON dbo.Wypozyczenie_Znajdz_Daty TO Sprzedawcy;
GRANT EXECUTE ON dbo.WypozyczenieUsluga_Modyfikuj TO Sprzedawcy;
GRANT EXECUTE ON dbo.WypozyczenieUsluga_Usun TO Sprzedawcy;
GRANT EXECUTE ON dbo.WypozyczenieUsluga_Wstaw TO Sprzedawcy;
GO

------------------------------------------------------------------------------------------------
-- Uprawnienia roli bazodanowej "Klienci".
------------------------------------------------------------------------------------------------

-- Zabronienie bezpoœredniego dostêpu do tabel.
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Kategoria TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Klient TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.KlientUprawnienia TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Marka TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Model TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Platnosc TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Pracownik TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Samochod TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Ubezpieczenie TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Uprawnienia TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Usluga TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Wypozyczenie TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.WypozyczenieUsluga TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Kategoria_CenaHistoria TO Klienci;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Pracownik_Kopia TO Klienci;
GO

-- Przyznanie uprawnieñ do uruchamiania procedur przechowywanych.
DENY EXECUTE ON dbo.Kategoria_Modyfikuj TO Klienci;
DENY EXECUTE ON dbo.Kategoria_Usun TO Klienci;
DENY EXECUTE ON dbo.Kategoria_Wstaw TO Klienci;
DENY EXECUTE ON dbo.Kategoria_ZmienCene TO Klienci;
GRANT EXECUTE ON dbo.Kategoria_Znajdz_Cena TO Klienci;
DENY EXECUTE ON dbo.Klienci_Wypozyczenia TO Klienci;
DENY EXECUTE ON dbo.Klient_CenaWypozyczenia TO Klienci;
DENY EXECUTE ON dbo.Klient_Miejscowosci TO Klienci;
GRANT EXECUTE ON dbo.Klient_Modyfikuj TO Klienci; -- /!\ Wymagany kontekst u¿ycia.
DENY EXECUTE ON dbo.Klient_Szukaj TO Klienci;
GRANT EXECUTE ON dbo.Klient_Usun TO Klienci; -- /!\ Wymagany kontekst u¿ycia.
DENY EXECUTE ON dbo.Klient_Wstaw TO Klienci;
DENY EXECUTE ON dbo.Klient_Znajdz_Nazwisko TO Klienci;
DENY EXECUTE ON dbo.Klient_Znajdz_Wzorzec TO Klienci;
GRANT EXECUTE ON dbo.KlientUprawnienia_Modyfikuj TO Klienci;
DENY EXECUTE ON dbo.KlientUprawnienia_Usun TO Klienci;
GRANT EXECUTE ON dbo.KlientUprawnienia_Wstaw TO Klienci;
DENY EXECUTE ON dbo.Marka_Modyfikuj TO Klienci;
DENY EXECUTE ON dbo.Marka_Usun TO Klienci;
DENY EXECUTE ON dbo.Marka_Wstaw TO Klienci;
DENY EXECUTE ON dbo.Marki_Popularnosc TO Klienci;
DENY EXECUTE ON dbo.Model_Modyfikuj TO Klienci;
DENY EXECUTE ON dbo.Model_Usun TO Klienci;
DENY EXECUTE ON dbo.Model_Wstaw TO Klienci;
DENY EXECUTE ON dbo.Platnosc_Modyfikuj TO Klienci;
DENY EXECUTE ON dbo.Platnosc_Usun TO Klienci;
DENY EXECUTE ON dbo.Platnosc_Wstaw TO Klienci;
DENY EXECUTE ON dbo.Pracownicy_Ranking TO Klienci;
DENY EXECUTE ON dbo.Pracownik_Archiwizuj TO Klienci;
DENY EXECUTE ON dbo.Pracownik_Modyfikuj TO Klienci;
DENY EXECUTE ON dbo.Pracownik_Usun TO Klienci;
DENY EXECUTE ON dbo.Pracownik_Wstaw TO Klienci;
DENY EXECUTE ON dbo.Pracownik_Znajdz_Id TO Klienci;
DENY EXECUTE ON dbo.Pracownik_Znajdz_Nazwisko TO Klienci;
GRANT EXECUTE ON dbo.Samochod_Dostepnosc TO Klienci;
DENY EXECUTE ON dbo.Samochod_Modyfikuj TO Klienci;
DENY EXECUTE ON dbo.Samochod_Usun TO Klienci;
DENY EXECUTE ON dbo.Samochod_Wstaw TO Klienci;
DENY EXECUTE ON dbo.Samochod_Wstaw_Makro TO Klienci;
DENY EXECUTE ON dbo.Samochody_Marki TO Klienci;
DENY EXECUTE ON dbo.Ubezpieczenie_Modyfikuj TO Klienci;
DENY EXECUTE ON dbo.Ubezpieczenie_Usun TO Klienci;
DENY EXECUTE ON dbo.Ubezpieczenie_Wstaw TO Klienci;
DENY EXECUTE ON dbo.Uprawnienia_Modyfikuj TO Klienci;
DENY EXECUTE ON dbo.Uprawnienia_Usun TO Klienci;
DENY EXECUTE ON dbo.Uprawnienia_Wstaw TO Klienci;
DENY EXECUTE ON dbo.Usluga_Modyfikuj TO Klienci;
DENY EXECUTE ON dbo.Usluga_Niedodawane TO Klienci;
DENY EXECUTE ON dbo.Usluga_Usun TO Klienci;
DENY EXECUTE ON dbo.Usluga_Wstaw TO Klienci;
DENY EXECUTE ON dbo.Wypozyczenie_Aktualne TO Klienci;
GRANT EXECUTE ON dbo.Wypozyczenie_Modyfikuj TO Klienci; -- /!\ Wymagany kontekst u¿ycia.
DENY EXECUTE ON dbo.Wypozyczenie_N_OstatnichDni TO Klienci;
DENY EXECUTE ON dbo.Wypozyczenie_Szukaj_Okres TO Klienci;
DENY EXECUTE ON dbo.Wypozyczenie_Usun TO Klienci;
GRANT EXECUTE ON dbo.Wypozyczenie_Wstaw TO Klienci; -- /!\ Wymagany kontekst u¿ycia.
DENY EXECUTE ON dbo.Wypozyczenie_Zestawienie TO Klienci;
DENY EXECUTE ON dbo.Wypozyczenie_Znajdz_Daty TO Klienci;
GRANT EXECUTE ON dbo.WypozyczenieUsluga_Modyfikuj TO Klienci; -- /!\ Wymagany kontekst u¿ycia.
DENY EXECUTE ON dbo.WypozyczenieUsluga_Usun TO Klienci;
GRANT EXECUTE ON dbo.WypozyczenieUsluga_Wstaw TO Klienci; -- /!\ Wymagany kontekst u¿ycia.
GO

------------------------------------------------------------------------------------------------
-- Uprawnienia roli bazodanowej "Goscie".
------------------------------------------------------------------------------------------------

-- Zabronienie bezpoœredniego dostêpu do tabel.
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Kategoria TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Klient TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.KlientUprawnienia TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Marka TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Model TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Platnosc TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Pracownik TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Samochod TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Ubezpieczenie TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Uprawnienia TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Usluga TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Wypozyczenie TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.WypozyczenieUsluga TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Kategoria_CenaHistoria TO Goscie;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Pracownik_Kopia TO Goscie;
GO

-- Przyznanie uprawnieñ do uruchamiania procedur przechowywanych.
DENY EXECUTE ON dbo.Kategoria_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.Kategoria_Usun TO Goscie;
DENY EXECUTE ON dbo.Kategoria_Wstaw TO Goscie;
DENY EXECUTE ON dbo.Kategoria_ZmienCene TO Goscie;
GRANT EXECUTE ON dbo.Kategoria_Znajdz_Cena TO Goscie;
DENY EXECUTE ON dbo.Klienci_Wypozyczenia TO Goscie;
DENY EXECUTE ON dbo.Klient_CenaWypozyczenia TO Goscie;
DENY EXECUTE ON dbo.Klient_Miejscowosci TO Goscie;
DENY EXECUTE ON dbo.Klient_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.Klient_Szukaj TO Goscie;
DENY EXECUTE ON dbo.Klient_Usun TO Goscie;
GRANT EXECUTE ON dbo.Klient_Wstaw TO Goscie; -- /!\ Wymagany kontekst u¿ycia.
DENY EXECUTE ON dbo.Klient_Znajdz_Nazwisko TO Goscie;
DENY EXECUTE ON dbo.Klient_Znajdz_Wzorzec TO Goscie;
DENY EXECUTE ON dbo.KlientUprawnienia_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.KlientUprawnienia_Usun TO Goscie;
DENY EXECUTE ON dbo.KlientUprawnienia_Wstaw TO Goscie;
DENY EXECUTE ON dbo.Marka_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.Marka_Usun TO Goscie;
DENY EXECUTE ON dbo.Marka_Wstaw TO Goscie;
DENY EXECUTE ON dbo.Marki_Popularnosc TO Goscie;
DENY EXECUTE ON dbo.Model_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.Model_Usun TO Goscie;
DENY EXECUTE ON dbo.Model_Wstaw TO Goscie;
DENY EXECUTE ON dbo.Platnosc_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.Platnosc_Usun TO Goscie;
DENY EXECUTE ON dbo.Platnosc_Wstaw TO Goscie;
DENY EXECUTE ON dbo.Pracownicy_Ranking TO Goscie;
DENY EXECUTE ON dbo.Pracownik_Archiwizuj TO Goscie;
DENY EXECUTE ON dbo.Pracownik_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.Pracownik_Usun TO Goscie;
DENY EXECUTE ON dbo.Pracownik_Wstaw TO Goscie;
DENY EXECUTE ON dbo.Pracownik_Znajdz_Id TO Goscie;
DENY EXECUTE ON dbo.Pracownik_Znajdz_Nazwisko TO Goscie;
GRANT EXECUTE ON dbo.Samochod_Dostepnosc TO Goscie;
DENY EXECUTE ON dbo.Samochod_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.Samochod_Usun TO Goscie;
DENY EXECUTE ON dbo.Samochod_Wstaw TO Goscie;
DENY EXECUTE ON dbo.Samochod_Wstaw_Makro TO Goscie;
DENY EXECUTE ON dbo.Samochody_Marki TO Goscie;
DENY EXECUTE ON dbo.Ubezpieczenie_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.Ubezpieczenie_Usun TO Goscie;
DENY EXECUTE ON dbo.Ubezpieczenie_Wstaw TO Goscie;
DENY EXECUTE ON dbo.Uprawnienia_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.Uprawnienia_Usun TO Goscie;
DENY EXECUTE ON dbo.Uprawnienia_Wstaw TO Goscie;
DENY EXECUTE ON dbo.Usluga_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.Usluga_Niedodawane TO Goscie;
DENY EXECUTE ON dbo.Usluga_Usun TO Goscie;
DENY EXECUTE ON dbo.Usluga_Wstaw TO Goscie;
DENY EXECUTE ON dbo.Wypozyczenie_Aktualne TO Goscie;
DENY EXECUTE ON dbo.Wypozyczenie_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.Wypozyczenie_N_OstatnichDni TO Goscie;
DENY EXECUTE ON dbo.Wypozyczenie_Szukaj_Okres TO Goscie;
DENY EXECUTE ON dbo.Wypozyczenie_Usun TO Goscie;
DENY EXECUTE ON dbo.Wypozyczenie_Wstaw TO Goscie;
DENY EXECUTE ON dbo.Wypozyczenie_Zestawienie TO Goscie;
DENY EXECUTE ON dbo.Wypozyczenie_Znajdz_Daty TO Goscie;
DENY EXECUTE ON dbo.WypozyczenieUsluga_Modyfikuj TO Goscie;
DENY EXECUTE ON dbo.WypozyczenieUsluga_Usun TO Goscie;
DENY EXECUTE ON dbo.WypozyczenieUsluga_Wstaw TO Goscie;
GO

------------------------------------------------------------------------------------------------
-- Koniec.
------------------------------------------------------------------------------------------------