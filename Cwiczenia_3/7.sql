--SELECT * FROM rozliczenia.pensje;

ALTER TABLE rozliczenia.pensje
ADD COLUMN kwota_netto MONEY;

UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto - (kwota_brutto * 0.17);