-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 09 2023 г., 19:21
-- Версия сервера: 5.7.39
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `droplisttable`
--

-- --------------------------------------------------------

--
-- Структура таблицы `citysource`
--

CREATE TABLE `citysource` (
  `id` int(100) UNSIGNED NOT NULL,
  `city_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `citysource`
--

INSERT INTO `citysource` (`id`, `city_name`) VALUES
(1, 'Усть-урюпинск'),
(2, 'Минск'),
(3, 'Орск');

-- --------------------------------------------------------

--
-- Структура таблицы `countrysource`
--

CREATE TABLE `countrysource` (
  `id` int(100) UNSIGNED NOT NULL,
  `country_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `countrysource`
--

INSERT INTO `countrysource` (`id`, `country_name`) VALUES
(1, 'Россия'),
(2, 'Беларусь');

-- --------------------------------------------------------

--
-- Структура таблицы `droplist`
--

CREATE TABLE `droplist` (
  `id` int(100) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(3) NOT NULL,
  `sex` enum('муж','жен') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hair` int(100) UNSIGNED NOT NULL,
  `country` int(100) UNSIGNED NOT NULL,
  `city` int(100) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `droplist`
--

INSERT INTO `droplist` (`id`, `name`, `age`, `sex`, `hair`, `country`, `city`) VALUES
(1, 'Иван', 33, 'муж', 1, 1, 1),
(2, ',<<<<', 21, 'муж', 2, 2, 2),
(3, 'Ж', 21, 'жен', 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `hairsource`
--

CREATE TABLE `hairsource` (
  `id` int(100) UNSIGNED NOT NULL,
  `hair_color` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hairsource`
--

INSERT INTO `hairsource` (`id`, `hair_color`) VALUES
(1, 'Блонд'),
(2, 'Каштан');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `citysource`
--
ALTER TABLE `citysource`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `countrysource`
--
ALTER TABLE `countrysource`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `droplist`
--
ALTER TABLE `droplist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hair` (`hair`),
  ADD KEY `country` (`country`),
  ADD KEY `city` (`city`);

--
-- Индексы таблицы `hairsource`
--
ALTER TABLE `hairsource`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `citysource`
--
ALTER TABLE `citysource`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `countrysource`
--
ALTER TABLE `countrysource`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `droplist`
--
ALTER TABLE `droplist`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `hairsource`
--
ALTER TABLE `hairsource`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `droplist`
--
ALTER TABLE `droplist`
  ADD CONSTRAINT `droplist_ibfk_1` FOREIGN KEY (`hair`) REFERENCES `hairsource` (`id`),
  ADD CONSTRAINT `droplist_ibfk_2` FOREIGN KEY (`country`) REFERENCES `countrysource` (`id`),
  ADD CONSTRAINT `droplist_ibfk_3` FOREIGN KEY (`city`) REFERENCES `citysource` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
