SELECT
  DATE_PART('day', data) AS day,
  DATE_PART('month', data) AS month
FROM rozliczenia.godziny;