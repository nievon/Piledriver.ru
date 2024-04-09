-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 09 2024 г., 19:25
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `u2093624_default`
--

-- --------------------------------------------------------

--
-- Структура таблицы `call_requests`
--

CREATE TABLE `call_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `casees`
--

CREATE TABLE `casees` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `led` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `casees`
--

INSERT INTO `casees` (`id`, `name`, `led`, `price`, `created_at`, `updated_at`, `brand`, `color`, `img_brand`) VALUES
(9, 'Cylon', 'Красная', '2500.00', NULL, NULL, 'AeroCool', 'Темный', 'aerocool.png'),
(10, 'Aura', 'Синяя', '3000.00', NULL, NULL, 'NZXT', 'Черный', 'nzxt.png'),
(11, 'Phantom', 'Зеленая', '3500.00', NULL, NULL, 'Corsair', 'Белый', 'corsair.png'),
(12, 'Eclipse', 'Фиолетовая', '2800.00', NULL, NULL, 'Cooler Master', 'Черный', 'coolermaster.png'),
(13, 'Alpha', 'Оранжевая', '3200.00', NULL, NULL, 'Thermaltake', 'Черный', 'thermaltake.png'),
(14, 'Titan', 'Желтая', '2700.00', NULL, NULL, 'Deepcool', 'Черный', 'deepcool.png'),
(15, 'Shadow', 'Бирюзовая', '3000.00', NULL, NULL, 'Fractal Design', 'Черный', 'fractaldesign.png'),
(18, 'Pulse', 'Зеленая', '3300.00', NULL, NULL, 'Lian Li', 'Белый', 'lianli.png'),
(19, 'Nebula', 'Фиолетовая', '2900.00', NULL, NULL, 'Silverstone', 'Черный', 'silverstone.png'),
(21, 'Zenith', 'Желтая', '3200.00', NULL, NULL, 'Razer', 'Черный', 'razer.png'),
(23, 'Horizon', 'Красная', '2500.00', NULL, NULL, 'Antec', 'Черный', 'antec.png'),
(25, 'Supreme', 'Зеленая', '3300.00', NULL, NULL, 'Rosewill', 'Черный', 'rosewill.png'),
(26, 'Aero', 'Фиолетовая', '2900.00', NULL, NULL, 'Thermalright', 'Черный', 'thermalright.png'),
(27, 'Genesis', 'Оранжевая', '2700.00', NULL, NULL, 'Cougar', 'Черный', 'cougar.png'),
(30, 'Stellar', 'Красная', '2500.00', NULL, NULL, 'FSP', 'Черный', 'fsp.png'),
(31, 'Photon', 'Синяя', '3000.00', NULL, NULL, 'Zalman', 'Черный', 'zalman.png'),
(35, 'Dragon', 'Желтая', '2700.00', NULL, NULL, 'SilverStone', 'Черный', 'silverstone.png'),
(37, 'Zenith', 'Красная', '2500.00', NULL, NULL, 'Be Quiet!', 'Черный', 'bequiet.png'),
(38, 'Apollo', 'Синяя', '2800.00', NULL, NULL, 'NZXT', 'Черный', 'nzxt.png');

-- --------------------------------------------------------

--
-- Структура таблицы `catalogs`
--

CREATE TABLE `catalogs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,3) NOT NULL,
  `tagline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `motherboard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CPU` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GPU` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RAM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PSU` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coolingsys` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CASE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FPS` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `catalogs`
--

INSERT INTO `catalogs` (`id`, `name`, `img`, `price`, `tagline`, `description`, `motherboard`, `CPU`, `GPU`, `RAM`, `ROM`, `PSU`, `coolingsys`, `CASE`, `FPS`, `created_at`, `updated_at`) VALUES
(1, 'Shtepa Turbo', 'shtepa.png', '65.000', 'Офисный компьютер', 'Производительный компьютер для работы', 'ASUS PRIME B450M-A', 'AMD Ryzen 5 2600', 'AMD Radeon RX 580', '16GB', '500GSSD', '500W', 'Воздушное', 'Fractal Design Define 75', 10500, NULL, NULL),
(2, 'Lumen Light', 'lumen.png', '105.000', 'Король FullHD гейминга', 'Мощный компьютер для творческой работы', 'ASUS ROG Strix B550-I Gaming', 'Ryzen 7 3700x', 'AMD Radeon RX 5700 XT', '16GB', '1TB HDD + 500GB SSD', '650W', 'Жидкостное', 'Fractal Design Define 78', 14500, NULL, NULL),
(3, 'Pritkys', 'epix.png', '145.000', 'Заново изобретая эталон', 'Мощный компьютер для гейминга', 'ASUS ROG Crosshair VIII Hero', 'Ryzen 9 5900x', 'AMD Radeon RX 6900 XT', '32GB', '2TB B SSD', '1000W', 'Жидкостное', 'Fractal Design Define 79', 16500, NULL, NULL),
(4, 'Gaming Beast', 'gaming_beast.png', '120.000', 'Игровой компьютер', 'Мощный компьютер для гейминга', 'MSI Z590-A PRO', 'Intel Core i9-10900K', 'NVIDIA GeForce RTX 3080', '32GB', '2TB SSD', '850W', 'Жидкостное', 'NZXT H710i', 18000, NULL, NULL),
(5, 'Home Office Pro', 'home_office_pro.png', '140.000', 'Офисный компьютер', 'Производительный компьютер для работы', 'ASUS PRIME B450M-A', 'AMD Ryzen 7 3700X', 'AMD Radeon RX 6700 XT', '16GB', '1TB HDD + 500GB SSD', '600W', 'Воздушное', 'Fractal Design Define 7', 12000, NULL, NULL),
(6, 'Creative Workstation', 'creative_workstation.png', '180.000', 'Творческая рабочая станция', 'Мощный компьютер для творческой работы', 'Gigabyte X570 AORUS PRO', 'AMD Ryzen 9 5950X', 'NVIDIA Quadro RTX 5000', '64GB', '4TB NVMe SSD', '1000W', 'Воздушное', 'Corsair Crystal Series 680X RGB', 15000, NULL, NULL),
(7, 'Mini Gaming Rig', 'mini_gaming_rig.png', '185.000', 'Компактный игровой ПК', 'Мощный компьютер в компактном корпусе', 'ASUS ROG Strix B550-I Gaming', 'AMD Ryzen 7 5800X', 'NVIDIA GeForce RTX 3070', '32GB', '1TB NVMe SSD', '650W', 'Жидкостное', 'NZXT H210i', 14000, NULL, NULL),
(8, 'Multimedia Center', 'multimedia_center.png', '125.000', 'Мультимедийный центр', 'Компьютер для потокового воспроизведения и работы с мультимедиа', 'ASRock B560M-ITX/ac', 'Intel Core i7-11700', 'AMD Radeon RX 6600 XT', '16GB', '2TB HDD + 512GB SSD', '550W', 'Воздушное', 'SilverStone SG13', 10000, NULL, NULL),
(9, 'Budget Starter PC', 'budget_starter_pc.png', '50.000', 'Бюджетный стартовый ПК', 'Компьютер с базовыми характеристиками для начинающих пользователей', 'Gigabyte B450M DS3H', 'AMD Ryzen 3 3200G', 'Integrated Vega Graphics', '8GB', '512GB SSD', '450W', 'Воздушное', 'Thermaltake Versa H17', 5000, NULL, NULL),
(10, 'Streaming Powerhouse', 'streaming_powerhouse.png', '320.000', 'Компьютер для стриминга', 'Компьютер, оптимизированный для высококачественного стриминга', 'ASUS ROG Crosshair VIII Hero', 'AMD Ryzen 9 5900X', 'NVIDIA GeForce RTX 3090', '64GB', '2TB NVMe SSD', '850W', 'Жидкостное', 'Corsair Crystal Series 680X RGB', 20000, NULL, NULL),
(11, 'Workstation Pro', 'workstation_pro.png', '410.000', 'Профессиональная рабочая станция', 'Мощный компьютер для профессиональных задач и тяжелых вычислений', 'Gigabyte WRX80-SU8-IPMI', 'AMD Ryzen Threadripper PRO 3995WX', 'NVIDIA Quadro RTX 6000', '128GB', '8TB NVMe SSD', '1600W', 'Воздушное', 'be quiet! Dark Base Pro 900 Rev. 2', 18000, NULL, NULL),
(13, 'AMD FX Gaming Rig', 'amd_fx_gaming_rig.png', '50.000', 'Игровой ПК на процессоре AMD FX', 'Мощный игровой компьютер на базе процессора AMD FX', 'ASUS M5A97 R2.0', 'AMD FX-8350', 'NVIDIA GeForce GTX 1660', '16GB', '1TB HDD', '650W', 'Воздушное', 'Cooler Master MasterBox Q300L', 9000, NULL, NULL),
(14, 'AMD FX Workstation', 'amd_fx_workstation.png', '60.000', 'Рабочая станция на процессоре AMD FX', 'Мощный компьютер для профессиональных задач на базе процессора AMD FX', 'Gigabyte GA-990FXA-UD3', 'AMD FX-9370', 'AMD FirePro W7100', '32GB', '2TB HDD + 512GB SSD', '750W', 'Воздушное', 'NZXT H440', 8000, NULL, NULL),
(15, 'AMD FX Budget PC', 'amd_fx_budget_pc.png', '30.000', 'Бюджетный ПК на процессоре AMD FX', 'Компьютер с базовыми характеристиками на базе процессора AMD FX', 'ASRock 970A-G/3.1', 'AMD FX-6300', 'AMD Radeon RX 550', '8GB', '500GB HDD', '500W', 'Воздушное', 'Corsair Carbide 200R', 4000, NULL, NULL),
(16, 'AMD FX Budget Gaming PC', 'amd_fx_budget_gaming_pc.png', '25.000', 'Бюджетный игровой ПК на процессоре AMD FX', 'Компьютер с приемлемыми характеристиками для игр', 'GIGABYTE GA-78LMT-S2 R2', 'AMD FX-6300', 'NVIDIA GeForce GT 1030 2GB', '8GB', '1TB HDD', '450W', 'Воздушное', 'AMD Cooler', 3000, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `drams`
--

CREATE TABLE `drams` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `drams`
--

INSERT INTO `drams` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'DDR3', NULL, NULL),
(2, 'DDR4\r\n', NULL, NULL),
(3, 'DDR5', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gpupsuwatts`
--

CREATE TABLE `gpupsuwatts` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gpuwatt_id` bigint UNSIGNED NOT NULL,
  `psuwatt_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gpupsuwatts`
--

INSERT INTO `gpupsuwatts` (`id`, `created_at`, `updated_at`, `gpuwatt_id`, `psuwatt_id`) VALUES
(1, NULL, NULL, 2, 1),
(2, NULL, NULL, 2, 2),
(3, NULL, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `gpus`
--

CREATE TABLE `gpus` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `gpuwatt_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gpu_frequency` int DEFAULT NULL,
  `img_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gpus`
--

INSERT INTO `gpus` (`id`, `vendor`, `model`, `size`, `price`, `gpuwatt_id`, `created_at`, `updated_at`, `gpu_frequency`, `img_brand`) VALUES
(32, 'Gigabyte', 'RX 580 Gaming', '8GB', '7500.00', 4, NULL, NULL, 1350, 'gigabyte.png'),
(33, 'Gigabyte ', 'RX 580 Aorus', '4gb', '6500.00', 3, NULL, NULL, 1350, 'gigabyte.png'),
(34, 'MSI', 'GTX 1660 Super Gaming X', '6GB', '12000.00', 3, NULL, NULL, 1830, 'msi.png'),
(35, 'ASUS', 'RTX 3070 TUF Gaming', '8GB', '25000.00', 3, NULL, NULL, 1755, 'asus.png'),
(37, 'Gigabyte', 'RX 6800 XT Aorus Master', '16GB', '45000.00', 3, NULL, NULL, 2045, 'gigabyte.png'),
(40, 'Gigabyte', 'GTX 1050 Ti Windforce OC', '4GB', '6000.00', 3, NULL, NULL, 1455, 'gigabyte.png'),
(41, 'ASUS', 'RTX 3060 Dual', '12GB', '20000.00', 3, NULL, NULL, 1785, 'asus.png'),
(42, 'MSI', 'GTX 1660 Ventus XS OC', '6GB', '10000.00', 3, NULL, NULL, 1785, 'msi.png'),
(44, 'Gigabyte', 'RX 570 Gaming', '4GB', '5500.00', 3, NULL, NULL, 1255, 'gigabyte.png'),
(47, 'Gigabyte', 'GTX 1660 Ti Gaming OC', '6GB', '13000.00', 3, NULL, NULL, 1800, 'gigabyte.png'),
(48, 'ASUS', 'RTX 3090 ROG Strix', '24GB', '60000.00', 3, NULL, NULL, 1860, 'asus.png'),
(49, 'MSI', 'GTX 1050 Aero ITX', '2GB', '4000.00', 3, NULL, NULL, 1455, 'msi.png'),
(51, 'Gigabyte', 'GTX 1660 OC', '6GB', '11000.00', 3, NULL, NULL, 1830, 'gigabyte.png'),
(54, 'Gigabyte', 'GTX 1650 Gaming OC', '4GB', '7500.00', 3, NULL, NULL, 1710, 'gigabyte.png'),
(55, 'ASUS', 'RTX 3080 TUF Gaming', '10GB', '38000.00', 3, NULL, NULL, 1785, 'asus.png'),
(56, 'MSI', 'GTX 1070 Ti Armor', '8GB', '18000.00', 3, NULL, NULL, 1683, 'msi.png'),
(58, 'Gigabyte', 'GTX 1050 Windforce OC', '2GB', '3500.00', 3, NULL, NULL, 1518, 'gigabyte.png');

-- --------------------------------------------------------

--
-- Структура таблицы `gpuwatts`
--

CREATE TABLE `gpuwatts` (
  `id` bigint UNSIGNED NOT NULL,
  `wattint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gpuwatts`
--

INSERT INTO `gpuwatts` (`id`, `wattint`, `created_at`, `updated_at`) VALUES
(1, '200w', NULL, NULL),
(2, '150w', NULL, NULL),
(3, '100', NULL, NULL),
(4, '250\r\n', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `motherboards`
--

CREATE TABLE `motherboards` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `socket_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `chipset` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pcie` int DEFAULT NULL,
  `img_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `motherboards`
--

INSERT INTO `motherboards` (`id`, `name`, `price`, `socket_id`, `created_at`, `updated_at`, `chipset`, `brand`, `pcie`, `img_brand`) VALUES
(122, 'ASUS M5A97', 4500, 1, NULL, NULL, 'AMD 970', 'ASUS', 2, 'asus.png'),
(123, 'MSI 970A-G43', 3800, 1, NULL, NULL, 'AMD 970', 'MSI', 2, 'msi.png'),
(124, 'ASRock 970A-G/3.1', 3200, 1, NULL, NULL, 'AMD 970', 'ASRock', 3, 'asrock.png'),
(125, 'GIGABYTE GA-970A-DS3P', 2800, 1, NULL, NULL, 'AMD 970', 'GIGABYTE', 2, 'gigabyte.png'),
(126, 'Biostar A960D+', 2000, 1, NULL, NULL, 'AMD 760G', 'Biostar', 1, 'biostar.png'),
(127, 'ASUS M5A78L-M/USB3', 2600, 1, NULL, NULL, 'AMD 760G', 'ASUS', 1, 'asus.png'),
(128, 'MSI 760GM-P23', 1800, 1, NULL, NULL, 'AMD 760G', 'MSI', 1, 'msi.png'),
(129, 'ASRock N68C-GS FX', 1500, 1, NULL, NULL, 'NVIDIA GeForce 7025', 'ASRock', 1, 'asrock.png'),
(130, 'GIGABYTE GA-78LMT-S2P', 1700, 1, NULL, NULL, 'AMD 760G', 'GIGABYTE', 1, 'gigabyte.png'),
(131, 'ASUS M5A78L-M PLUS/USB3', 2300, 1, NULL, NULL, 'AMD 760G', 'ASUS', 1, 'asus.png'),
(132, 'MSI 970 GAMING', 4200, 1, NULL, NULL, 'AMD 970', 'MSI', 3, 'msi.png'),
(133, 'GIGABYTE GA-970-Gaming SLI', 3900, 1, NULL, NULL, 'AMD 970', 'GIGABYTE', 2, 'gigabyte.png'),
(134, 'ASUS M5A97 R2.0', 4600, 1, NULL, NULL, 'AMD 970', 'ASUS', 2, 'asus.png'),
(135, 'ASRock 970 Extreme3', 3300, 1, NULL, NULL, 'AMD 970', 'ASRock', 3, 'asrock.png'),
(136, 'MSI 970A SLI Krait Edition', 3800, 1, NULL, NULL, 'AMD 970', 'MSI', 3, 'msi.png'),
(137, 'GIGABYTE GA-970A-UD3P', 3200, 1, NULL, NULL, 'AMD 970', 'GIGABYTE', 2, 'gigabyte.png'),
(138, 'ASUS Sabertooth 990FX R2.0', 5500, 1, NULL, NULL, 'AMD 990FX', 'ASUS', 3, 'asus.png'),
(139, 'MSI 990FXA-GD65', 4800, 1, NULL, NULL, 'AMD 990FX', 'MSI', 4, 'msi.png'),
(140, 'GIGABYTE GA-990FXA-UD3', 4200, 1, NULL, NULL, 'AMD 990FX', 'GIGABYTE', 3, 'gigabyte.png'),
(141, 'ASRock 990FX Extreme3', 3800, 1, NULL, NULL, 'AMD 990FX', 'ASRock', 3, 'asrock.png'),
(142, 'ASUS M5A78L-M LX PLUS', 1800, 1, NULL, NULL, 'AMD 760G', 'ASUS', 1, 'asus.png'),
(143, 'MSI 760GM-P23', 1500, 1, NULL, NULL, 'AMD 760G', 'MSI', 1, 'msi.png'),
(144, 'GIGABYTE GA-78LMT-S2', 1600, 1, NULL, NULL, 'AMD 760G', 'GIGABYTE', 1, 'gigabyte.png'),
(145, 'ASRock 970M Pro3', 2800, 1, NULL, NULL, 'AMD 970', 'ASRock', 2, 'asrock.png'),
(146, 'GIGABYTE GA-970A-D3P', 3100, 1, NULL, NULL, 'AMD 970', 'GIGABYTE', 2, 'gigabyte.png'),
(147, 'ASUS M5A78L-M/USB3', 2100, 1, NULL, NULL, 'AMD 760G', 'ASUS', 1, 'asus.png'),
(148, 'MSI 760GM-P34', 1600, 1, NULL, NULL, 'AMD 760G', 'MSI', 1, 'msi.png'),
(149, 'GIGABYTE GA-78LMT-S2P rev. 5.x', 1700, 1, NULL, NULL, 'AMD 760G', 'GIGABYTE', 1, 'gigabyte.png'),
(150, 'ASRock 970 Pro3 R2.0', 2500, 1, NULL, NULL, 'AMD 970', 'ASRock', 2, 'asrock.png'),
(151, 'GIGABYTE GA-970A-DS3P', 2900, 1, NULL, NULL, 'AMD 970', 'GIGABYTE', 2, 'gigabyte.png'),
(152, 'MSI B450 Tomahawk', 8000, 2, NULL, NULL, 'AMD B450', 'MSI', 2, 'msi.png'),
(153, 'GIGABYTE B450 AORUS M', 5500, 2, NULL, NULL, 'AMD B450', 'GIGABYTE', 2, 'gigabyte.png'),
(154, 'ASUS TUF B450-PLUS Gaming', 7000, 2, NULL, NULL, 'AMD B450', 'ASUS', 2, 'asus.png'),
(155, 'ASRock B450M Steel Legend', 6000, 2, NULL, NULL, 'AMD B450', 'ASRock', 2, 'asrock.png'),
(156, 'MSI B450 Gaming Plus', 6500, 2, NULL, NULL, 'AMD B450', 'MSI', 2, 'msi.png'),
(157, 'GIGABYTE B450 AORUS Elite', 5700, 2, NULL, NULL, 'AMD B450', 'GIGABYTE', 2, 'gigabyte.png'),
(158, 'ASUS Prime B450M-A', 5000, 2, NULL, NULL, 'AMD B450', 'ASUS', 2, 'asus.png'),
(159, 'ASRock B450 Pro4', 5500, 2, NULL, NULL, 'AMD B450', 'ASRock', 2, 'asrock.png'),
(160, 'MSI B450M Bazooka', 5200, 2, NULL, NULL, 'AMD B450', 'MSI', 2, 'msi.png'),
(161, 'GIGABYTE B450M DS3H', 4800, 2, NULL, NULL, 'AMD B450', 'GIGABYTE', 2, 'gigabyte.png'),
(162, 'ASUS ROG Strix B450-E Gaming', 9500, 2, NULL, NULL, 'AMD B450', 'ASUS', 3, 'asus.png'),
(163, 'ASRock Fatal1ty B450 Gaming K4', 6300, 2, NULL, NULL, 'AMD B450', 'ASRock', 2, 'asrock.png'),
(164, 'MSI B450 Gaming Pro Carbon AC', 9000, 2, NULL, NULL, 'AMD B450', 'MSI', 3, 'msi.png'),
(165, 'GIGABYTE B450 AORUS Pro', 6900, 2, NULL, NULL, 'AMD B450', 'GIGABYTE', 2, 'gigabyte.png'),
(166, 'ASUS ROG Crosshair VII Hero', 12000, 2, NULL, NULL, 'AMD X470', 'ASUS', 3, 'asus.png'),
(167, 'ASRock B450M-HDV R4.0', 4200, 2, NULL, NULL, 'AMD B450', 'ASRock', 2, 'asrock.png'),
(168, 'MSI B450-A PRO MAX', 4800, 2, NULL, NULL, 'AMD B450', 'MSI', 2, 'msi.png'),
(169, 'GIGABYTE B450 AORUS Elite V2', 6000, 2, NULL, NULL, 'AMD B450', 'GIGABYTE', 2, 'gigabyte.png'),
(170, 'ASUS Prime B450-Plus', 5200, 2, NULL, NULL, 'AMD B450', 'ASUS', 2, 'asus.png'),
(171, 'ASRock B450M Pro4', 4500, 2, NULL, NULL, 'AMD B450', 'ASRock', 2, 'asrock.png'),
(172, 'ASUS TUF B450M-PRO Gaming', 5600, 2, NULL, NULL, 'AMD B450', 'ASUS', 2, 'asus.png'),
(173, 'MSI B450 Tomahawk MAX', 6700, 2, NULL, NULL, 'AMD B450', 'MSI', 2, 'msi.png'),
(174, 'GIGABYTE B450 AORUS M', 5300, 2, NULL, NULL, 'AMD B450', 'GIGABYTE', 2, 'gigabyte.png'),
(175, 'ASRock B450 Steel Legend', 5900, 2, NULL, NULL, 'AMD B450', 'ASRock', 2, 'asrock.png'),
(176, 'ASUS ROG Strix X570-E Gaming', 15000, 2, NULL, NULL, 'AMD X570', 'ASUS', 3, 'asus.png'),
(177, 'MSI B450 Gaming Plus MAX', 5200, 2, NULL, NULL, 'AMD B450', 'MSI', 2, 'msi.png'),
(178, 'GIGABYTE X570 AORUS Elite', 7800, 2, NULL, NULL, 'AMD X570', 'GIGABYTE', 3, 'gigabyte.png'),
(179, 'ASRock X570 Phantom Gaming 4', 6900, 2, NULL, NULL, 'AMD X570', 'ASRock', 3, 'asrock.png'),
(180, 'MSI B450M Mortar MAX', 5600, 2, NULL, NULL, 'AMD B450', 'MSI', 2, 'msi.png'),
(181, 'ASUS Prime X570-P', 7800, 2, NULL, NULL, 'AMD X570', 'ASUS', 3, 'asus.png'),
(182, 'ASRock H110M-HDV', 2500, 4, NULL, NULL, 'Intel H110', 'ASRock', 1, 'asrock.png'),
(183, 'GIGABYTE GA-H110M-S2', 2700, 4, NULL, NULL, 'Intel H110', 'GIGABYTE', 1, 'gigabyte.png'),
(184, 'MSI H110M PRO-VD', 2400, 4, NULL, NULL, 'Intel H110', 'MSI', 1, 'msi.png'),
(185, 'ASUS B150M-A', 2800, 4, NULL, NULL, 'Intel B150', 'ASUS', 1, 'asus.png'),
(186, 'GIGABYTE GA-B150M-D3H', 2900, 4, NULL, NULL, 'Intel B150', 'GIGABYTE', 1, 'gigabyte.png'),
(187, 'MSI B150 PC MATE', 2700, 4, NULL, NULL, 'Intel B150', 'MSI', 1, 'msi.png'),
(188, 'ASRock Z170 Pro4', 4000, 4, NULL, NULL, 'Intel Z170', 'ASRock', 2, 'asrock.png'),
(189, 'GIGABYTE GA-Z170-HD3P', 3800, 4, NULL, NULL, 'Intel Z170', 'GIGABYTE', 2, 'gigabyte.png'),
(190, 'MSI Z170A GAMING PRO', 4200, 4, NULL, NULL, 'Intel Z170', 'MSI', 2, 'msi.png'),
(191, 'ASUS H170-PRO', 3200, 4, NULL, NULL, 'Intel H170', 'ASUS', 1, 'asus.png'),
(192, 'GIGABYTE GA-H170-D3H', 3300, 4, NULL, NULL, 'Intel H170', 'GIGABYTE', 1, 'gigabyte.png'),
(193, 'MSI H170A PC MATE', 3100, 4, NULL, NULL, 'Intel H170', 'MSI', 1, 'msi.png'),
(194, 'ASRock B250M Pro4', 3000, 4, NULL, NULL, 'Intel B250', 'ASRock', 1, 'asrock.png'),
(195, 'GIGABYTE GA-B250M-DS3H', 3200, 4, NULL, NULL, 'Intel B250', 'GIGABYTE', 1, 'gigabyte.png'),
(196, 'MSI B250M PRO-VH', 2900, 4, NULL, NULL, 'Intel B250', 'MSI', 1, 'msi.png'),
(197, 'ASUS Z270-A', 4200, 4, NULL, NULL, 'Intel Z270', 'ASUS', 2, 'asus.png'),
(198, 'GIGABYTE GA-Z270P-D3', 3800, 4, NULL, NULL, 'Intel Z270', 'GIGABYTE', 2, 'gigabyte.png'),
(199, 'MSI Z270 GAMING PRO CARBON', 4800, 4, NULL, NULL, 'Intel Z270', 'MSI', 2, 'msi.png'),
(200, 'ASRock H310M-HDV', 2600, 4, NULL, NULL, 'Intel H310', 'ASRock', 1, 'asrock.png'),
(201, 'GIGABYTE GA-H310M-DS2', 2700, 4, NULL, NULL, 'Intel H310', 'GIGABYTE', 1, 'gigabyte.png'),
(202, 'MSI B360M BAZOOKA', 3200, 4, NULL, NULL, 'Intel B360', 'MSI', 1, 'msi.png'),
(203, 'ASUS Prime H370M-Plus', 3500, 4, NULL, NULL, 'Intel H370', 'ASUS', 1, 'asus.png'),
(204, 'GIGABYTE Z390 AORUS PRO', 5200, 4, NULL, NULL, 'Intel Z390', 'GIGABYTE', 2, 'gigabyte.png'),
(205, 'MSI Z370 SLI PLUS', 4500, 4, NULL, NULL, 'Intel Z370', 'MSI', 2, 'msi.png'),
(206, 'ASRock B365M PRO4', 3200, 4, NULL, NULL, 'Intel B365', 'ASRock', 1, 'asrock.png'),
(207, 'GIGABYTE H370 AORUS GAMING 3', 4000, 4, NULL, NULL, 'Intel H370', 'GIGABYTE', 1, 'gigabyte.png'),
(208, 'MSI B365M PRO-VH', 2800, 4, NULL, NULL, 'Intel B365', 'MSI', 1, 'msi.png'),
(209, 'ASUS ROG STRIX Z390-E GAMING', 5500, 4, NULL, NULL, 'Intel Z390', 'ASUS', 2, 'asus.png');

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_p_c_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(15,5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_p_c_s`
--

CREATE TABLE `order_p_c_s` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `total_price` decimal(15,5) NOT NULL,
  `products` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `pc_configurations`
--

CREATE TABLE `pc_configurations` (
  `id` bigint UNSIGNED NOT NULL,
  `processor_id` bigint UNSIGNED NOT NULL,
  `motherboard_id` bigint UNSIGNED NOT NULL,
  `ram_id` bigint UNSIGNED NOT NULL,
  `gpu_id` bigint UNSIGNED NOT NULL,
  `psu_id` bigint UNSIGNED NOT NULL,
  `case_id` bigint UNSIGNED NOT NULL,
  `rom_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `processors`
--

CREATE TABLE `processors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `socket_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `core` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `processors`
--

INSERT INTO `processors` (`id`, `name`, `price`, `socket_id`, `created_at`, `updated_at`, `brand`, `core`, `frequency`, `img_brand`) VALUES
(1, 'Сброс', '0.00', 6, NULL, NULL, ' ', '-', '-', ''),
(8, 'AMD FX-8350', '139.99', 1, '2023-05-12 20:35:41', '2023-05-12 20:35:41', 'AMD', '8-cores', '4.0 GHz', 'amd-fx.png'),
(9, 'AMD FX-8370', '149.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '8-cores', '4.3 GHz', 'amd-fx.png'),
(10, 'AMD FX-8320', '129.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '8-cores', '3.5 GHz', 'amd-fx.png'),
(13, 'AMD FX-9590', '199.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '8-cores', '4.7 GHz', 'amd-fx.png'),
(14, 'AMD FX-9370', '179.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '8-cores', '4.4 GHz', 'amd-fx.png'),
(15, 'AMD FX-8370E', '159.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '8-cores', '3.3 GHz', 'amd-fx.png'),
(16, 'AMD FX-8320E', '139.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '8-cores', '3.2 GHz', 'amd-fx.png'),
(17, 'AMD FX-6350', '109.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '6-cores', '3.9 GHz', 'amd-fx.png'),
(19, 'AMD FX-9590 Black Edition', '219.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '8-cores', '4.7 GHz', 'amd-fx.png'),
(20, 'AMD FX-9370 Black Edition', '199.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '8-cores', '4.4 GHz', 'amd-fx.png'),
(21, 'AMD FX-8370E Black Edition', '179.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '8-cores', '3.3 GHz', 'amd-fx.png'),
(22, 'AMD FX-8320E Black Edition', '159.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '8-cores', '3.2 GHz', 'amd-fx.png'),
(23, 'AMD FX-6350 Black Edition', '129.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '6-cores', '3.9 GHz', 'amd-fx.png'),
(25, 'AMD FX-6300 Black Edition', '99.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '6-cores', '3.5 GHz', 'amd-fx.png'),
(26, 'AMD FX-4320', '79.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '4-cores', '4.0 GHz', 'amd-fx.png'),
(28, 'AMD FX-8300', '129.99', 1, '2023-05-12 20:37:59', '2023-05-12 20:37:59', 'AMD', '8-cores', '3.3 GHz', 'amd-fx.png'),
(51, 'AMD FX-6300', '99.99', 1, '2023-05-12 20:40:01', '2023-05-12 20:40:01', 'AMD', '6-cores', '3.5 GHz', 'amd-fx.png'),
(52, 'AMD FX-4300', '79.99', 1, '2023-05-12 20:40:01', '2023-05-12 20:40:01', 'AMD', '4-cores', '3.8 GHz', 'amd-fx.png'),
(58, 'AMD FX-4350', '89.99', 1, '2023-05-12 20:40:01', '2023-05-12 20:40:01', 'AMD', '4-cores', '4.2 GHz', 'amd-fx.png'),
(75, 'AMD FX-4350 Black Edition', '109.99', 1, '2023-05-12 20:40:02', '2023-05-12 20:40:02', 'AMD', '4-cores', '4.2 GHz', 'amd-fx.png'),
(81, 'AMD Ryzen 9 5950X', '799.99', 2, '2023-05-12 20:55:27', '2023-05-12 20:55:27', 'AMD', '16-cores', '3.4 GHz', 'ryzen.svg'),
(83, 'AMD Ryzen 9 5900X', '549.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '12-cores', '3.7 GHz', 'ryzen.svg'),
(85, 'AMD Ryzen 5 5600X', '299.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '6-cores', '3.7 GHz', 'ryzen.svg'),
(86, 'AMD Ryzen 7 3700X', '329.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '8-cores', '3.6 GHz', 'ryzen.svg'),
(87, 'AMD Ryzen 5 3600X', '249.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '6-cores', '3.8 GHz', 'ryzen.svg'),
(88, 'AMD Ryzen 5 5600G', '249.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '6-cores', '3.9 GHz', 'ryzen.svg'),
(89, 'AMD Ryzen 5 3600', '199.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '6-cores', '3.6 GHz', 'ryzen.svg'),
(91, 'AMD Ryzen 3 3200G', '129.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '4-cores', '3.7 GHz', 'ryzen.svg'),
(92, 'AMD Ryzen 3 3100', '89.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '4-cores', '3.6 GHz', 'ryzen.svg'),
(93, 'AMD Ryzen 9 3950X', '749.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '16-cores', '3.5 GHz', 'ryzen.svg'),
(94, 'AMD Ryzen 9 3900X', '499.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '12-cores', '3.8 GHz', 'ryzen.svg'),
(95, 'AMD Ryzen 7 3800X', '399.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '8-cores', '3.9 GHz', 'ryzen.svg'),
(98, 'AMD Ryzen 5 3500X', '179.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '6-cores', '3.6 GHz', 'ryzen.svg'),
(99, 'AMD Ryzen 5 3400G', '149.99', 2, '2023-05-12 20:55:28', '2023-05-12 20:55:28', 'AMD', '4-cores', '3.7 GHz', 'ryzen.svg'),
(105, 'AMD Ryzen 7 5800X', '449.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '8-cores', '3.8 GHz', 'ryzen.svg'),
(111, 'AMD Ryzen 3 3300X', '149.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '4-cores', '3.8 GHz', 'ryzen.svg'),
(117, 'AMD Ryzen 7 3700', '329.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '8-cores', '3.6 GHz', 'ryzen.svg'),
(121, 'AMD Ryzen 5 3300X', '129.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '4-cores', '3.8 GHz', 'ryzen.svg'),
(123, 'AMD Ryzen 7 1800X', '499.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '8-cores', '3.6 GHz', 'ryzen.svg'),
(124, 'AMD Ryzen 7 1700X', '399.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '8-cores', '3.4 GHz', 'ryzen.svg'),
(125, 'AMD Ryzen 7 1700', '329.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '8-cores', '3.0 GHz', 'ryzen.svg'),
(126, 'AMD Ryzen 5 1600X', '249.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '6-cores', '3.6 GHz', 'ryzen.svg'),
(127, 'AMD Ryzen 5 1600', '219.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '6-cores', '3.2 GHz', 'ryzen.svg'),
(128, 'AMD Ryzen 5 1500X', '189.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '4-cores', '3.5 GHz', 'ryzen.svg'),
(129, 'AMD Ryzen 5 1400', '169.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '4-cores', '3.2 GHz', 'ryzen.svg'),
(130, 'AMD Ryzen 3 1300X', '129.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '4-cores', '3.5 GHz', 'ryzen.svg'),
(131, 'AMD Ryzen 3 1200', '109.99', 2, '2023-05-12 20:55:46', '2023-05-12 20:55:46', 'AMD', '4-cores', '3.1 GHz', 'ryzen.svg'),
(132, ' Intel Core i3-6100', '70.00', 4, NULL, NULL, 'Intel', '2-cores', '3.70 GHz', 'lga1151.svg'),
(133, 'Intel Core i5-6600', '150.00', 4, NULL, NULL, 'Intel', '4-cores', '3.30 GHz', 'lga1151.svg'),
(134, 'Intel Core i7-6700', '250.00', 4, NULL, NULL, 'Intel', '4-cores', '3.40 GHz', 'lga1151.svg'),
(135, 'Intel Core i3-6300', '100.00', 4, NULL, NULL, 'Intel', '2-cores', '3.80 GHz', 'lga1151.svg'),
(136, 'Intel Pentium G4560', '50.00', 4, NULL, NULL, 'Intel', '2-cores', '3.50 GHz', 'lga1151.svg'),
(137, 'Intel Core i5-6400', '180.00', 4, NULL, NULL, 'Intel', '4-cores', '2.70 GHz', 'lga1151.svg'),
(138, 'Intel Core i7-6700K', '300.00', 4, NULL, NULL, 'Intel', '4-cores', '4.00 GHz', 'lga1151.svg'),
(139, 'Intel Core i3-6100T', '90.00', 4, NULL, NULL, 'Intel', '2-cores', '3.20 GHz', 'lga1151.svg'),
(140, 'Intel Pentium G4600', '60.00', 4, NULL, NULL, 'Intel', '2-cores', '3.60 GHz', 'lga1151.svg'),
(141, 'Intel Core i7-6700T', '280.00', 4, NULL, NULL, 'Intel', '4-cores', '2.80 GHz', 'lga1151.svg'),
(142, 'Intel Core i3-6300T', '110.00', 4, NULL, NULL, 'Intel', '2-cores', '3.30 GHz', 'lga1151.svg'),
(143, 'Intel Pentium G4400', '40.00', 4, NULL, NULL, 'Intel', '2-cores', '3.30 GHz', 'lga1151.svg'),
(144, 'Intel Core i5-6500T', '210.00', 4, NULL, NULL, 'Intel', '4-cores', '2.50 GHz', 'lga1151.svg');

-- --------------------------------------------------------

--
-- Структура таблицы `psus`
--

CREATE TABLE `psus` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `typemodyls` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `power` int DEFAULT NULL,
  `img_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `psus`
--

INSERT INTO `psus` (`id`, `vendor`, `model`, `typemodyls`, `price`, `created_at`, `updated_at`, `power`, `img_brand`) VALUES
(3, 'Gigabyte', 'GP-P750GM', 'Модульный', '8500.00', NULL, NULL, 750, 'gigabyte.png'),
(4, 'Corsair', 'RM750x', 'Модульный', '9500.00', NULL, NULL, 750, 'corsair.png'),
(9, 'Corsair', 'RM750x', 'Модульный', '9000.00', NULL, NULL, 750, 'corsair.png'),
(10, 'EVGA', 'SuperNOVA 750', 'Модульный', '8500.00', NULL, NULL, 750, 'evga.png'),
(11, 'Seasonic', 'Focus GX-750', 'Модульный', '9500.00', NULL, NULL, 750, 'seasonic.png'),
(12, 'Thermaltake', 'Toughpower GF1 750W', 'Модульный', '8000.00', NULL, NULL, 750, 'thermaltake.png'),
(13, 'Cooler Master', 'MWE 750 Bronze', 'Модульный', '7500.00', NULL, NULL, 750, 'coolermaster.png'),
(14, 'Gigabyte', 'GP-P850GM', 'Модульный', '9500.00', NULL, NULL, 850, 'gigabyte.png'),
(15, 'EVGA', 'SuperNOVA 850', 'Модульный', '9000.00', NULL, NULL, 850, 'evga.png'),
(16, 'Corsair', 'RM850x', 'Модульный', '10000.00', NULL, NULL, 850, 'corsair.png'),
(17, 'Thermaltake', 'Toughpower GF1 850W', 'Модульный', '8500.00', NULL, NULL, 850, 'thermaltake.png'),
(18, 'Cooler Master', 'MWE 850 Bronze', 'Модульный', '8000.00', NULL, NULL, 850, 'coolermaster.png'),
(19, 'Seasonic', 'Focus GX-850', 'Модульный', '10500.00', NULL, NULL, 850, 'seasonic.png'),
(20, 'Corsair', 'RM1000x', 'Модульный', '12000.00', NULL, NULL, 1000, 'corsair.png'),
(21, 'EVGA', 'SuperNOVA 1000', 'Модульный', '11500.00', NULL, NULL, 1000, 'evga.png'),
(22, 'Thermaltake', 'Toughpower GF1 1000W', 'Модульный', '11000.00', NULL, NULL, 1000, 'thermaltake.png'),
(23, 'Cooler Master', 'MWE 1000 Bronze', 'Модульный', '10500.00', NULL, NULL, 1000, 'coolermaster.png'),
(24, 'Seasonic', 'Focus GX-1000', 'Модульный', '12500.00', NULL, NULL, 1000, 'seasonic.png'),
(25, 'Corsair', 'RM1200x', 'Модульный', '13500.00', NULL, NULL, 1200, 'corsair.png'),
(26, 'EVGA', 'SuperNOVA 1200', 'Модульный', '13000.00', NULL, NULL, 1200, 'evga.png'),
(27, 'Thermaltake', 'Toughpower GF1 1200W', 'Модульный', '12500.00', NULL, NULL, 1200, 'thermaltake.png'),
(28, 'Cooler Master', 'MWE 1200 Bronze', 'Модульный', '12000.00', NULL, NULL, 1200, 'coolermaster.png'),
(29, 'Seasonic', 'Focus GX-1200', 'Модульный', '14000.00', NULL, NULL, 1200, 'seasonic.png'),
(30, 'Corsair', 'RM1400x', 'Модульный', '15500.00', NULL, NULL, 1400, 'corsair.png'),
(31, 'EVGA', 'SuperNOVA 1400', 'Модульный', '15000.00', NULL, NULL, 1400, 'evga.png'),
(32, 'Thermaltake', 'Toughpower GF1 1400W', 'Модульный', '14500.00', NULL, NULL, 1400, 'thermaltake.png'),
(33, 'Cooler Master', 'MWE 1400 Bronze', 'Модульный', '14000.00', NULL, NULL, 1400, 'coolermaster.png'),
(34, 'Seasonic', 'Focus GX-1400', 'Модульный', '16000.00', NULL, NULL, 1400, 'seasonic.png'),
(35, 'Corsair', 'RM1600x', 'Модульный', '17500.00', NULL, NULL, 1600, 'corsair.png'),
(36, 'EVGA', 'SuperNOVA 1600', 'Модульный', '17000.00', NULL, NULL, 1600, 'evga.png'),
(37, 'Thermaltake', 'Toughpower GF1 1600W', 'Модульный', '16500.00', NULL, NULL, 1600, 'thermaltake.png'),
(38, 'Cooler Master', 'MWE 1600 Bronze', 'Модульный', '16000.00', NULL, NULL, 1600, 'coolermaster.png'),
(39, 'Seasonic', 'Focus GX-1600', 'Модульный', '18000.00', NULL, NULL, 1600, 'seasonic.png'),
(40, 'Thermaltake', 'Smart 500W', 'Не модульный', '3000.00', NULL, NULL, 500, 'thermaltake.png'),
(41, 'Cooler Master', 'Elite V3 500W', 'Не модульный', '2800.00', NULL, NULL, 500, 'coolermaster.png'),
(42, 'EVGA', 'BR 500W', 'Не модульный', '2500.00', NULL, NULL, 500, 'evga.png'),
(43, 'Corsair', 'VS550', 'Не модульный', '3200.00', NULL, NULL, 550, 'corsair.png'),
(44, 'Seasonic', 'S12III 550W', 'Не модульный', '3500.00', NULL, NULL, 550, 'seasonic.png');

-- --------------------------------------------------------

--
-- Структура таблицы `psuwatts`
--

CREATE TABLE `psuwatts` (
  `id` bigint UNSIGNED NOT NULL,
  `watt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `psuwatts`
--

INSERT INTO `psuwatts` (`id`, `watt`, `created_at`, `updated_at`) VALUES
(1, '400w', NULL, NULL),
(2, '700w', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `rams`
--

CREATE TABLE `rams` (
  `idss` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `frequency` int NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `dram_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rams`
--

INSERT INTO `rams` (`idss`, `name`, `size`, `frequency`, `price`, `dram_id`, `created_at`, `updated_at`, `brand`, `img_brand`) VALUES
(44, 'Samsung DDR3', 4, 1333, '1000.00', 1, NULL, NULL, 'Samsung', 'samsung.png'),
(45, 'Kingston HyperX Fury DDR3', 8, 1600, '1500.00', 1, NULL, NULL, 'Kingston', 'kingston.png'),
(46, 'Corsair Vengeance DDR3', 16, 1866, '2500.00', 1, NULL, NULL, 'Corsair', 'corsair.png'),
(47, 'Crucial Ballistix Sport DDR3', 8, 1600, '1300.00', 1, NULL, NULL, 'Crucial', 'crucial.png'),
(48, 'G.Skill Ripjaws X DDR3', 16, 2133, '2800.00', 1, NULL, NULL, 'G.Skill', 'gskill.png'),
(49, 'ADATA XPG DDR3', 8, 1600, '1200.00', 1, NULL, NULL, 'ADATA', 'adata.png'),
(50, 'TeamGroup Elite DDR3', 4, 1333, '800.00', 1, NULL, NULL, 'TeamGroup', 'teamgroup.png'),
(51, 'Patriot Viper 3 DDR3', 8, 1866, '1400.00', 1, NULL, NULL, 'Patriot', 'patriot.png'),
(52, 'HyperX Impact DDR3', 16, 1600, '2200.00', 1, NULL, NULL, 'HyperX', 'hyperx.png'),
(53, 'Transcend JetRAM DDR3', 4, 1600, '900.00', 1, NULL, NULL, 'Transcend', 'transcend.png'),
(54, 'GeIL Evo Potenza DDR3', 8, 1600, '1100.00', 1, NULL, NULL, 'GeIL', 'geil.png'),
(55, 'Kingston ValueRAM DDR3', 4, 1333, '900.00', 1, NULL, NULL, 'Kingston', 'kingston.png'),
(56, 'Crucial DDR3L', 8, 1600, '1200.00', 1, NULL, NULL, 'Crucial', 'crucial.png'),
(57, 'Corsair XMS3 DDR3', 8, 1600, '1300.00', 1, NULL, NULL, 'Corsair', 'corsair.png'),
(58, 'G.Skill Ares DDR3', 16, 1600, '1800.00', 1, NULL, NULL, 'G.Skill', 'gskill.png'),
(59, 'ADATA Premier DDR3', 4, 1600, '800.00', 1, NULL, NULL, 'ADATA', 'adata.png'),
(60, 'TeamGroup T-Force DDR3', 8, 1866, '1400.00', 1, NULL, NULL, 'TeamGroup', 'teamgroup.png'),
(61, 'Patriot Signature DDR3', 8, 1600, '1000.00', 1, NULL, NULL, 'Patriot', 'patriot.png'),
(62, 'HyperX Fury DDR3', 16, 1866, '2000.00', 1, NULL, NULL, 'HyperX', 'hyperx.png'),
(63, 'Transcend DDR3', 4, 1600, '700.00', 1, NULL, NULL, 'Transcend', 'transcend.png'),
(64, 'GeIL EVO DDR3', 8, 1600, '1100.00', 1, NULL, NULL, 'GeIL', 'geil.png'),
(65, 'Corsair Vengeance LPX DDR3', 32, 1600, '2800.00', 1, NULL, NULL, 'Corsair', 'corsair.png'),
(66, 'G.Skill RipjawsX DDR3', 32, 1866, '3000.00', 1, NULL, NULL, 'G.Skill', 'gskill.png'),
(67, 'Kingston HyperX Beast DDR3', 32, 2400, '3200.00', 1, NULL, NULL, 'Kingston', 'kingston.png'),
(68, 'Crucial Ballistix Tactical DDR3', 32, 1600, '2500.00', 1, NULL, NULL, 'Crucial', 'crucial.png'),
(69, 'ADATA XPG DDR3', 32, 2133, '2900.00', 1, NULL, NULL, 'ADATA', 'adata.png'),
(70, 'Corsair Vengeance LPX DDR4', 8, 3200, '1500.00', 2, NULL, NULL, 'Corsair', 'corsair.png'),
(71, 'G.Skill Ripjaws V DDR4', 16, 3600, '2500.00', 2, NULL, NULL, 'G.Skill', 'gskill.png'),
(72, 'Kingston HyperX Fury DDR4', 8, 2400, '1200.00', 2, NULL, NULL, 'Kingston', 'kingston.png'),
(73, 'Crucial Ballistix DDR4', 16, 3000, '1800.00', 2, NULL, NULL, 'Crucial', 'crucial.png'),
(74, 'ADATA XPG Spectrix DDR4', 8, 3200, '1400.00', 2, NULL, NULL, 'ADATA', 'adata.png'),
(75, 'Team T-Force Delta RGB DDR4', 16, 3200, '2000.00', 2, NULL, NULL, 'Team', 'team.png'),
(76, 'Patriot Viper Steel DDR4', 16, 3600, '2200.00', 2, NULL, NULL, 'Patriot', 'patriot.png'),
(77, 'HyperX Predator DDR4', 32, 3200, '4000.00', 2, NULL, NULL, 'HyperX', 'hyperx.png'),
(78, 'Corsair Dominator Platinum DDR4', 32, 3600, '4500.00', 2, NULL, NULL, 'Corsair', 'corsair.png'),
(79, 'G.Skill Trident Z RGB DDR4', 16, 3200, '2500.00', 2, NULL, NULL, 'G.Skill', 'gskill.png'),
(80, 'Kingston HyperX Predator DDR4', 16, 3600, '2800.00', 2, NULL, NULL, 'Kingston', 'kingston.png'),
(81, 'Crucial Ballistix RGB DDR4', 8, 3000, '1600.00', 2, NULL, NULL, 'Crucial', 'crucial.png'),
(82, 'ADATA XPG Spectrix D60G DDR4', 16, 3200, '2300.00', 2, NULL, NULL, 'ADATA', 'adata.png'),
(83, 'Team T-Force Vulcan Z DDR4', 8, 2666, '1100.00', 2, NULL, NULL, 'Team', 'team.png'),
(84, 'Patriot Viper 4 DDR4', 16, 3000, '1800.00', 2, NULL, NULL, 'Patriot', 'patriot.png'),
(85, 'HyperX Fury DDR4', 16, 2666, '1500.00', 2, NULL, NULL, 'HyperX', 'hyperx.png'),
(86, 'Corsair Vengeance RGB Pro DDR4', 32, 3200, '3500.00', 2, NULL, NULL, 'Corsair', 'corsair.png'),
(87, 'G.Skill Trident Z Neo DDR4', 32, 3600, '4000.00', 2, NULL, NULL, 'G.Skill', 'gskill.png'),
(88, 'Kingston HyperX FURY RGB DDR4', 16, 3200, '2000.00', 2, NULL, NULL, 'Kingston', 'kingston.png'),
(89, 'Crucial Ballistix MAX DDR4', 32, 4000, '5000.00', 2, NULL, NULL, 'Crucial', 'crucial.png'),
(90, 'ADATA XPG SPECTRIX D50 DDR4', 16, 3600, '2500.00', 2, NULL, NULL, 'ADATA', 'adata.png'),
(91, 'Team T-Force DARK Z DDR4', 32, 3200, '3800.00', 2, NULL, NULL, 'Team', 'team.png'),
(92, 'Patriot Viper Elite DDR4', 8, 2400, '900.00', 2, NULL, NULL, 'Patriot', 'patriot.png'),
(93, 'HyperX Impact DDR4', 16, 3200, '2200.00', 2, NULL, NULL, 'HyperX', 'hyperx.png'),
(94, 'Corsair Vengeance LPX DDR4', 16, 2666, '1800.00', 2, NULL, NULL, 'Corsair', 'corsair.png'),
(95, 'G.Skill Trident Z Royal DDR4', 32, 3600, '4500.00', 2, NULL, NULL, 'G.Skill', 'gskill.png'),
(96, 'Kingston HyperX Impact DDR4', 16, 2666, '1500.00', 2, NULL, NULL, 'Kingston', 'kingston.png'),
(97, 'Crucial Ballistix Tactical DDR4', 16, 3000, '1600.00', 2, NULL, NULL, 'Crucial', 'crucial.png'),
(98, 'ADATA XPG SPECTRIX D41 DDR4', 8, 3200, '1400.00', 2, NULL, NULL, 'ADATA', 'adata.png'),
(99, 'Team T-Force Vulcan DDR4', 8, 2400, '1000.00', 2, NULL, NULL, 'Team', 'team.png'),
(100, 'Patriot Viper Steel DDR4', 16, 3200, '2200.00', 2, NULL, NULL, 'Patriot', 'patriot.png'),
(101, 'HyperX FURY DDR4', 32, 2666, '3200.00', 2, NULL, NULL, 'HyperX', 'hyperx.png'),
(102, 'Corsair Vengeance LPX RGB DDR4', 16, 3000, '1900.00', 2, NULL, NULL, 'Corsair', 'corsair.png'),
(103, 'G.Skill Ripjaws V DDR4', 32, 3200, '4000.00', 2, NULL, NULL, 'G.Skill', 'gskill.png');

-- --------------------------------------------------------

--
-- Структура таблицы `recalls`
--

CREATE TABLE `recalls` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `roms`
--

CREATE TABLE `roms` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `speed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roms`
--

INSERT INTO `roms` (`id`, `name`, `speed`, `size`, `price`, `created_at`, `updated_at`, `brand`, `storage_type`, `img_brand`) VALUES
(3, 'Samsung 970 EVO Plus', '3500', '1TB', '8000.00', NULL, NULL, 'Samsung', 'SSD', 'samsung.png'),
(4, 'Crucial MX500', '560', '2TB', '6000.00', NULL, NULL, 'Crucial', 'SSD', 'crucial.png'),
(7, 'ADATA SU635', '520', '480GB', '1500.00', NULL, NULL, 'ADATA', 'SSD', 'adata.png'),
(8, 'Goldenfir SSD', '512', '512', '2500.00', NULL, NULL, 'Goldenfir', 'SSD', 'goldenfir.png'),
(9, 'Kingston SSD', '256', '256', '1500.00', NULL, NULL, 'Kingston', 'SSD', 'kingston.png'),
(10, 'Samsung SSD', '1TB', '1000', '3500.00', NULL, NULL, 'Samsung', 'SSD', 'samsung.png'),
(11, 'Crucial SSD', '480', '480', '2800.00', NULL, NULL, 'Crucial', 'SSD', 'crucial.png'),
(12, 'Western Digital HDD', '7200', '2TB', '2000.00', NULL, NULL, 'Western Digital', 'HDD', 'wd.png'),
(13, 'Seagate HDD', '5400', '4TB', '3000.00', NULL, NULL, 'Seagate', 'HDD', 'seagate.png'),
(14, 'Adata SSD', '256', '256', '1500.00', NULL, NULL, 'Adata', 'SSD', 'adata.png'),
(15, 'Toshiba HDD', '7200', '1TB', '1800.00', NULL, NULL, 'Toshiba', 'HDD', 'toshiba.png'),
(16, 'Intel SSD', '512', '512', '2500.00', NULL, NULL, 'Intel', 'SSD', 'intel.png'),
(17, 'Corsair SSD', '1TB', '1000', '3500.00', NULL, NULL, 'Corsair', 'SSD', 'corsair.png'),
(18, 'SanDisk SSD', '480', '480', '2800.00', NULL, NULL, 'SanDisk', 'SSD', 'sandisk.png'),
(19, 'Hitachi HDD', '5400', '2TB', '2000.00', NULL, NULL, 'Hitachi', 'HDD', 'hitachi.png'),
(20, 'Patriot SSD', '256', '256', '1500.00', NULL, NULL, 'Patriot', 'SSD', 'patriot.png'),
(21, 'Transcend SSD', '480', '480', '2800.00', NULL, NULL, 'Transcend', 'SSD', 'transcend.png'),
(22, 'ADATA HDD', '7200', '1TB', '1800.00', NULL, NULL, 'ADATA', 'HDD', 'adata.png'),
(23, 'Kingston HDD', '5400', '4TB', '3000.00', NULL, NULL, 'Kingston', 'HDD', 'kingston.png'),
(24, 'Samsung NVMe', '1TB', '1000', '4500.00', NULL, NULL, 'Samsung', 'NVMe', 'samsung.png'),
(25, 'Crucial NVMe', '500', '500', '3500.00', NULL, NULL, 'Crucial', 'NVMe', 'crucial.png'),
(26, 'Western Digital NVMe', '256', '256', '2500.00', NULL, NULL, 'Western Digital', 'NVMe', 'wd.png'),
(27, 'Seagate NVMe', '2TB', '2000', '5500.00', NULL, NULL, 'Seagate', 'NVMe', 'seagate.png'),
(28, 'Adata NVMe', '1TB', '1000', '4500.00', NULL, NULL, 'Adata', 'NVMe', 'adata.png'),
(29, 'Toshiba NVMe', '500', '500', '3500.00', NULL, NULL, 'Toshiba', 'NVMe', 'toshiba.png'),
(30, 'Intel NVMe', '256', '256', '2500.00', NULL, NULL, 'Intel', 'NVMe', 'intel.png'),
(31, 'Corsair NVMe', '2TB', '2000', '5500.00', NULL, NULL, 'Corsair', 'NVMe', 'corsair.png'),
(32, 'SanDisk NVMe', '1TB', '1000', '4500.00', NULL, NULL, 'SanDisk', 'NVMe', 'sandisk.png'),
(33, 'Patriot NVMe', '500', '500', '3500.00', NULL, NULL, 'Patriot', 'NVMe', 'patriot.png'),
(34, 'Transcend NVMe', '2TB', '2000', '5500.00', NULL, NULL, 'Transcend', 'NVMe', 'transcend.png'),
(35, 'ADATA NVMe', '1TB', '1000', '4500.00', NULL, NULL, 'ADATA', 'NVMe', 'adata.png'),
(36, 'Kingston NVMe', '500', '500', '3500.00', NULL, NULL, 'Kingston', 'NVMe', 'kingston.png'),
(37, 'Samsung HDD', '7200', '2TB', '2500.00', NULL, NULL, 'Samsung', 'HDD', 'samsung.png');

-- --------------------------------------------------------

--
-- Структура таблицы `socketdrams`
--

CREATE TABLE `socketdrams` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `socket_id` bigint UNSIGNED NOT NULL,
  `dram_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `socketdrams`
--

INSERT INTO `socketdrams` (`id`, `created_at`, `updated_at`, `socket_id`, `dram_id`) VALUES
(1, NULL, NULL, 1, 1),
(2, NULL, NULL, 2, 2),
(8, NULL, NULL, 4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `sockets`
--

CREATE TABLE `sockets` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sockets`
--

INSERT INTO `sockets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'AM3+', NULL, NULL),
(2, 'AM4', NULL, NULL),
(3, 'AM5', NULL, NULL),
(4, 'LGA 1151-v1', NULL, NULL),
(6, ' ', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `statys`
--

CREATE TABLE `statys` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `statys`
--

INSERT INTO `statys` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Принят в обработку', NULL, NULL),
(2, 'Собирается', NULL, NULL),
(3, 'Отменен', NULL, NULL),
(4, 'Ожидает оплаты', NULL, NULL),
(5, 'Готов к выдаче', NULL, NULL),
(6, 'Получен!', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'def.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `call_requests`
--
ALTER TABLE `call_requests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_item_id_foreign` (`item_id`);

--
-- Индексы таблицы `casees`
--
ALTER TABLE `casees`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `catalogs`
--
ALTER TABLE `catalogs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `drams`
--
ALTER TABLE `drams`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `gpupsuwatts`
--
ALTER TABLE `gpupsuwatts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gpupsuwatts_gpuwatt_id_foreign` (`gpuwatt_id`),
  ADD KEY `gpupsuwatts_psuwatt_id_foreign` (`psuwatt_id`);

--
-- Индексы таблицы `gpus`
--
ALTER TABLE `gpus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gpus_gpuwatt_id_foreign` (`gpuwatt_id`);

--
-- Индексы таблицы `gpuwatts`
--
ALTER TABLE `gpuwatts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `motherboards`
--
ALTER TABLE `motherboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `motherboards_socket_id_foreign` (`socket_id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_p_c_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `order_p_c_s`
--
ALTER TABLE `order_p_c_s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_p_c_s_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `pc_configurations`
--
ALTER TABLE `pc_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pc_configurations_processor_id_foreign` (`processor_id`),
  ADD KEY `pc_configurations_motherboard_id_foreign` (`motherboard_id`),
  ADD KEY `pc_configurations_ram_id_foreign` (`ram_id`),
  ADD KEY `pc_configurations_gpu_id_foreign` (`gpu_id`),
  ADD KEY `pc_configurations_psu_id_foreign` (`psu_id`),
  ADD KEY `pc_configurations_case_id_foreign` (`case_id`),
  ADD KEY `pc_configurations_rom_id_foreign` (`rom_id`),
  ADD KEY `pc_configurations_user_id_foreign` (`user_id`),
  ADD KEY `pc_configurations_status_id_foreign` (`status_id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `processors`
--
ALTER TABLE `processors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `processors_socket_id_foreign` (`socket_id`);

--
-- Индексы таблицы `psus`
--
ALTER TABLE `psus`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `psuwatts`
--
ALTER TABLE `psuwatts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rams`
--
ALTER TABLE `rams`
  ADD PRIMARY KEY (`idss`),
  ADD KEY `rams_dram_id_foreign` (`dram_id`);

--
-- Индексы таблицы `recalls`
--
ALTER TABLE `recalls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recalls_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `roms`
--
ALTER TABLE `roms`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `socketdrams`
--
ALTER TABLE `socketdrams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `socketdrams_socket_id_foreign` (`socket_id`),
  ADD KEY `socketdrams_dram_id_foreign` (`dram_id`);

--
-- Индексы таблицы `sockets`
--
ALTER TABLE `sockets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `statys`
--
ALTER TABLE `statys`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `call_requests`
--
ALTER TABLE `call_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `casees`
--
ALTER TABLE `casees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `catalogs`
--
ALTER TABLE `catalogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `drams`
--
ALTER TABLE `drams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gpupsuwatts`
--
ALTER TABLE `gpupsuwatts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gpus`
--
ALTER TABLE `gpus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблицы `gpuwatts`
--
ALTER TABLE `gpuwatts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `motherboards`
--
ALTER TABLE `motherboards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `order_p_c_s`
--
ALTER TABLE `order_p_c_s`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `pc_configurations`
--
ALTER TABLE `pc_configurations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `processors`
--
ALTER TABLE `processors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT для таблицы `psus`
--
ALTER TABLE `psus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `psuwatts`
--
ALTER TABLE `psuwatts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `rams`
--
ALTER TABLE `rams`
  MODIFY `idss` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT для таблицы `recalls`
--
ALTER TABLE `recalls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `roms`
--
ALTER TABLE `roms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `socketdrams`
--
ALTER TABLE `socketdrams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `sockets`
--
ALTER TABLE `sockets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `statys`
--
ALTER TABLE `statys`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `catalogs` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `gpupsuwatts`
--
ALTER TABLE `gpupsuwatts`
  ADD CONSTRAINT `gpupsuwatts_gpuwatt_id_foreign` FOREIGN KEY (`gpuwatt_id`) REFERENCES `gpuwatts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gpupsuwatts_psuwatt_id_foreign` FOREIGN KEY (`psuwatt_id`) REFERENCES `psuwatts` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `gpus`
--
ALTER TABLE `gpus`
  ADD CONSTRAINT `gpus_gpuwatt_id_foreign` FOREIGN KEY (`gpuwatt_id`) REFERENCES `gpuwatts` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `motherboards`
--
ALTER TABLE `motherboards`
  ADD CONSTRAINT `motherboards_socket_id_foreign` FOREIGN KEY (`socket_id`) REFERENCES `sockets` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_p_c_id`) REFERENCES `order_p_c_s` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `catalogs` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_p_c_s`
--
ALTER TABLE `order_p_c_s`
  ADD CONSTRAINT `order_p_c_s_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `pc_configurations`
--
ALTER TABLE `pc_configurations`
  ADD CONSTRAINT `pc_configurations_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `casees` (`id`),
  ADD CONSTRAINT `pc_configurations_gpu_id_foreign` FOREIGN KEY (`gpu_id`) REFERENCES `gpus` (`id`),
  ADD CONSTRAINT `pc_configurations_motherboard_id_foreign` FOREIGN KEY (`motherboard_id`) REFERENCES `motherboards` (`id`),
  ADD CONSTRAINT `pc_configurations_processor_id_foreign` FOREIGN KEY (`processor_id`) REFERENCES `processors` (`id`),
  ADD CONSTRAINT `pc_configurations_psu_id_foreign` FOREIGN KEY (`psu_id`) REFERENCES `psus` (`id`),
  ADD CONSTRAINT `pc_configurations_ram_id_foreign` FOREIGN KEY (`ram_id`) REFERENCES `rams` (`idss`),
  ADD CONSTRAINT `pc_configurations_rom_id_foreign` FOREIGN KEY (`rom_id`) REFERENCES `roms` (`id`),
  ADD CONSTRAINT `pc_configurations_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statys` (`id`),
  ADD CONSTRAINT `pc_configurations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `processors`
--
ALTER TABLE `processors`
  ADD CONSTRAINT `processors_socket_id_foreign` FOREIGN KEY (`socket_id`) REFERENCES `sockets` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rams`
--
ALTER TABLE `rams`
  ADD CONSTRAINT `rams_dram_id_foreign` FOREIGN KEY (`dram_id`) REFERENCES `drams` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `recalls`
--
ALTER TABLE `recalls`
  ADD CONSTRAINT `recalls_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `socketdrams`
--
ALTER TABLE `socketdrams`
  ADD CONSTRAINT `socketdrams_dram_id_foreign` FOREIGN KEY (`dram_id`) REFERENCES `drams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `socketdrams_socket_id_foreign` FOREIGN KEY (`socket_id`) REFERENCES `sockets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
