SELECT min(datum), max(datum) FROM `ertekesitesek`;

SELECT eladok.nev, SUM(ertekesitesek.ertek) AS osszertek
FROM eladok
JOIN ertekesitesek ON eladok.eladoID = ertekesitesek.eladoID
GROUP BY eladok.eladoID
ORDER BY osszertek DESC;

