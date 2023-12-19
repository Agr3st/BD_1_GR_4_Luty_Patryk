-- ZADANIE 1 -------------------------

-- Tworzenie tabeli tymczasowej
CREATE TABLE tempemployeeinfo (
    businessentityid INT,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    rate MONEY
)

-- CTE do znalezienia najwyzszej stawki w historii dla danego pracownika
WITH MaxRate AS (
    SELECT
        eph.businessentityid,
        MAX(eph.rate) AS max_rate
    FROM
        HumanResources.EmployeePayHistory eph
    GROUP BY
        eph.businessentityid
)

-- Wybieranie danych pracownika o najwyższej stawce i zapis do tabeli tymczasowej
INSERT INTO tempemployeeinfo (businessentityid, firstname, lastname, rate)
SELECT
    p.businessentityid,
    p.firstname,
    p.lastname,
    m.max_rate AS rate
FROM
    MaxRate m
JOIN
    Person.Person p ON m.businessentityid = p.businessentityid;



-- ZADANIE 2 -------------------------

WITH CustomerTerritory AS (
    SELECT
        customerid,
        territoryid AS customerterritoryid
    FROM
        sales.customer
),
SalesPerson AS (
    SELECT
        sp.businessentityid,
        sp.territoryid,
        pp.firstname,
        pp.lastname
    FROM
        sales.salesperson sp
    JOIN
        person.person pp ON sp.businessentityid = pp.businessentityid
)
SELECT
    ct.customerid,
    ct.customerterritoryid,
    CONCAT(sp.firstname, ' ', sp.lastname) AS salespersoninthisterritory
FROM
    CustomerTerritory ct
JOIN
    SalesPerson sp ON ct.customerterritoryid = sp.territoryid;