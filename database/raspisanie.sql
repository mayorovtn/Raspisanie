-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 192.168.1.13:3306
-- Время создания: Ноя 14 2022 г., 15:22
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `raspisanie`
--

-- --------------------------------------------------------

--
-- Структура таблицы `dni`
--

CREATE TABLE `dni` (
  `idDen` int NOT NULL,
  `Den` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `dni`
--

INSERT INTO `dni` (`idDen`, `Den`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота'),
(7, 'Воскресение');

-- --------------------------------------------------------

--
-- Структура таблицы `kabineti`
--

CREATE TABLE `kabineti` (
  `idKabinet` int NOT NULL,
  `num_kab` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `klassi`
--

CREATE TABLE `klassi` (
  `idKlass` int NOT NULL,
  `Klass` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `predmeti`
--

CREATE TABLE `predmeti` (
  `idPredmet` int NOT NULL,
  `Predmet` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `raspisanie`
--

CREATE TABLE `raspisanie` (
  `id` int NOT NULL,
  `idZvonok` int NOT NULL,
  `idPredmet` int NOT NULL,
  `idUchitel` int NOT NULL,
  `idDen` int NOT NULL,
  `idKabinet` int NOT NULL,
  `idKlass` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `uchiteli`
--

CREATE TABLE `uchiteli` (
  `idUchitel` int NOT NULL,
  `fio` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `zvonki`
--

CREATE TABLE `zvonki` (
  `idZvonok` int NOT NULL,
  `start_urok` time NOT NULL,
  `stop_urok` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `dni`
--
ALTER TABLE `dni`
  ADD PRIMARY KEY (`idDen`);

--
-- Индексы таблицы `kabineti`
--
ALTER TABLE `kabineti`
  ADD PRIMARY KEY (`idKabinet`);

--
-- Индексы таблицы `klassi`
--
ALTER TABLE `klassi`
  ADD PRIMARY KEY (`idKlass`);

--
-- Индексы таблицы `predmeti`
--
ALTER TABLE `predmeti`
  ADD PRIMARY KEY (`idPredmet`);

--
-- Индексы таблицы `raspisanie`
--
ALTER TABLE `raspisanie`
  ADD PRIMARY KEY (`id`,`idPredmet`,`idUchitel`,`idKlass`,`idKabinet`,`idZvonok`,`idDen`),
  ADD KEY `fk_Raspisanie_Predmeti_idx` (`idPredmet`),
  ADD KEY `fk_Raspisanie_Uchiteli1_idx` (`idUchitel`),
  ADD KEY `fk_Raspisanie_Klassi1_idx` (`idKlass`),
  ADD KEY `fk_Raspisanie_Kabineti1_idx` (`idKabinet`),
  ADD KEY `fk_Raspisanie_Zvonki1_idx` (`idZvonok`),
  ADD KEY `fk_Raspisanie_Dni1_idx` (`idDen`);

--
-- Индексы таблицы `uchiteli`
--
ALTER TABLE `uchiteli`
  ADD PRIMARY KEY (`idUchitel`);

--
-- Индексы таблицы `zvonki`
--
ALTER TABLE `zvonki`
  ADD PRIMARY KEY (`idZvonok`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `dni`
--
ALTER TABLE `dni`
  MODIFY `idDen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `kabineti`
--
ALTER TABLE `kabineti`
  MODIFY `idKabinet` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `klassi`
--
ALTER TABLE `klassi`
  MODIFY `idKlass` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `predmeti`
--
ALTER TABLE `predmeti`
  MODIFY `idPredmet` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `raspisanie`
--
ALTER TABLE `raspisanie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `uchiteli`
--
ALTER TABLE `uchiteli`
  MODIFY `idUchitel` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `zvonki`
--
ALTER TABLE `zvonki`
  MODIFY `idZvonok` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `raspisanie`
--
ALTER TABLE `raspisanie`
  ADD CONSTRAINT `fk_Raspisanie_Dni1` FOREIGN KEY (`idDen`) REFERENCES `dni` (`idDen`),
  ADD CONSTRAINT `fk_Raspisanie_Kabineti1` FOREIGN KEY (`idKabinet`) REFERENCES `kabineti` (`idKabinet`),
  ADD CONSTRAINT `fk_Raspisanie_Klassi1` FOREIGN KEY (`idKlass`) REFERENCES `klassi` (`idKlass`),
  ADD CONSTRAINT `fk_Raspisanie_Predmeti` FOREIGN KEY (`idPredmet`) REFERENCES `predmeti` (`idPredmet`),
  ADD CONSTRAINT `fk_Raspisanie_Uchiteli1` FOREIGN KEY (`idUchitel`) REFERENCES `uchiteli` (`idUchitel`),
  ADD CONSTRAINT `fk_Raspisanie_Zvonki1` FOREIGN KEY (`idZvonok`) REFERENCES `zvonki` (`idZvonok`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
