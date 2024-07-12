---------------------------------------------------------------------------------------------------------------------------
-- SRBD_C5: zapytania rozproszone i transakcje 2PC.
---------------------------------------------------------------------------------------------------------------------------
-- Dokumentacja testowania
---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- Zad.2a. Utworzenie s�ownika oddzia��w firmy.
---------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM dbo.Oddzial;
GO

/*
IdOddzial   OddzialNazwa                                       OddzialMiasto                                      SerwerNazwa                                                                                          OddzialOpis                                                                                          OddzialLokalny
----------- -------------------------------------------------- -------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- --------------
1           centrala                                           Kalisz                                             SQL1                                                                                                 centrala                                                                                             1
2           sklep                                              Krak�w                                             SQL2                                                                                                 sklep                                                                                                0
3           sklep i serwis                                     Warszawa                                           SQL3                                                                                                 sklep i serwis                                                                                       0

(3 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- Identyfikatory oddzia��wdodane s�do tabel [Klient] oraz [Pracownik] jako klucze obce wskazuj�ce na tabel� [Oddzial].
---------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM dbo.Klient;
GO

SELECT *
FROM dbo.Pracownik;
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         �wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             1
2           Micha�               Mietczy�ski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             1
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             1
4           Adam                 Kula                                     NULL                                     Pruszk�w                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             1
5           Zuzanna              Paj�k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             1
6           Konrad               Rusek                                    NULL                                     Ostr�w Wielkopolski            Kaliska                                            1          3          63-400      Ostr�w Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             1
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             1
8           Robert               Kowalski                                 Przedsi�biorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             1
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             1
10          Marcin               Stefaniak                                NULL                                     Warsz�wka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             1

(10 rows affected)

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail                      IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------ -----------
1           Pawe�                Malczy�ski                               W�a�ciciel                               +48 589 593 943 p_malczynski1@gmail.com        1
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl            1
3           Micha�               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com          1
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl                 1
5           Anna                 �awniczak                                Dzia� marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com       1
6           Amadeusz             Kaczy�ski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl              1
7           Jolanta              Kaczmarek                                Inspektor pojazd�w                       +48 593 993 732 jolana.kaczmarek@gmail.com     1
8           Miros�aw             Steczy�ski                               Specjalista ds. obs�ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl    1
9           Klaudia              Kuku�ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com      1
10          Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl             1

(10 rows affected)
*/

SELECT *
FROM LS_SQL2.S19_P3.dbo.Klient;
GO

SELECT *
FROM LS_SQL2.S19_P3.dbo.Pracownik;
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Andrzej              Michalak                                 NULL                                     Ostr�w Wielkopolski            �wirki i Wigury                                    22         NULL       63-400      Ostr�w Wielkopolski                                +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             2
2           Micha�               Mietczy�ski                              NULL                                     Ostr�w Wielkopolski            Konopnicka                                         12         NULL       63-400      Ostr�w Wielkopolski                                +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             2
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             2
4           Adam                 Kula                                     NULL                                     Ostr�w Wielkopolski            NULL                                               32         NULL       63-400      Ostr�w Wielkopolski                                +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             2
5           Zuzanna              Paj�k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             2
6           Konrad               Rusek                                    NULL                                     Ostr�w Wielkopolski            Kaliska                                            1          3          63-400      Ostr�w Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             2
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             2
8           Robert               Kowalski                                 Przedsi�biorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             2
9           Marcin               Borysiuk                                 NULL                                     Ostr�w Wielkopolski            Przechodnia                                        3          6          63-400      Ostr�w Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             2
10          Marcin               Stefaniak                                NULL                                     Ostr�w Wielkopolski            NULL                                               10         NULL       63-400      Ostr�w Wielkopolski                                +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             2

(10 rows affected)

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail                      IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------ -----------
1           Pawe�                Malczy�ski                               W�a�ciciel                               +48 589 593 943 p_malczynski1@gmail.com        2
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl            2
3           Micha�               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com          2
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl                 2
5           Anna                 �awniczak                                Dzia� marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com       2
6           Amadeusz             Kaczy�ski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl              2
7           Jolanta              Kaczmarek                                Inspektor pojazd�w                       +48 593 993 732 jolana.kaczmarek@gmail.com     2
8           Miros�aw             Steczy�ski                               Specjalista ds. obs�ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl    2
9           Klaudia              Kuku�ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com      2
10          Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl             2

(10 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- Zad.3. Zapytania rozproszone.
---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- (ZR1a) Wszyscy pracownicy zatrudnieni w dw�ch oddzia�ach firmy. (Suma wierszyz dw�ch tabel bez powt�rze� - operator UNION.)
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Pracownicy_Wszyscy_RBD;
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl
7           Jola                 Kaczmarek                                Inspektor pojazd�w                       +48 593 993 732 jolana.kaczmarek@gmail.com
7           Jolanta              Kaczmarek                                Inspektor pojazd�w                       +48 593 993 732 jolana.kaczmarek@gmail.com
6           Amadeusz             Kaczy�ski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl
3           Micha�               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com
9           Klaudia              Kuku�a                                   Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
9           Klaudia              Kuku�ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
5           Anna                 �awniczak                                Dzia� marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl
1           Pawe�                Malczy�ski                               W�a�ciciel                               +48 589 593 943 p_malczynski1@gmail.com
8           Mirek                Steczy�ski                               Specjalista ds. obs�ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl
8           Miros�aw             Steczy�ski                               Specjalista ds. obs�ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl
10          Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl

(13 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR1b) Wszyscy pracownicy z dw�ch oddzia��w firmy ze wskazaniem oddzia�u, w kt�rym s� zatrudnieni. (Suma wierszy z dw�ch 
--	      tabel z powt�rzeniami - operator UNION ALL. Z��czenia z tabel� s�ownikaoddzia��w w celu ustalenia lokalizacji wierszy.)
---------------------------------------------------------------------------------------------------------------------------
-- W z��czeniach zdalnych konieczne jest u�ycie alias�w zamiast 4-cz�onowych nazw obiekt�wna serwerze po��czonym, poniewa�
-- niedopuszczalne by�oby odw�anie do kolumn tabel poprzez nazwy 5-cz�onowe.
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Pracownicy_Wszyscy_Oddzialy_RBD;
GO

/*
Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail                      OddzialMiasto
-------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------ --------------------------------------------------
Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl            Kalisz
Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl            Krak�w
Jola                 Kaczmarek                                Inspektor pojazd�w                       +48 593 993 732 jolana.kaczmarek@gmail.com     Kalisz
Jolanta              Kaczmarek                                Inspektor pojazd�w                       +48 593 993 732 jolana.kaczmarek@gmail.com     Krak�w
Amadeusz             Kaczy�ski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl              Kalisz
Amadeusz             Kaczy�ski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl              Krak�w
Micha�               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com          Kalisz
Micha�               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com          Krak�w
Klaudia              Kuku�a                                   Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com      Kalisz
Klaudia              Kuku�ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com      Krak�w
Anna                 �awniczak                                Dzia� marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com       Kalisz
Anna                 �awniczak                                Dzia� marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com       Krak�w
Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl                 Kalisz
Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl                 Krak�w
Pawe�                Malczy�ski                               W�a�ciciel                               +48 589 593 943 p_malczynski1@gmail.com        Kalisz
Pawe�                Malczy�ski                               W�a�ciciel                               +48 589 593 943 p_malczynski1@gmail.com        Krak�w
Mirek                Steczy�ski                               Specjalista ds. obs�ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl    Kalisz
Miros�aw             Steczy�ski                               Specjalista ds. obs�ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl    Krak�w
Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl             Kalisz
Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl             Krak�w

(20 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR2) Pracownicy zatrudnieni jednocze�nie w dw�ch oddzia�ach firmy. (Przekr�j, cz�� wsp�lna dw�ch tabel - operator INSERECT).
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Pracownicy_Wspolni_RBD;
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl
6           Amadeusz             Kaczy�ski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl
3           Micha�               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com
5           Anna                 �awniczak                                Dzia� marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl
1           Pawe�                Malczy�ski                               W�a�ciciel                               +48 589 593 943 p_malczynski1@gmail.com
10          Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl

(7 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR3a) Pracownicy zatrudnieni tylko w lokalnym oddziale firmy. (R�nica dw�ch tabel - operator EXCEPT.)
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Pracownicy_Lokalni_RBD;
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
7           Jola                 Kaczmarek                                Inspektor pojazd�w                       +48 593 993 732 jolana.kaczmarek@gmail.com
9           Klaudia              Kuku�a                                   Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
8           Mirek                Steczy�ski                               Specjalista ds. obs�ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl

(3 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR3b) Pracownicy zatrudnieni tylko w zdalnym oddziale firmy. (R�nica dw�ch tabel - operator EXCEPT.)
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Pracownicy_Zdalni_RBD;
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
7           Jolanta              Kaczmarek                                Inspektor pojazd�w                       +48 593 993 732 jolana.kaczmarek@gmail.com
9           Klaudia              Kuku�ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
8           Miros�aw             Steczy�ski                               Specjalista ds. obs�ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl

(3 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR4a) Wyszukiwanie klient�w zarejestrowanych w dw�ch oddzia�ach firmy - wzgl�dem wzorca znakowego w nazwiksu.
--	      (Suma wierszy z powt�rzeniami - operator UNION ALL.)
---------------------------------------------------------------------------------------------------------------------------
-- Lokalizacja wierszy ustalana jest przy u�yciu kolumny wirtualnej "Oddzia�". Jest to rozwi�zanie proste, ale ma�o elastyczne
-- - przeniesienie tej procedury na inny serwer wymaga modyfikacji kodu.
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Klient_Znajdz_RBD
@Par_Nazwisko = '';
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    AdresMail                      Oddzial
----------- -------------------- ---------------------------------------- ------------------------------ ------------------------------ -------
9           Marcin               Borysiuk                                 Ostr�w Wielkopolski            m.borysiuk56@gmail.com         Krak�w
7           Jan                  Kowalski                                 Kalisz                         jan.kowalski@pwk.com.pl        Krak�w
7           Konrad               Kowalski                                 Kalisz                         jan.kowalski@pwk.com.pl        Kalisz
8           Robert               Kowalski                                 Konin                          robert.kolanski@onet.pl        Kalisz
8           Robert               Kowalski                                 Konin                          robert.kolanski@onet.pl        Krak�w
4           Adam                 Kula                                     Pruszk�w                       adam.kula@onet.pl              Kalisz
4           Adam                 Kula                                     Ostr�w Wielkopolski            adam.kula@onet.pl              Krak�w
9           Marcin               Marciniak                                Kalisz                         m.borysiuk56@gmail.com         Kalisz
1           Andrzej              Michalak                                 Kalisz                         andrzej.marciniak@gmail.com    Kalisz
1           Andrzej              Michalak                                 Ostr�w Wielkopolski            andrzej.marciniak@gmail.com    Krak�w
3           Aleksandra           Michalik                                 Kalisz                         aleksandra.michalik@gmail.com  Krak�w
3           Ola                  Michalik                                 Kalisz                         aleksandra.michalik@gmail.com  Kalisz
2           Micha�               Mietczy�ski                              Kalisz                         michal.mietczynski@wp.pl       Kalisz
2           Micha�               Mietczy�ski                              Ostr�w Wielkopolski            michal.mietczynski@wp.pl       Krak�w
5           Zuzanna              Paj�k                                    Konin                          z_pajak@firma.pl               Kalisz
5           Zuzanna              Paj�k                                    Konin                          z_pajak@firma.pl               Krak�w
6           Konrad               Rusek                                    Ostr�w Wielkopolski            konrad.rusek99@firma.pl        Kalisz
6           Konrad               Rusek                                    Ostr�w Wielkopolski            konrad.rusek99@firma.pl        Krak�w
10          Marcin               Stefaniak                                Warsz�wka                      m.stefaniak123@wp.pl           Kalisz
10          Marcin               Stefaniak                                Ostr�w Wielkopolski            m.stefaniak123@wp.pl           Krak�w

(20 rows affected)
*/

EXECUTE dbo.Klient_Znajdz_RBD
@Par_Nazwisko = '   n   ';
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    AdresMail                      Oddzial
----------- -------------------- ---------------------------------------- ------------------------------ ------------------------------ -------
9           Marcin               Marciniak                                Kalisz                         m.borysiuk56@gmail.com         Kalisz
10          Marcin               Stefaniak                                Warsz�wka                      m.stefaniak123@wp.pl           Kalisz
10          Marcin               Stefaniak                                Ostr�w Wielkopolski            m.stefaniak123@wp.pl           Krak�w

(3 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR4a) Wyszukiwanie klient�w zarejestrowanych w dw�ch oddzia�ach firmy - wzgl�dem wzorca znakowego w nazwiksu.
--	      (Suma wierszy z powt�rzeniami - operator UNION ALL.)
---------------------------------------------------------------------------------------------------------------------------
-- Lokalizacja wierszy ustalana jest poprzez z��czenie ze s�ownikiem oddzia��w [Oddzial].
-- Jest to rozwi�zanie elastyczne, poniewa� przy odpowiedniej konfiguracji serwer�w bazy rozproszonej mo�na u�y� tej
-- procedury w wielu oddzia�ach bez modyfikacji kodu.
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Klient_Znajdz_Oddzialy_RBD
@Par_Nazwisko = '';
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    AdresMail                      Lokalizacja
----------- -------------------- ---------------------------------------- ------------------------------ ------------------------------ -----------------------------------------------------------------------------------------------------
9           Marcin               Borysiuk                                 Ostr�w Wielkopolski            m.borysiuk56@gmail.com         sklep Krak�w
7           Jan                  Kowalski                                 Kalisz                         jan.kowalski@pwk.com.pl        sklep Krak�w
7           Konrad               Kowalski                                 Kalisz                         jan.kowalski@pwk.com.pl        centrala Kalisz
8           Robert               Kowalski                                 Konin                          robert.kolanski@onet.pl        centrala Kalisz
8           Robert               Kowalski                                 Konin                          robert.kolanski@onet.pl        sklep Krak�w
4           Adam                 Kula                                     Pruszk�w                       adam.kula@onet.pl              centrala Kalisz
4           Adam                 Kula                                     Ostr�w Wielkopolski            adam.kula@onet.pl              sklep Krak�w
9           Marcin               Marciniak                                Kalisz                         m.borysiuk56@gmail.com         centrala Kalisz
1           Andrzej              Michalak                                 Kalisz                         andrzej.marciniak@gmail.com    centrala Kalisz
1           Andrzej              Michalak                                 Ostr�w Wielkopolski            andrzej.marciniak@gmail.com    sklep Krak�w
3           Aleksandra           Michalik                                 Kalisz                         aleksandra.michalik@gmail.com  sklep Krak�w
3           Ola                  Michalik                                 Kalisz                         aleksandra.michalik@gmail.com  centrala Kalisz
2           Micha�               Mietczy�ski                              Kalisz                         michal.mietczynski@wp.pl       centrala Kalisz
2           Micha�               Mietczy�ski                              Ostr�w Wielkopolski            michal.mietczynski@wp.pl       sklep Krak�w
5           Zuzanna              Paj�k                                    Konin                          z_pajak@firma.pl               centrala Kalisz
5           Zuzanna              Paj�k                                    Konin                          z_pajak@firma.pl               sklep Krak�w
6           Konrad               Rusek                                    Ostr�w Wielkopolski            konrad.rusek99@firma.pl        centrala Kalisz
6           Konrad               Rusek                                    Ostr�w Wielkopolski            konrad.rusek99@firma.pl        sklep Krak�w
10          Marcin               Stefaniak                                Warsz�wka                      m.stefaniak123@wp.pl           centrala Kalisz
10          Marcin               Stefaniak                                Ostr�w Wielkopolski            m.stefaniak123@wp.pl           sklep Krak�w

(20 rows affected)
*/

EXECUTE dbo.Klient_Znajdz_Oddzialy_RBD
@Par_Nazwisko = '   n   ';
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    AdresMail                      Lokalizacja
----------- -------------------- ---------------------------------------- ------------------------------ ------------------------------ -----------------------------------------------------------------------------------------------------
9           Marcin               Marciniak                                Kalisz                         m.borysiuk56@gmail.com         centrala Kalisz
10          Marcin               Stefaniak                                Warsz�wka                      m.stefaniak123@wp.pl           centrala Kalisz
10          Marcin               Stefaniak                                Ostr�w Wielkopolski            m.stefaniak123@wp.pl           sklep Krak�w

(3 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR5) �ledzenie dost�pno�ci samochod�w w oddzia�ach. Zwracane s� dane wybranego samochodu lub samochod�w (domy�lnie). 
--		 (Suma tabel z powt�rzeniami - operator UNION ALL.)
---------------------------------------------------------------------------------------------------------------------------
-- Procedura zosta�a sparametryzowana w taki spos�b, aby mo�na by�o j� wdro�y� w ka�dym oddziale bazyrozproszonej - bez
-- wi�kszych modyfikacji kodu.
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Samochod_Dostepnosc_RBD
@Par_IdSamochod = NULL,
@Par_IdOddzialLokalny = 1,
@Par_IdOddzialZdalny = 2;
GO

/*
IdSamochod  Kategoria            Marka                Model                Rocznik     OddzialFirmy                                       Dostepnosc
----------- -------------------- -------------------- -------------------- ----------- -------------------------------------------------- ----------
2           Sportowe             Porsche              911                  2020        Kalisz                                             0
2           Sportowe             Porsche              911                  2020        Krak�w                                             0
6           Premium              Audi                 A4                   2022        Kalisz                                             1
6           Premium              Audi                 A4                   2022        Krak�w                                             0
5           Performance          Lamborghini          Aventador            2023        Kalisz                                             0
5           Performance          Lamborghini          Aventador            2023        Krak�w                                             0
4           Super Luxury         Rolls-Royce          Cullinan             2023        Kalisz                                             1
4           Super Luxury         Rolls-Royce          Cullinan             2023        Krak�w                                             1
3           Rodzinna             Ford                 Mondeo               2017        Kalisz                                             1
7           Rodzinna             Ford                 Mondeo               2018        Kalisz                                             0
3           Rodzinna             Ford                 Mondeo               2017        Krak�w                                             1
7           Rodzinna             Ford                 Mondeo               2018        Krak�w                                             1
8           SUV/Terenowe         Audi                 Q3                   2017        Kalisz                                             0
8           SUV/Terenowe         Audi                 Q3                   2017        Krak�w                                             1
9           Premium              BMW                  Seria 7              2022        Kalisz                                             0
10          Sportowe             BMW                  Seria 7              2022        Kalisz                                             0
1           Premium              BMW                  Seria 7              2021        Kalisz                                             1
1           Premium              BMW                  Seria 7              2021        Krak�w                                             1
9           Premium              BMW                  Seria 7              2022        Krak�w                                             0
10          Sportowe             BMW                  Seria 7              2022        Krak�w                                             0

(20 rows affected)
*/

EXECUTE dbo.Samochod_Dostepnosc_RBD
@Par_IdSamochod = 5,
@Par_IdOddzialLokalny = 1,
@Par_IdOddzialZdalny = 2
GO

/*
IdSamochod  Kategoria            Marka                Model                Rocznik     OddzialFirmy                                       Dostepnosc
----------- -------------------- -------------------- -------------------- ----------- -------------------------------------------------- ----------
5           Performance          Lamborghini          Aventador            2023        Kalisz                                             0
5           Performance          Lamborghini          Aventador            2023        Krak�w                                             0

(2 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR6a) Liczba i warto�� wypo�ycze� poszczeg�lnych klient�w realizowanych w dw�dz oddzia�ach firmy: SQL1 i SQL2.
--		  (Globalne zapytanie statystyczne z wykorzystaniem tabeli po�redniej.)
---------------------------------------------------------------------------------------------------------------------------
-- Zapytanie realizowane jest dwustopniowa: (1) najpierw z��czane i sumowane s� wiersze z obu serwer�w (tabela po�rednia -
-- zbi�r wierszy oznaczony aliasem "Wyp_RBD"), a nast�pnie (2) na tym zbiorze wykonywane jest grupowanie i agregowanie wierszy.
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Klienci_Wypozyczenia_RBD_TP;
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    LiczbaWyp   LacznaWartosc
----------- -------------------- ---------------------------------------- ------------------------------ ----------- ---------------------
3           Aleksandra           Michalik                                 Kalisz                         4           6050,00
3           Ola                  Michalik                                 Kalisz                         4           6050,00
1           Andrzej              Michalak                                 Kalisz                         2           1900,00
1           Andrzej              Michalak                                 Ostr�w Wielkopolski            2           1900,00
7           Jan                  Kowalski                                 Kalisz                         1           1000,00
7           Konrad               Kowalski                                 Kalisz                         1           1000,00
2           Micha�               Mietczy�ski                              Kalisz                         1           700,00
2           Micha�               Mietczy�ski                              Ostr�w Wielkopolski            1           700,00
9           Marcin               Borysiuk                                 Ostr�w Wielkopolski            1           300,00
9           Marcin               Marciniak                                Kalisz                         1           300,00
Warning: Null value is eliminated by an aggregate or other SET operation.

(10 rows affected)
*/

EXECUTE dbo.Klienci_Wypozyczenia_RBD_TP
@Par_DataOd = '2022-12-31',
@Par_DataDo = '2023-06-12',
@Par_MinWartosc = 500.00;
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    LiczbaWyp   LacznaWartosc
----------- -------------------- ---------------------------------------- ------------------------------ ----------- ---------------------
7           Jan                  Kowalski                                 Kalisz                         1           1000,00
7           Konrad               Kowalski                                 Kalisz                         1           1000,00
2           Micha�               Mietczy�ski                              Kalisz                         1           700,00
2           Micha�               Mietczy�ski                              Ostr�w Wielkopolski            1           700,00
Warning: Null value is eliminated by an aggregate or other SET operation.

(4 rows affected)
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

EXECUTE dbo.Klienci_Wypozyczenia_RBD_CTE;
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    LiczbaWyp   LacznaWartosc
----------- -------------------- ---------------------------------------- ------------------------------ ----------- ---------------------
3           Aleksandra           Michalik                                 Kalisz                         4           6050,00
3           Ola                  Michalik                                 Kalisz                         4           6050,00
1           Andrzej              Michalak                                 Kalisz                         2           1900,00
1           Andrzej              Michalak                                 Ostr�w Wielkopolski            2           1900,00
7           Jan                  Kowalski                                 Kalisz                         1           1000,00
7           Konrad               Kowalski                                 Kalisz                         1           1000,00
2           Micha�               Mietczy�ski                              Kalisz                         1           700,00
2           Micha�               Mietczy�ski                              Ostr�w Wielkopolski            1           700,00
9           Marcin               Borysiuk                                 Ostr�w Wielkopolski            1           300,00
9           Marcin               Marciniak                                Kalisz                         1           300,00
Warning: Null value is eliminated by an aggregate or other SET operation.

(10 rows affected)
*/

EXECUTE dbo.Klienci_Wypozyczenia_RBD_CTE
@Par_DataOd = '2022-12-31',
@Par_DataDo = '2023-06-12',
@Par_MinWartosc = 500.00;
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    LiczbaWyp   LacznaWartosc
----------- -------------------- ---------------------------------------- ------------------------------ ----------- ---------------------
7           Jan                  Kowalski                                 Kalisz                         1           1000,00
7           Konrad               Kowalski                                 Kalisz                         1           1000,00
2           Micha�               Mietczy�ski                              Kalisz                         1           700,00
2           Micha�               Mietczy�ski                              Ostr�w Wielkopolski            1           700,00
Warning: Null value is eliminated by an aggregate or other SET operation.

(4 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR7) Popularno�� samochod�w poszczeg�lnych marek w zadanym okresie - we wszystkich oddzia�ach firmy.
--		  (Globalne zapytanie statystycze z wykorzystaniem tabeli CTE.)
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Marki_Popularnosc_RBD_CTE;
GO

/*
Marka                LiczbaWyp   LacznaWartosc
-------------------- ----------- ---------------------
Porsche              8           2800,00
BMW                  6           1800,00
Lamborghini          2           1000,00
Ford                 4           360,00

(4 rows affected)
*/

EXECUTE dbo.Marki_Popularnosc_RBD_CTE
@Par_DataOd = '2022-12-31',
@Par_DataDo = '2023-06-12',
@Par_MinWartosc = 500.00;
GO

/*
Marka                LiczbaWyp   LacznaWartosc
-------------------- ----------- ---------------------
Porsche              6           2100,00
Lamborghini          2           1000,00
BMW                  2           600,00

(3 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR8) Popularno�� us�ug w zadanym okresie - we wszystkich oddzia�ach firmy.
--		  (Globalne zapytanie statystycze z wykorzystaniem tabeli CTE.)
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Uslugi_Popularnosc_RBD_CTE;
GO

/*
UslugaNazwa                    LiczbaWyp   LacznaWartosc
------------------------------ ----------- ---------------------
Pakiet refuel                  4           1800,00
Pakiet Weekendowy              4           800,00
Us�uga Przekraczania Granic    2           600,00
Pakiet clean                   8           400,00
Animal friendly                2           160,00

(5 rows affected)
*/

EXECUTE dbo.Uslugi_Popularnosc_RBD_CTE
@Par_DataOd = '2022-12-31',
@Par_DataDo = '2023-06-12',
@Par_MinWartosc = 500.00;
GO

/*
UslugaNazwa                    LiczbaWyp   LacznaWartosc
------------------------------ ----------- ---------------------
Pakiet refuel                  4           1800,00

(1 row affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (TR1) Aktualizacja danych us�ug na dw�ch serwerach.
---------------------------------------------------------------------------------------------------------------------------
-- Zgodnie z za�o�eniami projektowymi, dane samochod�w powinny by� synchronizowane w celu ujednolcenia oferty firmy we 
-- wszystkich oddzia�ach. Transakcj� t� nie jest jednak obj�te uzgadnianie dost�pno�ci samochod�w, kt�re mo�e by� r�ne
-- w poszczeg�lnych oddzia�ach.
---------------------------------------------------------------------------------------------------------------------------


SELECT *
FROM dbo.Samochod;
GO

SELECT *
FROM LS_SQL2.S19_P3.dbo.Samochod;
GO

-- Stan tabel przed wykonaniem transakcji.
/*
IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              1          5           2021        Diesel          BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              1          5           2021        Diesel          BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               1          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   1          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)
*/

EXECUTE dbo.Samochod_Zmien_RBD
@Par_IdSamochod = 1,
@Par_Kategoria = 'Premium', 
@Par_Model = 'Seria 7', 
@Par_IloscDrzwi = 5, 
@Par_Rocznik = 2023, 
@Par_TypSilnika = 'Benzya', 
@Par_InformacjeDodatkowe = 'BMW 740d xDrive';
GO

/*
(1 row affected)

(1 row affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              1          5           2023        Benzya          BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              1          5           2023        Benzya          BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               1          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   1          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (TR2) Kopiowanie danych klienta z bazy zdalnej do lokalnej.
---------------------------------------------------------------------------------------------------------------------------
-- Scenariusz: klient przychodzi do oddzia�u lokalnego i informuje, �e ju� wypo�ycza� samoch�d w innym oddziale naszej firmy
-- (nieanonimowo). Ewentualnie klient podaje swoje dane, a pracownik sprawdza czy nie zosta�y one ju� wprowadzone do systemu.
-- Je�eli tak, s� one kopiowane z oddzia�u zdalnego do bazy lokalnej.
---------------------------------------------------------------------------------------------------------------------------

/*
INSERT LS_SQL2.S19_P3.dbo.Klient
(IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi, IdOddzial)
VALUES
(11, 'Jakub', 'Jaworski', NULL, 'Krak�w', 'Jarz�binowa', '12a', NULL, '30-003', 'Krak�w', '+48 512 513 514', 'j.jarzabek@gmail.com', NULL, 2);
GO
*/

SELECT *
FROM dbo.Klient;
GO

SELECT *
FROM LS_SQL2.S19_P3.dbo.Klient;
GO

-- Klienci, kt�rych dane zapisane s� tylko w bazie zdalnej.
SELECT Imie, Nazwisko, AdresMail
FROM LS_SQL2.S19_P3.dbo.Klient
EXCEPT
SELECT Imie, Nazwisko, AdresMail
FROM dbo.Klient;
GO

/*
Imie                 Nazwisko                                 AdresMail
-------------------- ---------------------------------------- ------------------------------
Aleksandra           Michalik                                 aleksandra.michalik@gmail.com
Jan                  Kowalski                                 jan.kowalski@pwk.com.pl
Marcin               Borysiuk                                 m.borysiuk56@gmail.com
Jakub                Jaworski                                 j.jarzabek@gmail.com


(3 rows affected)
*/

-- Przypadek I: kopiowanie danych klienta, kt�ry nie jest zarejestrowany w bazie lokalnej.
--				z oryginalnym identyfikatorem (zdalnym).

EXECUTE dbo.Klient_Kopiuj_RBD
@Par_Imie = 'Jakub',
@Par_Nazwisko = 'Jaworski',
@Par_AresMail = 'j.jarzabek@gmail.com',
@Par_Kopiuj_ID = 1;
GO

/*
(1 row affected)

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         �wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             1
2           Micha�               Mietczy�ski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             1
3           Ola                  Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             1
4           Adam                 Kula                                     NULL                                     Pruszk�w                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             1
5           Zuzanna              Paj�k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             1
6           Konrad               Rusek                                    NULL                                     Ostr�w Wielkopolski            Kaliska                                            1          3          63-400      Ostr�w Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             1
7           Konrad               Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             1
8           Robert               Kowalski                                 Przedsi�biorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             1
9           Marcin               Marciniak                                NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             1
10          Marcin               Stefaniak                                NULL                                     Warsz�wka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             1
11          Jakub                Jaworski                                 NULL                                     Krak�w                         Jarz�binowa                                        12a        NULL       30-003      Krak�w                                             +48 512 513 514 j.jarzabek@gmail.com           NULL                                                                                                                                                                                                                                                             1

(11 rows affected)

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Andrzej              Michalak                                 NULL                                     Ostr�w Wielkopolski            �wirki i Wigury                                    22         NULL       63-400      Ostr�w Wielkopolski                                +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             2
2           Micha�               Mietczy�ski                              NULL                                     Ostr�w Wielkopolski            Konopnicka                                         12         NULL       63-400      Ostr�w Wielkopolski                                +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             2
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             2
4           Adam                 Kula                                     NULL                                     Ostr�w Wielkopolski            NULL                                               32         NULL       63-400      Ostr�w Wielkopolski                                +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             2
5           Zuzanna              Paj�k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             2
6           Konrad               Rusek                                    NULL                                     Ostr�w Wielkopolski            Kaliska                                            1          3          63-400      Ostr�w Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             2
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             2
8           Robert               Kowalski                                 Przedsi�biorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             2
9           Marcin               Borysiuk                                 NULL                                     Ostr�w Wielkopolski            Przechodnia                                        3          6          63-400      Ostr�w Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             2
10          Marcin               Stefaniak                                NULL                                     Ostr�w Wielkopolski            NULL                                               10         NULL       63-400      Ostr�w Wielkopolski                                +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             2
11          Jakub                Jaworski                                 NULL                                     Krak�w                         Jarz�binowa                                        12a        NULL       30-003      Krak�w                                             +48 512 513 514 j.jarzabek@gmail.com           NULL                                                                                                                                                                                                                                                             2

(11 rows affected)
*/

-- Przypadek II: kopiowanie danych klienta, kt�ry nie jest zarejestrowany w bazie lokalnej.
--				z nowym identyfikatorem (lokalnym).

EXECUTE dbo.Klient_Kopiuj_RBD
@Par_Imie = 'Marcin',
@Par_Nazwisko = 'Borysiuk',
@Par_AresMail = 'm.borysiuk56@gmail.com',
@Par_Kopiuj_ID = 1;
GO

/*
(1 row affected)

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         �wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             1
2           Micha�               Mietczy�ski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             1
3           Ola                  Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             1
4           Adam                 Kula                                     NULL                                     Pruszk�w                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             1
5           Zuzanna              Paj�k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             1
6           Konrad               Rusek                                    NULL                                     Ostr�w Wielkopolski            Kaliska                                            1          3          63-400      Ostr�w Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             1
7           Konrad               Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             1
8           Robert               Kowalski                                 Przedsi�biorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             1
9           Marcin               Marciniak                                NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             1
10          Marcin               Stefaniak                                NULL                                     Warsz�wka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             1
11          Jakub                Jaworski                                 NULL                                     Krak�w                         Jarz�binowa                                        12a        NULL       30-003      Krak�w                                             +48 512 513 514 j.jarzabek@gmail.com           NULL                                                                                                                                                                                                                                                             1
12          Marcin               Borysiuk                                 NULL                                     Ostr�w Wielkopolski            Przechodnia                                        3          6          63-400      Ostr�w Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             1

(12 rows affected)

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Andrzej              Michalak                                 NULL                                     Ostr�w Wielkopolski            �wirki i Wigury                                    22         NULL       63-400      Ostr�w Wielkopolski                                +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             2
2           Micha�               Mietczy�ski                              NULL                                     Ostr�w Wielkopolski            Konopnicka                                         12         NULL       63-400      Ostr�w Wielkopolski                                +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             2
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             2
4           Adam                 Kula                                     NULL                                     Ostr�w Wielkopolski            NULL                                               32         NULL       63-400      Ostr�w Wielkopolski                                +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             2
5           Zuzanna              Paj�k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             2
6           Konrad               Rusek                                    NULL                                     Ostr�w Wielkopolski            Kaliska                                            1          3          63-400      Ostr�w Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             2
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             2
8           Robert               Kowalski                                 Przedsi�biorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             2
9           Marcin               Borysiuk                                 NULL                                     Ostr�w Wielkopolski            Przechodnia                                        3          6          63-400      Ostr�w Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             2
10          Marcin               Stefaniak                                NULL                                     Ostr�w Wielkopolski            NULL                                               10         NULL       63-400      Ostr�w Wielkopolski                                +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             2
11          Jakub                Jaworski                                 NULL                                     Krak�w                         Jarz�binowa                                        12a        NULL       30-003      Krak�w                                             +48 512 513 514 j.jarzabek@gmail.com           NULL                                                                                                                                                                                                                                                             2

(11 rows affected)
*/

-- Przypadek III: kopiowanie danych klienta, kt�ry jest zarejestrowany w bazie lokalnej.

EXECUTE dbo.Klient_Kopiuj_RBD
@Par_Imie = 'Andrzej',
@Par_Nazwisko = 'Michalak',
@Par_AresMail = 'andrzej.marciniak@gmail.com',
@Par_Kopiuj_ID = 1;
GO

/*
Commands completed successfully.

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         �wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             1
2           Micha�               Mietczy�ski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             1
3           Ola                  Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             1
4           Adam                 Kula                                     NULL                                     Pruszk�w                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             1
5           Zuzanna              Paj�k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             1
6           Konrad               Rusek                                    NULL                                     Ostr�w Wielkopolski            Kaliska                                            1          3          63-400      Ostr�w Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             1
7           Konrad               Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             1
8           Robert               Kowalski                                 Przedsi�biorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             1
9           Marcin               Marciniak                                NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             1
10          Marcin               Stefaniak                                NULL                                     Warsz�wka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             1
11          Jakub                Jaworski                                 NULL                                     Krak�w                         Jarz�binowa                                        12a        NULL       30-003      Krak�w                                             +48 512 513 514 j.jarzabek@gmail.com           NULL                                                                                                                                                                                                                                                             1
12          Marcin               Borysiuk                                 NULL                                     Ostr�w Wielkopolski            Przechodnia                                        3          6          63-400      Ostr�w Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             1

(12 rows affected)

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Andrzej              Michalak                                 NULL                                     Ostr�w Wielkopolski            �wirki i Wigury                                    22         NULL       63-400      Ostr�w Wielkopolski                                +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             2
2           Micha�               Mietczy�ski                              NULL                                     Ostr�w Wielkopolski            Konopnicka                                         12         NULL       63-400      Ostr�w Wielkopolski                                +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             2
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             2
4           Adam                 Kula                                     NULL                                     Ostr�w Wielkopolski            NULL                                               32         NULL       63-400      Ostr�w Wielkopolski                                +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             2
5           Zuzanna              Paj�k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             2
6           Konrad               Rusek                                    NULL                                     Ostr�w Wielkopolski            Kaliska                                            1          3          63-400      Ostr�w Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             2
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             2
8           Robert               Kowalski                                 Przedsi�biorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             2
9           Marcin               Borysiuk                                 NULL                                     Ostr�w Wielkopolski            Przechodnia                                        3          6          63-400      Ostr�w Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             2
10          Marcin               Stefaniak                                NULL                                     Ostr�w Wielkopolski            NULL                                               10         NULL       63-400      Ostr�w Wielkopolski                                +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             2
11          Jakub                Jaworski                                 NULL                                     Krak�w                         Jarz�binowa                                        12a        NULL       30-003      Krak�w                                             +48 512 513 514 j.jarzabek@gmail.com           NULL                                                                                                                                                                                                                                                             2

(11 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (TR3) Obs�uga wypo�ycze� z uwzgl�dnieniem bie��cej dost�pno�ci samochodu w oddziale lokalnym oraz zdalnym.
---------------------------------------------------------------------------------------------------------------------------

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

/*
IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               1          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   1          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Got�wka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe�ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p�atno�ci online   2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Got�wka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Got�wka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdPrzeniesienie DataGodzPolecenia       DataGodzOdbioru         IdOddzialZam IdSamochod  Uwagi
--------------- ----------------------- ----------------------- ------------ ----------- ----------------------------------------------------------------------------------------------------

(0 rows affected)
*/

-- Przypadek I: pr�ba wypo�yczenia auta niedost�pnego w obu oddzia�ach.
EXECUTE dbo.Wypozyczenie_Dodaj_RBD
@Par_IdWypozyczenie = 11,
@Par_IdKlient = 3,
@Par_IdSamochod = 2,
@Par_IdPracownik = 3,
@Par_IdUbezpieczenie = 2,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-12-11 00:00',
@Par_TerminZwrotu = '2023-12-11 00:00',
@Par_Uwagi = '',
@Par_IdOddzialLokalny = 1;
GO

/*
Samochod niedost�pny w �adnym z oddzia��w.

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               1          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   1          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Got�wka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe�ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p�atno�ci online   2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Got�wka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Got�wka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdPrzeniesienie DataGodzPolecenia       DataGodzOdbioru         IdOddzialZam IdSamochod  Uwagi
--------------- ----------------------- ----------------------- ------------ ----------- ----------------------------------------------------------------------------------------------------

(0 rows affected)
*/

-- Przypadek II: wypo�yczenie auta dost�pnego jedynie w oddziale zdalnym.
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

/*
(1 row affected)

(1 row affected)

(1 row affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               1          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Got�wka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe�ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p�atno�ci online   2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Got�wka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Got�wka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
11             3           8           3           2               Przelew                   2023-12-11 00:00:00.000 2023-12-11 00:00:00.000 NULL                    80,00                 NULL                  1                  

(11 rows affected)

IdPrzeniesienie DataGodzPolecenia       DataGodzOdbioru         IdOddzialZam IdSamochod  Uwagi
--------------- ----------------------- ----------------------- ------------ ----------- ----------------------------------------------------------------------------------------------------
3               2023-12-11 05:31:03.820 NULL                    1            8           NULL

(1 row affected)
*/

-- Przypadek III: wypo�yczenie auta dost�pnego w oddziale lokalnym.
EXECUTE dbo.Wypozyczenie_Dodaj_RBD
@Par_IdWypozyczenie = 12,
@Par_IdKlient = 3,
@Par_IdSamochod = 1,
@Par_IdPracownik = 3,
@Par_IdUbezpieczenie = 2,
@Par_SposobPlatnosci = 'Przelew',
@Par_DataWypozyczenia = '2023-12-11 00:00',
@Par_TerminZwrotu = '2023-12-11 00:00',
@Par_Uwagi = '',
@Par_IdOddzialLokalny = 1;
GO

/*
(1 row affected)

(1 row affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              0          5           2023        Benzyna         BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               1          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Got�wka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe�ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p�atno�ci online   2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Got�wka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Got�wka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
11             3           8           3           2               Przelew                   2023-12-11 00:00:00.000 2023-12-11 00:00:00.000 NULL                    80,00                 NULL                  1                  
12             3           1           3           2               Przelew                   2023-12-11 00:00:00.000 2023-12-11 00:00:00.000 NULL                    80,00                 NULL                  1                  

(12 rows affected)

IdPrzeniesienie DataGodzPolecenia       DataGodzOdbioru         IdOddzialZam IdSamochod  Uwagi
--------------- ----------------------- ----------------------- ------------ ----------- ----------------------------------------------------------------------------------------------------
3               2023-12-11 05:31:03.820 NULL                    1            8           NULL

(1 row affected)
*/

EXECUTE dbo.Przeniesienia_RBD
@Par_DataGodzOd = '2023-12-01 00:00',
@Par_DataGodzDo = '2023-12-31 23:59',
@Par_IdOddzialLokalny = 1,
@Par_IdOddzialZdalny = 2;
GO

/*
Z                                                  Do                                                 IdPrzeniesienie DataGodzPolecenia       DataGodzOdbioru         IdSamochod  Model                Marka                Rocznik     Uwagi
-------------------------------------------------- -------------------------------------------------- --------------- ----------------------- ----------------------- ----------- -------------------- -------------------- ----------- ----------------------------------------------------------------------------------------------------
Krak�w                                             Kalisz                                             3               2023-12-11 05:31:03.820 NULL                    8           Q3                   Audi                 2017        NULL

(1 row affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (TR4) Automatyczna replikacja danych produkt�w z jednego oddzia�u do drugiego.
--		 (Procedury wyzwalane + transakcje rozproszone 2PC.)
---------------------------------------------------------------------------------------------------------------------------



---------------------------------------------------------------------------------------------------------------------------
-- (TR4a) Kopiowanie wiersza nowo dodanego z serwera lokalnego do zdalnego.
--		  (Procedura wyzwalana typu AFTR + transakcja 2PC.)
---------------------------------------------------------------------------------------------------------------------------


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

/*
Kategoria            Cena                  Opis
-------------------- --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Dostawcze            250,00                Samochody dostawcze, kt�re umo�liwiaj� przew�z r�nych towar�w i materia��w. Charakteryzuj� si� wi�ksz� przestrzeni� �adunkow�, wygodnym dost�pem do przestrzeni �adunkowej oraz r�nymi udogodnieniami, takimi jak systemy zabezpieczaj�ce �adunek czy uchwyty 
Ekonomiczna          80,00                 Kompaktowe samochody o niskim zu�yciu paliwa, idealne do codziennych podr�y miejskich. Posiadaj� podstawowe funkcje i wystarczaj�co du�o miejsca dla jednej lub dw�ch os�b.
Elektryczne          200,00                Samochody elektryczne, kt�re s� zasilane energi� elektryczn�, co sprawia, �e s� przyjazne dla �rodowiska i generuj� mniejsze emisje. Samochody elektryczne oferuj� cich� jazd�, niskie koszty eksploatacji i wi�ksz� efektywno�� energetyczn�. S� doskona�ym wyb
Klasyczny/Antyk      400,00                Klasyczne samochody z przesz�o�ci, kt�re zachwycaj� swoim pi�knym wzornictwem i duchem retro. Idealne dla mi�o�nik�w motoryzacji i unikalnych do�wiadcze�.
Performance          500,00                Pot�ne samochody z wysokimi osi�gami, kt�re zapewniaj� niezwyk�e wra�enia z jazdy. Posiadaj� zaawansowane systemy nap�dowe i sportowe osi�gi.
Premium              300,00                Luksusowe samochody z najnowszymi funkcjami i eleganckim wyko�czeniem. Zapewniaj� wyj�tkowy komfort, styl i doskona�e osi�gi. Doskona�e do podr�y s�u�bowych lub specjalnych okazji.
Rodzinna             90,00                 Przestronne samochody typu kombi lub SUV, idealne dla rodzin i wi�kszych grup podr�uj�cych. Oferuj� wygodn� przestrze� pasa�ersk� i wystarczaj�c� pojemno�� baga�nika.
Sportowe             350,00                Dynamiczne samochody o wysokich osi�gach i agresywnym designie. Zapewniaj� emocjonuj�ce wra�enia z jazdy i doskona�� reakcj� na drodze.
Super Luxury         600,00                Najwy�szy poziom luksusu i presti�u. Oferuje ekskluzywne samochody z najwy�szym wyposa�eniem, najnowszymi technologiami i niezr�wnanym komfortem.
SUV/Terenowe         180,00                Wytrzyma�e samochody terenowe o du�ej przestrzeni w kabinie pasa�erskiej i doskona�ych mo�liwo�ciach jazdy w r�nych warunkach terenowych. Idealne do podr�y poza miasto.

(10 rows affected)

Model                Marka
-------------------- --------------------
911                  Porsche
A4                   Audi
Aventador            Lamborghini
Cullinan             Rolls-Royce
G klasa              Mercedes
Mondeo               Ford
Q3                   Audi
S klasa              Mercedes
Seria 1              BMW
Seria 5              BMW
Seria 7              BMW

(11 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              0          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1

(10 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               1          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1

(10 rows affected)
*/

INSERT dbo.Samochod
(IdSamochod, Kategoria, Model, Dostepnosc, IloscDrzwi, Rocznik, TypSilnika, InformacjeDodatkowe, Aktywny)
VALUES
(11, 'Super Luxury', 'Cullinan', 1, 5, 2023, 'Diesel', 'Rolls-Royce Cullinan Black Badge', 1);
GO

/*
(1 row affected)

(1 row affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              0          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1
11          Super Luxury         Cullinan             1          5           2023        Diesel          Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1

(11 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               1          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1
11          Super Luxury         Cullinan             1          5           2023        Diesel          Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1

(11 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (TR4b) Aktualizowanie wiersza na serwerze zdalnym po wyst�pieniu zmiany na serwerze lokalnym.
--		  (Procedura wyzwalana typu AFTER + transajcha 2PC.)
---------------------------------------------------------------------------------------------------------------------------
-- Procedura nie replikuje dost�pno�ci samochodu, poniewa� mo�e ona by� r�na w poszczeg�lnych oddzia�ach firmy.
-- Natomiast kopiowany jest status wiersza, kt�ry oznacza, czy jest on aktywny, czy nie (archiwalny)
-- - zast�puj�c fizyczne usuni�cie.
---------------------------------------------------------------------------------------------------------------------------

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

/*
Kategoria            Cena                  Opis
-------------------- --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Dostawcze            250,00                Samochody dostawcze, kt�re umo�liwiaj� przew�z r�nych towar�w i materia��w. Charakteryzuj� si� wi�ksz� przestrzeni� �adunkow�, wygodnym dost�pem do przestrzeni �adunkowej oraz r�nymi udogodnieniami, takimi jak systemy zabezpieczaj�ce �adunek czy uchwyty 
Ekonomiczna          80,00                 Kompaktowe samochody o niskim zu�yciu paliwa, idealne do codziennych podr�y miejskich. Posiadaj� podstawowe funkcje i wystarczaj�co du�o miejsca dla jednej lub dw�ch os�b.
Elektryczne          200,00                Samochody elektryczne, kt�re s� zasilane energi� elektryczn�, co sprawia, �e s� przyjazne dla �rodowiska i generuj� mniejsze emisje. Samochody elektryczne oferuj� cich� jazd�, niskie koszty eksploatacji i wi�ksz� efektywno�� energetyczn�. S� doskona�ym wyb
Klasyczny/Antyk      400,00                Klasyczne samochody z przesz�o�ci, kt�re zachwycaj� swoim pi�knym wzornictwem i duchem retro. Idealne dla mi�o�nik�w motoryzacji i unikalnych do�wiadcze�.
Performance          500,00                Pot�ne samochody z wysokimi osi�gami, kt�re zapewniaj� niezwyk�e wra�enia z jazdy. Posiadaj� zaawansowane systemy nap�dowe i sportowe osi�gi.
Premium              300,00                Luksusowe samochody z najnowszymi funkcjami i eleganckim wyko�czeniem. Zapewniaj� wyj�tkowy komfort, styl i doskona�e osi�gi. Doskona�e do podr�y s�u�bowych lub specjalnych okazji.
Rodzinna             90,00                 Przestronne samochody typu kombi lub SUV, idealne dla rodzin i wi�kszych grup podr�uj�cych. Oferuj� wygodn� przestrze� pasa�ersk� i wystarczaj�c� pojemno�� baga�nika.
Sportowe             350,00                Dynamiczne samochody o wysokich osi�gach i agresywnym designie. Zapewniaj� emocjonuj�ce wra�enia z jazdy i doskona�� reakcj� na drodze.
Super Luxury         600,00                Najwy�szy poziom luksusu i presti�u. Oferuje ekskluzywne samochody z najwy�szym wyposa�eniem, najnowszymi technologiami i niezr�wnanym komfortem.
SUV/Terenowe         180,00                Wytrzyma�e samochody terenowe o du�ej przestrzeni w kabinie pasa�erskiej i doskona�ych mo�liwo�ciach jazdy w r�nych warunkach terenowych. Idealne do podr�y poza miasto.

(10 rows affected)

Model                Marka
-------------------- --------------------
911                  Porsche
A4                   Audi
Aventador            Lamborghini
Cullinan             Rolls-Royce
G klasa              Mercedes
Mondeo               Ford
Q3                   Audi
S klasa              Mercedes
Seria 1              BMW
Seria 5              BMW
Seria 7              BMW

(11 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              0          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1
11          Super Luxury         Cullinan             1          5           2023        Diesel          Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1

(11 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               1          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1
11          Super Luxury         Cullinan             1          5           2023        Diesel          Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1

(11 rows affected)
*/

UPDATE dbo.Samochod
SET Rocznik = 2022
WHERE IdSamochod = 11;
GO

/*
(1 row affected)

(1 row affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              0          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1
11          Super Luxury         Cullinan             1          5           2022        Diesel          Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1

(11 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               1          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1
11          Super Luxury         Cullinan             1          5           2022        Diesel          Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1

(11 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- Oznaczenie wiersza jako nieaktywnego na serwerze lokalnym.
-- (Procedura wyzwalana typu INSTEAD OF.)
---------------------------------------------------------------------------------------------------------------------------
-- Nie ma potrzeby realizowania tej zmiany do serwera zdalnego, poniewa� zostanie ona tam przes�ana przez procedur�
-- wyzwalan� obs�uguj�c� operacj� UPDATE.
---------------------------------------------------------------------------------------------------------------------------

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

/*
Kategoria            Cena                  Opis
-------------------- --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Dostawcze            250,00                Samochody dostawcze, kt�re umo�liwiaj� przew�z r�nych towar�w i materia��w. Charakteryzuj� si� wi�ksz� przestrzeni� �adunkow�, wygodnym dost�pem do przestrzeni �adunkowej oraz r�nymi udogodnieniami, takimi jak systemy zabezpieczaj�ce �adunek czy uchwyty 
Ekonomiczna          80,00                 Kompaktowe samochody o niskim zu�yciu paliwa, idealne do codziennych podr�y miejskich. Posiadaj� podstawowe funkcje i wystarczaj�co du�o miejsca dla jednej lub dw�ch os�b.
Elektryczne          200,00                Samochody elektryczne, kt�re s� zasilane energi� elektryczn�, co sprawia, �e s� przyjazne dla �rodowiska i generuj� mniejsze emisje. Samochody elektryczne oferuj� cich� jazd�, niskie koszty eksploatacji i wi�ksz� efektywno�� energetyczn�. S� doskona�ym wyb
Klasyczny/Antyk      400,00                Klasyczne samochody z przesz�o�ci, kt�re zachwycaj� swoim pi�knym wzornictwem i duchem retro. Idealne dla mi�o�nik�w motoryzacji i unikalnych do�wiadcze�.
Performance          500,00                Pot�ne samochody z wysokimi osi�gami, kt�re zapewniaj� niezwyk�e wra�enia z jazdy. Posiadaj� zaawansowane systemy nap�dowe i sportowe osi�gi.
Premium              300,00                Luksusowe samochody z najnowszymi funkcjami i eleganckim wyko�czeniem. Zapewniaj� wyj�tkowy komfort, styl i doskona�e osi�gi. Doskona�e do podr�y s�u�bowych lub specjalnych okazji.
Rodzinna             90,00                 Przestronne samochody typu kombi lub SUV, idealne dla rodzin i wi�kszych grup podr�uj�cych. Oferuj� wygodn� przestrze� pasa�ersk� i wystarczaj�c� pojemno�� baga�nika.
Sportowe             350,00                Dynamiczne samochody o wysokich osi�gach i agresywnym designie. Zapewniaj� emocjonuj�ce wra�enia z jazdy i doskona�� reakcj� na drodze.
Super Luxury         600,00                Najwy�szy poziom luksusu i presti�u. Oferuje ekskluzywne samochody z najwy�szym wyposa�eniem, najnowszymi technologiami i niezr�wnanym komfortem.
SUV/Terenowe         180,00                Wytrzyma�e samochody terenowe o du�ej przestrzeni w kabinie pasa�erskiej i doskona�ych mo�liwo�ciach jazdy w r�nych warunkach terenowych. Idealne do podr�y poza miasto.

(10 rows affected)

Model                Marka
-------------------- --------------------
911                  Porsche
A4                   Audi
Aventador            Lamborghini
Cullinan             Rolls-Royce
G klasa              Mercedes
Mondeo               Ford
Q3                   Audi
S klasa              Mercedes
Seria 1              BMW
Seria 5              BMW
Seria 7              BMW

(11 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              0          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1
11          Super Luxury         Cullinan             1          5           2022        Diesel          Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1

(11 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               1          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1
11          Super Luxury         Cullinan             1          5           2022        Diesel          Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1

(11 rows affected)
*/

DELETE dbo.Samochod
WHERE IdSamochod = 11;
GO

/*
(1 row affected)

(1 row affected)

(1 row affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              0          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1
11          Super Luxury         Cullinan             1          5           2022        Diesel          Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 0

(11 rows affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              1          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               1          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1
11          Super Luxury         Cullinan             1          5           2022        Diesel          Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 0

(11 rows affected)
*/

/*
Aktualizacja danych przy braku dost�pu do serwera zdalnego (wy��czony).
*/

UPDATE dbo.Samochod
SET Rocznik = 2023
WHERE IdSamochod = 11;
GO

/*
OLE DB provider "MSOLEDBSQL" for linked server "LS_SQL2" returned message "Login timeout expired".
OLE DB provider "MSOLEDBSQL" for linked server "LS_SQL2" returned message "A network-related or instance-specific error has occurred while establishing a connection to SQL Server. Server is not found or not accessible. Check if instance name is correct and if SQL Server is configured to allow remote connections. For more information see SQL Server Books Online.".
Msg 2, Level 16, State 1, Line 1547
Shared Memory Provider: Could not open a connection to SQL Server [2]. 
*/

/*
IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe                                                                                                                                                                                                                                              Aktywny
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
1           Premium              Seria 7              0          5           2023        Benzyna         BMW 740d xDrive                                                                                                                                                                                                                                                  1
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera                                                                                                                                                                                                                                                      1
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi                                                                                                                                                                                                                                             1
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 1
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto                                                                                                                                                                                                                                   1
6           Premium              A4                   1          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic                                                                                                                                                                                                                      1
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid                                                                                                                                                                                                                                   1
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI                                                                                                                                                                                                                                                  1
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV                                                                                                                                                                                                                                            1
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport                                                                                                                                                                                                                       1
11          Super Luxury         Cullinan             1          5           2022        Diesel          Rolls-Royce Cullinan Black Badge                                                                                                                                                                                                                                 0

(11 rows affected)

OLE DB provider "MSOLEDBSQL" for linked server "LS_SQL2" returned message "Login timeout expired".
OLE DB provider "MSOLEDBSQL" for linked server "LS_SQL2" returned message "A network-related or instance-specific error has occurred while establishing a connection to SQL Server. Server is not found or not accessible. Check if instance name is correct and if SQL Server is configured to allow remote connections. For more information see SQL Server Books Online.".
Msg 2, Level 16, State 1, Line 1429
Shared Memory Provider: Could not open a connection to SQL Server [2]. 
*/

---------------------------------------------------------------------------------------------------------------------------
-- Koniec.
---------------------------------------------------------------------------------------------------------------------------