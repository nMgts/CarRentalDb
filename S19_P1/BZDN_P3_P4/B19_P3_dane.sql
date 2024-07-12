--------------------------------------------------------------
-- BZDN_P3: programowanie operacji CRUD oraz transakcji.
--------------------------------------------------------------

--------------------------------------------------------------
-- Kolejność wstawiania danych do bazy.
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

-- Tabela [Klient].

EXECUTE dbo.Klient_Wstaw 1, 'Andrzej', 'Michalak', NULL, 'Kalisz', 'Żwirki i Wigury', '22', NULL, '62-800', 'Kalisz', '+48 553 512 420', 'andrzej.marciniak@gmail.com', NULL;
EXECUTE dbo.Klient_Wstaw 2, 'Michał', 'Mietczyński', NULL, 'Kalisz', 'Konopnicka', '12', NULL, '62-800', 'Kalisz','+48 593 439 941', 'michal.mietczynski@wp.pl', NULL;
EXECUTE dbo.Klient_Wstaw 3, 'Aleksandra', 'Michalik', 'FB ANTCZAK', 'Kalisz', 'Babina', '1', '3a', '62-800', 'Kalisz','+48 533 322 167', 'aleksandra.michalik@gmail.com', NULL;
EXECUTE dbo.Klient_Wstaw 4, 'Adam', 'Kula', NULL, 'Pruszków', NULL, 32, NULL, '62-800', 'Kalisz','+48 521 139 953', 'adam.kula@onet.pl', NULL;
EXECUTE dbo.Klient_Wstaw 5, 'Zuzanna', 'Pająk', NULL, 'Konin', 'Ciemna', '6b', NULL, '62-500', 'Konin','+48 59 3439 141', 'z_pajak@firma.pl', NULL;
EXECUTE dbo.Klient_Wstaw 6, 'Konrad', 'Rusek', NULL, 'Ostrów Wielkopolski', 'Kaliska', 1, 3, '63-400', 'Ostrów Wielkopolski','+48 511 429 644', 'konrad.rusek99@firma.pl', NULL;
EXECUTE dbo.Klient_Wstaw 7, 'Jan', 'Kowalski', 'Pratt & Whitney Kalisz SP. z o. o.', 'Kalisz', 'Elektryczna', '4a', NULL, '62-800', 'Kalisz', '+48 542 434 909', 'jan.kowalski@pwk.com.pl', NULL;
EXECUTE dbo.Klient_Wstaw 8, 'Robert', 'Kowalski', 'Przedsiębiorstwo KWADRAT Sp. z o.o.', 'Konin', 'Jasna', '3', '4', '62-500', 'Konin', '+48 502 902 433', 'robert.kolanski@onet.pl', NULL;
EXECUTE dbo.Klient_Wstaw 9, 'Marcin', 'Borysiuk', NULL, 'Kalisz', 'Przechodnia', '3', '6', '62-800', 'Kalisz', '+48 51 1512 532', 'm.borysiuk56@gmail.com', NULL;
EXECUTE dbo.Klient_Wstaw 10, 'Marcin', 'Stefaniak', NULL, 'Warszówka', NULL, 10, NULL, '62-800', 'Kalisz', '+48 62 4264 321', 'm.stefaniak123@wp.pl', NULL;
GO

--------------------------------------------------------------

-- Tabela [Pracownik].

EXECUTE dbo.Pracownik_Wstaw 1, 'Paweł', 'Malczyński', 'Właściciel', '+48 589 593 943', 'p_malczynski1@gmail.com';
EXECUTE dbo.Pracownik_Wstaw 2, 'Mariusz', 'Iwaniuk', 'Sprzedawca', '+48 585 432 944', 'mariusz_iw123@wp.pl';
EXECUTE dbo.Pracownik_Wstaw 3, 'Michał', 'Kowalczyk', 'Sprzedawca', '+48 592 123 543', 'm.kowalczyk@gmail.com';
EXECUTE dbo.Pracownik_Wstaw 4, 'Marcin', 'Maciejuk', 'Sprzedawca', '+48 53 3426 423', 'iwnmck@onet.pl';
EXECUTE dbo.Pracownik_Wstaw 5, 'Anna', 'Ławniczak', 'Dział marketingu i reklamy', '+48 509 350 533', 'anna.lawniczak@gmail.com';
EXECUTE dbo.Pracownik_Wstaw 6, 'Amadeusz', 'Kaczyński', 'Kierownik', '+48 59 2232 436', 'a_kaczynski@wp.pl';
EXECUTE dbo.Pracownik_Wstaw 7, 'Jolanta', 'Kaczmarek', 'Inspektor pojazdów', '+48 593 993 732', 'jolana.kaczmarek@gmail.com';
EXECUTE dbo.Pracownik_Wstaw 8, 'Mirosław', 'Steczyński', 'Specjalista ds. obsługi klienta online', '+48 577 593 433', 'miroslaw.steczynski94@wp.pl';
EXECUTE dbo.Pracownik_Wstaw 9, 'Klaudia', 'Kukułka', 'Administrator systemu', '+48 583 553 523', 'klaudia.kukulka@gmail.com';
EXECUTE dbo.Pracownik_Wstaw 10, 'Marcel', 'Winiecki', 'Konsultant ubezpieczeniowy', '+48 503 463 553', 'marcel_win85@wp.pl';
GO

--------------------------------------------------------------

-- Tabela [Uprawnienia].

EXECUTE dbo.Uprawnienia_Wstaw 'A', 'Uprawnia do prowadzenia motocykli o pojemności silnika powyżej 125 cm³ lub mocy powyżej 11 kW.';
EXECUTE dbo.Uprawnienia_Wstaw 'AM', 'Uprawnia do prowadzenia pojazdów typu quad (czterokołowce) oraz motocykli o pojemności silnika do 50 cm³.';
EXECUTE dbo.Uprawnienia_Wstaw 'A1', 'Uprawnia do prowadzenia motocykli o pojemności silnika do 125 cm³ i mocy do 11 kW.';
EXECUTE dbo.Uprawnienia_Wstaw 'A2', 'Uprawnia do prowadzenia motocykli o pojemności silnika do 35 kW (48 KM) oraz stosunku mocy do masy nieprzekraczającego 0,2 kW/kg.'
EXECUTE dbo.Uprawnienia_Wstaw 'B', 'Uprawnia do prowadzenia samochodów osobowych o masie całkowitej do 3,5 tony oraz do 9 miejsc siedzących, nie licząc kierowcy.';
EXECUTE dbo.Uprawnienia_Wstaw 'B1', 'Uprawnia do prowadzenia pojazdów o masie, która nie przekracza 400 kg oraz mocy nie większej niż 15 kW = maksymalnie 20,4 KM.';
EXECUTE dbo.Uprawnienia_Wstaw 'B+E', 'Uprawnia do prowadzenia samochodu osobowego z przyczepą o masie całkowitej przekraczającej 750 kg.';
EXECUTE dbo.Uprawnienia_Wstaw 'C', 'Uprawnia do prowadzenia samochodami ciężarowymi o masie całkowitej powyżej 3,5 tony.';
EXECUTE dbo.Uprawnienia_Wstaw 'C+E', 'Uprawnia do prowadzenia zestawu pojazdów składającego się z samochodu ciężarowego i przyczepy o masie całkowitej przekraczającej 750 kg.';
EXECUTE dbo.Uprawnienia_Wstaw 'D', 'Uprawnia do prowadzenia autobusów przewożących pasażerów na terenie kraju.';
GO

--------------------------------------------------------------

-- Tabela [Ubezpieczenie].

EXECUTE dbo.Ubezpieczenie_Wstaw 1, 'Ubezpieczenie podstawowe', 0, 'OC, AC, ubezpieczenie od kradzieży.';
EXECUTE dbo.Ubezpieczenie_Wstaw 2, 'Ubezpieczenie rozszerzone', 80, 'CDW + ubezpieczenie podstawowe';
EXECUTE dbo.Ubezpieczenie_Wstaw 3, 'Ubezpieczenie roszerzone plus', 100, 'GT, RP + ubezieczenie rozszerzone';
EXECUTE dbo.Ubezpieczenie_Wstaw 4, 'Ubezpieczenie ultra', 200, 'SCDW + ubezpieczenie rozszerzone plus';
EXECUTE dbo.Ubezpieczenie_Wstaw 5, 'Ubezpieczenie max', 270, 'PAI + ubezpieczenie ultra';
GO

--------------------------------------------------------------

-- Tabela [Platnosc].

EXECUTE dbo.Platnosc_Wstaw 'BLIK';
EXECUTE dbo.Platnosc_Wstaw 'Przelew';
EXECUTE dbo.Platnosc_Wstaw 'Karta';
EXECUTE dbo.Platnosc_Wstaw 'Gotówka';
EXECUTE dbo.Platnosc_Wstaw 'System płatności online';
EXECUTE dbo.Platnosc_Wstaw 'Aplikacja mobilna';
GO

--------------------------------------------------------------

-- Tabela [Usluga].

EXECUTE dbo.Usluga_Wstaw 1, 'Pakiet clean', 50, 'Usługa, która zwalnia klientów z konieczności mycia samochodu przed zwrotem. Wypożyczalnia dba o czystość zarówno wewnątrz, jak i na zewnątrz pojazdu';
EXECUTE dbo.Usluga_Wstaw 2, 'Pakiet refuel', 450, 'Usługa, która zwalnia klientów z konieczności tankowania paliwa przed zwrotem samochodu. Wypożyczalnia samochodów dba o zatankowanie pojazdu przed odbiorem, a klient może zwrócić samochód bez zmartwień o puste zbiorniki paliwa.';
EXECUTE dbo.Usluga_Wstaw 3, 'Usługa Wi-Fi Mobilnego', 100, 'Usługa zapewniająca dostęp do mobilnego Wi-Fi w samochodzie. Klienci mogą cieszyć się połączeniem internetowym w trakcie podróży, umożliwiając łatwy dostęp do map, informacji o ruchu drogowym i komunikacji online.';
EXECUTE dbo.Usluga_Wstaw 4, 'Usługa Transferu Lotniskowego', 400, 'Usługa dostępna na lotniskach, która umożliwia klientom wynajem samochodu bezpośrednio po przylocie lub dostarczenie pojazdu na lotnisko przed odlotem. Zapewnia wygodny i szybki transport między lotniskiem a miejscem docelowym.';
EXECUTE dbo.Usluga_Wstaw 5, 'Usługa Dostawy', 180, 'Klientom oferuje się dostawę samochodu bezpośrednio pod wskazany adres na terenie miasta. Pracownik wypożyczalni dostarcza i odbiera pojazd, umożliwiając wygodne i bezproblemowe korzystanie z usługi.';
EXECUTE dbo.Usluga_Wstaw 6, 'Animal friendly', 80, 'Usługa dedykowana klientom podróżującym ze swoimi zwierzętami. Wypożyczalnia samochodów zapewnia specjalne wyposażenie, takie jak transporter lub siatkę oddzielającą bagażnik, aby zapewnić bezpieczne i wygodne podróżowanie zwierząt. Dodatkowo, można skorzystać z usługi czyszczenia samochodu po podróży ze zwierzęciem, aby utrzymać pojazd w czystości i zapewnić higieniczne warunki dla następnych klientów.';
EXECUTE dbo.Usluga_Wstaw 7, 'Usługa Przekraczania Granic', 300, 'Dodatkowa opcja dla klientów planujących podróż zagraniczną. Wypożyczalnia zapewnia odpowiednie dokumenty i ubezpieczenia, umożliwiając swobodne przekraczanie granic i korzystanie z samochodu za granicą.'
EXECUTE dbo.Usluga_Wstaw 8, 'Pakiet equipment', 60, 'Wypożyczalnia oferuje dodatkowy sprzęt, tak jak bagażniki dachowe, uchwyty na rowery, narty lub deski surfingowe, aby umożliwić klientom dostosowanie pojazdu do swoich indywidualnych potrzeb.';
EXECUTE dbo.Usluga_Wstaw 9, 'VIP Chauffeur Experience', 1000, 'Ekskluzywny pakiet, który zapewnia niezapomniane doświadczenie podróży z profesjonalnym szoferem. Klienci mogą cieszyć się pełnym komfortem i luksusem, podczas gdy doświadczony kierowca zapewnia bezpieczne i wygodne przemieszczanie się. Ten pakiet jest idealny dla osób, które pragną podróżować z klasą i stylem, mając gwarancję pierwszorzędnego obsługi i pełnej swobody.';
EXECUTE dbo.Usluga_Wstaw 10, 'Pakiet Weekendowy', 200, 'Specjalny pakiet dla klientów, którzy planują weekendowe wypady. Oferuje preferencyjne ceny i elastyczne godziny odbioru i zwrotu pojazdu, umożliwiając pełne wykorzystanie czasu na krótką podróż.';
GO

--------------------------------------------------------------

-- Tabela [Kategoria].

EXECUTE dbo.Kategoria_Wstaw 'Ekonomiczna', 80, 'Kompaktowe samochody o niskim zużyciu paliwa, idealne do codziennych podróży miejskich. Posiadają podstawowe funkcje i wystarczająco dużo miejsca dla jednej lub dwóch osób.';
EXECUTE dbo.Kategoria_Wstaw 'Rodzinna', 90, 'Przestronne samochody typu kombi lub SUV, idealne dla rodzin i większych grup podróżujących. Oferują wygodną przestrzeń pasażerską i wystarczającą pojemność bagażnika.';
EXECUTE dbo.Kategoria_Wstaw 'Premium', 300, 'Luksusowe samochody z najnowszymi funkcjami i eleganckim wykończeniem. Zapewniają wyjątkowy komfort, styl i doskonałe osiągi. Doskonałe do podróży służbowych lub specjalnych okazji.';
EXECUTE dbo.Kategoria_Wstaw 'Sportowe', 350, 'Dynamiczne samochody o wysokich osiągach i agresywnym designie. Zapewniają emocjonujące wrażenia z jazdy i doskonałą reakcję na drodze.';
EXECUTE dbo.Kategoria_Wstaw 'SUV/Terenowe', 180, 'Wytrzymałe samochody terenowe o dużej przestrzeni w kabinie pasażerskiej i doskonałych możliwościach jazdy w różnych warunkach terenowych. Idealne do podróży poza miasto.';
EXECUTE dbo.Kategoria_Wstaw 'Super Luxury', 600, 'Najwyższy poziom luksusu i prestiżu. Oferuje ekskluzywne samochody z najwyższym wyposażeniem, najnowszymi technologiami i niezrównanym komfortem.';
EXECUTE dbo.Kategoria_Wstaw 'Performance', 500, 'Potężne samochody z wysokimi osiągami, które zapewniają niezwykłe wrażenia z jazdy. Posiadają zaawansowane systemy napędowe i sportowe osiągi.';
EXECUTE dbo.Kategoria_Wstaw 'Dostawcze', 250, 'Samochody dostawcze, które umożliwiają przewóz różnych towarów i materiałów. Charakteryzują się większą przestrzenią ładunkową, wygodnym dostępem do przestrzeni ładunkowej oraz różnymi udogodnieniami, takimi jak systemy zabezpieczające ładunek czy uchwyty mocujące. Doskonałe rozwiązanie dla przedsiębiorców i osób potrzebujących transportu towarów.';
EXECUTE dbo.Kategoria_Wstaw 'Elektryczne', 200, 'Samochody elektryczne, które są zasilane energią elektryczną, co sprawia, że są przyjazne dla środowiska i generują mniejsze emisje. Samochody elektryczne oferują cichą jazdę, niskie koszty eksploatacji i większą efektywność energetyczną. Są doskonałym wyborem dla osób dbających o środowisko i poszukujących innowacyjnych rozwiązań.';
EXECUTE dbo.Kategoria_Wstaw 'Klasyczny/Antyk', 400, 'Klasyczne samochody z przeszłości, które zachwycają swoim pięknym wzornictwem i duchem retro. Idealne dla miłośników motoryzacji i unikalnych doświadczeń.';
GO

--------------------------------------------------------------

-- Tabela [Marka].

EXECUTE dbo.Marka_Wstaw 'BMW';
EXECUTE dbo.Marka_Wstaw 'Audi';
EXECUTE dbo.Marka_Wstaw 'Mercedes';
EXECUTE dbo.Marka_Wstaw 'Volvo';
EXECUTE dbo.Marka_Wstaw 'Lexus';
EXECUTE dbo.Marka_Wstaw 'Rolls-Royce';
EXECUTE dbo.Marka_Wstaw 'Lamborghini';
EXECUTE dbo.Marka_Wstaw 'Porsche';
EXECUTE dbo.Marka_Wstaw 'Ford';
EXECUTE dbo.Marka_Wstaw 'Hyundai';
GO

--------------------------------------------------------------

-- Tabela [KlientUprawnienia].

EXECUTE dbo.KlientUprawnienia_Wstaw 1, 1, 'B';
EXECUTE dbo.KlientUprawnienia_Wstaw 2, 2, 'B';
EXECUTE dbo.KlientUprawnienia_Wstaw 3, 2, 'C';
EXECUTE dbo.KlientUprawnienia_Wstaw 4, 3, 'B1';
EXECUTE dbo.KlientUprawnienia_Wstaw 5, 4, 'B';
EXECUTE dbo.KlientUprawnienia_Wstaw 6, 5, 'B';
EXECUTE dbo.KlientUprawnienia_Wstaw 7, 6, 'B';
EXECUTE dbo.KlientUprawnienia_Wstaw 8, 6, 'B+E';
EXECUTE dbo.KlientUprawnienia_Wstaw 9, 6, 'C';
EXECUTE dbo.KlientUprawnienia_Wstaw 10, 6, 'C+E';
GO

--------------------------------------------------------------

-- Tabela [Model].

EXECUTE dbo.Model_Wstaw 'Seria 1', 'BMW';
EXECUTE dbo.Model_Wstaw 'Seria 5', 'BMW';
EXECUTE dbo.Model_Wstaw 'Seria 7', 'BMW';
EXECUTE dbo.Model_Wstaw 'A4', 'Audi';
EXECUTE dbo.Model_Wstaw 'Q3', 'Audi';
EXECUTE dbo.Model_Wstaw 'G klasa', 'Mercedes';
EXECUTE dbo.Model_Wstaw 'S klasa', 'Mercedes';
EXECUTE dbo.Model_Wstaw 'Cullinan', 'Rolls-Royce';
EXECUTE dbo.Model_Wstaw '911', 'Porsche';
EXECUTE dbo.Model_Wstaw 'Mondeo', 'Ford';
EXECUTE dbo.Model_Wstaw 'Aventador', 'Lamborghini';
GO

--------------------------------------------------------------

-- Tabela [Samochod].

EXECUTE dbo.Samochod_Wstaw 1, 'Premium', 'Seria 7', 1, 5, 2021, 'Diesel', 'BMW 740d xDrive';
EXECUTE dbo.Samochod_Wstaw 2, 'Sportowe', '911', 0, 2, 2020, 'Benzyna', '911 Carrera';
EXECUTE dbo.Samochod_Wstaw 3, 'Rodzinna', 'Mondeo', 1, 5, 2017, 'Diesel', 'Ford Mondeo 2.0 TDCi';
EXECUTE dbo.Samochod_Wstaw 4, 'Super Luxury', 'Cullinan', 1, 5, 2023, 'Benzyna', 'Rolls-Royce Cullinan Black Badge';
EXECUTE dbo.Samochod_Wstaw 5, 'Performance', 'Aventador', 0, 2, 2023, 'Benzyna', 'Lamborghini Aventador Reuvelto';
EXECUTE dbo.Samochod_Wstaw 6, 'Premium', 'A4', 1, 5, 2022, 'Diesel', 'Audi A4 40 TDI MHEV Quattro S Line S Tronic';
EXECUTE dbo.Samochod_Wstaw 7, 'Rodzinna', 'Mondeo', 0, 5, 2018, 'Hybryda', 'Ford Mondeo Vignale 2.0 Hybrid';
EXECUTE dbo.Samochod_Wstaw 8, 'SUV/Terenowe', 'Q3', 0, 5, 2017, 'Diesel', 'Audi Q3 2.0 TDI';
EXECUTE dbo.Samochod_Wstaw 9, 'Premium', 'Seria 7', 0, 5, 2022, 'Diesel', 'BMW Seria 7 730d MHEV';
EXECUTE dbo.Samochod_Wstaw 10, 'Sportowe', 'Seria 7', 0, 5, 2022, 'Benzyna', 'BMW Seria 7 740d XDrive MHEV M Sport Sport';
GO

--------------------------------------------------------------

-- Tabela [Wypozyczenie].

EXECUTE dbo.Wypozyczenie_Wstaw 1, 1, 1, 2, 1, 'Gotówka', '2023-05-06 12:00', '2023-05-13 12:00', NULL, 1200, NULL, 1, NULL;
EXECUTE dbo.Wypozyczenie_Wstaw 2, 3, 1, 3, 3, 'Przelew', '2022-01-03 16:00', '2022-01-06 21:00', '2022-01-06 21:00', 800, 800, 0, NULL;
EXECUTE dbo.Wypozyczenie_Wstaw 3, 1, 2, 3, 4, 'BLIK', '2022-02-03 12:00', '2022-02-04 12:00', '2022-02-04 12:00', 400, 700, 0, 'Kara 300 za nie pełny bak.';
EXECUTE dbo.Wypozyczenie_Wstaw 4, 5, 7, 4, 4, 'Karta', '2023-05-05 14:00', '2023-05-25 14:00', NULL, 6000, NULL, 1, NULL;
EXECUTE dbo.Wypozyczenie_Wstaw 5, 7, 3, 4, 1, 'Aplikacja mobilna', '2023-02-03 10:00', '2023-02-04 10:00', '2023-02-04 10:00', 1000, 1000, 0, NULL;
EXECUTE dbo.Wypozyczenie_Wstaw 6, 3, 1, 2, 2, 'BLIK', '2022-12-01 8:00', '2022-12-12 17:00', '2022-12-12 17:00', 2000, 4000, 0, 'Kara 2000 za uszkodzenia pojazdu.';
EXECUTE dbo.Wypozyczenie_Wstaw 7, 3, 2, 2, 2, 'Przelew', '2023-06-05 19:00', '2023-06-11 9:00', NULL, 850, NULL, 1, NULL;
EXECUTE dbo.Wypozyczenie_Wstaw 8, 9, 5, 3, 1, 'System płatności online', '2023-01-04 10:00', '2023-01-04 20:00', '2023-01-04 20:00', 300, 300, 0, NULL;
EXECUTE dbo.Wypozyczenie_Wstaw 9, 2, 2, 2, 2, 'Gotówka', '2023-04-21 15:00', '2023-04-24 12:00', '2023-04-24 12:00', 700, 700, 0, NULL;
EXECUTE dbo.Wypozyczenie_Wstaw 10, 3, 2, 4, 1, 'Gotówka', '2023-03-17 10:00', '2023-03-17 16:00', '2023-03-17 16:00', 400, 400, 0, NULL;
GO

--------------------------------------------------------------

-- Tabela [WypozyczenieUsluga].

EXECUTE dbo.WypozyczenieUsluga_Wstaw 1, 4, 1, NULL;
EXECUTE dbo.WypozyczenieUsluga_Wstaw 2, 4, 2, NULL;
EXECUTE dbo.WypozyczenieUsluga_Wstaw 3, 4, 6, NULL;
EXECUTE dbo.WypozyczenieUsluga_Wstaw 4, 1, 1, NULL;
EXECUTE dbo.WypozyczenieUsluga_Wstaw 5, 3, 10, 'Niewywiązanie się z zasad usługi, kara 200zł';
EXECUTE dbo.WypozyczenieUsluga_Wstaw 6, 10, 1, NULL;
EXECUTE dbo.WypozyczenieUsluga_Wstaw 7, 5, 1, NULL;
EXECUTE dbo.WypozyczenieUsluga_Wstaw 8, 5, 2, NULL;
EXECUTE dbo.WypozyczenieUsluga_Wstaw 9, 5, 10, NULL;
EXECUTE dbo.WypozyczenieUsluga_Wstaw 10, 2, 7, NULL;
GO

--------------------------------------------------------------