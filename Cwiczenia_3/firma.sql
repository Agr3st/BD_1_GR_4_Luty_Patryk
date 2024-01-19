CREATE DATABASE firma;

USE firma;

CREATE SCHEMA rozliczenia;

-- Tabela pracownicy
CREATE TABLE rozliczenia.pracownicy (
    id_pracownika INT PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    adres VARCHAR(255),
    telefon VARCHAR(20)
);

-- Tabela godziny
CREATE TABLE rozliczenia.godziny (
    id_godziny INT PRIMARY KEY,
    data DATE NOT NULL,
    liczba_godzin INT NOT NULL,
    id_pracownika INT NOT NULL,
    FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika)
);

-- Tabela pensje
CREATE TABLE rozliczenia.pensje (
    id_pensji INT PRIMARY KEY,
    stanowisko VARCHAR(100) NOT NULL,
    kwota MONEY NOT NULL,
    id_premii INT,
    FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii)
);

-- Tabela premie
CREATE TABLE rozliczenia.premie (
    id_premii INT PRIMARY KEY,
    rodzaj VARCHAR(100),
    kwota MONEY NOT NULL
);

-- klucze obce
ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);

ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

-- Wypełnienie tabel rekordami
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
    (1, 'Adam', 'Nowak', 'ul. Kwiatowa 1', '123-456-789'),
    (2, 'Ewa', 'Kowalska', 'ul. Słoneczna 2', '987-654-321'),
    (3, 'Tomasz', 'Wiśniewski', 'ul. Polna 3', '111-222-333'),
    (4, 'Agnieszka', 'Kaczmarek', 'ul. Leśna 4', '555-666-777'),
    (5, 'Kamil', 'Lis', 'ul. Różana 5', '999-888-777'),
    (6, 'Anna', 'Szymańska', 'ul. Brzozowa 6', '444-333-222'),
    (7, 'Piotr', 'Zając', 'ul. Wiosenna 7', '111-999-555'),
    (8, 'Karolina', 'Górska', 'ul. Malinowa 8', '777-888-999'),
    (9, 'Michał', 'Jankowski', 'ul. Jesienna 9', '123-987-456'),
    (10, 'Iwona', 'Kwiatkowska', 'ul. Klonowa 10', '111-222-333'),
    (11, 'Łukasz', 'Sawicki', 'ul. Dębowa 11', '555-444-333'),
    (12, 'Marzena', 'Kubiak', 'ul. Lipowa 12', '999-888-777'),
    (13, 'Rafał', 'Głowacki', 'ul. Modra 13', '444-333-222'),
    (14, 'Alicja', 'Michalska', 'ul. Zielona 14', '111-999-555'),
    (15, 'Paweł', 'Wójcik', 'ul. Biała 15', '777-888-999');

INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
    (1, '2023-11-01', 8, 1),
    (2, '2023-11-02', 7, 2),
    (3, '2023-11-03', 6, 3),
    (4, '2023-11-04', 8, 4),
    (5, '2023-11-05', 7, 5),
    (6, '2023-11-06', 6, 6),
    (7, '2023-11-07', 8, 7),
    (8, '2023-11-08', 7, 8),
    (9, '2023-11-09', 6, 9),
    (10, '2023-11-10', 8, 10),
    (11, '2023-11-11', 7, 11),
    (12, '2023-11-12', 6, 12),
    (13, '2023-11-13', 8, 13),
    (14, '2023-11-14', 7, 14),
    (15, '2023-11-15', 6, 15);

INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES
    (1, 'Premia roczna', 1000),
    (2, 'Premia świąteczna', 500),
    (3, 'Premia za wyniki', 800),
    (4, 'Premia motywacyjna', 1200),
    (5, 'Premia specjalna', 1500),
    (6, 'Premia motywacyjna', 2000),
    (7, 'Premia uznaniowa', 1000),
    (8, 'Premia motywacyjna', 800),
    (9, 'Premia motywacyjna', 1200),
    (10, 'Premia za staż', 1500),
    (11, 'Premia za efektywność', 2000),
    (12, 'Premia motywacyjna', 1000),
    (13, 'Premia motywacyjna', 800),
    (14, 'Premia motywacyjna', 1200),
    (15, 'Premia za staż', 1500);

INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES
    (1, 'Kierownik', 5000, 1),
    (2, 'Specjalista ds. sprzedaży', 4000, 2),
    (3, 'Programista', 4500, 3),
    (4, 'Księgowy', 4200, 4),
    (5, 'Analityk finansowy', 4300, 5),
    (6, 'Doradca klienta', 3500, 6),
    (7, 'Pracownik produkcji', 3200, 7),
    (8, 'Inżynier ds. jakości', 3800, 8),
    (9, 'Specjalista ds. marketingu', 4200, 9),
    (10, 'Technik serwisu', 3700, 10),
    (11, 'Pracownik produkcji', 3400, 11),
    (12, 'Specjalista ds. HR', 3600, 12),
    (13, 'Pracownik produkcji', 3100, 13),
    (14, 'Pracownik produkcji', 3300, 14),
    (15, 'Pracownik produkcji', 3700, 15);

-- Wyświetlić nazwiska i adresy pracowników
SELECT nazwisko, adres FROM rozliczenia.pracownicy;

-- przekonwertowanie daty
ALTER TABLE rozliczenia.godziny
ADD dzien_tygodnia AS DATEPART(WEEKDAY, data),
    miesiac AS DATEPART(MONTH, data);

-- dodanie atrybutu kwota_netto do tabeli pensje
ALTER TABLE rozliczenia.pensje
ADD kwota_netto MONEY;

UPDATE rozliczenia.pensje
SET kwota_netto = kwota * 0.81, -- 19% podatku
    kwota_brutto = kwota; -- zmiana nazwy kwota na kwota_brutto