---------------------------------------------------------------------------------------------------------------------------
-- SRBD_C5: zapytania rozproszone i transakcje 2PC.
---------------------------------------------------------------------------------------------------------------------------
-- Dokumentacja testowania
---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- Zad.2a. Utworzenie s³ownika oddzia³ów firmy.
---------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM dbo.Oddzial;
GO

/*
IdOddzial   OddzialNazwa                                       OddzialMiasto                                      SerwerNazwa                                                                                          OddzialOpis                                                                                          OddzialLokalny
----------- -------------------------------------------------- -------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- --------------
1           centrala                                           Kalisz                                             SQL1                                                                                                 centrala                                                                                             1
2           sklep                                              Kraków                                             SQL2                                                                                                 sklep                                                                                                0
3           sklep i serwis                                     Warszawa                                           SQL3                                                                                                 sklep i serwis                                                                                       0

(3 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- Identyfikatory oddzia³ówdodane s¹do tabel [Klient] oraz [Pracownik] jako klucze obce wskazuj¹ce na tabelê [Oddzial].
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
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             1
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             1
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             1
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             1
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             1
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             1
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             1
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             1
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             1
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             1

(10 rows affected)

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail                      IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------ -----------
1           Pawe³                Malczyñski                               W³aœciciel                               +48 589 593 943 p_malczynski1@gmail.com        1
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl            1
3           Micha³               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com          1
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl                 1
5           Anna                 £awniczak                                Dzia³ marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com       1
6           Amadeusz             Kaczyñski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl              1
7           Jolanta              Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com     1
8           Miros³aw             Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl    1
9           Klaudia              Kuku³ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com      1
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
1           Andrzej              Michalak                                 NULL                                     Ostrów Wielkopolski            ¯wirki i Wigury                                    22         NULL       63-400      Ostrów Wielkopolski                                +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             2
2           Micha³               Mietczyñski                              NULL                                     Ostrów Wielkopolski            Konopnicka                                         12         NULL       63-400      Ostrów Wielkopolski                                +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             2
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             2
4           Adam                 Kula                                     NULL                                     Ostrów Wielkopolski            NULL                                               32         NULL       63-400      Ostrów Wielkopolski                                +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             2
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             2
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             2
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             2
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             2
9           Marcin               Borysiuk                                 NULL                                     Ostrów Wielkopolski            Przechodnia                                        3          6          63-400      Ostrów Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             2
10          Marcin               Stefaniak                                NULL                                     Ostrów Wielkopolski            NULL                                               10         NULL       63-400      Ostrów Wielkopolski                                +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             2

(10 rows affected)

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail                      IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------ -----------
1           Pawe³                Malczyñski                               W³aœciciel                               +48 589 593 943 p_malczynski1@gmail.com        2
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl            2
3           Micha³               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com          2
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl                 2
5           Anna                 £awniczak                                Dzia³ marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com       2
6           Amadeusz             Kaczyñski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl              2
7           Jolanta              Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com     2
8           Miros³aw             Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl    2
9           Klaudia              Kuku³ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com      2
10          Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl             2

(10 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- Zad.3. Zapytania rozproszone.
---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- (ZR1a) Wszyscy pracownicy zatrudnieni w dwóch oddzia³ach firmy. (Suma wierszyz dwóch tabel bez powtórzeñ - operator UNION.)
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Pracownicy_Wszyscy_RBD;
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl
7           Jola                 Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com
7           Jolanta              Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com
6           Amadeusz             Kaczyñski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl
3           Micha³               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com
9           Klaudia              Kuku³a                                   Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
9           Klaudia              Kuku³ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
5           Anna                 £awniczak                                Dzia³ marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl
1           Pawe³                Malczyñski                               W³aœciciel                               +48 589 593 943 p_malczynski1@gmail.com
8           Mirek                Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl
8           Miros³aw             Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl
10          Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl

(13 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR1b) Wszyscy pracownicy z dwóch oddzia³ów firmy ze wskazaniem oddzia³u, w którym s¹ zatrudnieni. (Suma wierszy z dwóch 
--	      tabel z powtórzeniami - operator UNION ALL. Z³¹czenia z tabel¹ s³ownikaoddzia³ów w celu ustalenia lokalizacji wierszy.)
---------------------------------------------------------------------------------------------------------------------------
-- W z³¹czeniach zdalnych konieczne jest u¿ycie aliasów zamiast 4-cz³onowych nazw obiektówna serwerze po³¹czonym, poniewa¿
-- niedopuszczalne by³oby odw³anie do kolumn tabel poprzez nazwy 5-cz³onowe.
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Pracownicy_Wszyscy_Oddzialy_RBD;
GO

/*
Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail                      OddzialMiasto
-------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------ --------------------------------------------------
Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl            Kalisz
Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl            Kraków
Jola                 Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com     Kalisz
Jolanta              Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com     Kraków
Amadeusz             Kaczyñski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl              Kalisz
Amadeusz             Kaczyñski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl              Kraków
Micha³               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com          Kalisz
Micha³               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com          Kraków
Klaudia              Kuku³a                                   Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com      Kalisz
Klaudia              Kuku³ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com      Kraków
Anna                 £awniczak                                Dzia³ marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com       Kalisz
Anna                 £awniczak                                Dzia³ marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com       Kraków
Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl                 Kalisz
Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl                 Kraków
Pawe³                Malczyñski                               W³aœciciel                               +48 589 593 943 p_malczynski1@gmail.com        Kalisz
Pawe³                Malczyñski                               W³aœciciel                               +48 589 593 943 p_malczynski1@gmail.com        Kraków
Mirek                Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl    Kalisz
Miros³aw             Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl    Kraków
Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl             Kalisz
Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl             Kraków

(20 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR2) Pracownicy zatrudnieni jednoczeœnie w dwóch oddzia³ach firmy. (Przekrój, czêœæ wspólna dwóch tabel - operator INSERECT).
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Pracownicy_Wspolni_RBD;
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl
6           Amadeusz             Kaczyñski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl
3           Micha³               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com
5           Anna                 £awniczak                                Dzia³ marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl
1           Pawe³                Malczyñski                               W³aœciciel                               +48 589 593 943 p_malczynski1@gmail.com
10          Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl

(7 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR3a) Pracownicy zatrudnieni tylko w lokalnym oddziale firmy. (Ró¿nica dwóch tabel - operator EXCEPT.)
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Pracownicy_Lokalni_RBD;
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
7           Jola                 Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com
9           Klaudia              Kuku³a                                   Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
8           Mirek                Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl

(3 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR3b) Pracownicy zatrudnieni tylko w zdalnym oddziale firmy. (Ró¿nica dwóch tabel - operator EXCEPT.)
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Pracownicy_Zdalni_RBD;
GO

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
7           Jolanta              Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com
9           Klaudia              Kuku³ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
8           Miros³aw             Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl

(3 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR4a) Wyszukiwanie klientów zarejestrowanych w dwóch oddzia³ach firmy - wzglêdem wzorca znakowego w nazwiksu.
--	      (Suma wierszy z powtórzeniami - operator UNION ALL.)
---------------------------------------------------------------------------------------------------------------------------
-- Lokalizacja wierszy ustalana jest przy u¿yciu kolumny wirtualnej "Oddzia³". Jest to rozwi¹zanie proste, ale ma³o elastyczne
-- - przeniesienie tej procedury na inny serwer wymaga modyfikacji kodu.
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Klient_Znajdz_RBD
@Par_Nazwisko = '';
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    AdresMail                      Oddzial
----------- -------------------- ---------------------------------------- ------------------------------ ------------------------------ -------
9           Marcin               Borysiuk                                 Ostrów Wielkopolski            m.borysiuk56@gmail.com         Kraków
7           Jan                  Kowalski                                 Kalisz                         jan.kowalski@pwk.com.pl        Kraków
7           Konrad               Kowalski                                 Kalisz                         jan.kowalski@pwk.com.pl        Kalisz
8           Robert               Kowalski                                 Konin                          robert.kolanski@onet.pl        Kalisz
8           Robert               Kowalski                                 Konin                          robert.kolanski@onet.pl        Kraków
4           Adam                 Kula                                     Pruszków                       adam.kula@onet.pl              Kalisz
4           Adam                 Kula                                     Ostrów Wielkopolski            adam.kula@onet.pl              Kraków
9           Marcin               Marciniak                                Kalisz                         m.borysiuk56@gmail.com         Kalisz
1           Andrzej              Michalak                                 Kalisz                         andrzej.marciniak@gmail.com    Kalisz
1           Andrzej              Michalak                                 Ostrów Wielkopolski            andrzej.marciniak@gmail.com    Kraków
3           Aleksandra           Michalik                                 Kalisz                         aleksandra.michalik@gmail.com  Kraków
3           Ola                  Michalik                                 Kalisz                         aleksandra.michalik@gmail.com  Kalisz
2           Micha³               Mietczyñski                              Kalisz                         michal.mietczynski@wp.pl       Kalisz
2           Micha³               Mietczyñski                              Ostrów Wielkopolski            michal.mietczynski@wp.pl       Kraków
5           Zuzanna              Paj¹k                                    Konin                          z_pajak@firma.pl               Kalisz
5           Zuzanna              Paj¹k                                    Konin                          z_pajak@firma.pl               Kraków
6           Konrad               Rusek                                    Ostrów Wielkopolski            konrad.rusek99@firma.pl        Kalisz
6           Konrad               Rusek                                    Ostrów Wielkopolski            konrad.rusek99@firma.pl        Kraków
10          Marcin               Stefaniak                                Warszówka                      m.stefaniak123@wp.pl           Kalisz
10          Marcin               Stefaniak                                Ostrów Wielkopolski            m.stefaniak123@wp.pl           Kraków

(20 rows affected)
*/

EXECUTE dbo.Klient_Znajdz_RBD
@Par_Nazwisko = '   n   ';
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    AdresMail                      Oddzial
----------- -------------------- ---------------------------------------- ------------------------------ ------------------------------ -------
9           Marcin               Marciniak                                Kalisz                         m.borysiuk56@gmail.com         Kalisz
10          Marcin               Stefaniak                                Warszówka                      m.stefaniak123@wp.pl           Kalisz
10          Marcin               Stefaniak                                Ostrów Wielkopolski            m.stefaniak123@wp.pl           Kraków

(3 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR4a) Wyszukiwanie klientów zarejestrowanych w dwóch oddzia³ach firmy - wzglêdem wzorca znakowego w nazwiksu.
--	      (Suma wierszy z powtórzeniami - operator UNION ALL.)
---------------------------------------------------------------------------------------------------------------------------
-- Lokalizacja wierszy ustalana jest poprzez z³¹czenie ze s³ownikiem oddzia³ów [Oddzial].
-- Jest to rozwi¹zanie elastyczne, poniewa¿ przy odpowiedniej konfiguracji serwerów bazy rozproszonej mo¿na u¿yæ tej
-- procedury w wielu oddzia³ach bez modyfikacji kodu.
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Klient_Znajdz_Oddzialy_RBD
@Par_Nazwisko = '';
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    AdresMail                      Lokalizacja
----------- -------------------- ---------------------------------------- ------------------------------ ------------------------------ -----------------------------------------------------------------------------------------------------
9           Marcin               Borysiuk                                 Ostrów Wielkopolski            m.borysiuk56@gmail.com         sklep Kraków
7           Jan                  Kowalski                                 Kalisz                         jan.kowalski@pwk.com.pl        sklep Kraków
7           Konrad               Kowalski                                 Kalisz                         jan.kowalski@pwk.com.pl        centrala Kalisz
8           Robert               Kowalski                                 Konin                          robert.kolanski@onet.pl        centrala Kalisz
8           Robert               Kowalski                                 Konin                          robert.kolanski@onet.pl        sklep Kraków
4           Adam                 Kula                                     Pruszków                       adam.kula@onet.pl              centrala Kalisz
4           Adam                 Kula                                     Ostrów Wielkopolski            adam.kula@onet.pl              sklep Kraków
9           Marcin               Marciniak                                Kalisz                         m.borysiuk56@gmail.com         centrala Kalisz
1           Andrzej              Michalak                                 Kalisz                         andrzej.marciniak@gmail.com    centrala Kalisz
1           Andrzej              Michalak                                 Ostrów Wielkopolski            andrzej.marciniak@gmail.com    sklep Kraków
3           Aleksandra           Michalik                                 Kalisz                         aleksandra.michalik@gmail.com  sklep Kraków
3           Ola                  Michalik                                 Kalisz                         aleksandra.michalik@gmail.com  centrala Kalisz
2           Micha³               Mietczyñski                              Kalisz                         michal.mietczynski@wp.pl       centrala Kalisz
2           Micha³               Mietczyñski                              Ostrów Wielkopolski            michal.mietczynski@wp.pl       sklep Kraków
5           Zuzanna              Paj¹k                                    Konin                          z_pajak@firma.pl               centrala Kalisz
5           Zuzanna              Paj¹k                                    Konin                          z_pajak@firma.pl               sklep Kraków
6           Konrad               Rusek                                    Ostrów Wielkopolski            konrad.rusek99@firma.pl        centrala Kalisz
6           Konrad               Rusek                                    Ostrów Wielkopolski            konrad.rusek99@firma.pl        sklep Kraków
10          Marcin               Stefaniak                                Warszówka                      m.stefaniak123@wp.pl           centrala Kalisz
10          Marcin               Stefaniak                                Ostrów Wielkopolski            m.stefaniak123@wp.pl           sklep Kraków

(20 rows affected)
*/

EXECUTE dbo.Klient_Znajdz_Oddzialy_RBD
@Par_Nazwisko = '   n   ';
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    AdresMail                      Lokalizacja
----------- -------------------- ---------------------------------------- ------------------------------ ------------------------------ -----------------------------------------------------------------------------------------------------
9           Marcin               Marciniak                                Kalisz                         m.borysiuk56@gmail.com         centrala Kalisz
10          Marcin               Stefaniak                                Warszówka                      m.stefaniak123@wp.pl           centrala Kalisz
10          Marcin               Stefaniak                                Ostrów Wielkopolski            m.stefaniak123@wp.pl           sklep Kraków

(3 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR5) Œledzenie dostêpnoœci samochodów w oddzia³ach. Zwracane s¹ dane wybranego samochodu lub samochodów (domyœlnie). 
--		 (Suma tabel z powtórzeniami - operator UNION ALL.)
---------------------------------------------------------------------------------------------------------------------------
-- Procedura zosta³a sparametryzowana w taki sposób, aby mo¿na by³o j¹ wdro¿yæ w ka¿dym oddziale bazyrozproszonej - bez
-- wiêkszych modyfikacji kodu.
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
2           Sportowe             Porsche              911                  2020        Kraków                                             0
6           Premium              Audi                 A4                   2022        Kalisz                                             1
6           Premium              Audi                 A4                   2022        Kraków                                             0
5           Performance          Lamborghini          Aventador            2023        Kalisz                                             0
5           Performance          Lamborghini          Aventador            2023        Kraków                                             0
4           Super Luxury         Rolls-Royce          Cullinan             2023        Kalisz                                             1
4           Super Luxury         Rolls-Royce          Cullinan             2023        Kraków                                             1
3           Rodzinna             Ford                 Mondeo               2017        Kalisz                                             1
7           Rodzinna             Ford                 Mondeo               2018        Kalisz                                             0
3           Rodzinna             Ford                 Mondeo               2017        Kraków                                             1
7           Rodzinna             Ford                 Mondeo               2018        Kraków                                             1
8           SUV/Terenowe         Audi                 Q3                   2017        Kalisz                                             0
8           SUV/Terenowe         Audi                 Q3                   2017        Kraków                                             1
9           Premium              BMW                  Seria 7              2022        Kalisz                                             0
10          Sportowe             BMW                  Seria 7              2022        Kalisz                                             0
1           Premium              BMW                  Seria 7              2021        Kalisz                                             1
1           Premium              BMW                  Seria 7              2021        Kraków                                             1
9           Premium              BMW                  Seria 7              2022        Kraków                                             0
10          Sportowe             BMW                  Seria 7              2022        Kraków                                             0

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
5           Performance          Lamborghini          Aventador            2023        Kraków                                             0

(2 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR6a) Liczba i wartoœæ wypo¿yczeñ poszczególnych klientów realizowanych w dwódz oddzia³ach firmy: SQL1 i SQL2.
--		  (Globalne zapytanie statystyczne z wykorzystaniem tabeli poœredniej.)
---------------------------------------------------------------------------------------------------------------------------
-- Zapytanie realizowane jest dwustopniowa: (1) najpierw z³¹czane i sumowane s¹ wiersze z obu serwerów (tabela poœrednia -
-- zbiór wierszy oznaczony aliasem "Wyp_RBD"), a nastêpnie (2) na tym zbiorze wykonywane jest grupowanie i agregowanie wierszy.
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Klienci_Wypozyczenia_RBD_TP;
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    LiczbaWyp   LacznaWartosc
----------- -------------------- ---------------------------------------- ------------------------------ ----------- ---------------------
3           Aleksandra           Michalik                                 Kalisz                         4           6050,00
3           Ola                  Michalik                                 Kalisz                         4           6050,00
1           Andrzej              Michalak                                 Kalisz                         2           1900,00
1           Andrzej              Michalak                                 Ostrów Wielkopolski            2           1900,00
7           Jan                  Kowalski                                 Kalisz                         1           1000,00
7           Konrad               Kowalski                                 Kalisz                         1           1000,00
2           Micha³               Mietczyñski                              Kalisz                         1           700,00
2           Micha³               Mietczyñski                              Ostrów Wielkopolski            1           700,00
9           Marcin               Borysiuk                                 Ostrów Wielkopolski            1           300,00
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
2           Micha³               Mietczyñski                              Kalisz                         1           700,00
2           Micha³               Mietczyñski                              Ostrów Wielkopolski            1           700,00
Warning: Null value is eliminated by an aggregate or other SET operation.

(4 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR6b) Liczba i wartoœæ zamówieñ poszczególnych klientów realizowanych w dwóch oddzia³ach firmy: SQL1 i SQL2.
--		  (Globalne zapytanie statystczne z wykorzystaniem tabeli CTE.)
---------------------------------------------------------------------------------------------------------------------------
-- Jest to pytanie analogiczne do "Klienci_Wypozyczenia_RBD_TP", ale realizowane przy u¿yciu wygodniejszego mechanizmu
-- - tabeli typu CTE (ang. common table expression). Zapytanie realizowane jest dwustopniowo: (1) najpierw z³¹czane
-- i sumowane s¹wiersze z obu serwerów (tabela CTE o nazwie "KlienciWypRBP_CTE" - w istocie jest to widok),
-- a nastêpnie (2) w tabeli CTE wykonywane jest grupowanie i agregowanie wierszy.
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Klienci_Wypozyczenia_RBD_CTE;
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    LiczbaWyp   LacznaWartosc
----------- -------------------- ---------------------------------------- ------------------------------ ----------- ---------------------
3           Aleksandra           Michalik                                 Kalisz                         4           6050,00
3           Ola                  Michalik                                 Kalisz                         4           6050,00
1           Andrzej              Michalak                                 Kalisz                         2           1900,00
1           Andrzej              Michalak                                 Ostrów Wielkopolski            2           1900,00
7           Jan                  Kowalski                                 Kalisz                         1           1000,00
7           Konrad               Kowalski                                 Kalisz                         1           1000,00
2           Micha³               Mietczyñski                              Kalisz                         1           700,00
2           Micha³               Mietczyñski                              Ostrów Wielkopolski            1           700,00
9           Marcin               Borysiuk                                 Ostrów Wielkopolski            1           300,00
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
2           Micha³               Mietczyñski                              Kalisz                         1           700,00
2           Micha³               Mietczyñski                              Ostrów Wielkopolski            1           700,00
Warning: Null value is eliminated by an aggregate or other SET operation.

(4 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (ZR7) Popularnoœæ samochodów poszczególnych marek w zadanym okresie - we wszystkich oddzia³ach firmy.
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
-- (ZR8) Popularnoœæ us³ug w zadanym okresie - we wszystkich oddzia³ach firmy.
--		  (Globalne zapytanie statystycze z wykorzystaniem tabeli CTE.)
---------------------------------------------------------------------------------------------------------------------------

EXECUTE dbo.Uslugi_Popularnosc_RBD_CTE;
GO

/*
UslugaNazwa                    LiczbaWyp   LacznaWartosc
------------------------------ ----------- ---------------------
Pakiet refuel                  4           1800,00
Pakiet Weekendowy              4           800,00
Us³uga Przekraczania Granic    2           600,00
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
-- (TR1) Aktualizacja danych us³ug na dwóch serwerach.
---------------------------------------------------------------------------------------------------------------------------
-- Zgodnie z za³o¿eniami projektowymi, dane samochodów powinny byæ synchronizowane w celu ujednolcenia oferty firmy we 
-- wszystkich oddzia³ach. Transakcj¹ t¹ nie jest jednak objête uzgadnianie dostêpnoœci samochodów, które mo¿e byæ ró¿ne
-- w poszczególnych oddzia³ach.
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
-- Scenariusz: klient przychodzi do oddzia³u lokalnego i informuje, ¿e ju¿ wypo¿ycza³ samochód w innym oddziale naszej firmy
-- (nieanonimowo). Ewentualnie klient podaje swoje dane, a pracownik sprawdza czy nie zosta³y one ju¿ wprowadzone do systemu.
-- Je¿eli tak, s¹ one kopiowane z oddzia³u zdalnego do bazy lokalnej.
---------------------------------------------------------------------------------------------------------------------------

/*
INSERT LS_SQL2.S19_P3.dbo.Klient
(IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi, IdOddzial)
VALUES
(11, 'Jakub', 'Jaworski', NULL, 'Kraków', 'Jarzêbinowa', '12a', NULL, '30-003', 'Kraków', '+48 512 513 514', 'j.jarzabek@gmail.com', NULL, 2);
GO
*/

SELECT *
FROM dbo.Klient;
GO

SELECT *
FROM LS_SQL2.S19_P3.dbo.Klient;
GO

-- Klienci, których dane zapisane s¹ tylko w bazie zdalnej.
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

-- Przypadek I: kopiowanie danych klienta, który nie jest zarejestrowany w bazie lokalnej.
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
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             1
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             1
3           Ola                  Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             1
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             1
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             1
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             1
7           Konrad               Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             1
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             1
9           Marcin               Marciniak                                NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             1
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             1
11          Jakub                Jaworski                                 NULL                                     Kraków                         Jarzêbinowa                                        12a        NULL       30-003      Kraków                                             +48 512 513 514 j.jarzabek@gmail.com           NULL                                                                                                                                                                                                                                                             1

(11 rows affected)

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Andrzej              Michalak                                 NULL                                     Ostrów Wielkopolski            ¯wirki i Wigury                                    22         NULL       63-400      Ostrów Wielkopolski                                +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             2
2           Micha³               Mietczyñski                              NULL                                     Ostrów Wielkopolski            Konopnicka                                         12         NULL       63-400      Ostrów Wielkopolski                                +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             2
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             2
4           Adam                 Kula                                     NULL                                     Ostrów Wielkopolski            NULL                                               32         NULL       63-400      Ostrów Wielkopolski                                +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             2
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             2
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             2
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             2
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             2
9           Marcin               Borysiuk                                 NULL                                     Ostrów Wielkopolski            Przechodnia                                        3          6          63-400      Ostrów Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             2
10          Marcin               Stefaniak                                NULL                                     Ostrów Wielkopolski            NULL                                               10         NULL       63-400      Ostrów Wielkopolski                                +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             2
11          Jakub                Jaworski                                 NULL                                     Kraków                         Jarzêbinowa                                        12a        NULL       30-003      Kraków                                             +48 512 513 514 j.jarzabek@gmail.com           NULL                                                                                                                                                                                                                                                             2

(11 rows affected)
*/

-- Przypadek II: kopiowanie danych klienta, który nie jest zarejestrowany w bazie lokalnej.
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
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             1
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             1
3           Ola                  Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             1
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             1
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             1
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             1
7           Konrad               Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             1
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             1
9           Marcin               Marciniak                                NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             1
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             1
11          Jakub                Jaworski                                 NULL                                     Kraków                         Jarzêbinowa                                        12a        NULL       30-003      Kraków                                             +48 512 513 514 j.jarzabek@gmail.com           NULL                                                                                                                                                                                                                                                             1
12          Marcin               Borysiuk                                 NULL                                     Ostrów Wielkopolski            Przechodnia                                        3          6          63-400      Ostrów Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             1

(12 rows affected)

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Andrzej              Michalak                                 NULL                                     Ostrów Wielkopolski            ¯wirki i Wigury                                    22         NULL       63-400      Ostrów Wielkopolski                                +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             2
2           Micha³               Mietczyñski                              NULL                                     Ostrów Wielkopolski            Konopnicka                                         12         NULL       63-400      Ostrów Wielkopolski                                +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             2
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             2
4           Adam                 Kula                                     NULL                                     Ostrów Wielkopolski            NULL                                               32         NULL       63-400      Ostrów Wielkopolski                                +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             2
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             2
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             2
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             2
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             2
9           Marcin               Borysiuk                                 NULL                                     Ostrów Wielkopolski            Przechodnia                                        3          6          63-400      Ostrów Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             2
10          Marcin               Stefaniak                                NULL                                     Ostrów Wielkopolski            NULL                                               10         NULL       63-400      Ostrów Wielkopolski                                +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             2
11          Jakub                Jaworski                                 NULL                                     Kraków                         Jarzêbinowa                                        12a        NULL       30-003      Kraków                                             +48 512 513 514 j.jarzabek@gmail.com           NULL                                                                                                                                                                                                                                                             2

(11 rows affected)
*/

-- Przypadek III: kopiowanie danych klienta, który jest zarejestrowany w bazie lokalnej.

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
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             1
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             1
3           Ola                  Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             1
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             1
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             1
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             1
7           Konrad               Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             1
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             1
9           Marcin               Marciniak                                NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             1
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             1
11          Jakub                Jaworski                                 NULL                                     Kraków                         Jarzêbinowa                                        12a        NULL       30-003      Kraków                                             +48 512 513 514 j.jarzabek@gmail.com           NULL                                                                                                                                                                                                                                                             1
12          Marcin               Borysiuk                                 NULL                                     Ostrów Wielkopolski            Przechodnia                                        3          6          63-400      Ostrów Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             1

(12 rows affected)

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            IdOddzial
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Andrzej              Michalak                                 NULL                                     Ostrów Wielkopolski            ¯wirki i Wigury                                    22         NULL       63-400      Ostrów Wielkopolski                                +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             2
2           Micha³               Mietczyñski                              NULL                                     Ostrów Wielkopolski            Konopnicka                                         12         NULL       63-400      Ostrów Wielkopolski                                +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             2
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             2
4           Adam                 Kula                                     NULL                                     Ostrów Wielkopolski            NULL                                               32         NULL       63-400      Ostrów Wielkopolski                                +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             2
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             2
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             2
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             2
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             2
9           Marcin               Borysiuk                                 NULL                                     Ostrów Wielkopolski            Przechodnia                                        3          6          63-400      Ostrów Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             2
10          Marcin               Stefaniak                                NULL                                     Ostrów Wielkopolski            NULL                                               10         NULL       63-400      Ostrów Wielkopolski                                +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             2
11          Jakub                Jaworski                                 NULL                                     Kraków                         Jarzêbinowa                                        12a        NULL       30-003      Kraków                                             +48 512 513 514 j.jarzabek@gmail.com           NULL                                                                                                                                                                                                                                                             2

(11 rows affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (TR3) Obs³uga wypo¿yczeñ z uwzglêdnieniem bie¿¹cej dostêpnoœci samochodu w oddziale lokalnym oraz zdalnym.
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
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci online   2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdPrzeniesienie DataGodzPolecenia       DataGodzOdbioru         IdOddzialZam IdSamochod  Uwagi
--------------- ----------------------- ----------------------- ------------ ----------- ----------------------------------------------------------------------------------------------------

(0 rows affected)
*/

-- Przypadek I: próba wypo¿yczenia auta niedostêpnego w obu oddzia³ach.
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
Samochod niedostêpny w ¿adnym z oddzia³ów.

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
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci online   2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdPrzeniesienie DataGodzPolecenia       DataGodzOdbioru         IdOddzialZam IdSamochod  Uwagi
--------------- ----------------------- ----------------------- ------------ ----------- ----------------------------------------------------------------------------------------------------

(0 rows affected)
*/

-- Przypadek II: wypo¿yczenie auta dostêpnego jedynie w oddziale zdalnym.
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
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci online   2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
11             3           8           3           2               Przelew                   2023-12-11 00:00:00.000 2023-12-11 00:00:00.000 NULL                    80,00                 NULL                  1                  

(11 rows affected)

IdPrzeniesienie DataGodzPolecenia       DataGodzOdbioru         IdOddzialZam IdSamochod  Uwagi
--------------- ----------------------- ----------------------- ------------ ----------- ----------------------------------------------------------------------------------------------------
3               2023-12-11 05:31:03.820 NULL                    1            8           NULL

(1 row affected)
*/

-- Przypadek III: wypo¿yczenie auta dostêpnego w oddziale lokalnym.
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
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci online   2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
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
Kraków                                             Kalisz                                             3               2023-12-11 05:31:03.820 NULL                    8           Q3                   Audi                 2017        NULL

(1 row affected)
*/

---------------------------------------------------------------------------------------------------------------------------
-- (TR4) Automatyczna replikacja danych produktów z jednego oddzia³u do drugiego.
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
Dostawcze            250,00                Samochody dostawcze, które umo¿liwiaj¹ przewóz ró¿nych towarów i materia³ów. Charakteryzuj¹ siê wiêksz¹ przestrzeni¹ ³adunkow¹, wygodnym dostêpem do przestrzeni ³adunkowej oraz ró¿nymi udogodnieniami, takimi jak systemy zabezpieczaj¹ce ³adunek czy uchwyty 
Ekonomiczna          80,00                 Kompaktowe samochody o niskim zu¿yciu paliwa, idealne do codziennych podró¿y miejskich. Posiadaj¹ podstawowe funkcje i wystarczaj¹co du¿o miejsca dla jednej lub dwóch osób.
Elektryczne          200,00                Samochody elektryczne, które s¹ zasilane energi¹ elektryczn¹, co sprawia, ¿e s¹ przyjazne dla œrodowiska i generuj¹ mniejsze emisje. Samochody elektryczne oferuj¹ cich¹ jazdê, niskie koszty eksploatacji i wiêksz¹ efektywnoœæ energetyczn¹. S¹ doskona³ym wyb
Klasyczny/Antyk      400,00                Klasyczne samochody z przesz³oœci, które zachwycaj¹ swoim piêknym wzornictwem i duchem retro. Idealne dla mi³oœników motoryzacji i unikalnych doœwiadczeñ.
Performance          500,00                Potê¿ne samochody z wysokimi osi¹gami, które zapewniaj¹ niezwyk³e wra¿enia z jazdy. Posiadaj¹ zaawansowane systemy napêdowe i sportowe osi¹gi.
Premium              300,00                Luksusowe samochody z najnowszymi funkcjami i eleganckim wykoñczeniem. Zapewniaj¹ wyj¹tkowy komfort, styl i doskona³e osi¹gi. Doskona³e do podró¿y s³u¿bowych lub specjalnych okazji.
Rodzinna             90,00                 Przestronne samochody typu kombi lub SUV, idealne dla rodzin i wiêkszych grup podró¿uj¹cych. Oferuj¹ wygodn¹ przestrzeñ pasa¿ersk¹ i wystarczaj¹c¹ pojemnoœæ baga¿nika.
Sportowe             350,00                Dynamiczne samochody o wysokich osi¹gach i agresywnym designie. Zapewniaj¹ emocjonuj¹ce wra¿enia z jazdy i doskona³¹ reakcjê na drodze.
Super Luxury         600,00                Najwy¿szy poziom luksusu i presti¿u. Oferuje ekskluzywne samochody z najwy¿szym wyposa¿eniem, najnowszymi technologiami i niezrównanym komfortem.
SUV/Terenowe         180,00                Wytrzyma³e samochody terenowe o du¿ej przestrzeni w kabinie pasa¿erskiej i doskona³ych mo¿liwoœciach jazdy w ró¿nych warunkach terenowych. Idealne do podró¿y poza miasto.

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
-- (TR4b) Aktualizowanie wiersza na serwerze zdalnym po wyst¹pieniu zmiany na serwerze lokalnym.
--		  (Procedura wyzwalana typu AFTER + transajcha 2PC.)
---------------------------------------------------------------------------------------------------------------------------
-- Procedura nie replikuje dostêpnoœci samochodu, poniewa¿ mo¿e ona byæ ró¿na w poszczególnych oddzia³ach firmy.
-- Natomiast kopiowany jest status wiersza, który oznacza, czy jest on aktywny, czy nie (archiwalny)
-- - zastêpuj¹c fizyczne usuniêcie.
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
Dostawcze            250,00                Samochody dostawcze, które umo¿liwiaj¹ przewóz ró¿nych towarów i materia³ów. Charakteryzuj¹ siê wiêksz¹ przestrzeni¹ ³adunkow¹, wygodnym dostêpem do przestrzeni ³adunkowej oraz ró¿nymi udogodnieniami, takimi jak systemy zabezpieczaj¹ce ³adunek czy uchwyty 
Ekonomiczna          80,00                 Kompaktowe samochody o niskim zu¿yciu paliwa, idealne do codziennych podró¿y miejskich. Posiadaj¹ podstawowe funkcje i wystarczaj¹co du¿o miejsca dla jednej lub dwóch osób.
Elektryczne          200,00                Samochody elektryczne, które s¹ zasilane energi¹ elektryczn¹, co sprawia, ¿e s¹ przyjazne dla œrodowiska i generuj¹ mniejsze emisje. Samochody elektryczne oferuj¹ cich¹ jazdê, niskie koszty eksploatacji i wiêksz¹ efektywnoœæ energetyczn¹. S¹ doskona³ym wyb
Klasyczny/Antyk      400,00                Klasyczne samochody z przesz³oœci, które zachwycaj¹ swoim piêknym wzornictwem i duchem retro. Idealne dla mi³oœników motoryzacji i unikalnych doœwiadczeñ.
Performance          500,00                Potê¿ne samochody z wysokimi osi¹gami, które zapewniaj¹ niezwyk³e wra¿enia z jazdy. Posiadaj¹ zaawansowane systemy napêdowe i sportowe osi¹gi.
Premium              300,00                Luksusowe samochody z najnowszymi funkcjami i eleganckim wykoñczeniem. Zapewniaj¹ wyj¹tkowy komfort, styl i doskona³e osi¹gi. Doskona³e do podró¿y s³u¿bowych lub specjalnych okazji.
Rodzinna             90,00                 Przestronne samochody typu kombi lub SUV, idealne dla rodzin i wiêkszych grup podró¿uj¹cych. Oferuj¹ wygodn¹ przestrzeñ pasa¿ersk¹ i wystarczaj¹c¹ pojemnoœæ baga¿nika.
Sportowe             350,00                Dynamiczne samochody o wysokich osi¹gach i agresywnym designie. Zapewniaj¹ emocjonuj¹ce wra¿enia z jazdy i doskona³¹ reakcjê na drodze.
Super Luxury         600,00                Najwy¿szy poziom luksusu i presti¿u. Oferuje ekskluzywne samochody z najwy¿szym wyposa¿eniem, najnowszymi technologiami i niezrównanym komfortem.
SUV/Terenowe         180,00                Wytrzyma³e samochody terenowe o du¿ej przestrzeni w kabinie pasa¿erskiej i doskona³ych mo¿liwoœciach jazdy w ró¿nych warunkach terenowych. Idealne do podró¿y poza miasto.

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
-- Nie ma potrzeby realizowania tej zmiany do serwera zdalnego, poniewa¿ zostanie ona tam przes³ana przez procedur¹
-- wyzwalan¹ obs³uguj¹c¹ operacjê UPDATE.
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
Dostawcze            250,00                Samochody dostawcze, które umo¿liwiaj¹ przewóz ró¿nych towarów i materia³ów. Charakteryzuj¹ siê wiêksz¹ przestrzeni¹ ³adunkow¹, wygodnym dostêpem do przestrzeni ³adunkowej oraz ró¿nymi udogodnieniami, takimi jak systemy zabezpieczaj¹ce ³adunek czy uchwyty 
Ekonomiczna          80,00                 Kompaktowe samochody o niskim zu¿yciu paliwa, idealne do codziennych podró¿y miejskich. Posiadaj¹ podstawowe funkcje i wystarczaj¹co du¿o miejsca dla jednej lub dwóch osób.
Elektryczne          200,00                Samochody elektryczne, które s¹ zasilane energi¹ elektryczn¹, co sprawia, ¿e s¹ przyjazne dla œrodowiska i generuj¹ mniejsze emisje. Samochody elektryczne oferuj¹ cich¹ jazdê, niskie koszty eksploatacji i wiêksz¹ efektywnoœæ energetyczn¹. S¹ doskona³ym wyb
Klasyczny/Antyk      400,00                Klasyczne samochody z przesz³oœci, które zachwycaj¹ swoim piêknym wzornictwem i duchem retro. Idealne dla mi³oœników motoryzacji i unikalnych doœwiadczeñ.
Performance          500,00                Potê¿ne samochody z wysokimi osi¹gami, które zapewniaj¹ niezwyk³e wra¿enia z jazdy. Posiadaj¹ zaawansowane systemy napêdowe i sportowe osi¹gi.
Premium              300,00                Luksusowe samochody z najnowszymi funkcjami i eleganckim wykoñczeniem. Zapewniaj¹ wyj¹tkowy komfort, styl i doskona³e osi¹gi. Doskona³e do podró¿y s³u¿bowych lub specjalnych okazji.
Rodzinna             90,00                 Przestronne samochody typu kombi lub SUV, idealne dla rodzin i wiêkszych grup podró¿uj¹cych. Oferuj¹ wygodn¹ przestrzeñ pasa¿ersk¹ i wystarczaj¹c¹ pojemnoœæ baga¿nika.
Sportowe             350,00                Dynamiczne samochody o wysokich osi¹gach i agresywnym designie. Zapewniaj¹ emocjonuj¹ce wra¿enia z jazdy i doskona³¹ reakcjê na drodze.
Super Luxury         600,00                Najwy¿szy poziom luksusu i presti¿u. Oferuje ekskluzywne samochody z najwy¿szym wyposa¿eniem, najnowszymi technologiami i niezrównanym komfortem.
SUV/Terenowe         180,00                Wytrzyma³e samochody terenowe o du¿ej przestrzeni w kabinie pasa¿erskiej i doskona³ych mo¿liwoœciach jazdy w ró¿nych warunkach terenowych. Idealne do podró¿y poza miasto.

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
Aktualizacja danych przy braku dostêpu do serwera zdalnego (wy³¹czony).
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