---------------------------------------------------------------------------------------
-- SRBD_C4: projektowanie i konfigurowanie rozproszonej bazy danych.
---------------------------------------------------------------------------------------

-- Pobranie wierszy z tabeli w bazie lokalnej.
--
SELECT *
FROM dbo.Klient;
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL

(10 rows affected)
*/

-- Pobranie wierszy w tabeli w bazie zdalnej - poprzez serwer po³¹czony "LS_SQL2".
--
SELECT *
FROM LS_SQL2.S19_C4.dbo.Klient;
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Andrzej              Michalak                                 NULL                                     Ostrów Wielkopolski            ¯wirki i Wigury                                    22         NULL       63-400      Ostrów Wielkopolski                                +48 553 512 420 andrzej.marciniak@gmail.com    NULL
2           Micha³               Mietczyñski                              NULL                                     Ostrów Wielkopolski            Konopnicka                                         12         NULL       63-400      Ostrów Wielkopolski                                +48 593 439 941 michal.mietczynski@wp.pl       NULL
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL
4           Adam                 Kula                                     NULL                                     Ostrów Wielkopolski            NULL                                               32         NULL       63-400      Ostrów Wielkopolski                                +48 521 139 953 adam.kula@onet.pl              NULL
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL
9           Marcin               Borysiuk                                 NULL                                     Ostrów Wielkopolski            Przechodnia                                        3          6          63-400      Ostrów Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL
10          Marcin               Stefaniak                                NULL                                     Ostrów Wielkopolski            NULL                                               10         NULL       63-400      Ostrów Wielkopolski                                +48 62 4264 321 m.stefaniak123@wp.pl           NULL

(10 rows affected)
*/

---------------------------------------------------------------------------------------
-- Suma wierszy z tabeli w bazie lokalnej i zaldnej - bez powtórzeñ.
--
SELECT IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi
FROM dbo.Klient

UNION -- Operator sumy wierszy - bez powtórzeñ.

SELECT IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi
FROM LS_SQL2.S19_C4.dbo.Klient;
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL
1           Andrzej              Michalak                                 NULL                                     Ostrów Wielkopolski            ¯wirki i Wigury                                    22         NULL       63-400      Ostrów Wielkopolski                                +48 553 512 420 andrzej.marciniak@gmail.com    NULL
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL
2           Micha³               Mietczyñski                              NULL                                     Ostrów Wielkopolski            Konopnicka                                         12         NULL       63-400      Ostrów Wielkopolski                                +48 593 439 941 michal.mietczynski@wp.pl       NULL
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL
4           Adam                 Kula                                     NULL                                     Ostrów Wielkopolski            NULL                                               32         NULL       63-400      Ostrów Wielkopolski                                +48 521 139 953 adam.kula@onet.pl              NULL
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL
9           Marcin               Borysiuk                                 NULL                                     Ostrów Wielkopolski            Przechodnia                                        3          6          63-400      Ostrów Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL
10          Marcin               Stefaniak                                NULL                                     Ostrów Wielkopolski            NULL                                               10         NULL       63-400      Ostrów Wielkopolski                                +48 62 4264 321 m.stefaniak123@wp.pl           NULL
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL

(15 rows affected)
*/

---------------------------------------------------------------------------------------
-- Suma wierszy z tabeli w bazie lokalnej i zaldnej - z powtórzeniami.
--
SELECT IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi
FROM dbo.Klient

UNION ALL -- Operator sumy wierszy - z powtórzeniami.

SELECT IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi
FROM LS_SQL2.S19_C4.dbo.Klient;
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL
1           Andrzej              Michalak                                 NULL                                     Ostrów Wielkopolski            ¯wirki i Wigury                                    22         NULL       63-400      Ostrów Wielkopolski                                +48 553 512 420 andrzej.marciniak@gmail.com    NULL
2           Micha³               Mietczyñski                              NULL                                     Ostrów Wielkopolski            Konopnicka                                         12         NULL       63-400      Ostrów Wielkopolski                                +48 593 439 941 michal.mietczynski@wp.pl       NULL
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL
4           Adam                 Kula                                     NULL                                     Ostrów Wielkopolski            NULL                                               32         NULL       63-400      Ostrów Wielkopolski                                +48 521 139 953 adam.kula@onet.pl              NULL
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL
9           Marcin               Borysiuk                                 NULL                                     Ostrów Wielkopolski            Przechodnia                                        3          6          63-400      Ostrów Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL
10          Marcin               Stefaniak                                NULL                                     Ostrów Wielkopolski            NULL                                               10         NULL       63-400      Ostrów Wielkopolski                                +48 62 4264 321 m.stefaniak123@wp.pl           NULL

(20 rows affected)
*/

---------------------------------------------------------------------------------------
-- Suma wierszy z tabeli w bazie lokalnej i zaldnej - z powtórzeniami (sortowanie wyniku).
--
SELECT IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi
FROM dbo.Klient

UNION ALL -- Operator sumy wierszy - z powtórzeniami.

SELECT IdKlient, Imie, Nazwisko, Nazwa, Miejscowosc, Ulica, NrDomu, NrLokalu, KodPocztowy, Poczta, NrTelefonu, AdresMail, Uwagi
FROM LS_SQL2.S19_C4.dbo.Klient
ORDER BY Nazwisko ASC, Imie ASC;
GO

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL
9           Marcin               Borysiuk                                 NULL                                     Ostrów Wielkopolski            Przechodnia                                        3          6          63-400      Ostrów Wielkopolski                                +48 51 1512 532 m.borysiuk56@gmail.com         NULL
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL
4           Adam                 Kula                                     NULL                                     Ostrów Wielkopolski            NULL                                               32         NULL       63-400      Ostrów Wielkopolski                                +48 521 139 953 adam.kula@onet.pl              NULL
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL
1           Andrzej              Michalak                                 NULL                                     Ostrów Wielkopolski            ¯wirki i Wigury                                    22         NULL       63-400      Ostrów Wielkopolski                                +48 553 512 420 andrzej.marciniak@gmail.com    NULL
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL
2           Micha³               Mietczyñski                              NULL                                     Ostrów Wielkopolski            Konopnicka                                         12         NULL       63-400      Ostrów Wielkopolski                                +48 593 439 941 michal.mietczynski@wp.pl       NULL
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL
10          Marcin               Stefaniak                                NULL                                     Ostrów Wielkopolski            NULL                                               10         NULL       63-400      Ostrów Wielkopolski                                +48 62 4264 321 m.stefaniak123@wp.pl           NULL

(20 rows affected)
*/

---------------------------------------------------------------------------------------
-- Suma wierszy z tabeli w bazie lokalnej i zaldnej - z powtórzeniami (sortowanie wyniku).
--
SELECT IdKlient, Imie, Nazwisko, Miejscowosc, KodPocztowy, 'Kalisz' AS [Oddzial]
FROM dbo.Klient

UNION ALL -- Operator sumy wierszy - z powtórzeniami.

SELECT IdKlient, Imie, Nazwisko, Miejscowosc, KodPocztowy, 'Ostrów Wkl' AS [Oddzial]
FROM LS_SQL2.S19_C4.dbo.Klient
ORDER BY Nazwisko ASC, Imie ASC;
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    KodPocztowy Oddzial
----------- -------------------- ---------------------------------------- ------------------------------ ----------- ----------
9           Marcin               Borysiuk                                 Kalisz                         62-800      Kalisz
9           Marcin               Borysiuk                                 Ostrów Wielkopolski            63-400      Ostrów Wkl
7           Jan                  Kowalski                                 Kalisz                         62-800      Ostrów Wkl
7           Jan                  Kowalski                                 Kalisz                         62-800      Kalisz
8           Robert               Kowalski                                 Konin                          62-500      Kalisz
8           Robert               Kowalski                                 Konin                          62-500      Ostrów Wkl
4           Adam                 Kula                                     Ostrów Wielkopolski            63-400      Ostrów Wkl
4           Adam                 Kula                                     Pruszków                       62-800      Kalisz
1           Andrzej              Michalak                                 Kalisz                         62-800      Kalisz
1           Andrzej              Michalak                                 Ostrów Wielkopolski            63-400      Ostrów Wkl
3           Aleksandra           Michalik                                 Kalisz                         62-800      Ostrów Wkl
3           Aleksandra           Michalik                                 Kalisz                         62-800      Kalisz
2           Micha³               Mietczyñski                              Ostrów Wielkopolski            63-400      Ostrów Wkl
2           Micha³               Mietczyñski                              Kalisz                         62-800      Kalisz
5           Zuzanna              Paj¹k                                    Konin                          62-500      Kalisz
5           Zuzanna              Paj¹k                                    Konin                          62-500      Ostrów Wkl
6           Konrad               Rusek                                    Ostrów Wielkopolski            63-400      Ostrów Wkl
6           Konrad               Rusek                                    Ostrów Wielkopolski            63-400      Kalisz
10          Marcin               Stefaniak                                Warszówka                      62-800      Kalisz
10          Marcin               Stefaniak                                Ostrów Wielkopolski            63-400      Ostrów Wkl

(20 rows affected)
*/

---------------------------------------------------------------------------------------
-- Czêœæ wspólna wierszy z tabeli w bazie lokalnej i zaldnej.
--

SELECT IdKlient, Imie, Nazwisko, Miejscowosc, KodPocztowy
FROM dbo.Klient

INTERSECT -- Operator iloczynu zbiorów.

SELECT IdKlient, Imie, Nazwisko, Miejscowosc, KodPocztowy
FROM LS_SQL2.S19_C4.dbo.Klient
ORDER BY Nazwisko ASC, Imie ASC;
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    KodPocztowy
----------- -------------------- ---------------------------------------- ------------------------------ -----------
7           Jan                  Kowalski                                 Kalisz                         62-800
8           Robert               Kowalski                                 Konin                          62-500
3           Aleksandra           Michalik                                 Kalisz                         62-800
5           Zuzanna              Paj¹k                                    Konin                          62-500
6           Konrad               Rusek                                    Ostrów Wielkopolski            63-400

(5 rows affected)
*/

---------------------------------------------------------------------------------------
-- Ró¿nica wierszy z tabeli lokalnej i zdalnej.
--

SELECT IdKlient, Imie, Nazwisko, Miejscowosc, KodPocztowy
FROM dbo.Klient

EXCEPT -- Operator ró¿nicy zbiorów.

SELECT IdKlient, Imie, Nazwisko, Miejscowosc, KodPocztowy
FROM LS_SQL2.S19_C4.dbo.Klient
ORDER BY Nazwisko ASC, Imie ASC;
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    KodPocztowy
----------- -------------------- ---------------------------------------- ------------------------------ -----------
9           Marcin               Borysiuk                                 Kalisz                         62-800
4           Adam                 Kula                                     Pruszków                       62-800
1           Andrzej              Michalak                                 Kalisz                         62-800
2           Micha³               Mietczyñski                              Kalisz                         62-800
10          Marcin               Stefaniak                                Warszówka                      62-800

(5 rows affected)
*/

---------------------------------------------------------------------------------------
-- Ró¿nica wierszy z tabeli zdalnej i lokalnej.
--

SELECT IdKlient, Imie, Nazwisko, Miejscowosc, KodPocztowy
FROM LS_SQL2.S19_C4.dbo.Klient

EXCEPT -- Operator ró¿nicy zbiorów.

SELECT IdKlient, Imie, Nazwisko, Miejscowosc, KodPocztowy
FROM dbo.Klient
ORDER BY Nazwisko ASC, Imie ASC;
GO

/*
IdKlient    Imie                 Nazwisko                                 Miejscowosc                    KodPocztowy
----------- -------------------- ---------------------------------------- ------------------------------ -----------
9           Marcin               Borysiuk                                 Ostrów Wielkopolski            63-400
4           Adam                 Kula                                     Ostrów Wielkopolski            63-400
1           Andrzej              Michalak                                 Ostrów Wielkopolski            63-400
2           Micha³               Mietczyñski                              Ostrów Wielkopolski            63-400
10          Marcin               Stefaniak                                Ostrów Wielkopolski            63-400

(5 rows affected)
*/

---------------------------------------------------------------------------------------
-- Koniec.
---------------------------------------------------------------------------------------