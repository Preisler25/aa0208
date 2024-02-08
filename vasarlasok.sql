-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Júl 31. 07:43
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `vasarlasok`
--
CREATE DATABASE IF NOT EXISTS `vasarlasok` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `vasarlasok`;

DELIMITER $$
--
-- Eljárások
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Keresztnevek` ()   select
  vasarlok.vasarloID,
  SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING(`nev`,LOCATE(" ",`nev`)+1,100), ' ', keresztnevek.n), ' ', -1) AS name
from
  (select 1 AS n union all
   select 2 union all select 3 union all
   select 4 union all select 5) AS keresztnevek INNER JOIN vasarlok
  on CHAR_LENGTH(SUBSTRING(`nev`,LOCATE(" ",`nev`)+1,100))
     -CHAR_LENGTH(REPLACE(SUBSTRING(`nev`,LOCATE(" ",`nev`)+1,100), ' ', ''))>=keresztnevek.n-1
order by
  name$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eladok`
--

CREATE TABLE `eladok` (
  `eladoID` int(1) NOT NULL,
  `nev` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `eladok`
--

INSERT INTO `eladok` (`eladoID`, `nev`) VALUES
(1, 'Ajsa'),
(2, 'Csenge'),
(3, 'Emese'),
(4, 'Harmat'),
(5, 'Imola'),
(6, 'Kincső'),
(7, 'Csongor'),
(8, 'Gabriella');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ertekesitesek`
--

CREATE TABLE `ertekesitesek` (
  `vasarloID` int(2) DEFAULT NULL,
  `eladoID` int(1) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `ertek` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='2020, 2021 és 2022 évi adatok';

--
-- A tábla adatainak kiíratása `ertekesitesek`
--

INSERT INTO `ertekesitesek` (`vasarloID`, `eladoID`, `datum`, `ertek`) VALUES
(7, 6, '2022-01-01', 287428),
(4, 5, '2021-01-05', 203392),
(14, 1, '2020-01-06', 356130),
(7, 1, '2022-01-09', 349427),
(17, 6, '2022-01-10', 975248),
(29, 8, '2020-01-10', 981618),
(21, 7, '2022-01-11', 478927),
(29, 2, '2022-01-11', 795485),
(21, 1, '2022-01-12', 712927),
(2, 5, '2022-01-13', 1034554),
(18, 3, '2022-01-14', 287435),
(21, 2, '2022-01-16', 617546),
(28, 7, '2022-01-16', 637090),
(12, 8, '2022-01-17', 553646),
(3, 3, '2022-01-19', 818753),
(28, 6, '2020-01-20', 931824),
(14, 2, '2020-01-21', 980841),
(15, 2, '2022-01-21', 568355),
(4, 6, '2022-01-21', 857890),
(28, 7, '2022-01-21', 755852),
(26, 3, '2021-01-25', 783118),
(25, 7, '2022-01-25', 558289),
(13, 8, '2022-01-26', 379669),
(27, 1, '2020-01-30', 715290),
(18, 1, '2022-02-02', 522563),
(18, 7, '2022-02-02', 386894),
(12, 8, '2020-02-02', 301506),
(28, 2, '2022-02-05', 939830),
(25, 3, '2020-02-07', 803421),
(11, 8, '2022-02-10', 382685),
(28, 5, '2022-02-11', 460454),
(27, 7, '2022-02-11', 85300),
(2, 1, '2022-02-13', 793075),
(7, 8, '2022-02-14', 437662),
(3, 6, '2022-02-16', 450476),
(22, 7, '2022-02-18', 546538),
(26, 6, '2020-02-19', 69897),
(15, 5, '2022-02-23', 669563),
(26, 7, '2022-02-25', 632479),
(10, 3, '2022-02-25', 668782),
(6, 2, '2022-02-26', 162322),
(25, 5, '2022-02-28', 652403),
(3, 1, '2022-03-01', 430936),
(8, 5, '2021-03-01', 1008959),
(5, 2, '2022-03-01', 744157),
(22, 2, '2022-03-04', 536813),
(6, 8, '2022-03-04', 983788),
(8, 1, '2020-03-05', 695091),
(23, 3, '2022-03-06', 80908),
(14, 6, '2022-03-09', 642277),
(21, 5, '2022-03-10', 818404),
(13, 6, '2021-03-10', 441791),
(29, 2, '2022-03-10', 775934),
(26, 1, '2022-03-12', 901379),
(30, 1, '2019-03-13', 1041453),
(24, 7, '2022-03-14', 526345),
(24, 2, '2022-03-18', 468262),
(12, 1, '2022-03-19', 655994),
(8, 5, '2020-03-19', 637311),
(5, 8, '2022-03-19', 317945),
(5, 2, '2022-03-21', 659749),
(7, 2, '2019-03-23', 806358),
(18, 5, '2020-03-26', 579981),
(20, 5, '2022-03-28', 441016),
(23, 7, '2021-03-29', 81088),
(20, 5, '2022-03-29', 75668),
(26, 8, '2020-03-29', 461721),
(18, 6, '2022-04-02', 318982),
(11, 3, '2022-04-02', 548405),
(24, 7, '2022-04-03', 465037),
(27, 3, '2022-04-03', 670360),
(7, 5, '2022-04-06', 974656),
(16, 3, '2022-04-09', 461395),
(18, 8, '2022-04-10', 452812),
(2, 2, '2020-04-12', 917748),
(15, 7, '2022-04-14', 172948),
(1, 7, '2021-04-14', 213857),
(10, 6, '2020-04-15', 523611),
(26, 7, '2022-04-15', 995251),
(6, 7, '2022-04-16', 180763),
(22, 2, '2022-04-18', 90131),
(23, 6, '2022-04-20', 850019),
(8, 3, '2020-04-21', 519975),
(18, 2, '2021-04-22', 788396),
(30, 7, '2022-04-22', 796499),
(28, 5, '2020-04-22', 722772),
(13, 8, '2022-04-24', 602779),
(30, 1, '2022-04-25', 1049081),
(21, 5, '2022-04-25', 540272),
(26, 5, '2022-04-25', 429722),
(13, 1, '2021-04-25', 690634),
(14, 2, '2022-04-26', 516974),
(25, 5, '2022-04-27', 361498),
(15, 2, '2021-04-28', 1033123),
(28, 6, '2020-04-28', 756576),
(18, 7, '2020-04-30', 125646),
(27, 8, '2021-05-02', 332465),
(13, 2, '2020-05-03', 250272),
(29, 6, '2020-05-04', 88602),
(26, 6, '2022-05-07', 962947),
(10, 3, '2020-05-07', 678969),
(4, 6, '2021-05-07', 263207),
(24, 2, '2022-05-08', 1027375),
(11, 2, '2022-05-08', 417521),
(26, 5, '2020-05-10', 638898),
(27, 5, '2022-05-10', 538192),
(29, 7, '2022-05-12', 487279),
(23, 8, '2021-05-13', 332738),
(7, 3, '2020-05-13', 56412),
(19, 5, '2020-05-14', 275514),
(2, 6, '2020-05-15', 99858),
(17, 5, '2020-05-17', 977784),
(21, 3, '2021-05-18', 452662),
(17, 6, '2022-05-18', 1042667),
(25, 8, '2020-05-22', 910947),
(25, 5, '2022-05-23', 845428),
(8, 7, '2022-05-25', 1021840),
(4, 2, '2022-05-25', 128909),
(15, 2, '2022-05-25', 769663),
(19, 8, '2020-05-26', 446925),
(28, 7, '2022-06-01', 734171),
(9, 2, '2021-06-01', 933919),
(5, 3, '2022-06-05', 318379),
(25, 5, '2022-06-05', 386476),
(13, 5, '2019-06-07', 790083),
(28, 1, '2022-06-12', 550958),
(19, 1, '2022-06-15', 869501),
(9, 6, '2021-06-16', 224413),
(23, 3, '2020-06-16', 1026576),
(16, 8, '2020-06-18', 279273),
(22, 3, '2021-06-19', 423668),
(26, 1, '2020-06-22', 83238),
(10, 6, '2021-06-23', 485513),
(2, 2, '2021-06-25', 301021),
(18, 3, '2022-06-27', 672820),
(16, 8, '2022-06-27', 205444),
(15, 1, '2022-06-29', 514333),
(23, 6, '2020-06-29', 293385),
(12, 2, '2020-06-29', 128766),
(24, 3, '2022-06-29', 406249),
(13, 8, '2021-06-29', 642383),
(8, 2, '2020-07-01', 528534),
(9, 1, '2022-07-05', 512156),
(13, 5, '2022-07-06', 455620),
(11, 3, '2020-07-07', 100269),
(22, 1, '2022-07-07', 666461),
(21, 6, '2022-07-08', 572993),
(17, 6, '2022-07-09', 474535),
(10, 6, '2021-07-09', 501970),
(18, 1, '2020-07-10', 168327),
(20, 6, '2020-07-10', 184962),
(12, 3, '2021-07-12', 276052),
(17, 6, '2020-07-12', 1034748),
(21, 1, '2021-07-14', 318367),
(2, 1, '2022-07-16', 978575),
(15, 7, '2022-07-18', 602468),
(11, 5, '2022-07-18', 983153),
(23, 8, '2020-07-18', 1042695),
(10, 1, '2022-07-19', 448852),
(5, 8, '2020-07-21', 440688),
(5, 8, '2021-07-21', 495271),
(29, 6, '2021-07-24', 859159),
(12, 5, '2022-07-25', 148517),
(6, 5, '2021-07-25', 1017947),
(2, 2, '2020-07-27', 935451),
(30, 8, '2022-07-29', 91544),
(12, 3, '2022-07-31', 717028),
(19, 6, '2021-07-31', 862820),
(16, 3, '2020-08-01', 105762),
(29, 7, '2021-08-01', 197225),
(12, 6, '2022-08-02', 793790),
(4, 6, '2022-08-07', 198169),
(26, 8, '2020-08-07', 369504),
(22, 1, '2022-08-09', 183790),
(21, 1, '2022-08-10', 403520),
(7, 8, '2022-08-11', 878152),
(2, 3, '2022-08-12', 903419),
(16, 7, '2021-08-12', 77749),
(28, 6, '2020-08-13', 446595),
(28, 3, '2022-08-16', 269161),
(13, 2, '2020-08-16', 103920),
(3, 8, '2020-08-17', 922107),
(11, 3, '2022-08-17', 828622),
(30, 5, '2022-08-17', 1011566),
(29, 2, '2020-08-20', 361203),
(4, 1, '2022-08-24', 91426),
(26, 3, '2019-08-25', 161721),
(5, 1, '2022-08-28', 727613),
(6, 7, '2022-08-31', 948734),
(5, 3, '2020-09-02', 98634),
(4, 7, '2020-09-03', 277848),
(27, 7, '2021-09-07', 699664),
(1, 3, '2022-09-10', 775618),
(9, 5, '2022-09-11', 387167),
(17, 2, '2020-09-13', 1033974),
(3, 6, '2020-09-15', 305565),
(26, 1, '2021-09-17', 354515),
(2, 1, '2022-09-18', 294575),
(29, 5, '2021-09-18', 236264),
(30, 6, '2022-09-19', 783256),
(5, 7, '2022-09-19', 577678),
(28, 1, '2022-09-20', 846626),
(15, 7, '2022-09-20', 765179),
(23, 3, '2022-09-22', 1049822),
(28, 1, '2021-09-23', 1009925),
(8, 8, '2020-09-23', 266346),
(19, 8, '2020-09-24', 1005804),
(20, 1, '2020-09-24', 523875),
(13, 6, '2020-09-24', 90708),
(18, 2, '2022-09-26', 348973),
(6, 1, '2022-09-28', 643219),
(6, 5, '2020-09-30', 125382),
(10, 5, '2022-10-04', 91967),
(21, 1, '2022-10-04', 339350),
(5, 2, '2022-10-05', 790331),
(23, 1, '2022-10-09', 100924),
(1, 5, '2021-10-09', 190351),
(21, 6, '2020-10-12', 191160),
(8, 8, '2020-10-12', 653607),
(6, 6, '2020-10-13', 917373),
(22, 2, '2022-10-14', 233113),
(23, 1, '2022-10-14', 1024145),
(30, 8, '2021-10-14', 303919),
(2, 5, '2022-10-15', 435896),
(24, 7, '2022-10-16', 360331),
(28, 5, '2022-10-17', 539044),
(15, 7, '2020-10-17', 936198),
(29, 8, '2022-10-19', 262784),
(18, 3, '2022-10-20', 333181),
(19, 8, '2022-10-20', 127436),
(6, 2, '2022-10-21', 835868),
(4, 5, '2022-10-21', 811873),
(20, 8, '2020-10-21', 622155),
(5, 7, '2020-10-23', 386241),
(13, 2, '2020-10-24', 255924),
(26, 6, '2019-10-24', 540078),
(25, 7, '2022-10-24', 833801),
(4, 6, '2020-10-25', 525669),
(16, 1, '2022-10-25', 895063),
(14, 6, '2022-10-26', 297067),
(28, 1, '2022-10-28', 95794),
(22, 3, '2022-10-31', 413332),
(20, 1, '2022-10-31', 549739),
(15, 2, '2022-11-02', 999413),
(24, 6, '2020-11-02', 507291),
(1, 1, '2022-11-02', 256117),
(28, 8, '2020-11-03', 896655),
(4, 5, '2019-11-06', 97692),
(12, 7, '2021-11-06', 146300),
(22, 3, '2022-11-07', 717203),
(6, 5, '2020-11-07', 309003),
(11, 5, '2020-11-08', 922515),
(14, 2, '2021-11-09', 306299),
(8, 1, '2022-11-09', 210566),
(17, 3, '2022-11-11', 527692),
(2, 3, '2020-11-12', 410031),
(27, 2, '2020-11-12', 895008),
(16, 7, '2021-11-14', 462014),
(9, 5, '2022-11-15', 1047796),
(28, 7, '2022-11-17', 95033),
(12, 5, '2022-11-17', 272063),
(8, 7, '2020-11-17', 813903),
(13, 1, '2021-11-19', 66962),
(27, 3, '2022-11-22', 432839),
(13, 3, '2022-11-23', 218396),
(10, 5, '2022-11-25', 925487),
(27, 5, '2022-11-25', 959039),
(23, 3, '2022-11-27', 884041),
(12, 5, '2022-11-28', 897926),
(19, 3, '2022-11-29', 193048),
(17, 1, '2022-11-30', 309944),
(6, 6, '2019-11-30', 752640),
(12, 6, '2021-11-30', 855085),
(13, 7, '2022-11-30', 175643),
(9, 2, '2020-12-01', 317490),
(16, 6, '2022-12-01', 513287),
(20, 7, '2022-12-01', 422810),
(13, 1, '2022-12-01', 681343),
(20, 6, '2022-12-02', 340798),
(12, 2, '2022-12-04', 944170),
(28, 7, '2020-12-16', 523017),
(11, 6, '2022-12-16', 726062),
(10, 8, '2020-12-16', 160749),
(11, 6, '2020-12-17', 428559),
(11, 5, '2020-12-17', 155079),
(3, 8, '2022-12-17', 884813),
(16, 8, '2019-12-17', 67956),
(6, 3, '2020-12-18', 191616),
(12, 1, '2022-12-18', 759314),
(28, 8, '2021-12-21', 115199),
(20, 2, '2020-12-21', 701055),
(20, 3, '2022-12-21', 432056),
(2, 6, '2020-12-22', 192513),
(22, 2, '2022-12-22', 313303),
(5, 3, '2020-12-23', 182367),
(24, 6, '2022-12-23', 839684),
(8, 6, '2020-12-24', 178758),
(9, 7, '2021-12-25', 618170),
(17, 8, '2022-12-25', 1047853),
(2, 6, '2022-12-26', 556903),
(18, 1, '2022-12-27', 548939),
(10, 3, '2022-12-27', 779659),
(26, 3, '2022-12-27', 931183),
(11, 2, '2019-12-28', 796761),
(25, 1, '2020-12-29', 86643);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megyek`
--

CREATE TABLE `megyek` (
  `megyeID` int(2) NOT NULL,
  `megyeNev` varchar(28) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `megyek`
--

INSERT INTO `megyek` (`megyeID`, `megyeNev`) VALUES
(1, 'Bács-Kiskun megye'),
(2, 'Baranya megye'),
(3, 'Békés megye'),
(4, 'Borsod-Abaúj-Zemplén megye'),
(5, 'Csongrád-Csanád megye'),
(6, 'Fejér megye'),
(7, 'Győr-Moson-Sopron megye'),
(8, 'Hajdú-Bihar megye'),
(9, 'Heves megye'),
(10, 'Jász-Nagykun-Szolnok megye'),
(11, 'Komárom-Esztergom megye'),
(12, 'Nógrád megye'),
(13, 'Pest megye'),
(14, 'Somogy megye'),
(15, 'Szabolcs-Szatmár-Bereg megye'),
(16, 'Tolna megye'),
(17, 'Vas megye'),
(18, 'Veszprém megye'),
(19, 'Zala megye');

-- --------------------------------------------------------

--
-- A nézet helyettes szerkezete `nevek`
-- (Lásd alább az aktuális nézetet)
--
CREATE TABLE `nevek` (
`vasarloID` int(2)
,`name` varchar(75)
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `numbers`
--

CREATE TABLE `numbers` (
  `id` int(11) NOT NULL,
  `n` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vasarlok`
--

CREATE TABLE `vasarlok` (
  `vasarloID` int(2) NOT NULL,
  `nev` varchar(25) DEFAULT NULL,
  `szuletett` date DEFAULT NULL,
  `helyseg` varchar(16) DEFAULT NULL,
  `megyeID` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `vasarlok`
--

INSERT INTO `vasarlok` (`vasarloID`, `nev`, `szuletett`, `helyseg`, `megyeID`) VALUES
(1, 'Ábel Zsófia', '1996-10-09', 'Magyargencs', 18),
(2, 'Balázs Zsolt', '1998-07-17', 'Százhalombatta', 13),
(3, 'Bellavics Mária Zsóka', '2000-04-28', 'Bátaapáti', 16),
(4, 'Bodócsi Réka', '1999-12-17', 'Hajdúbagos', 8),
(5, 'Bokor Péter', '1997-02-22', 'Kõszegszerdahely', 17),
(6, 'Burány Erzsébet Zita', '1996-08-26', 'Létavértes', 8),
(7, 'Csányi Zsuzsanna', '1998-11-14', 'Hövej', 7),
(8, 'Dobos Judit Eszter', '2000-04-22', 'Szellõ', 2),
(9, 'Dudás-Szabó Anett', '1997-10-20', 'Kerecseny', 19),
(10, 'Falusi Mária', '1998-01-31', 'Balatonhenye', 18),
(11, 'Ferencz Edit', '1999-11-18', 'Debrecen', 8),
(12, 'Ferencz Emil', '1999-05-05', 'Nagysimonyi', 17),
(13, 'Kovács György', '1999-09-13', 'Berkesd', 2),
(14, 'Kovács László Gábor', '2000-09-05', 'Kismaros', 13),
(15, 'Köröndi Bernát', '1999-09-30', 'Csempeszkopács', 17),
(16, 'Kubasch Gábriel', '1999-09-23', 'Iborfia', 19),
(17, 'Mészáros András', '1997-01-06', 'Kartal', 13),
(18, 'Mogyoróssy Sándor Lajos', '1997-08-20', 'Füle', 6),
(19, 'Nagy László', '1997-11-20', 'Geszt', 3),
(20, 'Pukoli Dániel', '1999-05-13', 'Pirtó', 1),
(21, 'Regényi Zoltán István Dr.', '1999-12-02', 'Magyargencs', 18),
(22, 'Sandi Dániel', '1999-12-23', 'Debrecen', 8),
(23, 'Simon Mónika', '1996-12-22', 'Csoma', 14),
(24, 'Slezák András', '2000-09-24', 'Nagyszénás', 3),
(25, 'Szabó Angelika', '1998-02-25', 'Himesháza', 2),
(26, 'Szebeni Áron', '1998-07-28', 'Rudabánya', 4),
(27, 'Szöllősy Szilvia', '1996-11-12', 'Halmajugra', 9),
(28, 'Szulcsán Ádám József', '1997-04-03', 'Szalkszentmárton', 1),
(29, 'Uatkán Temír Antal', '1997-07-26', 'Tormásliget', 17),
(30, 'Varga Nóra Beáta', '1997-04-17', 'Tompa', 1),
(31, 'Zabaglo Máté', '2000-10-18', 'Õrtilos', 14);

-- --------------------------------------------------------

--
-- Nézet szerkezete `nevek`
--
DROP TABLE IF EXISTS `nevek`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nevek`  AS SELECT `vasarlok`.`vasarloID` AS `vasarloID`, substring_index(substring_index(substr(`vasarlok`.`nev`,locate(' ',`vasarlok`.`nev`) + 1,100),' ',`keresztnevek`.`n`),' ',-1) AS `name` FROM ((select 1 AS `n` union all select 2 AS `2` union all select 3 AS `3` union all select 4 AS `4` union all select 5 AS `5`) `keresztnevek` join `vasarlok` on(char_length(substr(`vasarlok`.`nev`,locate(' ',`vasarlok`.`nev`) + 1,100)) - char_length(replace(substr(`vasarlok`.`nev`,locate(' ',`vasarlok`.`nev`) + 1,100),' ','')) >= `keresztnevek`.`n` - 1)) ORDER BY substring_index(substring_index(substr(`vasarlok`.`nev`,locate(' ',`vasarlok`.`nev`) + 1,100),' ',`keresztnevek`.`n`),' ',-1) ASC ;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `eladok`
--
ALTER TABLE `eladok`
  ADD PRIMARY KEY (`eladoID`);

--
-- A tábla indexei `ertekesitesek`
--
ALTER TABLE `ertekesitesek`
  ADD KEY `fk_ert_vasarlo` (`vasarloID`),
  ADD KEY `fk_elado_ert` (`eladoID`);

--
-- A tábla indexei `megyek`
--
ALTER TABLE `megyek`
  ADD PRIMARY KEY (`megyeID`);

--
-- A tábla indexei `vasarlok`
--
ALTER TABLE `vasarlok`
  ADD PRIMARY KEY (`vasarloID`),
  ADD UNIQUE KEY `nev` (`nev`),
  ADD KEY `fk_megyyek` (`megyeID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `eladok`
--
ALTER TABLE `eladok`
  MODIFY `eladoID` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `megyek`
--
ALTER TABLE `megyek`
  MODIFY `megyeID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `vasarlok`
--
ALTER TABLE `vasarlok`
  MODIFY `vasarloID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `ertekesitesek`
--
ALTER TABLE `ertekesitesek`
  ADD CONSTRAINT `fk_elado_ert` FOREIGN KEY (`eladoID`) REFERENCES `eladok` (`eladoID`),
  ADD CONSTRAINT `fk_ert_vasarlo` FOREIGN KEY (`vasarloID`) REFERENCES `vasarlok` (`vasarloID`);

--
-- Megkötések a táblához `vasarlok`
--
ALTER TABLE `vasarlok`
  ADD CONSTRAINT `fk_megyyek` FOREIGN KEY (`megyeID`) REFERENCES `megyek` (`megyeID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;