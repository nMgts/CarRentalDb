---------------------------------------------------------------------------------------------------
-- SRBD_P2: transakcje i wspó³bie¿noœæ.
---------------------------------------------------------------------------------------------------
-- Dokumentacja testowania.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- T1. Archiwizowanie danych pracownika.
---------------------------------------------------------------------------------------------------
-- Procedura: "dbo.Pracownik_Archiwizuj".
---------------------------------------------------------------------------------------------------

/*
SELECT *
FROM dbo.Pracownik;
GO

SELECT *
FROM dbo.Pracownik_Kopia;
GO

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
1           Pawe³                Malczyñski                               W³aœciciel                               +48 589 593 943 p_malczynski1@gmail.com
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl
3           Micha³               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl
5           Anna                 £awniczak                                Dzia³ marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com
6           Amadeusz             Kaczyñski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl
7           Jolanta              Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com
8           Miros³aw             Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl
9           Klaudia              Kuku³ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
10          Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl

(10 rows affected)

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail                      DataArchiwizacji
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------ -----------------------

(0 rows affected)

*/

/*
INSERT dbo.Pracownik
(IdPracownik, Imie, Nazwisko, Stanowisko, NrTelefonu, AdresMail)
VALUES
(11, 'Cris', 'Cononovitch', 'gwiazdor', '+48 500 300 500', 'cris.cononovitch@firma.pl');
GO

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
1           Pawe³                Malczyñski                               W³aœciciel                               +48 589 593 943 p_malczynski1@gmail.com
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl
3           Micha³               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl
5           Anna                 £awniczak                                Dzia³ marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com
6           Amadeusz             Kaczyñski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl
7           Jolanta              Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com
8           Miros³aw             Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl
9           Klaudia              Kuku³ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
10          Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl
11          Cris                 Cononovitch                              gwiazdor                                 +48 500 300 500 cris.cononovitch@firma.pl

(11 rows affected)

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail                      DataArchiwizacji
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------ -----------------------

(0 rows affected)
*/

--------------------------------------------------------------------------------------------------
-- TEST (a): wywo³anie transakcji bez b³êdów.
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.Pracownik_Archiwizuj
@Par_IdPracownik = 11;
GO
*/

/*
(1 row affected)

(1 row affected)

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
1           Pawe³                Malczyñski                               W³aœciciel                               +48 589 593 943 p_malczynski1@gmail.com
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl
3           Micha³               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl
5           Anna                 £awniczak                                Dzia³ marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com
6           Amadeusz             Kaczyñski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl
7           Jolanta              Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com
8           Miros³aw             Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl
9           Klaudia              Kuku³ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
10          Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl

(10 rows affected)

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail                      DataArchiwizacji
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------ -----------------------
11          Cris                 Cononovitch                              gwiazdor                                 +48 500 300 500 cris.cononovitch@firma.pl      2023-11-09 16:53:20.680

(1 row affected)

Wynik: archiwizacja wiersza przebieg³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (b): wywo³anie z b³êdem czasu wykonania (ang. runtime error).
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.Pracownik_Archiwizuj
@Par_IdPracownik = 11;
GO
*/

/*
Msg 2627, Level 14, State 1, Procedure dbo.Pracownik_Archiwizuj, Line 9 [Batch Start Line 116]
Violation of PRIMARY KEY constraint 'PK__Pracowni__0B6036819C399708'. Cannot insert duplicate key in object 'dbo.Pracownik_Kopia'. The duplicate key value is (11).
*/

/*
IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
1           Pawe³                Malczyñski                               W³aœciciel                               +48 589 593 943 p_malczynski1@gmail.com
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl
3           Micha³               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl
5           Anna                 £awniczak                                Dzia³ marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com
6           Amadeusz             Kaczyñski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl
7           Jolanta              Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com
8           Miros³aw             Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl
9           Klaudia              Kuku³ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
10          Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl
11          Cris                 Cononovitch                              gwiazdor                                 +48 500 300 500 cris.cononovitch@firma.pl

(11 rows affected)

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail                      DataArchiwizacji
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------ -----------------------
11          Cris                 Cononovitch                              gwiazdor                                 +48 500 300 500 cris.cononovitch@firma.pl      2023-11-09 16:53:20.680

(1 row affected)

Wynik: po wyst¹pieniu b³êdu czasu wykonania transakcja zosta³a przerwana i wycofana,
w tabelach nie zosta³y dokonane ¿adne zmiany.
*/

--------------------------------------------------------------------------------------------------
-- TEST (c): wywo³anie z przerwaniem transakcji w œrodku (WAITFOR DELAY).
--------------------------------------------------------------------------------------------------

/*
DELETE dbo.Pracownik_Kopia
WHERE IdPracownik = 11;
GO
*/

/*
EXECUTE dbo.Pracownik_Archiwizuj
@Par_IdPracownik = 11;
GO
*/

/*
(1 row affected)
Query was canceled by user.

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------
1           Pawe³                Malczyñski                               W³aœciciel                               +48 589 593 943 p_malczynski1@gmail.com
2           Mariusz              Iwaniuk                                  Sprzedawca                               +48 585 432 944 mariusz_iw123@wp.pl
3           Micha³               Kowalczyk                                Sprzedawca                               +48 592 123 543 m.kowalczyk@gmail.com
4           Marcin               Maciejuk                                 Sprzedawca                               +48 53 3426 423 iwnmck@onet.pl
5           Anna                 £awniczak                                Dzia³ marketingu i reklamy               +48 509 350 533 anna.lawniczak@gmail.com
6           Amadeusz             Kaczyñski                                Kierownik                                +48 59 2232 436 a_kaczynski@wp.pl
7           Jolanta              Kaczmarek                                Inspektor pojazdów                       +48 593 993 732 jolana.kaczmarek@gmail.com
8           Miros³aw             Steczyñski                               Specjalista ds. obs³ugi klienta online   +48 577 593 433 miroslaw.steczynski94@wp.pl
9           Klaudia              Kuku³ka                                  Administrator systemu                    +48 583 553 523 klaudia.kukulka@gmail.com
10          Marcel               Winiecki                                 Konsultant ubezpieczeniowy               +48 503 463 553 marcel_win85@wp.pl
11          Cris                 Cononovitch                              gwiazdor                                 +48 500 300 500 cris.cononovitch@firma.pl

(11 rows affected)

IdPracownik Imie                 Nazwisko                                 Stanowisko                               NrTelefonu      AdresMail                      DataArchiwizacji
----------- -------------------- ---------------------------------------- ---------------------------------------- --------------- ------------------------------ -----------------------

(0 rows affected)

Wynik: po uruchumieniu transakcji wiersz zosta³ skopiowany z tabeli Ÿród³owej do archiwum, 
ale po przerwaniu transakcji b³¹d zosta³ stamt¹d automatycznie usuniêty.
*/

---------------------------------------------------------------------------------------------------
-- T2. Rejestrowanie zmian cen kategorii w czasie.
---------------------------------------------------------------------------------------------------
-- Procedura: "dbo.Kategoria_Zmien".
---------------------------------------------------------------------------------------------------

/*
SELECT *
FROM dbo.Kategoria;
GO

SELECT *
FROM dbo.Kategoria_CenaHistoria;
GO

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

IdKategoriaCenaHistoria Kategoria            DataGodzZmiany          CenaPoprzednia        CenaNowa
----------------------- -------------------- ----------------------- --------------------- ---------------------

(0 rows affected)
*/

--------------------------------------------------------------------------------------------------
-- TEST (a): wywo³anie transakcji bez b³êdów.
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.Kategoria_ZmienCene
@Par_Kategoria = 'Sportowe',
@Par_Cena = 400;
GO
*/

/*
(1 row affected)

(1 row affected)

Kategoria            Cena                  Opis
-------------------- --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Dostawcze            250,00                Samochody dostawcze, które umo¿liwiaj¹ przewóz ró¿nych towarów i materia³ów. Charakteryzuj¹ siê wiêksz¹ przestrzeni¹ ³adunkow¹, wygodnym dostêpem do przestrzeni ³adunkowej oraz ró¿nymi udogodnieniami, takimi jak systemy zabezpieczaj¹ce ³adunek czy uchwyty 
Ekonomiczna          80,00                 Kompaktowe samochody o niskim zu¿yciu paliwa, idealne do codziennych podró¿y miejskich. Posiadaj¹ podstawowe funkcje i wystarczaj¹co du¿o miejsca dla jednej lub dwóch osób.
Elektryczne          200,00                Samochody elektryczne, które s¹ zasilane energi¹ elektryczn¹, co sprawia, ¿e s¹ przyjazne dla œrodowiska i generuj¹ mniejsze emisje. Samochody elektryczne oferuj¹ cich¹ jazdê, niskie koszty eksploatacji i wiêksz¹ efektywnoœæ energetyczn¹. S¹ doskona³ym wyb
Klasyczny/Antyk      400,00                Klasyczne samochody z przesz³oœci, które zachwycaj¹ swoim piêknym wzornictwem i duchem retro. Idealne dla mi³oœników motoryzacji i unikalnych doœwiadczeñ.
Performance          500,00                Potê¿ne samochody z wysokimi osi¹gami, które zapewniaj¹ niezwyk³e wra¿enia z jazdy. Posiadaj¹ zaawansowane systemy napêdowe i sportowe osi¹gi.
Premium              300,00                Luksusowe samochody z najnowszymi funkcjami i eleganckim wykoñczeniem. Zapewniaj¹ wyj¹tkowy komfort, styl i doskona³e osi¹gi. Doskona³e do podró¿y s³u¿bowych lub specjalnych okazji.
Rodzinna             90,00                 Przestronne samochody typu kombi lub SUV, idealne dla rodzin i wiêkszych grup podró¿uj¹cych. Oferuj¹ wygodn¹ przestrzeñ pasa¿ersk¹ i wystarczaj¹c¹ pojemnoœæ baga¿nika.
Sportowe             400,00                Dynamiczne samochody o wysokich osi¹gach i agresywnym designie. Zapewniaj¹ emocjonuj¹ce wra¿enia z jazdy i doskona³¹ reakcjê na drodze.
Super Luxury         600,00                Najwy¿szy poziom luksusu i presti¿u. Oferuje ekskluzywne samochody z najwy¿szym wyposa¿eniem, najnowszymi technologiami i niezrównanym komfortem.
SUV/Terenowe         180,00                Wytrzyma³e samochody terenowe o du¿ej przestrzeni w kabinie pasa¿erskiej i doskona³ych mo¿liwoœciach jazdy w ró¿nych warunkach terenowych. Idealne do podró¿y poza miasto.

(10 rows affected)

IdKategoriaCenaHistoria Kategoria            DataGodzZmiany          CenaPoprzednia        CenaNowa
----------------------- -------------------- ----------------------- --------------------- ---------------------
1                       Sportowe             2023-11-12 00:24:01.260 350,00                400,00

(1 row affected)
*/

/*
EXECUTE dbo.Kategoria_ZmienCene
@Par_Kategoria = 'Sportowe',
@Par_Cena = 350;
GO
*/

/*
(1 row affected)

(1 row affected)

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

IdKategoriaCenaHistoria Kategoria            DataGodzZmiany          CenaPoprzednia        CenaNowa
----------------------- -------------------- ----------------------- --------------------- ---------------------
1                       Sportowe             2023-11-12 00:24:01.260 350,00                400,00
2                       Sportowe             2023-11-12 00:25:09.293 400,00                350,00

(2 rows affected)

Wynik: zmiana ceny kategorii i zapisanie tego faktu w tabeli przebieg³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (b): wywo³anie z b³êdem czasu wykonania (ang. runtime error).
--------------------------------------------------------------------------------------------------

/*
-- Próba naruszenia regu³y ograniczenia CHECK "CK_Kategoria_Cena"
-- (cena kategorii nie mo¿e byæ ujemna).

EXECUTE dbo.Kategoria_ZmienCene
@Par_Kategoria = 'Sportowe',
@Par_Cena = -350;
GO
*/

/*
Msg 547, Level 16, State 0, Procedure dbo.Kategoria_ZmienCene, Line 19 [Batch Start Line 317]
The UPDATE statement conflicted with the CHECK constraint "CK_Kategoria_Cena". The conflict occurred in database "S19_P2", table "dbo.Kategoria", column 'Cena'.

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

IdKategoriaCenaHistoria Kategoria            DataGodzZmiany          CenaPoprzednia        CenaNowa
----------------------- -------------------- ----------------------- --------------------- ---------------------
1                       Sportowe             2023-11-12 00:24:01.260 350,00                400,00
2                       Sportowe             2023-11-12 00:25:09.293 400,00                350,00

(2 rows affected)

Wynik: brak zmian w obu tabelach, transakcja dzia³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (c): wywo³anie z przerwaniem transakcji w œrodku (WAITFOR DELAY).
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.Kategoria_ZmienCene
@Par_Kategoria = 'Sportowe',
@Par_Cena = 350;
GO
*/

/*
(1 row affected)
Query was canceled by user.

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

IdKategoriaCenaHistoria Kategoria            DataGodzZmiany          CenaPoprzednia        CenaNowa
----------------------- -------------------- ----------------------- --------------------- ---------------------
1                       Sportowe             2023-11-09 17:17:56.963 350,00                400,00
2                       Sportowe             2023-11-09 17:19:23.823 400,00                350,00

(2 rows affected)

Wynik: wycofana transakcja nie spowodowa³a ¿adnych zmian, transakcja dzia³a zgodnie z za³o¿eniami.
*/

---------------------------------------------------------------------------------------------------
-- T3. Synchronizacja danych wypo¿yczenia, dodanej us³ugi oraz us³ugi.
-- (a) Dodawanie us³ugi do wypo¿yczenia.
---------------------------------------------------------------------------------------------------
-- Procedura "dbo.WypozyczenieUsluga_Dodaj"
---------------------------------------------------------------------------------------------------

/*
SELECT *
FROM dbo.Wypozyczenie;
GO

SELECT *
FROM dbo.WypozyczenieUsluga;
GO

SELECT *
FROM dbo.Usluga;
GO
*/

/*
IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1                    4              1           NULL
2                    4              2           NULL
3                    4              6           NULL
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL

(10 rows affected)

IdUsluga    Nazwa                          Cena                  Opis                                                                                                                                                                                                                                                             Dostepnosc
----------- ------------------------------ --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Pakiet clean                   50,00                 Us³uga, która zwalnia klientów z koniecznoœci mycia samochodu przed zwrotem. Wypo¿yczalnia dba o czystoœæ zarówno wewn¹trz, jak i na zewn¹trz pojazdu                                                                                                            NULL
2           Pakiet refuel                  450,00                Us³uga, która zwalnia klientów z koniecznoœci tankowania paliwa przed zwrotem samochodu. Wypo¿yczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient mo¿e zwróciæ samochód bez zmartwieñ o puste zbiorniki paliwa.                              NULL
3           Us³uga Wi-Fi Mobilnego         100,00                Us³uga zapewniaj¹ca dostêp do mobilnego Wi-Fi w samochodzie. Klienci mog¹ cieszyæ siê po³¹czeniem internetowym w trakcie podró¿y, umo¿liwiaj¹c ³atwy dostêp do map, informacji o ruchu drogowym i komunikacji online.                                            NULL
4           Us³uga Transferu Lotniskowego  400,00                Us³uga dostêpna na lotniskach, która umo¿liwia klientom wynajem samochodu bezpoœrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport miêdzy lotniskiem a miejscem docelowym.                              NULL
5           Us³uga Dostawy                 180,00                Klientom oferuje siê dostawê samochodu bezpoœrednio pod wskazany adres na terenie miasta. Pracownik wypo¿yczalni dostarcza i odbiera pojazd, umo¿liwiaj¹c wygodne i bezproblemowe korzystanie z us³ugi.                                                          NULL
6           Animal friendly                80,00                 Us³uga dedykowana klientom podró¿uj¹cym ze swoimi zwierzêtami. Wypo¿yczalnia samochodów zapewnia specjalne wyposa¿enie, takie jak transporter lub siatkê oddzielaj¹c¹ baga¿nik, aby zapewniæ bezpieczne i wygodne podró¿owanie zwierz¹t. Dodatkowo, mo¿na skorzy 4
7           Us³uga Przekraczania Granic    300,00                Dodatkowa opcja dla klientów planuj¹cych podró¿ zagraniczn¹. Wypo¿yczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umo¿liwiaj¹c swobodne przekraczanie granic i korzystanie z samochodu za granic¹.                                                      NULL
8           Pakiet equipment               60,00                 Wypo¿yczalnia oferuje dodatkowy sprzêt, tak jak baga¿niki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umo¿liwiæ klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.                                                                  4
9           VIP Chauffeur Experience       1000,00               Ekskluzywny pakiet, który zapewnia niezapomniane doœwiadczenie podró¿y z profesjonalnym szoferem. Klienci mog¹ cieszyæ siê pe³nym komfortem i luksusem, podczas gdy doœwiadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie siê. Ten pakiet jest ide 4
10          Pakiet Weekendowy              200,00                Specjalny pakiet dla klientów, którzy planuj¹ weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umo¿liwiaj¹c pe³ne wykorzystanie czasu na krótk¹ podró¿.                                                              NULL

(10 rows affected)
*/

--------------------------------------------------------------------------------------------------
-- TEST (a1): wywo³anie transakcji bez b³êdów.
-- 1: Pole "Dostepnosc" dla wiersza w tabeli [Usluga] nie jest nullem.
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.WypozyczenieUsluga_Dodaj
@Par_IdWypozyczenieUsluga = 11,
@Par_IdWypozyczenie = 3,
@Par_IdUsluga = 9,
@Par_Uwagi = 'Brak';
GO
*/

/*
(1 row affected)

(1 row affected)

(1 row affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 1400,00               700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1                    4              1           NULL
2                    4              2           NULL
3                    4              6           NULL
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL
11                   3              9           Brak

(11 rows affected)

IdUsluga    Nazwa                          Cena                  Opis                                                                                                                                                                                                                                                             Dostepnosc
----------- ------------------------------ --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Pakiet clean                   50,00                 Us³uga, która zwalnia klientów z koniecznoœci mycia samochodu przed zwrotem. Wypo¿yczalnia dba o czystoœæ zarówno wewn¹trz, jak i na zewn¹trz pojazdu                                                                                                            NULL
2           Pakiet refuel                  450,00                Us³uga, która zwalnia klientów z koniecznoœci tankowania paliwa przed zwrotem samochodu. Wypo¿yczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient mo¿e zwróciæ samochód bez zmartwieñ o puste zbiorniki paliwa.                              NULL
3           Us³uga Wi-Fi Mobilnego         100,00                Us³uga zapewniaj¹ca dostêp do mobilnego Wi-Fi w samochodzie. Klienci mog¹ cieszyæ siê po³¹czeniem internetowym w trakcie podró¿y, umo¿liwiaj¹c ³atwy dostêp do map, informacji o ruchu drogowym i komunikacji online.                                            NULL
4           Us³uga Transferu Lotniskowego  400,00                Us³uga dostêpna na lotniskach, która umo¿liwia klientom wynajem samochodu bezpoœrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport miêdzy lotniskiem a miejscem docelowym.                              NULL
5           Us³uga Dostawy                 180,00                Klientom oferuje siê dostawê samochodu bezpoœrednio pod wskazany adres na terenie miasta. Pracownik wypo¿yczalni dostarcza i odbiera pojazd, umo¿liwiaj¹c wygodne i bezproblemowe korzystanie z us³ugi.                                                          NULL
6           Animal friendly                80,00                 Us³uga dedykowana klientom podró¿uj¹cym ze swoimi zwierzêtami. Wypo¿yczalnia samochodów zapewnia specjalne wyposa¿enie, takie jak transporter lub siatkê oddzielaj¹c¹ baga¿nik, aby zapewniæ bezpieczne i wygodne podró¿owanie zwierz¹t. Dodatkowo, mo¿na skorzy 4
7           Us³uga Przekraczania Granic    300,00                Dodatkowa opcja dla klientów planuj¹cych podró¿ zagraniczn¹. Wypo¿yczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umo¿liwiaj¹c swobodne przekraczanie granic i korzystanie z samochodu za granic¹.                                                      NULL
8           Pakiet equipment               60,00                 Wypo¿yczalnia oferuje dodatkowy sprzêt, tak jak baga¿niki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umo¿liwiæ klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.                                                                  4
9           VIP Chauffeur Experience       1000,00               Ekskluzywny pakiet, który zapewnia niezapomniane doœwiadczenie podró¿y z profesjonalnym szoferem. Klienci mog¹ cieszyæ siê pe³nym komfortem i luksusem, podczas gdy doœwiadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie siê. Ten pakiet jest ide 3
10          Pakiet Weekendowy              200,00                Specjalny pakiet dla klientów, którzy planuj¹ weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umo¿liwiaj¹c pe³ne wykorzystanie czasu na krótk¹ podró¿.                                                              NULL

(10 rows affected)

Wynik: Dostêpnoœæ us³ugi zosta³a zmniejszona, dodany zosta³ nowy wiersz do tabeli [WypozyczenieUsluga]
oraz zwiêkszona zosta³a przewidywana cena wypo¿yczenia, procedura dzia³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (a2): wywo³anie transakcji bez b³êdów.
-- 1: Pole "Dostepnosc" dla wiersza w tabeli [Usluga] jest nullem.
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.WypozyczenieUsluga_Dodaj
@Par_IdWypozyczenieUsluga = 12,
@Par_IdWypozyczenie = 3,
@Par_IdUsluga = 1,
@Par_Uwagi = 'Brak';
GO
*/

/*
(1 row affected)

(1 row affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 1450,00               700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1                    4              1           NULL
2                    4              2           NULL
3                    4              6           NULL
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL
11                   3              9           Brak
12                   3              1           Brak

(12 rows affected)

IdUsluga    Nazwa                          Cena                  Opis                                                                                                                                                                                                                                                             Dostepnosc
----------- ------------------------------ --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Pakiet clean                   50,00                 Us³uga, która zwalnia klientów z koniecznoœci mycia samochodu przed zwrotem. Wypo¿yczalnia dba o czystoœæ zarówno wewn¹trz, jak i na zewn¹trz pojazdu                                                                                                            NULL
2           Pakiet refuel                  450,00                Us³uga, która zwalnia klientów z koniecznoœci tankowania paliwa przed zwrotem samochodu. Wypo¿yczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient mo¿e zwróciæ samochód bez zmartwieñ o puste zbiorniki paliwa.                              NULL
3           Us³uga Wi-Fi Mobilnego         100,00                Us³uga zapewniaj¹ca dostêp do mobilnego Wi-Fi w samochodzie. Klienci mog¹ cieszyæ siê po³¹czeniem internetowym w trakcie podró¿y, umo¿liwiaj¹c ³atwy dostêp do map, informacji o ruchu drogowym i komunikacji online.                                            NULL
4           Us³uga Transferu Lotniskowego  400,00                Us³uga dostêpna na lotniskach, która umo¿liwia klientom wynajem samochodu bezpoœrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport miêdzy lotniskiem a miejscem docelowym.                              NULL
5           Us³uga Dostawy                 180,00                Klientom oferuje siê dostawê samochodu bezpoœrednio pod wskazany adres na terenie miasta. Pracownik wypo¿yczalni dostarcza i odbiera pojazd, umo¿liwiaj¹c wygodne i bezproblemowe korzystanie z us³ugi.                                                          NULL
6           Animal friendly                80,00                 Us³uga dedykowana klientom podró¿uj¹cym ze swoimi zwierzêtami. Wypo¿yczalnia samochodów zapewnia specjalne wyposa¿enie, takie jak transporter lub siatkê oddzielaj¹c¹ baga¿nik, aby zapewniæ bezpieczne i wygodne podró¿owanie zwierz¹t. Dodatkowo, mo¿na skorzy 4
7           Us³uga Przekraczania Granic    300,00                Dodatkowa opcja dla klientów planuj¹cych podró¿ zagraniczn¹. Wypo¿yczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umo¿liwiaj¹c swobodne przekraczanie granic i korzystanie z samochodu za granic¹.                                                      NULL
8           Pakiet equipment               60,00                 Wypo¿yczalnia oferuje dodatkowy sprzêt, tak jak baga¿niki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umo¿liwiæ klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.                                                                  4
9           VIP Chauffeur Experience       1000,00               Ekskluzywny pakiet, który zapewnia niezapomniane doœwiadczenie podró¿y z profesjonalnym szoferem. Klienci mog¹ cieszyæ siê pe³nym komfortem i luksusem, podczas gdy doœwiadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie siê. Ten pakiet jest ide 3
10          Pakiet Weekendowy              200,00                Specjalny pakiet dla klientów, którzy planuj¹ weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umo¿liwiaj¹c pe³ne wykorzystanie czasu na krótk¹ podró¿.                                                              NULL

(10 rows affected)

Wynik: Dodany zosta³ nowy wiersz do tabeli [WypozyczenieUsluga] oraz zwiêkszona 
zosta³a przewidywana cena wypo¿yczenia, procedura dzia³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (b): wywo³anie z b³êdem czasu wykonania (ang. runtime error).
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.WypozyczenieUsluga_Dodaj
@Par_IdWypozyczenieUsluga = 12,
@Par_IdWypozyczenie = 3,
@Par_IdUsluga = 1,
@Par_Uwagi = 'Brak';
GO
*/

/*
Msg 50000, Level 16, State 1, Procedure dbo.WypozyczenieUsluga_Dodaj, Line 28 [Batch Start Line 606]
Dana us³uga ju¿ istnieje w danym wypo¿yczeniu
*/

/*
EXECUTE dbo.WypozyczenieUsluga_Dodaj
@Par_IdWypozyczenieUsluga = 13,
@Par_IdWypozyczenie = 23,
@Par_IdUsluga = 1,
@Par_Uwagi = 'Brak';
GO
*/

/*
(0 rows affected)
Msg 547, Level 16, State 0, Procedure dbo.WypozyczenieUsluga_Dodaj, Line 54 [Batch Start Line 615]
The INSERT statement conflicted with the FOREIGN KEY constraint "FK_WypozyczenieUsluga_Wypozyczenie". The conflict occurred in database "S19_P2", table "dbo.Wypozyczenie", column 'IdWypozyczenie'.

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 1450,00               700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1                    4              1           NULL
2                    4              2           NULL
3                    4              6           NULL
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL
11                   3              9           Brak
12                   3              1           Brak

(12 rows affected)

IdUsluga    Nazwa                          Cena                  Opis                                                                                                                                                                                                                                                             Dostepnosc
----------- ------------------------------ --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Pakiet clean                   50,00                 Us³uga, która zwalnia klientów z koniecznoœci mycia samochodu przed zwrotem. Wypo¿yczalnia dba o czystoœæ zarówno wewn¹trz, jak i na zewn¹trz pojazdu                                                                                                            NULL
2           Pakiet refuel                  450,00                Us³uga, która zwalnia klientów z koniecznoœci tankowania paliwa przed zwrotem samochodu. Wypo¿yczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient mo¿e zwróciæ samochód bez zmartwieñ o puste zbiorniki paliwa.                              NULL
3           Us³uga Wi-Fi Mobilnego         100,00                Us³uga zapewniaj¹ca dostêp do mobilnego Wi-Fi w samochodzie. Klienci mog¹ cieszyæ siê po³¹czeniem internetowym w trakcie podró¿y, umo¿liwiaj¹c ³atwy dostêp do map, informacji o ruchu drogowym i komunikacji online.                                            NULL
4           Us³uga Transferu Lotniskowego  400,00                Us³uga dostêpna na lotniskach, która umo¿liwia klientom wynajem samochodu bezpoœrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport miêdzy lotniskiem a miejscem docelowym.                              NULL
5           Us³uga Dostawy                 180,00                Klientom oferuje siê dostawê samochodu bezpoœrednio pod wskazany adres na terenie miasta. Pracownik wypo¿yczalni dostarcza i odbiera pojazd, umo¿liwiaj¹c wygodne i bezproblemowe korzystanie z us³ugi.                                                          NULL
6           Animal friendly                80,00                 Us³uga dedykowana klientom podró¿uj¹cym ze swoimi zwierzêtami. Wypo¿yczalnia samochodów zapewnia specjalne wyposa¿enie, takie jak transporter lub siatkê oddzielaj¹c¹ baga¿nik, aby zapewniæ bezpieczne i wygodne podró¿owanie zwierz¹t. Dodatkowo, mo¿na skorzy 4
7           Us³uga Przekraczania Granic    300,00                Dodatkowa opcja dla klientów planuj¹cych podró¿ zagraniczn¹. Wypo¿yczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umo¿liwiaj¹c swobodne przekraczanie granic i korzystanie z samochodu za granic¹.                                                      NULL
8           Pakiet equipment               60,00                 Wypo¿yczalnia oferuje dodatkowy sprzêt, tak jak baga¿niki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umo¿liwiæ klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.                                                                  4
9           VIP Chauffeur Experience       1000,00               Ekskluzywny pakiet, który zapewnia niezapomniane doœwiadczenie podró¿y z profesjonalnym szoferem. Klienci mog¹ cieszyæ siê pe³nym komfortem i luksusem, podczas gdy doœwiadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie siê. Ten pakiet jest ide 3
10          Pakiet Weekendowy              200,00                Specjalny pakiet dla klientów, którzy planuj¹ weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umo¿liwiaj¹c pe³ne wykorzystanie czasu na krótk¹ podró¿.                                                              NULL

(10 rows affected)

Wynik: Próby zduplikowania us³ugi oraz dodania nieistniej¹cej us³ugi nie powiod³y siê,
wiersze tabel nie zosta³y zmienione, procedura dzia³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (c): wywo³anie z przerwaniem transakcji w œrodku (WAITFOR DELAY).
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.WypozyczenieUsluga_Dodaj
@Par_IdWypozyczenieUsluga = 13,
@Par_IdWypozyczenie = 10,
@Par_IdUsluga = 2,
@Par_Uwagi = 'Brak';
GO
*/

/*
(1 row affected)
Query was canceled by user.

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 1450,00               700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1                    4              1           NULL
2                    4              2           NULL
3                    4              6           NULL
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL
11                   3              9           Brak
12                   3              1           Brak

(12 rows affected)

IdUsluga    Nazwa                          Cena                  Opis                                                                                                                                                                                                                                                             Dostepnosc
----------- ------------------------------ --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Pakiet clean                   50,00                 Us³uga, która zwalnia klientów z koniecznoœci mycia samochodu przed zwrotem. Wypo¿yczalnia dba o czystoœæ zarówno wewn¹trz, jak i na zewn¹trz pojazdu                                                                                                            NULL
2           Pakiet refuel                  450,00                Us³uga, która zwalnia klientów z koniecznoœci tankowania paliwa przed zwrotem samochodu. Wypo¿yczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient mo¿e zwróciæ samochód bez zmartwieñ o puste zbiorniki paliwa.                              NULL
3           Us³uga Wi-Fi Mobilnego         100,00                Us³uga zapewniaj¹ca dostêp do mobilnego Wi-Fi w samochodzie. Klienci mog¹ cieszyæ siê po³¹czeniem internetowym w trakcie podró¿y, umo¿liwiaj¹c ³atwy dostêp do map, informacji o ruchu drogowym i komunikacji online.                                            NULL
4           Us³uga Transferu Lotniskowego  400,00                Us³uga dostêpna na lotniskach, która umo¿liwia klientom wynajem samochodu bezpoœrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport miêdzy lotniskiem a miejscem docelowym.                              NULL
5           Us³uga Dostawy                 180,00                Klientom oferuje siê dostawê samochodu bezpoœrednio pod wskazany adres na terenie miasta. Pracownik wypo¿yczalni dostarcza i odbiera pojazd, umo¿liwiaj¹c wygodne i bezproblemowe korzystanie z us³ugi.                                                          NULL
6           Animal friendly                80,00                 Us³uga dedykowana klientom podró¿uj¹cym ze swoimi zwierzêtami. Wypo¿yczalnia samochodów zapewnia specjalne wyposa¿enie, takie jak transporter lub siatkê oddzielaj¹c¹ baga¿nik, aby zapewniæ bezpieczne i wygodne podró¿owanie zwierz¹t. Dodatkowo, mo¿na skorzy 4
7           Us³uga Przekraczania Granic    300,00                Dodatkowa opcja dla klientów planuj¹cych podró¿ zagraniczn¹. Wypo¿yczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umo¿liwiaj¹c swobodne przekraczanie granic i korzystanie z samochodu za granic¹.                                                      NULL
8           Pakiet equipment               60,00                 Wypo¿yczalnia oferuje dodatkowy sprzêt, tak jak baga¿niki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umo¿liwiæ klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.                                                                  4
9           VIP Chauffeur Experience       1000,00               Ekskluzywny pakiet, który zapewnia niezapomniane doœwiadczenie podró¿y z profesjonalnym szoferem. Klienci mog¹ cieszyæ siê pe³nym komfortem i luksusem, podczas gdy doœwiadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie siê. Ten pakiet jest ide 3
10          Pakiet Weekendowy              200,00                Specjalny pakiet dla klientów, którzy planuj¹ weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umo¿liwiaj¹c pe³ne wykorzystanie czasu na krótk¹ podró¿.                                                              NULL

(10 rows affected)

Wynik: Przerwanie transakcji w œrodku przez u¿ytkownika spowodowa³o odwrócenie
zmian wykonanych podczas jej dzia³ania, transakcja dzia³a zgodnie z za³o¿eniami.
*/

---------------------------------------------------------------------------------------------------
-- T3. Synchronizacja danych wypo¿yczenia, dodanej us³ugi oraz us³ugi.
-- (b) Usuwanie us³ugi z wypo¿yczenia.
---------------------------------------------------------------------------------------------------
-- Procedura "dbo.WypozyczenieUsluga_Skasuj"
---------------------------------------------------------------------------------------------------

/*
SELECT *
FROM dbo.Wypozyczenie;
GO

SELECT *
FROM dbo.WypozyczenieUsluga;
GO

SELECT *
FROM dbo.Usluga;
GO
*/

--------------------------------------------------------------------------------------------------
-- TEST (a1): wywo³anie transakcji bez b³êdów.
-- 1: Pole "Dostepnosc" dla wiersza w tabeli [Usluga] jest nullem.
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.WypozyczenieUsluga_Skasuj
@Par_IdWypozyczenieUsluga = 12;
GO
*/

/*
(1 row affected)

(1 row affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 1400,00               700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1                    4              1           NULL
2                    4              2           NULL
3                    4              6           NULL
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL
11                   3              9           Brak

(11 rows affected)

IdUsluga    Nazwa                          Cena                  Opis                                                                                                                                                                                                                                                             Dostepnosc
----------- ------------------------------ --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Pakiet clean                   50,00                 Us³uga, która zwalnia klientów z koniecznoœci mycia samochodu przed zwrotem. Wypo¿yczalnia dba o czystoœæ zarówno wewn¹trz, jak i na zewn¹trz pojazdu                                                                                                            NULL
2           Pakiet refuel                  450,00                Us³uga, która zwalnia klientów z koniecznoœci tankowania paliwa przed zwrotem samochodu. Wypo¿yczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient mo¿e zwróciæ samochód bez zmartwieñ o puste zbiorniki paliwa.                              NULL
3           Us³uga Wi-Fi Mobilnego         100,00                Us³uga zapewniaj¹ca dostêp do mobilnego Wi-Fi w samochodzie. Klienci mog¹ cieszyæ siê po³¹czeniem internetowym w trakcie podró¿y, umo¿liwiaj¹c ³atwy dostêp do map, informacji o ruchu drogowym i komunikacji online.                                            NULL
4           Us³uga Transferu Lotniskowego  400,00                Us³uga dostêpna na lotniskach, która umo¿liwia klientom wynajem samochodu bezpoœrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport miêdzy lotniskiem a miejscem docelowym.                              NULL
5           Us³uga Dostawy                 180,00                Klientom oferuje siê dostawê samochodu bezpoœrednio pod wskazany adres na terenie miasta. Pracownik wypo¿yczalni dostarcza i odbiera pojazd, umo¿liwiaj¹c wygodne i bezproblemowe korzystanie z us³ugi.                                                          NULL
6           Animal friendly                80,00                 Us³uga dedykowana klientom podró¿uj¹cym ze swoimi zwierzêtami. Wypo¿yczalnia samochodów zapewnia specjalne wyposa¿enie, takie jak transporter lub siatkê oddzielaj¹c¹ baga¿nik, aby zapewniæ bezpieczne i wygodne podró¿owanie zwierz¹t. Dodatkowo, mo¿na skorzy 4
7           Us³uga Przekraczania Granic    300,00                Dodatkowa opcja dla klientów planuj¹cych podró¿ zagraniczn¹. Wypo¿yczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umo¿liwiaj¹c swobodne przekraczanie granic i korzystanie z samochodu za granic¹.                                                      NULL
8           Pakiet equipment               60,00                 Wypo¿yczalnia oferuje dodatkowy sprzêt, tak jak baga¿niki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umo¿liwiæ klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.                                                                  4
9           VIP Chauffeur Experience       1000,00               Ekskluzywny pakiet, który zapewnia niezapomniane doœwiadczenie podró¿y z profesjonalnym szoferem. Klienci mog¹ cieszyæ siê pe³nym komfortem i luksusem, podczas gdy doœwiadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie siê. Ten pakiet jest ide 3
10          Pakiet Weekendowy              200,00                Specjalny pakiet dla klientów, którzy planuj¹ weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umo¿liwiaj¹c pe³ne wykorzystanie czasu na krótk¹ podró¿.                                                              NULL

(10 rows affected)

Wynik: procedura usunê³a wiersz z tabeli [WypozyczenieUsluga] oraz zmniejszy³a przewidywan¹ cenê zamówienia.
*/

--------------------------------------------------------------------------------------------------
-- TEST (a2): wywo³anie transakcji bez b³êdów.
-- 1: Pole "Dostepnosc" dla wiersza w tabeli [Usluga] nie jest nullem.
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.WypozyczenieUsluga_Skasuj
@Par_IdWypozyczenieUsluga = 11;
GO
*/

/*
(1 row affected)

(1 row affected)

(1 row affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1                    4              1           NULL
2                    4              2           NULL
3                    4              6           NULL
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL

(10 rows affected)

IdUsluga    Nazwa                          Cena                  Opis                                                                                                                                                                                                                                                             Dostepnosc
----------- ------------------------------ --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Pakiet clean                   50,00                 Us³uga, która zwalnia klientów z koniecznoœci mycia samochodu przed zwrotem. Wypo¿yczalnia dba o czystoœæ zarówno wewn¹trz, jak i na zewn¹trz pojazdu                                                                                                            NULL
2           Pakiet refuel                  450,00                Us³uga, która zwalnia klientów z koniecznoœci tankowania paliwa przed zwrotem samochodu. Wypo¿yczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient mo¿e zwróciæ samochód bez zmartwieñ o puste zbiorniki paliwa.                              NULL
3           Us³uga Wi-Fi Mobilnego         100,00                Us³uga zapewniaj¹ca dostêp do mobilnego Wi-Fi w samochodzie. Klienci mog¹ cieszyæ siê po³¹czeniem internetowym w trakcie podró¿y, umo¿liwiaj¹c ³atwy dostêp do map, informacji o ruchu drogowym i komunikacji online.                                            NULL
4           Us³uga Transferu Lotniskowego  400,00                Us³uga dostêpna na lotniskach, która umo¿liwia klientom wynajem samochodu bezpoœrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport miêdzy lotniskiem a miejscem docelowym.                              NULL
5           Us³uga Dostawy                 180,00                Klientom oferuje siê dostawê samochodu bezpoœrednio pod wskazany adres na terenie miasta. Pracownik wypo¿yczalni dostarcza i odbiera pojazd, umo¿liwiaj¹c wygodne i bezproblemowe korzystanie z us³ugi.                                                          NULL
6           Animal friendly                80,00                 Us³uga dedykowana klientom podró¿uj¹cym ze swoimi zwierzêtami. Wypo¿yczalnia samochodów zapewnia specjalne wyposa¿enie, takie jak transporter lub siatkê oddzielaj¹c¹ baga¿nik, aby zapewniæ bezpieczne i wygodne podró¿owanie zwierz¹t. Dodatkowo, mo¿na skorzy 4
7           Us³uga Przekraczania Granic    300,00                Dodatkowa opcja dla klientów planuj¹cych podró¿ zagraniczn¹. Wypo¿yczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umo¿liwiaj¹c swobodne przekraczanie granic i korzystanie z samochodu za granic¹.                                                      NULL
8           Pakiet equipment               60,00                 Wypo¿yczalnia oferuje dodatkowy sprzêt, tak jak baga¿niki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umo¿liwiæ klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.                                                                  4
9           VIP Chauffeur Experience       1000,00               Ekskluzywny pakiet, który zapewnia niezapomniane doœwiadczenie podró¿y z profesjonalnym szoferem. Klienci mog¹ cieszyæ siê pe³nym komfortem i luksusem, podczas gdy doœwiadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie siê. Ten pakiet jest ide 4
10          Pakiet Weekendowy              200,00                Specjalny pakiet dla klientów, którzy planuj¹ weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umo¿liwiaj¹c pe³ne wykorzystanie czasu na krótk¹ podró¿.                                                              NULL

(10 rows affected)

Wynik: procedura usunê³a wiersz z tabeli [WypozyczenieUsluga], zwiêkszy³a
dostêpnoœæ us³ugi oraz zmniejszy³a przewidywan¹ cenê zamówienia.
*/

--------------------------------------------------------------------------------------------------
-- TEST (b): wywo³anie z b³êdem czasu wykonania (ang. runtime error).
--------------------------------------------------------------------------------------------------

-- Próba skasowanie nieistniej¹cego wiersza.
-- Brak mo¿liwoœci wywo³ania b³edu runtime error.

/*
EXECUTE dbo.WypozyczenieUsluga_Skasuj
@Par_IdWypozyczenieUsluga = 11;
GO
*/

/*
(0 rows affected)

(0 rows affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1                    4              1           NULL
2                    4              2           NULL
3                    4              6           NULL
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL

(10 rows affected)

IdUsluga    Nazwa                          Cena                  Opis                                                                                                                                                                                                                                                             Dostepnosc
----------- ------------------------------ --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Pakiet clean                   50,00                 Us³uga, która zwalnia klientów z koniecznoœci mycia samochodu przed zwrotem. Wypo¿yczalnia dba o czystoœæ zarówno wewn¹trz, jak i na zewn¹trz pojazdu                                                                                                            NULL
2           Pakiet refuel                  450,00                Us³uga, która zwalnia klientów z koniecznoœci tankowania paliwa przed zwrotem samochodu. Wypo¿yczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient mo¿e zwróciæ samochód bez zmartwieñ o puste zbiorniki paliwa.                              NULL
3           Us³uga Wi-Fi Mobilnego         100,00                Us³uga zapewniaj¹ca dostêp do mobilnego Wi-Fi w samochodzie. Klienci mog¹ cieszyæ siê po³¹czeniem internetowym w trakcie podró¿y, umo¿liwiaj¹c ³atwy dostêp do map, informacji o ruchu drogowym i komunikacji online.                                            NULL
4           Us³uga Transferu Lotniskowego  400,00                Us³uga dostêpna na lotniskach, która umo¿liwia klientom wynajem samochodu bezpoœrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport miêdzy lotniskiem a miejscem docelowym.                              NULL
5           Us³uga Dostawy                 180,00                Klientom oferuje siê dostawê samochodu bezpoœrednio pod wskazany adres na terenie miasta. Pracownik wypo¿yczalni dostarcza i odbiera pojazd, umo¿liwiaj¹c wygodne i bezproblemowe korzystanie z us³ugi.                                                          NULL
6           Animal friendly                80,00                 Us³uga dedykowana klientom podró¿uj¹cym ze swoimi zwierzêtami. Wypo¿yczalnia samochodów zapewnia specjalne wyposa¿enie, takie jak transporter lub siatkê oddzielaj¹c¹ baga¿nik, aby zapewniæ bezpieczne i wygodne podró¿owanie zwierz¹t. Dodatkowo, mo¿na skorzy 4
7           Us³uga Przekraczania Granic    300,00                Dodatkowa opcja dla klientów planuj¹cych podró¿ zagraniczn¹. Wypo¿yczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umo¿liwiaj¹c swobodne przekraczanie granic i korzystanie z samochodu za granic¹.                                                      NULL
8           Pakiet equipment               60,00                 Wypo¿yczalnia oferuje dodatkowy sprzêt, tak jak baga¿niki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umo¿liwiæ klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.                                                                  4
9           VIP Chauffeur Experience       1000,00               Ekskluzywny pakiet, który zapewnia niezapomniane doœwiadczenie podró¿y z profesjonalnym szoferem. Klienci mog¹ cieszyæ siê pe³nym komfortem i luksusem, podczas gdy doœwiadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie siê. Ten pakiet jest ide 4
10          Pakiet Weekendowy              200,00                Specjalny pakiet dla klientów, którzy planuj¹ weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umo¿liwiaj¹c pe³ne wykorzystanie czasu na krótk¹ podró¿.                                                              NULL

(10 rows affected)

Wynik: wiersze nie zosta³y zmienione, procedura dzia³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (c): wywo³anie z przerwaniem transakcji w œrodku (WAITFOR DELAY).
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.WypozyczenieUsluga_Skasuj
@Par_IdWypozyczenieUsluga = 10;
GO
*/

/*
(1 row affected)
Query was canceled by user.

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1                    4              1           NULL
2                    4              2           NULL
3                    4              6           NULL
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL

(10 rows affected)

IdUsluga    Nazwa                          Cena                  Opis                                                                                                                                                                                                                                                             Dostepnosc
----------- ------------------------------ --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Pakiet clean                   50,00                 Us³uga, która zwalnia klientów z koniecznoœci mycia samochodu przed zwrotem. Wypo¿yczalnia dba o czystoœæ zarówno wewn¹trz, jak i na zewn¹trz pojazdu                                                                                                            NULL
2           Pakiet refuel                  450,00                Us³uga, która zwalnia klientów z koniecznoœci tankowania paliwa przed zwrotem samochodu. Wypo¿yczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient mo¿e zwróciæ samochód bez zmartwieñ o puste zbiorniki paliwa.                              NULL
3           Us³uga Wi-Fi Mobilnego         100,00                Us³uga zapewniaj¹ca dostêp do mobilnego Wi-Fi w samochodzie. Klienci mog¹ cieszyæ siê po³¹czeniem internetowym w trakcie podró¿y, umo¿liwiaj¹c ³atwy dostêp do map, informacji o ruchu drogowym i komunikacji online.                                            NULL
4           Us³uga Transferu Lotniskowego  400,00                Us³uga dostêpna na lotniskach, która umo¿liwia klientom wynajem samochodu bezpoœrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport miêdzy lotniskiem a miejscem docelowym.                              NULL
5           Us³uga Dostawy                 180,00                Klientom oferuje siê dostawê samochodu bezpoœrednio pod wskazany adres na terenie miasta. Pracownik wypo¿yczalni dostarcza i odbiera pojazd, umo¿liwiaj¹c wygodne i bezproblemowe korzystanie z us³ugi.                                                          NULL
6           Animal friendly                80,00                 Us³uga dedykowana klientom podró¿uj¹cym ze swoimi zwierzêtami. Wypo¿yczalnia samochodów zapewnia specjalne wyposa¿enie, takie jak transporter lub siatkê oddzielaj¹c¹ baga¿nik, aby zapewniæ bezpieczne i wygodne podró¿owanie zwierz¹t. Dodatkowo, mo¿na skorzy 4
7           Us³uga Przekraczania Granic    300,00                Dodatkowa opcja dla klientów planuj¹cych podró¿ zagraniczn¹. Wypo¿yczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umo¿liwiaj¹c swobodne przekraczanie granic i korzystanie z samochodu za granic¹.                                                      NULL
8           Pakiet equipment               60,00                 Wypo¿yczalnia oferuje dodatkowy sprzêt, tak jak baga¿niki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umo¿liwiæ klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.                                                                  4
9           VIP Chauffeur Experience       1000,00               Ekskluzywny pakiet, który zapewnia niezapomniane doœwiadczenie podró¿y z profesjonalnym szoferem. Klienci mog¹ cieszyæ siê pe³nym komfortem i luksusem, podczas gdy doœwiadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie siê. Ten pakiet jest ide 4
10          Pakiet Weekendowy              200,00                Specjalny pakiet dla klientów, którzy planuj¹ weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umo¿liwiaj¹c pe³ne wykorzystanie czasu na krótk¹ podró¿.                                                              NULL

(10 rows affected)

Wynik: po uruchumieniu transakcji wiersz zosta³ zmieniony, ale po 
przerwaniu transakcji b³¹d zosta³ stamt¹d automatycznie usuniêty.
*/

---------------------------------------------------------------------------------------------------
-- T4. Dodanie nowego wypo¿yczenia.
-- Synchronizacja danych wypo¿yczenia, oraz samochodu.
---------------------------------------------------------------------------------------------------
-- Procedura "dbo.Wypozyczenie_Dodaj".
---------------------------------------------------------------------------------------------------

/*
SELECT *
FROM dbo.Wypozyczenie;
GO

SELECT IdSamochod, Model, Cena, Dostepnosc
FROM dbo.Samochod
	INNER JOIN dbo.Kategoria
	ON Samochod.Kategoria = Kategoria.Kategoria;
GO

SELECT *
FROM dbo.Ubezpieczenie;
GO
*/

/*
IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL

(10 rows affected)

IdSamochod  Model                Cena                  Dostepnosc
----------- -------------------- --------------------- ----------
1           Seria 7              300,00                0
2           911                  350,00                0
3           Mondeo               90,00                 1
4           Cullinan             600,00                1
5           Aventador            500,00                0
6           A4                   300,00                1
7           Mondeo               90,00                 0
8           Q3                   180,00                0
9           Seria 7              300,00                0
10          Seria 7              350,00                0

(10 rows affected)

IdUbezpieczenie Nazwa                          Cena                  Opis
--------------- ------------------------------ --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1               Ubezpieczenie podstawowe       0,00                  OC, AC, ubezpieczenie od kradzie¿y.
2               Ubezpieczenie rozszerzone      80,00                 CDW + ubezpieczenie podstawowe
3               Ubezpieczenie roszerzone plus  100,00                GT, RP + ubezieczenie rozszerzone
4               Ubezpieczenie ultra            200,00                SCDW + ubezpieczenie rozszerzone plus
5               Ubezpieczenie max              270,00                PAI + ubezpieczenie ultra

(5 rows affected)
*/

--------------------------------------------------------------------------------------------------
-- TEST (a1): wywo³anie transakcji bez b³êdów.
-- z zadeklarowan¹ dat¹ zwrotu jako NULL.
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.Wypozyczenie_Dodaj
@Par_IdWypozyczenie = 11,
@Par_IdKlient = 3,
@Par_IdSamochod = 1,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Karta',
@Par_DataWypozyczenia = '2023-11-11 11:00:00',
@Par_TerminZwrotu = '2023-11-13 17:00:00',
@Par_DataZwrotu = NULL,
@Par_Uwagi = NULL;
GO
*/

/*
(1 row affected)

(1 row affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
11             3           1           5           5               Karta                     2023-11-11 11:00:00.000 2023-11-13 17:00:00.000 NULL                    945,00                NULL                  1                  NULL

(11 rows affected)

IdSamochod  Model                Cena                  Dostepnosc
----------- -------------------- --------------------- ----------
1           Seria 7              300,00                0
2           911                  350,00                0
3           Mondeo               90,00                 1
4           Cullinan             600,00                1
5           Aventador            500,00                0
6           A4                   300,00                1
7           Mondeo               90,00                 0
8           Q3                   180,00                0
9           Seria 7              300,00                0
10          Seria 7              350,00                0

(10 rows affected)

IdUbezpieczenie Nazwa                          Cena                  Opis
--------------- ------------------------------ --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1               Ubezpieczenie podstawowe       0,00                  OC, AC, ubezpieczenie od kradzie¿y.
2               Ubezpieczenie rozszerzone      80,00                 CDW + ubezpieczenie podstawowe
3               Ubezpieczenie roszerzone plus  100,00                GT, RP + ubezieczenie rozszerzone
4               Ubezpieczenie ultra            200,00                SCDW + ubezpieczenie rozszerzone plus
5               Ubezpieczenie max              270,00                PAI + ubezpieczenie ultra

(5 rows affected)

Wynik: dodano nowy wypo¿yczenie i zmieniono dostêpnoœæ samochodu, procedura dzia³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (a2): wywo³anie transakcji bez b³êdów.
-- z zadeklarowan¹ dat¹ zwrotu NULL.
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.Wypozyczenie_Dodaj
@Par_IdWypozyczenie = 12,
@Par_IdKlient = 4,
@Par_IdSamochod = 6,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Karta',
@Par_DataWypozyczenia = '2023-11-10 11:00:00',
@Par_TerminZwrotu = '2023-11-11 11:00:00',
@Par_DataZwrotu = '2023-11-11 11:00:00',
@Par_Uwagi = NULL;
GO
*/

/*
(1 row affected)

(1 row affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
11             3           1           5           5               Karta                     2023-11-11 11:00:00.000 2023-11-13 17:00:00.000 NULL                    945,00                NULL                  1                  NULL
12             4           6           5           5               Karta                     2023-11-10 11:00:00.000 2023-11-11 11:00:00.000 2023-11-11 11:00:00.000 570,00                570,00                0                  NULL

(12 rows affected)

IdSamochod  Model                Cena                  Dostepnosc
----------- -------------------- --------------------- ----------
1           Seria 7              300,00                0
2           911                  350,00                0
3           Mondeo               90,00                 1
4           Cullinan             600,00                1
5           Aventador            500,00                0
6           A4                   300,00                0
7           Mondeo               90,00                 0
8           Q3                   180,00                0
9           Seria 7              300,00                0
10          Seria 7              350,00                0

(10 rows affected)

IdUbezpieczenie Nazwa                          Cena                  Opis
--------------- ------------------------------ --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1               Ubezpieczenie podstawowe       0,00                  OC, AC, ubezpieczenie od kradzie¿y.
2               Ubezpieczenie rozszerzone      80,00                 CDW + ubezpieczenie podstawowe
3               Ubezpieczenie roszerzone plus  100,00                GT, RP + ubezieczenie rozszerzone
4               Ubezpieczenie ultra            200,00                SCDW + ubezpieczenie rozszerzone plus
5               Ubezpieczenie max              270,00                PAI + ubezpieczenie ultra

(5 rows affected)

Wynik: dodano nowy wypo¿yczenie i zmieniono dostêpnoœæ samochodu, procedura dzia³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (b): wywo³anie z b³êdem czasu wykonania (ang. runtime error).
--------------------------------------------------------------------------------------------------

-- Próba zduplikowania klucza g³ównego
/*
EXECUTE dbo.Wypozyczenie_Dodaj
@Par_IdWypozyczenie = 12,
@Par_IdKlient = 4,
@Par_IdSamochod = 3,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Karta',
@Par_DataWypozyczenia = '2023-11-10 11:00:00',
@Par_TerminZwrotu = '2023-11-11 11:00:00',
@Par_DataZwrotu = '2023-11-11 11:00:00',
@Par_Uwagi = NULL;
GO
*/

/*
(1 row affected)
Msg 2627, Level 14, State 1, Procedure dbo.Wypozyczenie_Dodaj, Line 68 [Batch Start Line 1237]
Violation of PRIMARY KEY constraint 'PK_Wypozyczenie'. Cannot insert duplicate key in object 'dbo.Wypozyczenie'. The duplicate key value is (12).
*/

-- Próba wypo¿yczenie niedostêpnego samochodu.
/*
EXECUTE dbo.Wypozyczenie_Dodaj
@Par_IdWypozyczenie = 13,
@Par_IdKlient = 4,
@Par_IdSamochod = 10,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Karta',
@Par_DataWypozyczenia = '2023-11-10 11:00:00',
@Par_TerminZwrotu = '2023-11-11 11:00:00',
@Par_DataZwrotu = '2023-11-11 11:00:00',
@Par_Uwagi = NULL;
GO
*/

/*
Msg 50000, Level 16, State 1, Procedure dbo.Wypozyczenie_Dodaj, Line 57 [Batch Start Line 1260]
Samochód jest niedostêpny

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
11             3           1           5           5               Karta                     2023-11-11 11:00:00.000 2023-11-13 17:00:00.000 NULL                    945,00                NULL                  1                  NULL
12             4           6           5           5               Karta                     2023-11-10 11:00:00.000 2023-11-11 11:00:00.000 2023-11-11 11:00:00.000 570,00                570,00                0                  NULL

(12 rows affected)

IdSamochod  Model                Cena                  Dostepnosc
----------- -------------------- --------------------- ----------
1           Seria 7              300,00                0
2           911                  350,00                0
3           Mondeo               90,00                 1
4           Cullinan             600,00                1
5           Aventador            500,00                0
6           A4                   300,00                0
7           Mondeo               90,00                 0
8           Q3                   180,00                0
9           Seria 7              300,00                0
10          Seria 7              350,00                0

(10 rows affected)

IdUbezpieczenie Nazwa                          Cena                  Opis
--------------- ------------------------------ --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1               Ubezpieczenie podstawowe       0,00                  OC, AC, ubezpieczenie od kradzie¿y.
2               Ubezpieczenie rozszerzone      80,00                 CDW + ubezpieczenie podstawowe
3               Ubezpieczenie roszerzone plus  100,00                GT, RP + ubezieczenie rozszerzone
4               Ubezpieczenie ultra            200,00                SCDW + ubezpieczenie rozszerzone plus
5               Ubezpieczenie max              270,00                PAI + ubezpieczenie ultra

(5 rows affected)

Wynik: wiersze nie zosta³y zmienione, procedura dzia³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (c): wywo³anie z przerwaniem transakcji w œrodku (WAITFOR DELAY).
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.Wypozyczenie_Dodaj
@Par_IdWypozyczenie = 13,
@Par_IdKlient = 4,
@Par_IdSamochod = 3,
@Par_IdPracownik = 5,
@Par_IdUbezpieczenie = 5,
@Par_SposobPlatnosci = 'Karta',
@Par_DataWypozyczenia = '2023-11-10 11:00:00',
@Par_TerminZwrotu = '2023-11-11 11:00:00',
@Par_DataZwrotu = '2023-11-11 11:00:00',
@Par_Uwagi = NULL;
GO
*/

/*
(1 row affected)
Query was canceled by user.

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
4              5           7           4           4               Karta                     2023-05-05 14:00:00.000 2023-05-25 14:00:00.000 NULL                    6000,00               NULL                  1                  NULL
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
11             3           1           5           5               Karta                     2023-11-11 11:00:00.000 2023-11-13 17:00:00.000 NULL                    945,00                NULL                  1                  NULL
12             4           6           5           5               Karta                     2023-11-10 11:00:00.000 2023-11-11 11:00:00.000 2023-11-11 11:00:00.000 570,00                570,00                0                  NULL

(12 rows affected)

IdSamochod  Model                Cena                  Dostepnosc
----------- -------------------- --------------------- ----------
1           Seria 7              300,00                0
2           911                  350,00                0
3           Mondeo               90,00                 1
4           Cullinan             600,00                1
5           Aventador            500,00                0
6           A4                   300,00                0
7           Mondeo               90,00                 0
8           Q3                   180,00                0
9           Seria 7              300,00                0
10          Seria 7              350,00                0

(10 rows affected)

IdUbezpieczenie Nazwa                          Cena                  Opis
--------------- ------------------------------ --------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1               Ubezpieczenie podstawowe       0,00                  OC, AC, ubezpieczenie od kradzie¿y.
2               Ubezpieczenie rozszerzone      80,00                 CDW + ubezpieczenie podstawowe
3               Ubezpieczenie roszerzone plus  100,00                GT, RP + ubezieczenie rozszerzone
4               Ubezpieczenie ultra            200,00                SCDW + ubezpieczenie rozszerzone plus
5               Ubezpieczenie max              270,00                PAI + ubezpieczenie ultra

(5 rows affected)

Wynik: Uruchomienie procedury wp³ynê³o na 1 wiersz, ale po jej przerwaniu przez u¿ytkownika b³¹d zosta³ wycofany.
*/

---------------------------------------------------------------------------------------------------
-- T5. Elastyczne zarz¹dzanie s³ownikami - makrooperacja.
---------------------------------------------------------------------------------------------------
-- Procedura "dbo.Samochod_Wstaw_Makro".
---------------------------------------------------------------------------------------------------

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
*/

/*
IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              0          5           2021        Diesel          BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport

(10 rows affected)

Marka
--------------------
Audi
BMW
Ford
Hyundai
Lamborghini
Lexus
Mercedes
Porsche
Rolls-Royce
Volvo

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
*/

--------------------------------------------------------------------------------------------------
-- TEST (a1): wywo³anie transakcji bez b³êdów.
-- 1: Wstawienie samochodu istniej¹cej marki i modelu.
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.Samochod_Wstaw_Makro
@Par_IdSamochod = 11,
@Par_Kategoria = 'Premium',
@Par_Marka = 'BMW',
@Par_Model = 'Seria 7',
@Par_Dostepnosc = 1,
@Par_IloscDrzwi = 5,
@Par_Rocznik = 2015,
@Par_TypSilnika = 'Benzyna',
@Par_InformacjeDodatkowe = 'BMW 740 xDrive';
GO
*/

/*
(1 row affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              0          5           2021        Diesel          BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport
11          Premium              Seria 7              1          5           2015        Benzyna         BMW 740 xDrive

(11 rows affected)

Wynik: Zosta³ dodany nowy wiersz do tabeli [Samochod], procedura dzia³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (a2): wywo³anie transakcji bez b³êdów.
-- 2: Wstawienie samochodu nieistniej¹cej marki i modelu.
--------------------------------------------------------------------------------------------------

/*
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

/*
(1 row affected)

(1 row affected)

(1 row affected)

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              0          5           2021        Diesel          BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport
11          Premium              Seria 7              1          5           2015        Benzyna         BMW 740 xDrive
12          Sportowe             GTR                  1          2           2015        Benzyna         NISSAN GT-R R35 Premium Edition 4WD 3.8

(12 rows affected)

Marka
--------------------
Audi
BMW
Ford
Hyundai
Lamborghini
Lexus
Mercedes
Nissan
Porsche
Rolls-Royce
Volvo

(11 rows affected)

Model                Marka
-------------------- --------------------
911                  Porsche
A4                   Audi
Aventador            Lamborghini
Cullinan             Rolls-Royce
G klasa              Mercedes
GTR                  Nissan
Mondeo               Ford
Q3                   Audi
S klasa              Mercedes
Seria 1              BMW
Seria 5              BMW
Seria 7              BMW

(12 rows affected)

Wynik: zosta³y dodane nowe wiersze do wszyskich 3 tabel, procedura dzia³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (b): wywo³anie z b³êdem czasu wykonania (ang. runtime error).
--------------------------------------------------------------------------------------------------

/*
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

/*
Msg 2627, Level 14, State 1, Procedure dbo.Samochod_Wstaw_Makro, Line 73 [Batch Start Line 1584]
Violation of PRIMARY KEY constraint 'PK_Samochod'. Cannot insert duplicate key in object 'dbo.Samochod'. The duplicate key value is (12).

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              0          5           2021        Diesel          BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport
11          Premium              Seria 7              1          5           2015        Benzyna         BMW 740 xDrive
12          Sportowe             GTR                  1          2           2015        Benzyna         NISSAN GT-R R35 Premium Edition 4WD 3.8

(12 rows affected)

Wynik: nie zosta³y dodane nowe wiersze, procedura dzia³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (c): wywo³anie z przerwaniem transakcji w œrodku (WAITFOR DELAY).
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.Samochod_Wstaw_Makro
@Par_IdSamochod = 13,
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

/*
(1 row affected)
Query was canceled by user.

IdSamochod  Kategoria            Model                Dostepnosc IloscDrzwi  Rocznik     TypSilnika      InformacjeDodatkowe
----------- -------------------- -------------------- ---------- ----------- ----------- --------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Premium              Seria 7              0          5           2021        Diesel          BMW 740d xDrive
2           Sportowe             911                  0          2           2020        Benzyna         911 Carrera
3           Rodzinna             Mondeo               1          5           2017        Diesel          Ford Mondeo 2.0 TDCi
4           Super Luxury         Cullinan             1          5           2023        Benzyna         Rolls-Royce Cullinan Black Badge
5           Performance          Aventador            0          2           2023        Benzyna         Lamborghini Aventador Reuvelto
6           Premium              A4                   0          5           2022        Diesel          Audi A4 40 TDI MHEV Quattro S Line S Tronic
7           Rodzinna             Mondeo               0          5           2018        Hybryda         Ford Mondeo Vignale 2.0 Hybrid
8           SUV/Terenowe         Q3                   0          5           2017        Diesel          Audi Q3 2.0 TDI
9           Premium              Seria 7              0          5           2022        Diesel          BMW Seria 7 730d MHEV
10          Sportowe             Seria 7              0          5           2022        Benzyna         BMW Seria 7 740d XDrive MHEV M Sport Sport
11          Premium              Seria 7              1          5           2015        Benzyna         BMW 740 xDrive
12          Sportowe             GTR                  1          2           2015        Benzyna         NISSAN GT-R R35 Premium Edition 4WD 3.8

(12 rows affected)

Wynik: Uruchomienie procedury wp³ynê³o na 1 wiersz, ale po jej przerwaniu przez u¿ytkownika b³¹d zosta³ wycofany.
*/

---------------------------------------------------------------------------------------------------
-- T6. Zaawansowane archiwizowanie pe³nych danych klienta, jego wypo¿yczeñ i dodanych us³ug
-- w formacie XML.
---------------------------------------------------------------------------------------------------
-- Procedura "dbo.Klient_Archiwizuj".
---------------------------------------------------------------------------------------------------

/*
SELECT *
FROM dbo.Klient;
GO

SELECT *
FROM dbo.Klient_Kopia;
GO

SELECT *
FROM dbo.KlientUprawnienia;
GO

SELECT *
FROM dbo.Wypozyczenie;
GO

SELECT *
FROM dbo.WypozyczenieUsluga;
GO
*/

/*
IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            NIP        Aktywny
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- -------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             NULL       1
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             NULL       1
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             NULL       1
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             NULL       1
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             NULL       1
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             NULL       1
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             NULL       1
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             NULL       1
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             NULL       1
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             NULL       1

(10 rows affected)

IdArchiwalne DaneXML                                                                                                                                                                                                                                                          DataArchiwizacji
------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------

(0 rows affected)

IdKlientUprawnienia IdKlient    KategoriaPrawaJazdy
------------------- ----------- -------------------
1                   1           B
2                   2           B
3                   2           C
4                   3           B1
5                   4           B
6                   5           B
7                   6           B
8                   6           B+E
9                   6           C
10                  6           C+E

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
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
11             3           1           5           5               Karta                     2023-11-11 11:00:00.000 2023-11-13 17:00:00.000 NULL                    945,00                NULL                  1                  NULL
12             4           6           5           5               Karta                     2023-11-10 11:00:00.000 2023-11-11 11:00:00.000 2023-11-11 11:00:00.000 570,00                570,00                0                  NULL

(12 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1                    4              1           NULL
2                    4              2           NULL
3                    4              6           NULL
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL

(10 rows affected)
*/

--------------------------------------------------------------------------------------------------
-- TEST (a): wywo³anie transakcji bez b³êdów.
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.Klient_Archiwizuj
@Par_IdKlient = 5;
GO
*/

/*
(1 row affected)

(3 rows affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            NIP        Aktywny
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- -------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             NULL       1
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             NULL       1
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             NULL       1
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             NULL       1
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             NULL       0
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             NULL       1
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             NULL       1
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             NULL       1
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             NULL       1
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             NULL       1

(10 rows affected)

IdArchiwalne DaneXML                                                                                                                                                                                                                                                          DataArchiwizacji
------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------
1            <Archiwum><DaneArchiwalne><IdKlient>5</IdKlient><Imie>Zuzanna</Imie><Nazwisko>Paj¹k</Nazwisko><Miejscowosc>Konin</Miejscowosc><Ulica>Ciemna</Ulica><NrDomu>6b</NrDomu><KodPocztowy>62-500</KodPocztowy><Poczta>Konin</Poczta><NrTelefonu>+48 59 3439 141</NrTele 2023-11-12 03:29:17.620

(1 row affected)

IdKlientUprawnienia IdKlient    KategoriaPrawaJazdy
------------------- ----------- -------------------
1                   1           B
2                   2           B
3                   2           C
4                   3           B1
5                   4           B
7                   6           B
8                   6           B+E
9                   6           C
10                  6           C+E

(9 rows affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
11             3           1           5           5               Karta                     2023-11-11 11:00:00.000 2023-11-13 17:00:00.000 NULL                    945,00                NULL                  1                  NULL
12             4           6           5           5               Karta                     2023-11-10 11:00:00.000 2023-11-11 11:00:00.000 2023-11-11 11:00:00.000 570,00                570,00                0                  NULL

(11 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL

(7 rows affected)

Wynik: kompletne dane klienta wraz ze wszystkimi wypo¿yczeniami i uprawnieniami zosta³y prawid³owo zarchiwizowane,
z innych tabel zosta³y usuniête wszystkie powi¹zane z nim wiersze, natomiast sam klient nie zosta³ usuniêty z powodu
procedury wyzwalanej "dbo.tr_Klient_I_D", pole aktywny zosta³o zmienione na 0.
*/

--------------------------------------------------------------------------------------------------
-- TEST (b): wywo³anie z b³êdem czasu wykonania (ang. runtime error).
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.Klient_Archiwizuj
@Par_IdKlient = 11;
GO
*/

/*
Msg 515, Level 16, State 2, Procedure dbo.Klient_Archiwizuj, Line 41 [Batch Start Line 1865]
Cannot insert the value NULL into column 'DaneXML', table 'S19_P2.dbo.Klient_Kopia'; column does not allow nulls. INSERT fails.

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            NIP        Aktywny
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- -------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             NULL       1
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             NULL       1
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             NULL       1
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             NULL       1
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             NULL       0
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             NULL       1
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             NULL       1
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             NULL       1
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             NULL       1
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             NULL       1

(10 rows affected)

IdArchiwalne DaneXML                                                                                                                                                                                                                                                          DataArchiwizacji
------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------
1            <Archiwum><DaneArchiwalne><IdKlient>5</IdKlient><Imie>Zuzanna</Imie><Nazwisko>Paj¹k</Nazwisko><Miejscowosc>Konin</Miejscowosc><Ulica>Ciemna</Ulica><NrDomu>6b</NrDomu><KodPocztowy>62-500</KodPocztowy><Poczta>Konin</Poczta><NrTelefonu>+48 59 3439 141</NrTele 2023-11-12 03:29:17.620

(1 row affected)

Wynik: próba archiwizacji nieistniej¹cego klienta zakoñczy³a siê b³êdem, nie 
zosta³y dodane ani zmienione ¿adne wiersze, procedura dzia³a zgodnie z za³o¿eniami.
*/

--------------------------------------------------------------------------------------------------
-- TEST (c): wywo³anie z przerwaniem transakcji w œrodku (WAITFOR DELAY).
--------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.Klient_Archiwizuj
@Par_IdKlient = 10;
GO
*/

/*
(1 row affected)

(0 rows affected)

(0 rows affected)

(0 rows affected)

(0 rows affected)
Query was canceled by user.

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            NIP        Aktywny
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- -------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             NULL       1
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             NULL       1
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             NULL       1
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             NULL       1
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             NULL       0
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             NULL       1
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             NULL       1
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             NULL       1
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             NULL       1
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             NULL       1

(10 rows affected)

IdArchiwalne DaneXML                                                                                                                                                                                                                                                          DataArchiwizacji
------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------
1            <Archiwum><DaneArchiwalne><IdKlient>5</IdKlient><Imie>Zuzanna</Imie><Nazwisko>Paj¹k</Nazwisko><Miejscowosc>Konin</Miejscowosc><Ulica>Ciemna</Ulica><NrDomu>6b</NrDomu><KodPocztowy>62-500</KodPocztowy><Poczta>Konin</Poczta><NrTelefonu>+48 59 3439 141</NrTele 2023-11-12 03:29:17.620

(1 row affected)

IdKlientUprawnienia IdKlient    KategoriaPrawaJazdy
------------------- ----------- -------------------
1                   1           B
2                   2           B
3                   2           C
4                   3           B1
5                   4           B
7                   6           B
8                   6           B+E
9                   6           C
10                  6           C+E

(9 rows affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
11             3           1           5           5               Karta                     2023-11-11 11:00:00.000 2023-11-13 17:00:00.000 NULL                    945,00                NULL                  1                  NULL
12             4           6           5           5               Karta                     2023-11-10 11:00:00.000 2023-11-11 11:00:00.000 2023-11-11 11:00:00.000 570,00                570,00                0                  NULL

(11 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL

(7 rows affected)

Wynik: Uruchomienie procedury wp³ynê³o na 1 wiersz, ale po jej przerwaniu przez u¿ytkownika b³¹d zosta³ wycofany.
*/

--------------------------------------------------------------------------------------------------
-- Testowanie procedur wyzwalanych.
--------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- W1. Unikalnoœæ pola opcjonalnego "NIP" w tabeli [Klient].
-- Procedura wyzwalana typu AFTER.
---------------------------------------------------------------------------------------------------

/*
-- Przypadek I: wprowadzenia prawid³owych danych - unikalnego numeru NIP.

UPDATE dbo.Klient
SET NIP = '111122223'
WHERE IdKlient = 1;
GO

(1 row affected)

SELECT *
FROM dbo.Klient;
GO

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            NIP        Aktywny
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- -------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             111122223  1
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             NULL       1
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             NULL       1
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             NULL       1
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             NULL       0
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             NULL       1
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             NULL       1
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             NULL       1
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             NULL       1
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             NULL       1

(10 rows affected)
*/

/*
-- Przypadek II: próba wprowadzenia b³êdnych danych - powielonego unikalnego numeru NIP.

UPDATE dbo.Klient
SET NIP = '111122223'
WHERE IdKlient = 2;
GO

Msg 50000, Level 16, State 1, Procedure tr_Klient_A_IU, Line 16 [Batch Start Line 2029]
Numer NIP musi byæ unikalny
Msg 3609, Level 16, State 1, Line 2030
The transaction ended in the trigger. The batch has been aborted.

SELECT *
FROM dbo.Klient;
GO

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            NIP        Aktywny
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- -------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             111122223  1
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             NULL       1
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             NULL       1
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             NULL       1
5           Zuzanna              Paj¹k                                    NULL                                     Konin                          Ciemna                                             6b         NULL       62-500      Konin                                              +48 59 3439 141 z_pajak@firma.pl               NULL                                                                                                                                                                                                                                                             NULL       0
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             NULL       1
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             NULL       1
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             NULL       1
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             NULL       1
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             NULL       1

(10 rows affected)

Wniosek: procedura wyzwalana typu AFTER dzia³a zgodnie z za³o¿eniami.
*/

---------------------------------------------------------------------------------------------------
-- W2. Wycofanie niedozwolonej operacji usuwania zrealizowanego wypo¿yczenia.
-- Procedura wyzwalana typu INSTEAD OF.
---------------------------------------------------------------------------------------------------

/*
SELECT *
FROM dbo.Wypozyczenie;
GO

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
11             3           1           5           5               Karta                     2023-11-11 11:00:00.000 2023-11-13 17:00:00.000 NULL                    945,00                NULL                  1                  NULL
12             4           6           5           5               Karta                     2023-11-10 11:00:00.000 2023-11-11 11:00:00.000 2023-11-11 11:00:00.000 570,00                570,00                0                  NULL

(11 rows affected)
*/

/*
-- Przypadek I: próba usuniêcia nieaktywnego wypo¿yczenia.
DELETE FROM dbo.Wypozyczenie
WHERE IdWypozyczenie = 11;
GO

(1 row affected)

(1 row affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
12             4           6           5           5               Karta                     2023-11-10 11:00:00.000 2023-11-11 11:00:00.000 2023-11-11 11:00:00.000 570,00                570,00                0                  NULL

(10 rows affected)
*/

/*
-- Przypadek II: próba usuniêcia aktywnego wypo¿yczenia.
DELETE FROM dbo.Wypozyczenie
WHERE IdWypozyczenie = 12;
GO

Msg 50000, Level 16, State 1, Procedure tr_Wypozyczenie_I_D, Line 17 [Batch Start Line 2116]
Nie mo¿na usun¹æ zrealizowanego wypo¿yczenia.

(1 row affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
12             4           6           5           5               Karta                     2023-11-10 11:00:00.000 2023-11-11 11:00:00.000 2023-11-11 11:00:00.000 570,00                570,00                0                  NULL

(10 rows affected)

Wynik: procedura dzia³a zgodnie z za³o¿eniami.
*/

---------------------------------------------------------------------------------------------------
-- W3. "Miêkkie" usuwanie wierszy - oznaczanie ich jako nieaktywnych.
-- Procedura wyzwalana typu INSTEAD OF.
---------------------------------------------------------------------------------------------------

/*
SELECT *
FROM dbo.Klienci_Aktywni;
GO

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            NIP
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             111122223 
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             NULL
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             NULL
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             NULL
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             NULL
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             NULL
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             NULL
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             NULL
10          Marcin               Stefaniak                                NULL                                     Warszówka                      NULL                                               10         NULL       62-800      Kalisz                                             +48 62 4264 321 m.stefaniak123@wp.pl           NULL                                                                                                                                                                                                                                                             NULL

(9 rows affected)
*/

/*
DELETE dbo.Klient
WHERE IdKlient = 10;
GO
*/

/*
(1 row affected)

(1 row affected)

IdKlient    Imie                 Nazwisko                                 Nazwa                                    Miejscowosc                    Ulica                                              NrDomu     NrLokalu   KodPocztowy Poczta                                             NrTelefonu      AdresMail                      Uwagi                                                                                                                                                                                                                                                            NIP
----------- -------------------- ---------------------------------------- ---------------------------------------- ------------------------------ -------------------------------------------------- ---------- ---------- ----------- -------------------------------------------------- --------------- ------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------
1           Andrzej              Michalak                                 NULL                                     Kalisz                         ¯wirki i Wigury                                    22         NULL       62-800      Kalisz                                             +48 553 512 420 andrzej.marciniak@gmail.com    NULL                                                                                                                                                                                                                                                             111122223 
2           Micha³               Mietczyñski                              NULL                                     Kalisz                         Konopnicka                                         12         NULL       62-800      Kalisz                                             +48 593 439 941 michal.mietczynski@wp.pl       NULL                                                                                                                                                                                                                                                             NULL
3           Aleksandra           Michalik                                 FB ANTCZAK                               Kalisz                         Babina                                             1          3a         62-800      Kalisz                                             +48 533 322 167 aleksandra.michalik@gmail.com  NULL                                                                                                                                                                                                                                                             NULL
4           Adam                 Kula                                     NULL                                     Pruszków                       NULL                                               32         NULL       62-800      Kalisz                                             +48 521 139 953 adam.kula@onet.pl              NULL                                                                                                                                                                                                                                                             NULL
6           Konrad               Rusek                                    NULL                                     Ostrów Wielkopolski            Kaliska                                            1          3          63-400      Ostrów Wielkopolski                                +48 511 429 644 konrad.rusek99@firma.pl        NULL                                                                                                                                                                                                                                                             NULL
7           Jan                  Kowalski                                 Pratt & Whitney Kalisz SP. z o. o.       Kalisz                         Elektryczna                                        4a         NULL       62-800      Kalisz                                             +48 542 434 909 jan.kowalski@pwk.com.pl        NULL                                                                                                                                                                                                                                                             NULL
8           Robert               Kowalski                                 Przedsiêbiorstwo KWADRAT Sp. z o.o.      Konin                          Jasna                                              3          4          62-500      Konin                                              +48 502 902 433 robert.kolanski@onet.pl        NULL                                                                                                                                                                                                                                                             NULL
9           Marcin               Borysiuk                                 NULL                                     Kalisz                         Przechodnia                                        3          6          62-800      Kalisz                                             +48 51 1512 532 m.borysiuk56@gmail.com         NULL                                                                                                                                                                                                                                                             NULL

(8 rows affected)

Wynik: procedura dzia³a zgodnie z za³o¿eniami.
*/

---------------------------------------------------------------------------------------------------
-- W4. Zabezpieczenie schematy bazy danych przed niedozwolonymi modyfikacjami.
-- Procedura wyzwalana DDL.
---------------------------------------------------------------------------------------------------

/*
CREATE TABLE A 
(
	Id int NOT NULL
);
GO
*/

/*
Msg 50000, Level 16, State 1, Procedure tr_ZabezpieczenieSchematu, Line 6 [Batch Start Line 2201]
Nie mo¿esz modyfikowaæ struktury tabel.
Msg 3609, Level 16, State 2, Line 2202
The transaction ended in the trigger. The batch has been aborted.

Wynik:Procedura dzia³a zgodnie z za³o¿eniami.
*/

---------------------------------------------------------------------------------------------------
-- (8) Monitorowanie stanu blokowania zasobów podczas uruchamiania
-- transakcji w warunkach wspó³bie¿noœci.
---------------------------------------------------------------------------------------------------

-- Wywo³anie transakcji z poziomu po³¹czenia "proces 1" (spid = 66).
/*
EXECUTE dbo.Pracownik_Archiwizuj
@Par_IdPracownik = 11;
GO
*/

---------------------------------------------------------------------------------------------------
-- (11*) Wywo³anie zakleszczenia (ang. deadlock) procesów wspó³bie¿nych.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- Procedura "dbo.WypozyczenieUsluga_Dodaj_WU".
--
-- Modyfikacja tabel: [Wypozyczenie] --> [Usluga].
---------------------------------------------------------------------------------------------------

/*
SELECT *
FROM dbo.wypozyczenie;
GO

SELECT *
FROM dbo.WypozyczenieUsluga;
GO

SELECT *
FROM dbo.Usluga;
GO
*/

/*
IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 400,00                700,00                0                  Kara 300 za nie pe³ny bak.
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
12             4           6           5           5               Karta                     2023-11-10 11:00:00.000 2023-11-11 11:00:00.000 2023-11-11 11:00:00.000 570,00                570,00                0                  NULL

(10 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL

(7 rows affected)

IdUsluga    Nazwa                          Cena                  Opis                                                                                                                                                                                                                                                             Dostepnosc
----------- ------------------------------ --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Pakiet clean                   50,00                 Us³uga, która zwalnia klientów z koniecznoœci mycia samochodu przed zwrotem. Wypo¿yczalnia dba o czystoœæ zarówno wewn¹trz, jak i na zewn¹trz pojazdu                                                                                                            NULL
2           Pakiet refuel                  450,00                Us³uga, która zwalnia klientów z koniecznoœci tankowania paliwa przed zwrotem samochodu. Wypo¿yczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient mo¿e zwróciæ samochód bez zmartwieñ o puste zbiorniki paliwa.                              NULL
3           Us³uga Wi-Fi Mobilnego         100,00                Us³uga zapewniaj¹ca dostêp do mobilnego Wi-Fi w samochodzie. Klienci mog¹ cieszyæ siê po³¹czeniem internetowym w trakcie podró¿y, umo¿liwiaj¹c ³atwy dostêp do map, informacji o ruchu drogowym i komunikacji online.                                            NULL
4           Us³uga Transferu Lotniskowego  400,00                Us³uga dostêpna na lotniskach, która umo¿liwia klientom wynajem samochodu bezpoœrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport miêdzy lotniskiem a miejscem docelowym.                              NULL
5           Us³uga Dostawy                 180,00                Klientom oferuje siê dostawê samochodu bezpoœrednio pod wskazany adres na terenie miasta. Pracownik wypo¿yczalni dostarcza i odbiera pojazd, umo¿liwiaj¹c wygodne i bezproblemowe korzystanie z us³ugi.                                                          NULL
6           Animal friendly                80,00                 Us³uga dedykowana klientom podró¿uj¹cym ze swoimi zwierzêtami. Wypo¿yczalnia samochodów zapewnia specjalne wyposa¿enie, takie jak transporter lub siatkê oddzielaj¹c¹ baga¿nik, aby zapewniæ bezpieczne i wygodne podró¿owanie zwierz¹t. Dodatkowo, mo¿na skorzy 4
7           Us³uga Przekraczania Granic    300,00                Dodatkowa opcja dla klientów planuj¹cych podró¿ zagraniczn¹. Wypo¿yczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umo¿liwiaj¹c swobodne przekraczanie granic i korzystanie z samochodu za granic¹.                                                      NULL
8           Pakiet equipment               60,00                 Wypo¿yczalnia oferuje dodatkowy sprzêt, tak jak baga¿niki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umo¿liwiæ klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.                                                                  4
9           VIP Chauffeur Experience       1000,00               Ekskluzywny pakiet, który zapewnia niezapomniane doœwiadczenie podró¿y z profesjonalnym szoferem. Klienci mog¹ cieszyæ siê pe³nym komfortem i luksusem, podczas gdy doœwiadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie siê. Ten pakiet jest ide 4
10          Pakiet Weekendowy              200,00                Specjalny pakiet dla klientów, którzy planuj¹ weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umo¿liwiaj¹c pe³ne wykorzystanie czasu na krótk¹ podró¿.                                                              NULL

(10 rows affected)
*/

/*
EXECUTE dbo.WypozyczenieUsluga_Dodaj_WU
@Par_IdWypozyczenieUsluga = 11,
@Par_IdWypozyczenie = 3,
@Par_IdUsluga = 9,
@Par_CenaWypozyczenia = 1000.00,
@Par_Uwagi = 'Brak';
GO
*/

/*
(1 row affected)

(1 row affected)

(1 row affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 1400,00               700,00                0                  Kara 300 za nie pe³ny bak.
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
12             4           6           5           5               Karta                     2023-11-10 11:00:00.000 2023-11-11 11:00:00.000 2023-11-11 11:00:00.000 570,00                570,00                0                  NULL

(10 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL
11                   3              9           Brak

(8 rows affected)

IdUsluga    Nazwa                          Cena                  Opis                                                                                                                                                                                                                                                             Dostepnosc
----------- ------------------------------ --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Pakiet clean                   50,00                 Us³uga, która zwalnia klientów z koniecznoœci mycia samochodu przed zwrotem. Wypo¿yczalnia dba o czystoœæ zarówno wewn¹trz, jak i na zewn¹trz pojazdu                                                                                                            NULL
2           Pakiet refuel                  450,00                Us³uga, która zwalnia klientów z koniecznoœci tankowania paliwa przed zwrotem samochodu. Wypo¿yczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient mo¿e zwróciæ samochód bez zmartwieñ o puste zbiorniki paliwa.                              NULL
3           Us³uga Wi-Fi Mobilnego         100,00                Us³uga zapewniaj¹ca dostêp do mobilnego Wi-Fi w samochodzie. Klienci mog¹ cieszyæ siê po³¹czeniem internetowym w trakcie podró¿y, umo¿liwiaj¹c ³atwy dostêp do map, informacji o ruchu drogowym i komunikacji online.                                            NULL
4           Us³uga Transferu Lotniskowego  400,00                Us³uga dostêpna na lotniskach, która umo¿liwia klientom wynajem samochodu bezpoœrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport miêdzy lotniskiem a miejscem docelowym.                              NULL
5           Us³uga Dostawy                 180,00                Klientom oferuje siê dostawê samochodu bezpoœrednio pod wskazany adres na terenie miasta. Pracownik wypo¿yczalni dostarcza i odbiera pojazd, umo¿liwiaj¹c wygodne i bezproblemowe korzystanie z us³ugi.                                                          NULL
6           Animal friendly                80,00                 Us³uga dedykowana klientom podró¿uj¹cym ze swoimi zwierzêtami. Wypo¿yczalnia samochodów zapewnia specjalne wyposa¿enie, takie jak transporter lub siatkê oddzielaj¹c¹ baga¿nik, aby zapewniæ bezpieczne i wygodne podró¿owanie zwierz¹t. Dodatkowo, mo¿na skorzy 4
7           Us³uga Przekraczania Granic    300,00                Dodatkowa opcja dla klientów planuj¹cych podró¿ zagraniczn¹. Wypo¿yczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umo¿liwiaj¹c swobodne przekraczanie granic i korzystanie z samochodu za granic¹.                                                      NULL
8           Pakiet equipment               60,00                 Wypo¿yczalnia oferuje dodatkowy sprzêt, tak jak baga¿niki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umo¿liwiæ klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.                                                                  4
9           VIP Chauffeur Experience       1000,00               Ekskluzywny pakiet, który zapewnia niezapomniane doœwiadczenie podró¿y z profesjonalnym szoferem. Klienci mog¹ cieszyæ siê pe³nym komfortem i luksusem, podczas gdy doœwiadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie siê. Ten pakiet jest ide 3
10          Pakiet Weekendowy              200,00                Specjalny pakiet dla klientów, którzy planuj¹ weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umo¿liwiaj¹c pe³ne wykorzystanie czasu na krótk¹ podró¿.                                                              NULL

(10 rows affected)
*/

---------------------------------------------------------------------------------------------------
-- Procedura "dbo.WypozyczenieUsluga_Dodaj_UW".
--
-- Modyfikacja tabel: [Usluga] --> [Wypozyczenie].
---------------------------------------------------------------------------------------------------

/*
SELECT *
FROM dbo.wypozyczenie;
GO

SELECT *
FROM dbo.WypozyczenieUsluga;
GO

SELECT *
FROM dbo.Usluga;
GO
*/

/*
EXECUTE dbo.WypozyczenieUsluga_Dodaj_UW
@Par_IdWypozyczenieUsluga = 12,
@Par_IdWypozyczenie = 3,
@Par_IdUsluga = 9,
@Par_CenaWypozyczenia = 1000.00,
@Par_Uwagi = 'Brak';
GO
*/

/*
(1 row affected)

(1 row affected)

(1 row affected)

IdWypozyczenie IdKlient    IdSamochod  IdPracownik IdUbezpieczenie SposobPlatnosci           DataWypozyczenia        TerminZwrotu            DataZwrotu              CenaPrzewidywana      CenaOstateczna        StatusWypozyczenia Uwagi
-------------- ----------- ----------- ----------- --------------- ------------------------- ----------------------- ----------------------- ----------------------- --------------------- --------------------- ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1              1           1           2           1               Gotówka                   2023-05-06 12:00:00.000 2023-05-13 12:00:00.000 NULL                    1200,00               NULL                  1                  NULL
2              3           1           3           3               Przelew                   2022-01-03 16:00:00.000 2022-01-06 21:00:00.000 2022-01-06 21:00:00.000 800,00                800,00                0                  NULL
3              1           2           3           4               BLIK                      2022-02-03 12:00:00.000 2022-02-04 12:00:00.000 2022-02-04 12:00:00.000 2400,00               700,00                0                  Kara 300 za nie pe³ny bak.
5              7           3           4           1               Aplikacja mobilna         2023-02-03 10:00:00.000 2023-02-04 10:00:00.000 2023-02-04 10:00:00.000 1000,00               1000,00               0                  NULL
6              3           1           2           2               BLIK                      2022-12-01 08:00:00.000 2022-12-12 17:00:00.000 2022-12-12 17:00:00.000 2000,00               4000,00               0                  Kara 2000 za uszkodzenia pojazdu.
7              3           2           2           2               Przelew                   2023-06-05 19:00:00.000 2023-06-11 09:00:00.000 NULL                    850,00                NULL                  1                  NULL
8              9           5           3           1               System p³atnoœci onl      2023-01-04 10:00:00.000 2023-01-04 20:00:00.000 2023-01-04 20:00:00.000 300,00                300,00                0                  NULL
9              2           2           2           2               Gotówka                   2023-04-21 15:00:00.000 2023-04-24 12:00:00.000 2023-04-24 12:00:00.000 700,00                700,00                0                  NULL
10             3           2           4           1               Gotówka                   2023-03-17 10:00:00.000 2023-03-17 16:00:00.000 2023-03-17 16:00:00.000 400,00                400,00                0                  NULL
12             4           6           5           5               Karta                     2023-11-10 11:00:00.000 2023-11-11 11:00:00.000 2023-11-11 11:00:00.000 570,00                570,00                0                  NULL

(10 rows affected)

IdWypozyczenieUsluga IdWypozyczenie IdUsluga    Uwagi
-------------------- -------------- ----------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4                    1              1           NULL
5                    3              10          Niewywi¹zanie siê z zasad us³ugi, kara 200z³
6                    10             1           NULL
7                    5              1           NULL
8                    5              2           NULL
9                    5              10          NULL
10                   2              7           NULL
11                   3              9           Brak
12                   3              9           Brak

(9 rows affected)

IdUsluga    Nazwa                          Cena                  Opis                                                                                                                                                                                                                                                             Dostepnosc
----------- ------------------------------ --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Pakiet clean                   50,00                 Us³uga, która zwalnia klientów z koniecznoœci mycia samochodu przed zwrotem. Wypo¿yczalnia dba o czystoœæ zarówno wewn¹trz, jak i na zewn¹trz pojazdu                                                                                                            NULL
2           Pakiet refuel                  450,00                Us³uga, która zwalnia klientów z koniecznoœci tankowania paliwa przed zwrotem samochodu. Wypo¿yczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient mo¿e zwróciæ samochód bez zmartwieñ o puste zbiorniki paliwa.                              NULL
3           Us³uga Wi-Fi Mobilnego         100,00                Us³uga zapewniaj¹ca dostêp do mobilnego Wi-Fi w samochodzie. Klienci mog¹ cieszyæ siê po³¹czeniem internetowym w trakcie podró¿y, umo¿liwiaj¹c ³atwy dostêp do map, informacji o ruchu drogowym i komunikacji online.                                            NULL
4           Us³uga Transferu Lotniskowego  400,00                Us³uga dostêpna na lotniskach, która umo¿liwia klientom wynajem samochodu bezpoœrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport miêdzy lotniskiem a miejscem docelowym.                              NULL
5           Us³uga Dostawy                 180,00                Klientom oferuje siê dostawê samochodu bezpoœrednio pod wskazany adres na terenie miasta. Pracownik wypo¿yczalni dostarcza i odbiera pojazd, umo¿liwiaj¹c wygodne i bezproblemowe korzystanie z us³ugi.                                                          NULL
6           Animal friendly                80,00                 Us³uga dedykowana klientom podró¿uj¹cym ze swoimi zwierzêtami. Wypo¿yczalnia samochodów zapewnia specjalne wyposa¿enie, takie jak transporter lub siatkê oddzielaj¹c¹ baga¿nik, aby zapewniæ bezpieczne i wygodne podró¿owanie zwierz¹t. Dodatkowo, mo¿na skorzy 4
7           Us³uga Przekraczania Granic    300,00                Dodatkowa opcja dla klientów planuj¹cych podró¿ zagraniczn¹. Wypo¿yczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umo¿liwiaj¹c swobodne przekraczanie granic i korzystanie z samochodu za granic¹.                                                      NULL
8           Pakiet equipment               60,00                 Wypo¿yczalnia oferuje dodatkowy sprzêt, tak jak baga¿niki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umo¿liwiæ klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.                                                                  4
9           VIP Chauffeur Experience       1000,00               Ekskluzywny pakiet, który zapewnia niezapomniane doœwiadczenie podró¿y z profesjonalnym szoferem. Klienci mog¹ cieszyæ siê pe³nym komfortem i luksusem, podczas gdy doœwiadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie siê. Ten pakiet jest ide 2
10          Pakiet Weekendowy              200,00                Specjalny pakiet dla klientów, którzy planuj¹ weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umo¿liwiaj¹c pe³ne wykorzystanie czasu na krótk¹ podró¿.                                                              NULL

(10 rows affected)

Wynik: obie procedury przechowywane "_WU" oraz "_UW" dzia³aj¹ prawid³owo - zgodnie z za³o¿eniami.
*/

---------------------------------------------------------------------------------------------------
-- Uruchomienie procedury "dbo.WypozyczenieUsluga_Dodaj_WU"
-- z poziomu procesu 2 (spid = 66).
---------------------------------------------------------------------------------------------------

/*
EXECUTE dbo.WypozyczenieUsluga_Skasuj 11;
GO
*/

/*
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
*/

/*
EXECUTE dbo.WypozyczenieUsluga_Dodaj_WU
@Par_IdWypozyczenieUsluga = 11,
@Par_IdWypozyczenie = 3,
@Par_IdUsluga = 9,
@Par_CenaWypozyczenia = 1000.00,
@Par_Uwagi = 'Brak';
GO
*/

/*
(1 row affected)
Msg 1205, Level 13, State 51, Procedure dbo.WypozyczenieUsluga_Dodaj_WU, Line 32 [Batch Start Line 2453]
Transaction (Process ID 66) was deadlocked on lock resources with another process and has been chosen as the deadlock victim. Rerun the transaction.
*/

---------------------------------------------------------------------------------------------------
-- Koniec.
---------------------------------------------------------------------------------------------------