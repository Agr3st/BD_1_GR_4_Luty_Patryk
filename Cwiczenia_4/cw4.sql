CREATE DATABASE firma;
-- UTWORZENIE BAZY DANYCH

USE firma;

-- UTWORZENIE SCHEMATU KSIEGOWOSC

CREATE SCHEMA ksiegowosc;

-- UTWORZENIE TABEL ORAZ KOMENTARZY

CREATE TABLE ksiegowosc.pracownicy {
	id_pracownika INT PRIMARY KEY,
	imie VARCHAR{50} NOT NULL,
	nazwisko VARCHAR{50} NOT NULL,
	adres VARCHAR{100} NOT NULL,
	telefon VARCHAR{15},
};

COMMENT ON TABLE ksiegowosc.pracownicy IS 'Informacje o pracownikach';


CREATE TABLE ksiegowosc.godziny {
	id_godziny INT PRIMARY KEY,
	data DATE NOT NULL,
	liczba_godzin DECIMAL{5, 2} NOT NULL,
	id_pracownika INT NOT NULL
};

COMMENT ON TABLE ksiegowosc.godziny IS 'Spis przepracowanych godzin';

CREATE TABLE ksiegowosc.pensja {
	id_pensji INT PRIMARY KEY,
	stanowisko VARCHAR{50},
	kwota MONEY NOT NULL
};

COMMENT ON TABLE ksiegowosc.pensja IS 'Informacje o pensjach';

CREATE TABLE ksiegowosc.premia {
	id_premii INT PRIMARY KEY,
	rodzaj VARCHAR{50},
	kwota MONEY NOT NULL
};

COMMENT ON TABLE ksiegowosc.premia IS 'Informacje o premiach';

CREATE TABLE ksiegowosc.wynagrodzenie {
	id_wynagrodzenia INT PRIMARY KEY,
	data DATE NOT NULL,
	id_pracownika INT NOT NULL,
	id_godziny INT NOT NULL,
	id_pensji INT NOT NULL
};

COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Informacje o wypłaconych wynagrodzeniach';


-- DODANIE KLUCZY OBCYCH

ALTER TABLE ksiegowosc.godziny
ADD FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_godziny)
REFERENCES ksiegowosc.godziny(id_godziny);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pensji)
REFERENCES ksiegowosc.pensja(id_pensji);

ALTER TABLE ksiegowosc.pensja
ADD FOREIGN KEY (id_pensji)
REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.premia
ADD FOREIGN KEY (id_premii)
REFERENCES ksiegowosc.pracownicy(id_pracownika);

-- DODANIE REKORDOW DO TABEL

INSERT INTO ksiegowosc.pracownicy 
	(id_pracownika, imie, nazwisko, adres, telefon)
VALUES
(1, 'Jan', 'Kowalski', 'Majowa 5', '554883112'),
(2, 'Anna', 'Nowak', 'Lipcowa 12', '665990234'),
(3, 'Piotr', 'Wiśniewski', 'Kwiatowa 8', '501223987'),
(4, 'Magdalena', 'Dąbrowska', 'Słoneczna 3', '600112345'),
(5, 'Krzysztof', 'Lis', 'Brzozowa 21', '512334567'),
(6, 'Monika', 'Kamińska', 'Akacjowa 7', '555777888'),
(7, 'Tomasz', 'Zając', 'Różana 15', '501112233'),
(8, 'Katarzyna', 'Sikora', 'Konwaliowa 4', '510223344'),
(9, 'Grzegorz', 'Pawlak', 'Klonowa 10', '502334455'),
(10, 'Karolina', 'Kowalczyk', 'Jasna 18', '533112233'),
(11, 'Michał', 'Olszewski', 'Cicha 22', '511223344'),
(12, 'Agnieszka', 'Adamczyk', 'Topolowa 9', '500334455'),
(13, 'Łukasz', 'Wójcik', 'Morska 16', '522112233'),
(14, 'Ewa', 'Kozłowska', 'Polna 25', '501334455'),
(15, 'Marcin', 'Jaworski', 'Szkolna 11', '533223344');

INSERT INTO ksiegowosc.godziny
	(id_godziny, data, liczba_godzin, id_pracownika)
VALUES
(1, '2023-10-01', 7, 1),
(2, '2023-10-02', 6, 2),
(3, '2023-10-03', 8, 3),
(4, '2023-10-04', 5, 4),
(5, '2023-10-05', 7, 5),
(6, '2023-10-06', 6, 6),
(7, '2023-10-07', 8, 7),
(8, '2023-10-08', 5, 8),
(9, '2023-10-09', 7, 9),
(10, '2023-10-10', 6, 10),
(11, '2023-10-11', 8, 11),
(12, '2023-10-12', 5, 12),
(13, '2023-10-13', 7, 13),
(14, '2023-10-14', 6, 14),
(15, '2023-10-15', 8, 15),
(16, '2023-10-16', 5, 1),
(17, '2023-10-17', 7, 2),
(18, '2023-10-18', 6, 3),
(19, '2023-10-19', 8, 4),
(20, '2023-10-20', 5, 5),
(21, '2023-10-21', 6, 6),
(22, '2023-10-22', 7, 7),
(23, '2023-10-23', 5, 8),
(24, '2023-10-24', 8, 9),
(25, '2023-10-25', 6, 10),
(26, '2023-10-26', 7, 11),
(27, '2023-10-27', 5, 12),
(28, '2023-10-28', 8, 13),
(29, '2023-10-29', 7, 14),
(30, '2023-10-30', 6, 15);

INSERT INTO ksiegowosc.pensja
	(id_pensji, stanowisko, kwota)
VALUES
(1, 'Programista', 7500.00),
(2, 'Analityk Systemowy', 8200.00),
(3, 'Inżynier Testów', 6300.00),
(4, 'Administrator Baz Danych', 9200.00),
(5, 'Architekt Systemowy', 5500.00),
(6, 'Programista Frontend', 6900.00),
(7, 'Programista Backend', 8100.00),
(8, 'Projektant UX/UI', 4800.00),
(9, 'Specjalista ds. Bezpieczeństwa IT', 7400.00),
(10, 'Inżynier Sieci', 5700.00),
(11, 'Analityk Big Data', 8800.00),
(12, 'Administrator Systemu', 4800.00),
(13, 'Programista Java', 9500.00),
(14, 'Specjalista ds. CRM', 6200.00),
(15, 'Analityk Biznesowy', 7000.00);

INSERT INTO ksiegowosc.premia
	(id_premii, rodzaj, kwota)
VALUES
(1, 'Premia świąteczna', 400.00),
(2, 'Premia za wyniki', 550.00),
(3, 'Premia jubileuszowa', 320.00),
(4, 'Premia motywacyjna', 700.00),
(5, 'Premia uznaniowa', 480.00),
(6, 'Premia specjalna', 600.00),
(7, 'Premia za dodatkowe zadania', 350.00),
(8, 'Premia za staż pracy', 800.00),
(9, 'Premia za osiągnięcia', 370.00),
(10, 'Premia za efektywność', 520.00);

INSERT INTO ksiegowosc.wynagrodzenie
	(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji)
VALUES
(1, '2023-10-03', 3, 3, 3),
(2, '2023-10-15', 15, 15, 15),
(3, '2023-10-11', 11, 11, 11),
(4, '2023-10-07', 7, 7, 7),
(5, '2023-10-14', 14, 14, 14),
(6, '2023-10-10', 10, 10, 10),
(7, '2023-10-05', 5, 5, 5),
(8, '2023-10-02', 2, 2, 2),
(9, '2023-10-13', 13, 13, 13),
(10, '2023-10-08', 8, 8, 8),
(11, '2023-10-12', 12, 12, 12),
(12, '2023-10-01', 1, 1, 1),
(13, '2023-10-09', 9, 9, 9),
(14, '2023-10-06', 6, 6, 6),
(15, '2023-10-04', 4, 4, 4);

-- ZAPYTANIA

-- Wyświetl tylko id pracownika oraz jego nazwisko
SELECT id_pracownika, nazwisko
FROM ksiegowosc.pracownicy;

-- Wyświetl id pracowników, których płaca jest większa niż 1000
SELECT id_pensji, id_pracownika, kwota
FROM ksiegowosc.pensja
WHERE kwota > 1000;

-- Wyświetl id pracowników nieposiadających premii, których płaca jest większa niż 2000
-- ....

-- Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’
SELECT id_pracownika, imie, nazwisko
FROM ksiegowosc.pracownicy
WHERE LEFT(imie, 1) = 'J';

-- Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’
SELECT id_pracownika, imie, nazwisko
FROM ksiegowosc.pracownicy
WHERE UPPER(nazwisko) LIKE '%N%' AND imie LIKE '%a';

-- Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, standardowy czas pracy to 160 h miesięcznie.
-- .....

-- Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 4500 – 7000 PLN
SELECT
    ksiegowosc.pracownicy.imie,
    ksiegowosc.pracownicy.nazwisko,
    ksiegowosc.pensja.kwota
FROM
    ksiegowosc.pracownicy
JOIN
    ksiegowosc.pensja ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.pensja.id_pracownika
WHERE
    ksiegowosc.pensja.kwota BETWEEN 4500 AND 7000;

-- Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.
-- ...

-- Uszereguj pracowników według pensji. 
SELECT
    imie,
    nazwisko,
    kwota
FROM
    ksiegowosc.pracownicy
JOIN
    ksiegowosc.pensja ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.pensja.id_pracownika
ORDER BY
    kwota ASC;

-- Uszereguj pracowników według pensji i premii malejąco. 
SELECT
    ksiegowosc.pracownicy.imie,
    ksiegowosc.pracownicy.nazwisko,
    ksiegowosc.pensja.kwota AS pensja,
    COALESCE(SUM(ksiegowosc.premia.kwota), 0) AS suma_premii
FROM
    ksiegowosc.pracownicy
JOIN
    ksiegowosc.pensja ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.pensja.id_pracownika
LEFT JOIN
    ksiegowosc.premia ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.premia.id_pracownika
GROUP BY
    ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensja.kwota
ORDER BY
    ksiegowosc.pensja.kwota DESC, suma_premii DESC;

-- Zlicz i pogrupuj pracowników według pola ‘stanowisko’
SELECT
    stanowisko,
    COUNT(*) AS liczba_pracownikow
FROM
    ksiegowosc.pracownicy
GROUP BY
    stanowisko;

-- Policz średnią, minimalną i maksymalną płacę dla stanowiska Programista
SELECT
    AVG(kwota) AS srednia_placa,
    MIN(kwota) AS minimalna_placa,
    MAX(kwota) AS maksymalna_placa
FROM
    ksiegowosc.pensja
WHERE
    stanowisko = 'Programista';

-- Policz sumę wszystkich wynagrodzeń
SELECT
    SUM(kwota) AS suma_wynagrodzen
FROM
    ksiegowosc.wynagrodzenie;

-- Policz sumę wynagrodzeń w ramach danego stanowiska
SELECT
    stanowisko,
    SUM(ksiegowosc.wynagrodzenie.kwota) AS suma_wynagrodzen
FROM
    ksiegowosc.wynagrodzenie
JOIN
    ksiegowosc.pensja ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
GROUP BY
    stanowisko;

-- Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska
SELECT
    stanowisko,
    COUNT(*) AS liczba_premii
FROM
    ksiegowosc.premia
JOIN
    ksiegowosc.pracownicy ON ksiegowosc.premia.id_pracownika = ksiegowosc.pracownicy.id_pracownika
JOIN
    ksiegowosc.pensja ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.pensja.id_pracownika
WHERE
    ksiegowosc.pensja.stanowisko = 'Programista'
GROUP BY
    stanowisko;

-- Usuń wszystkich pracowników mających pensję mniejszą niż 5000 zł
DELETE FROM ksiegowosc.pracownicy
WHERE id_pracownika IN (
    SELECT id_pracownika
    FROM ksiegowosc.pensja
    WHERE kwota < 5000.00
);