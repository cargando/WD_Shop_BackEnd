-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 10.0.151.203
-- Время создания: Ноя 17 2019 г., 18:43
-- Версия сервера: 5.7.26-29
-- Версия PHP: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `a0310311_students`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ec_brands`
--

CREATE TABLE `ec_brands` (
  `id` int(11) UNSIGNED NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT 'название',
  `desc` text,
  `dt_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title_eng` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ec_brands`
--

INSERT INTO `ec_brands` (`id`, `logo`, `title`, `desc`, `dt_in`, `title_eng`) VALUES
(1, NULL, 'Porto', NULL, '2019-11-10 14:49:48', ''),
(2, NULL, 'boco-boco', NULL, '2019-11-10 14:50:34', ''),
(3, NULL, 'Floran', NULL, '2019-11-10 14:51:02', ''),
(4, NULL, 'Pagany', NULL, '2019-11-10 14:51:08', ''),
(5, NULL, 'Ducu', NULL, '2019-11-10 14:51:20', ''),
(6, NULL, 'Gramm', NULL, '2019-11-10 14:51:34', ''),
(7, NULL, 'Rubiny', NULL, '2019-11-10 14:51:46', ''),
(8, NULL, 'Tamana', NULL, '2019-11-10 14:51:57', '');

-- --------------------------------------------------------

--
-- Структура таблицы `ec_catalog`
--

CREATE TABLE `ec_catalog` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `dt_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `img` varchar(255) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `colors` varchar(255) DEFAULT NULL,
  `category` int(11) UNSIGNED DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT '100',
  `available` int(11) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ec_catalog`
--

INSERT INTO `ec_catalog` (`id`, `title`, `desc`, `dt_in`, `img`, `brand`, `colors`, `category`, `price`, `available`) VALUES
(1, 'Уравновешенное кресло Sumatron', NULL, '2019-11-10 15:53:31', NULL, 1, '1', 3, 79, 15),
(2, 'Няшное кресло Марципано Итальяно', NULL, '2019-11-10 15:54:12', NULL, 2, '4', 3, 55, 1),
(3, 'Аскорбиновое кресло', NULL, '2019-11-10 15:54:29', NULL, 3, '2', 3, 21, 3),
(4, 'Кресло Галатрон-Мегатрок', NULL, '2019-11-10 15:54:53', NULL, 1, '6', 3, 26, 12),
(5, 'Гравитационное кресло Астромарти', NULL, '2019-11-10 15:55:37', NULL, 1, '7', 3, 51, 13),
(6, 'Кресло Abandone', NULL, '2019-11-10 15:55:46', NULL, 2, '3', 3, 65, 10),
(7, 'Кресло Доминатор', NULL, '2019-11-10 15:55:58', NULL, 3, '6', 3, 57, 8),
(8, 'Кресло Унижатор', NULL, '2019-11-10 15:56:05', NULL, 3, '7', 3, 76, 13),
(9, 'Пуховое кресло Floctuation', NULL, '2019-11-10 15:56:27', NULL, 4, '1', 3, 93, 1),
(10, 'Кресло Четыре Чресла', NULL, '2019-11-10 15:56:49', NULL, 1, '1', 3, 25, 5),
(11, 'Румба-кумба, кресло Джумба', NULL, '2019-11-10 15:57:08', NULL, 2, '6', 3, 29, 2),
(12, 'Диван Дружба никому нинужна', NULL, '2019-11-10 15:58:02', NULL, 2, '3', 4, 57, 17),
(13, 'Диван Ubrella Club', NULL, '2019-11-10 15:58:30', NULL, 2, '4', 4, 84, 1),
(14, 'Дикий диван Сногсшибан', NULL, '2019-11-10 15:58:49', NULL, 3, '3', 4, 36, 13),
(15, 'Шелкопрядный диван Акдуранбан', NULL, '2019-11-10 15:59:30', NULL, 2, '4', 4, 110, 5),
(16, 'Гелиоцентричный диван Toma-Doma', NULL, '2019-11-10 15:59:52', NULL, 1, '8', 4, 30, 4),
(17, 'Диван без Изъян', NULL, '2019-11-10 16:00:07', NULL, 2, '5', 4, 106, 6),
(18, 'Диван Аскорбьан', NULL, '2019-11-10 16:00:36', NULL, 1, '8', 4, 23, 19),
(19, 'Безудержный диван', NULL, '2019-11-10 16:00:48', NULL, 2, '1', 4, 83, 19),
(20, 'Лампа Радости', NULL, '2019-11-10 16:01:39', NULL, 9, '5', 5, 33, 18),
(21, 'Лампа Сладости', NULL, '2019-11-10 16:01:46', NULL, 9, '3', 5, 101, 15),
(22, 'Лампа Нежности и Гадости', NULL, '2019-11-10 16:01:57', NULL, 8, '2', 5, 92, 19),
(23, 'Лампа Изогнутость', NULL, '2019-11-10 16:02:15', NULL, 8, '1', 5, 42, 11),
(24, 'Лампа Вогнутость', NULL, '2019-11-10 16:02:21', NULL, 8, '8', 5, 21, 19),
(25, 'Лампа Молодость', NULL, '2019-11-10 16:02:33', NULL, 7, '1', 5, 63, 3),
(26, 'Светильник Мостовой напильник', NULL, '2019-11-10 16:03:09', NULL, 9, '8', 5, 38, 18),
(27, 'Светильник Армагедон', NULL, '2019-11-10 16:03:18', NULL, 9, '1', 5, 87, 3),
(28, 'Светильник 25й Рубильник', NULL, '2019-11-10 16:03:32', NULL, 8, '6', 5, 107, 19),
(29, 'Светильник Напильник', NULL, '2019-11-10 16:03:44', NULL, 7, '1', 5, 58, 9),
(30, 'Стол письменный Ростаман', NULL, '2019-11-10 16:04:29', NULL, 4, '3', 1, 56, 9),
(31, 'Стол письменный Гуливан', NULL, '2019-11-10 16:04:29', NULL, 5, '3', 1, 89, 18),
(32, 'Стол письменный Надиван', NULL, '2019-11-10 16:04:29', NULL, 6, '6', 1, 63, 3),
(33, 'Стол письменный Дулусан', NULL, '2019-11-10 16:04:29', NULL, 4, '5', 1, 33, 3),
(34, 'Стол кухонный Zadvigan', NULL, '2019-11-10 16:04:29', NULL, 4, '7', 1, 63, 4),
(35, 'Стол кухонный Arabian', NULL, '2019-11-10 16:04:29', NULL, 5, '3', 1, 100, 11),
(36, 'Стол кухонный Zucco', NULL, '2019-11-10 16:04:29', NULL, 6, '8', 1, 98, 3),
(37, 'Стул Грустный', NULL, '2019-11-10 16:04:29', NULL, 6, '7', 2, 74, 4),
(38, 'Стул Розовая Свежесть', NULL, '2019-11-10 16:04:29', NULL, 5, '3', 2, 63, 9),
(39, 'Стул Нежность и Зрелость', NULL, '2019-11-10 16:04:29', NULL, 5, '3', 2, 78, 17),
(40, 'Стул Знания Сила', NULL, '2019-11-10 16:04:29', NULL, 5, '4', 2, 86, 17),
(41, 'Стул Радость', NULL, '2019-11-10 16:04:29', NULL, 6, '2', 2, 84, 16),
(42, 'Стул Защитник', NULL, '2019-11-10 16:04:29', NULL, 4, '6', 2, 45, 10),
(43, 'Стул Именинник', NULL, '2019-11-10 16:04:29', NULL, 4, '8', 2, 60, 0),
(44, 'Стул Гуливер', NULL, '2019-11-10 16:04:29', NULL, 5, '4', 2, 51, 12),
(45, 'Стул Столет в обед', NULL, '2019-11-10 16:04:29', NULL, 6, '6', 2, 60, 19);

-- --------------------------------------------------------

--
-- Структура таблицы `ec_catalog_img`
--

CREATE TABLE `ec_catalog_img` (
  `id` int(11) UNSIGNED NOT NULL,
  `cid` int(11) DEFAULT NULL COMMENT 'catalog ID',
  `iid` int(11) DEFAULT NULL COMMENT 'image ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ec_catalog_img`
--

INSERT INTO `ec_catalog_img` (`id`, `cid`, `iid`) VALUES
(1, 1, 11),
(2, 2, 12),
(3, 3, 21),
(4, 4, 27),
(5, 5, 28),
(6, 6, 31),
(7, 7, 32),
(8, 8, 33),
(9, 9, 41),
(10, 10, 42),
(11, 11, 44),
(12, 12, 13),
(13, 13, 16),
(14, 14, 38),
(15, 15, 30),
(16, 16, 38),
(17, 17, 39),
(18, 18, 40),
(19, 20, 15),
(20, 21, 20),
(21, 22, 56),
(22, 23, 22),
(23, 24, 23),
(24, 25, 24),
(25, 26, 25),
(26, 27, 26),
(27, 28, 29),
(28, 29, 45),
(29, 30, 57),
(30, 31, 9),
(31, 32, 35),
(32, 33, 36),
(33, 34, 37),
(34, 35, 48),
(35, 36, 53),
(36, 37, 10),
(37, 38, 14),
(38, 39, 17),
(39, 40, 18),
(40, 41, 34),
(41, 42, 46),
(42, 43, 47),
(43, 44, 17),
(44, 45, 34),
(45, 46, 42),
(46, 47, 43),
(47, 48, 51),
(48, 49, 52),
(49, 50, 12),
(50, 51, 44),
(51, 52, 45),
(52, 53, 12),
(53, 54, 12),
(54, 55, 12),
(55, 56, 12),
(56, 37, 51),
(57, 37, 52);

-- --------------------------------------------------------

--
-- Структура таблицы `ec_category`
--

CREATE TABLE `ec_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `desc` text,
  `dt_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `url` varchar(20) NOT NULL,
  `title_eng` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ec_category`
--

INSERT INTO `ec_category` (`id`, `title`, `img`, `desc`, `dt_in`, `url`, `title_eng`) VALUES
(1, 'Столы', NULL, NULL, '2019-11-10 15:17:46', 'tables', 'Stoly'),
(2, 'Стулья', NULL, NULL, '2019-11-10 15:17:53', 'Chairs', ''),
(3, 'Кресла', NULL, NULL, '2019-11-10 15:17:59', 'arm-chairs', ''),
(4, 'Диваны', NULL, NULL, '2019-11-10 15:18:04', 'sofas', ''),
(5, 'Лампы', NULL, NULL, '2019-11-10 15:18:11', 'chandelier', '');

-- --------------------------------------------------------

--
-- Структура таблицы `ec_colors`
--

CREATE TABLE `ec_colors` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ec_colors`
--

INSERT INTO `ec_colors` (`id`, `title`, `img`, `color`) VALUES
(1, 'Красный', NULL, 'ff0000'),
(2, 'Розовый', NULL, 'ff9999'),
(3, 'Желтый', NULL, 'ffff00'),
(4, 'Серый', NULL, '999999'),
(5, 'Синий', NULL, '3399ff'),
(6, 'Черный', NULL, '000000'),
(7, 'Зеленый', NULL, '009933'),
(8, 'Белый', NULL, 'ffffff');

-- --------------------------------------------------------

--
-- Структура таблицы `ec_feedback`
--

CREATE TABLE `ec_feedback` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `dt_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ec_feedback`
--

INSERT INTO `ec_feedback` (`id`, `user`, `title`, `desc`, `dt_in`, `email`, `phone`, `cid`) VALUES
(1, 'Anatole', 'Великолепное сочетание нескончаемой радости и удивительной безответственности в отношении цены!', NULL, '2019-11-10 16:37:34', NULL, NULL, 1),
(10, 'Anatole', 'Великолепное сочетание нескончаемой радости и удивительной безответственности в отношении цены!', NULL, '2019-11-10 16:37:34', NULL, NULL, 2),
(11, 'Anatole', 'Великолепное сочетание нескончаемой радости и удивительной безответственности в отношении цены!', NULL, '2019-11-10 16:37:34', NULL, NULL, 3),
(12, 'Anatole', 'Великолепное сочетание нескончаемой радости и удивительной безответственности в отношении цены!', NULL, '2019-11-10 16:37:34', NULL, NULL, 4),
(13, 'Anatole', 'Великолепное сочетание нескончаемой радости и удивительной безответственности в отношении цены!', NULL, '2019-11-10 16:37:34', NULL, NULL, 5),
(14, 'Anatole', 'Великолепное сочетание нескончаемой радости и удивительной безответственности в отношении цены!', NULL, '2019-11-10 16:37:34', NULL, NULL, 6),
(15, 'Anatole', 'Великолепное сочетание нескончаемой радости и удивительной безответственности в отношении цены!', NULL, '2019-11-10 16:37:34', NULL, NULL, 7),
(16, 'Anatole', 'Великолепное сочетание нескончаемой радости и удивительной безответственности в отношении цены!', NULL, '2019-11-10 16:37:34', NULL, NULL, 8),
(17, 'Anatole', 'Великолепное сочетание нескончаемой радости и удивительной безответственности в отношении цены!', NULL, '2019-11-10 16:37:34', NULL, NULL, 9),
(18, 'Anatole', 'Великолепное сочетание нескончаемой радости и удивительной безответственности в отношении цены!', NULL, '2019-11-10 16:37:34', NULL, NULL, 10),
(19, 'Anatole', 'Великолепное сочетание нескончаемой радости и удивительной безответственности в отношении цены!', NULL, '2019-11-10 16:37:34', NULL, NULL, 11),
(20, 'Anatole', 'Великолепное сочетание нескончаемой радости и удивительной безответственности в отношении цены!', NULL, '2019-11-10 16:37:34', NULL, NULL, 12),
(21, 'Glorum', 'Купил и пожалел, что не купил раньше!', NULL, '2019-11-10 16:37:34', NULL, NULL, 13),
(22, 'Glorum', 'Купил и пожалел, что не купил раньше!', NULL, '2019-11-10 16:37:34', NULL, NULL, 14),
(27, 'Glorum', 'Купил и пожалел, что не купил раньше!', NULL, '2019-11-10 16:37:34', NULL, NULL, 15),
(28, 'Glorum', 'Купил и пожалел, что не купил раньше!', NULL, '2019-11-10 16:37:34', NULL, NULL, 1),
(29, 'Glorum', 'Купил и пожалел, что не купил раньше!', NULL, '2019-11-10 16:37:34', NULL, NULL, 16),
(30, 'Семен Семеныч', 'Недоволен качеством', NULL, '2019-11-10 16:37:34', NULL, NULL, 17),
(31, 'Семен Семеныч', 'Недоволен качеством', NULL, '2019-11-10 16:37:34', NULL, NULL, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `ec_image`
--

CREATE TABLE `ec_image` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `primary` tinyint(1) DEFAULT '0',
  `logo` tinyint(1) DEFAULT '0',
  `large` tinyint(1) DEFAULT '0',
  `small` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ec_image`
--

INSERT INTO `ec_image` (`id`, `title`, `url`, `primary`, `logo`, `large`, `small`) VALUES
(1, NULL, '1-.jpeg', 0, 1, 0, 0),
(2, NULL, 'western-australia.png', 0, 1, 0, 0),
(3, NULL, '268-2683283.png', 0, 1, 0, 0),
(4, NULL, '11574bb301599cc.jpg', 0, 1, 0, 0),
(5, NULL, 'gallery002.936afb9d.png', 0, 1, 0, 0),
(6, NULL, 'gallery009.6a28a2e7.png', 0, 1, 0, 0),
(7, NULL, 'JRCO-logo+sized.png', 0, 1, 0, 0),
(8, NULL, 'Perrier_hod_hr.png', 0, 1, 0, 0),
(9, 'стол', '90b82e40ab440d.jpeg', 1, 0, 0, 0),
(10, 'стул', '503-597-89-adde-stul-krasnyj.jpg', 1, 0, 0, 0),
(11, 'кресло', '38296_PE130209_S5.webp', 1, 0, 0, 0),
(12, 'кресло', '0325450_PE517970_S5.jpeg', 1, 0, 0, 0),
(13, 'диван', '0425669_PE581483_S5.webp', 1, 0, 0, 0),
(14, 'стул', '0428465_PE583568_S5.webp', 1, 0, 0, 0),
(15, 'лампа', '0434787_PE588546_S5.webp', 1, 0, 0, 0),
(16, 'диван', '0506800_PE634676_S5.webp', 1, 0, 0, 0),
(17, 'стул', '0512767_PE638683_S5.webp', 1, 0, 0, 0),
(18, 'стул', '0512775_PE638684_S5.webp', 1, 0, 0, 0),
(19, 'диван', '0520621_PE642354_S5.webp', 1, 0, 0, 0),
(20, 'лампа', '0588932_PE673256_S5.webp', 1, 0, 0, 0),
(21, 'кресло', '0602091_PE680160_S5.webp', 1, 0, 0, 0),
(22, 'лампа', '0606879_PE682600_S5.webp', 1, 0, 0, 0),
(23, 'лампа', '0609296_PE684433_S5.webp', 1, 0, 0, 0),
(24, 'лампа', '0609306_PE684440_S5.webp', 1, 0, 0, 0),
(25, 'лампа', '0609308_PE684439_S5.webp', 1, 0, 0, 0),
(26, 'лампа', '0613277_PE686201_S5.webp', 1, 0, 0, 0),
(27, 'кресло', '0641725_PE700622_S5.webp', 1, 0, 0, 0),
(28, 'кресло', '0652829_PE707677_S5.webp', 1, 0, 0, 0),
(29, 'лампа', '0687071_PE721952_S5.webp', 1, 0, 0, 0),
(30, 'диван', '0713943_PE729858_S5.webp', 1, 0, 0, 0),
(31, 'кресло', '0719584_PE732109_S5.webp', 1, 0, 0, 0),
(32, 'кресло', '0719586_PE732111_S5.webp', 1, 0, 0, 0),
(33, 'кресло', '0725425_PE734857_S5.webp', 1, 0, 0, 0),
(34, 'стул', '0729831_PE737187_S5.webp', 1, 0, 0, 0),
(35, 'стол', '0735967_PE740301_S5.webp', 1, 0, 0, 0),
(36, 'стол', '0737089_PE740879_S5.webp', 1, 0, 0, 0),
(37, 'стол', '0737165_PE740925_S5.jpeg', 1, 0, 0, 0),
(38, 'диван', '0754049_PE747775_S5.webp', 1, 0, 0, 0),
(39, 'диван', '0759910_PE750538_S5.webp', 1, 0, 0, 0),
(40, 'диван', '0761365_PE751231_S5.webp', 1, 0, 0, 0),
(41, 'кресло', '0767121_PE753991_S5.webp', 1, 0, 0, 0),
(42, 'кресло', '0769262_PE754933_S5.webp', 1, 0, 0, 0),
(43, 'диван', '0778506_PE759028_S5.webp', 1, 0, 0, 0),
(44, 'кресло', '9912403_images_1653927986.jpg', 1, 0, 0, 0),
(45, 'лампа', '91505012_images_13656420529.jpg', 1, 0, 0, 0),
(46, 'стул', '1321087560_w640_h640_barnyj-stul-ikea.jpg', 1, 0, 0, 0),
(47, 'стул', '1637071890_stul-ikea-rnninge.jpg', 1, 0, 0, 0),
(48, 'стол', '5792462179.webp', 1, 0, 0, 0),
(49, 'лампа', '11110314514_pe514214_s5.jpg', 1, 0, 0, 0),
(50, 'лампа', 'AjKrHjGNQ6BbQkvm7fzqCg.jpg', 1, 0, 0, 0),
(51, 'стул', '0d69d1cf_1497164703_1000_1000.jpg', 1, 0, 0, 0),
(52, 'стул', 'Ikea-.png', 1, 0, 0, 0),
(53, 'стол', 'Ikea-stolyi.jpg', 1, 0, 0, 0),
(54, 'лампа', 'images.jpeg', 1, 0, 0, 0),
(55, 'лампа', 'lampa-rabochaya-ranarp-303-606-04-1.jpg', 1, 0, 0, 0),
(56, 'лампа', 'uFNUOAIc00GK061kSqp9iw.jpg', 1, 0, 0, 0),
(57, 'стол', 'Nathan_skrivebord.jpg', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ec_review`
--

CREATE TABLE `ec_review` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `dt_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ec_brands`
--
ALTER TABLE `ec_brands`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ec_catalog`
--
ALTER TABLE `ec_catalog`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ec_catalog_img`
--
ALTER TABLE `ec_catalog_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `iid` (`iid`);

--
-- Индексы таблицы `ec_category`
--
ALTER TABLE `ec_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ec_colors`
--
ALTER TABLE `ec_colors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ec_feedback`
--
ALTER TABLE `ec_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ec_image`
--
ALTER TABLE `ec_image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ec_review`
--
ALTER TABLE `ec_review`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ec_brands`
--
ALTER TABLE `ec_brands`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `ec_catalog`
--
ALTER TABLE `ec_catalog`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `ec_catalog_img`
--
ALTER TABLE `ec_catalog_img`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT для таблицы `ec_category`
--
ALTER TABLE `ec_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `ec_colors`
--
ALTER TABLE `ec_colors`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `ec_feedback`
--
ALTER TABLE `ec_feedback`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `ec_image`
--
ALTER TABLE `ec_image`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT для таблицы `ec_review`
--
ALTER TABLE `ec_review`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
