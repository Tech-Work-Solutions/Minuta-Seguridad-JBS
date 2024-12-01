-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2024 a las 04:07:58
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `minutas_jbs`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arls`
--

CREATE TABLE `arls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `arls`
--

INSERT INTO `arls` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'COLMENA', '2022-03-02 15:38:31', '2022-03-02 15:38:31'),
(2, 'COLPATRIA', '2022-03-02 15:38:37', '2022-03-02 15:38:37'),
(3, 'EQUIDAD SEGUROS', '2022-03-02 15:38:42', '2022-03-02 15:38:42'),
(4, 'PORVENIR', '2022-03-02 15:38:47', '2022-03-02 15:38:47'),
(5, 'POSITIVA', '2022-03-02 15:38:51', '2022-03-02 15:38:51'),
(6, 'SEGUROS BOLIVAR', '2022-03-02 15:38:56', '2022-03-02 15:38:56'),
(7, 'SURA', '2022-03-02 15:39:00', '2022-03-02 15:39:00'),
(8, 'SURA 2', '2024-11-11 21:11:31', '2024-11-11 21:11:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL COMMENT 'Identificador de la tabla de clientes',
  `nit` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Nit del cliente',
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Nombre del cliente',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Email cliente',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `permisos_menu` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Contiene las opciones del menú ' CHECK (json_valid(`permisos_menu`)),
  `permisos_formulario` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Contiene las opciones multimedia' CHECK (json_valid(`permisos_formulario`)),
  `img_header` varchar(255) DEFAULT NULL COMMENT 'img para la sección de encabezado del reporte.',
  `img_footer` varchar(255) DEFAULT NULL COMMENT 'Img para el pie de página.',
  `estado` enum('ACTIVO','INACTIVO','ELIMINADO') DEFAULT 'ACTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `drivers`
--

INSERT INTO `drivers` (`id`, `nombre`, `numero_documento`, `created_at`, `updated_at`) VALUES
(1, 'David esteban soto', '1107511110', '2022-03-02 15:31:37', '2022-03-02 15:31:37'),
(2, 'Invitado', '111111111111', '2022-03-02 15:36:17', '2022-03-02 15:36:17'),
(3, 'SANDRA PATRICIA ARBOLEDA MORENO', '1144182050', '2022-03-02 19:19:07', '2022-03-02 19:19:07'),
(4, 'NINFA DÍAZ CASTAÑEDA', '31531179', '2022-03-02 19:21:13', '2022-03-02 19:21:13'),
(5, 'MARIA EUGENIA HERNANDEZ PINZÓN', '31971560', '2022-03-02 19:22:25', '2022-03-02 19:22:25'),
(6, 'SEBASTIAN HIDALGO COGOLLO', '1014240267', '2022-03-02 19:25:43', '2022-03-02 19:25:43'),
(7, 'GRACIELA DEL CARMEN LOPEZ TORO', '37123793', '2022-03-02 19:34:14', '2022-03-02 19:34:14'),
(8, 'YAMILE PEREZ ROYA', '63343047', '2022-03-02 19:34:49', '2022-03-02 19:34:49'),
(9, 'KAROL JULIETH VILLA QUINTERO', '1118309806', '2022-03-02 19:41:46', '2022-03-02 19:41:46'),
(10, 'LUSEYNE ZUÑIGA JANSASOY', '31531709', '2022-03-02 19:42:19', '2022-03-02 19:42:19'),
(11, 'SALCEDO COLLAZOS NORA PIEDAD', '66947768', '2022-03-02 19:43:43', '2022-03-02 19:43:43'),
(12, 'REBAGE SOTO JUAN CAMILO', '72008833', '2022-03-02 19:43:50', '2022-03-02 19:43:50'),
(13, 'FRANCO MERCZ VALERIA', '1130670323', '2022-03-02 19:43:54', '2022-03-02 19:43:54'),
(14, 'GONZALEZ BENITEZ PAULA ANDREA', '31482031', '2022-03-02 19:44:01', '2022-03-02 19:44:01'),
(15, 'BASTIDAS SILVA JUAN CARLOS', '1037581158', '2022-03-02 19:44:07', '2022-03-02 19:44:07'),
(16, 'OSPINA MILLAN HENRY FERNANDO', '94385007', '2022-03-02 19:44:25', '2022-03-02 19:44:25'),
(17, 'STERLING AUSECHA ANYELLI CLARENA', '1118297972', '2022-03-02 19:44:32', '2022-03-02 19:44:32'),
(18, 'RIVAS HOLGUIN ANDREA MARCELA', '1107093932', '2022-03-02 19:44:37', '2022-03-02 19:44:37'),
(19, 'VALENCIA ESCOBAR JULIANY', '1144076767', '2022-03-02 19:44:44', '2022-03-02 19:44:44'),
(20, 'YEPES LORZA DIEGO ARMANDO', '1144031836', '2022-03-02 19:44:55', '2022-03-02 19:44:55'),
(21, 'PETTO NARANJO ALEJANDRO', '11144076767', '2022-03-02 19:53:47', '2022-03-02 19:53:47'),
(22, 'VALENCIA ESCOBAR JULIANY', '1114828594', '2022-03-02 19:54:30', '2022-03-02 19:54:30'),
(23, 'JUAN PRUEBA', '12457', '2024-11-11 21:10:20', '2024-11-11 21:10:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'ASMETSALUD', '2022-03-02 15:37:35', '2022-03-02 15:37:35'),
(2, 'COOMEVA', '2022-03-02 15:37:40', '2022-03-02 15:37:40'),
(3, 'EMSSANAR', '2022-03-02 15:37:46', '2022-03-02 15:37:46'),
(4, 'FAMISANAR', '2022-03-02 15:37:58', '2022-03-02 15:37:58'),
(5, 'NUEVA EPS', '2022-03-02 15:38:19', '2022-03-02 15:38:19'),
(6, 'SANITAS', '2022-03-02 15:38:24', '2022-03-02 15:38:24'),
(7, 'Comfenalco', '2022-03-02 15:38:52', '2022-03-02 15:38:52'),
(8, 'COLSANITAS', '2024-11-11 21:11:21', '2024-11-11 21:11:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_11_02_204400_create_tipo_documentos_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_11_02_204409_create_eps_table', 1),
(7, '2021_11_02_204423_create_arls_table', 1),
(8, '2021_11_02_205216_create_subjects_table', 1),
(9, '2021_11_02_205631_create_ubicacions_table', 1),
(10, '2021_11_02_212702_create_people_table', 1),
(11, '2021_11_02_212959_create_vehicles_table', 1),
(12, '2021_11_02_213031_create_drivers_table', 1),
(13, '2021_11_02_213100_create_origins_table', 1),
(14, '2021_11_02_213121_create_volquetas_table', 1),
(15, '2021_11_02_213214_create_record_minutas_table', 1),
(16, '2021_11_02_213226_create_record_vehicles_table', 1),
(17, '2021_11_02_213236_create_record_people_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_menu`
--

CREATE TABLE `opciones_menu` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` enum('ACTIVO','INACTIVO','ELIMINADO') DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origins`
--

CREATE TABLE `origins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `origins`
--

INSERT INTO `origins` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Cali', '2022-03-02 15:32:07', '2022-03-02 15:32:07'),
(2, 'PALMIRA', '2022-03-02 19:14:43', '2022-03-02 19:14:43'),
(3, 'YUMBO', '2022-03-02 19:14:48', '2022-03-02 19:14:48'),
(4, 'JAMUNDÍ', '2022-03-02 19:14:52', '2022-03-02 19:14:52'),
(9, 'PASTO', '2024-11-11 21:10:48', '2024-11-11 21:10:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `numero_documento` varchar(15) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `tipo_documento_id` bigint(20) UNSIGNED NOT NULL,
  `eps_id` bigint(20) UNSIGNED NOT NULL,
  `arl_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `people`
--

INSERT INTO `people` (`id`, `nombres`, `apellidos`, `numero_documento`, `tipo`, `tipo_documento_id`, `eps_id`, `arl_id`, `created_at`, `updated_at`) VALUES
(1, 'Vshshu', 'Bshsjsj', '1107511110', 'VISITANTE', 1, 7, 1, '2022-03-02 15:41:03', '2022-03-02 15:41:03'),
(2, 'DavID', 'Soto', '11111111', 'VISITANTE', 1, 7, 5, '2022-05-23 15:41:58', '2022-05-23 15:41:58'),
(3, 'JOSE LUVER', 'VILLAFAÑE', '10483018', 'EMPLEADO', 1, 1, 5, '2022-04-08 01:41:55', '2022-04-08 01:41:55'),
(4, 'ANGUIE SAMIRA', 'GARCIA', '1143964686', 'VISITANTE', 1, 3, 5, '2022-04-11 20:00:19', '2022-04-11 20:00:19'),
(5, 'jose', 'casedo', '98429732', 'VISITANTE', 1, 1, 4, '2022-04-12 03:17:23', '2022-04-12 03:17:23'),
(6, 'jhonatan', 'ortiz', '1087206193', 'VISITANTE', 1, 2, 5, '2022-04-12 03:58:32', '2022-04-12 03:58:32'),
(7, 'juana paola', 'quiñone', '59657488', 'EMPLEADO', 1, 5, 1, '2022-04-12 05:03:58', '2022-04-12 05:03:58'),
(8, 'jose', 'castillo', '14236981', 'EMPLEADO', 1, 5, 5, '2022-04-12 06:01:06', '2022-04-12 06:01:06'),
(9, 'justino', 'angulo', '87594845', 'EMPLEADO', 1, 6, 5, '2022-04-12 08:04:27', '2022-04-12 08:04:27'),
(10, 'marisusana', 'landasati', '59687299', 'EMPLEADO', 1, 5, 2, '2022-04-12 08:25:13', '2022-04-12 08:25:13'),
(11, 'fransico', 'seviyano', '8790084', 'VISITANTE', 1, 4, 5, '2022-04-14 17:35:56', '2022-04-14 17:35:56'),
(12, 'mari', 'cavesa', '59687128', 'VISITANTE', 1, 5, 5, '2022-04-14 18:14:32', '2022-04-14 18:14:32'),
(13, 'edinson', 'ganboa', '10381721', 'EMPLEADO', 1, 3, 4, '2022-04-14 18:35:52', '2022-04-14 18:35:52'),
(14, 'carlo', 'mesa', '87943709', 'EMPLEADO', 1, 6, 5, '2022-04-15 00:36:43', '2022-04-15 00:36:43'),
(15, 'Hector', 'posso', '16834465', 'VISITANTE', 1, 4, 5, '2022-04-16 03:12:33', '2022-04-16 03:12:33'),
(16, 'jhon jairo', 'legarda', '77491627', 'EMPLEADO', 1, 1, 5, '2022-04-18 18:03:04', '2022-04-18 18:03:04'),
(17, 'jaider', 'rosero', '87946709', 'VISITANTE', 1, 1, 4, '2022-04-19 22:04:09', '2022-04-19 22:04:09'),
(18, 'Jaminton', 'Quiñones', '1004636382', 'VISITANTE', 1, 1, 4, '2022-04-19 22:06:05', '2022-04-19 22:06:05'),
(19, 'Franky', 'Cuero', '1087192630', 'VISITANTE', 1, 6, 4, '2022-04-19 22:07:55', '2022-04-19 22:07:55'),
(20, 'Jorge', 'Carabali', '1087188106', 'VISITANTE', 1, 1, 4, '2022-04-19 22:09:53', '2022-04-19 22:09:53'),
(21, 'leonardo', 'Cabezas Malaba', '1087781152', 'VISITANTE', 1, 2, 4, '2022-04-19 22:11:48', '2022-04-19 22:11:48'),
(22, 'jorge', 'carabali', '1087186106', 'VISITANTE', 1, 1, 4, '2022-04-19 22:23:15', '2022-04-19 22:23:15'),
(23, 'alexander', 'montaño', '1111775189', 'EMPLEADO', 1, 1, 7, '2022-04-21 04:16:24', '2022-04-21 04:16:24'),
(24, 'victor', 'betancourt', '12913450', 'EMPLEADO', 1, 1, 5, '2022-04-21 04:19:23', '2022-04-21 04:19:23'),
(25, 'brayan', 'ramirez', '1057599935', 'EMPLEADO', 1, 1, 5, '2022-04-22 02:56:56', '2022-04-22 02:56:56'),
(26, 'brayan', 'ramirez', '105759913', 'EMPLEADO', 1, 1, 5, '2022-04-23 04:27:56', '2022-04-23 04:27:56'),
(27, 'marta ilene', 'meza', '59672322', 'EMPLEADO', 1, 1, 5, '2022-04-23 17:47:10', '2022-04-23 17:47:10'),
(28, 'ELKIN JULIAN', 'MAYOR DOMO', '1015434564', 'VISITANTE', 1, 1, 2, '2022-04-24 20:04:25', '2022-04-24 20:04:25'),
(29, 'jAIME', 'ASERO', '91011690', 'VISITANTE', 1, 6, 2, '2022-04-24 20:07:58', '2022-04-24 20:07:58'),
(30, 'jaimen', 'acero', '9101169', 'VISITANTE', 1, 4, 2, '2022-04-25 16:00:09', '2022-04-25 16:00:09'),
(31, 'carmen', 'ordoñez', '59794977', 'VISITANTE', 1, 1, 5, '2022-04-25 17:47:11', '2022-04-25 17:47:11'),
(32, 'alesander', 'montaño', '1111765189', 'VISITANTE', 1, 1, 7, '2022-04-25 18:58:20', '2022-04-25 18:58:20'),
(33, 'elkin', 'rincon', '1004640610', 'EMPLEADO', 1, 1, 5, '2022-04-26 20:43:00', '2022-04-26 20:43:00'),
(34, 'jarol', 'oscar', '10871999880', 'EMPLEADO', 1, 1, 5, '2022-04-26 20:47:54', '2022-04-26 20:47:54'),
(35, 'alberto', 'liodar', '10871998', 'EMPLEADO', 1, 1, 4, '2022-04-26 20:52:34', '2022-04-26 20:52:34'),
(36, 'guiyermo', 'paneso', '1087201843', 'EMPLEADO', 1, 1, 5, '2022-04-26 20:55:49', '2022-04-26 20:55:49'),
(37, 'ronal', 'risco', '1087199980', 'EMPLEADO', 1, 1, 5, '2022-04-26 23:22:10', '2022-04-26 23:22:10'),
(38, 'luis', 'potia', '12545010', 'VISITANTE', 1, 1, 5, '2022-04-27 01:21:36', '2022-04-27 01:21:36'),
(39, 'juan', 'peda', '1298324', 'VISITANTE', 1, 1, 5, '2022-04-27 01:25:57', '2022-04-27 01:25:57'),
(40, 'montero', 'jeser', '87571621', 'VISITANTE', 1, 1, 5, '2022-04-27 01:32:29', '2022-04-27 01:32:29'),
(41, 'lus marina', 'uribe', '59673996', 'VISITANTE', 1, 1, 5, '2022-04-27 02:11:08', '2022-04-27 02:11:08'),
(42, 'mayo', 'mauricio', '105934604', 'VISITANTE', 1, 2, 5, '2022-04-27 20:53:44', '2022-04-27 20:53:44'),
(43, 'brayan', 'ramires', '10544935', 'VISITANTE', 1, 1, 5, '2022-04-28 06:19:00', '2022-04-28 06:19:00'),
(44, 'brayan', 'ramire', '1067599935', 'EMPLEADO', 1, 1, 5, '2022-04-29 04:09:17', '2022-04-29 04:09:17'),
(45, 'jose gillermo', 'paneso', '1087201845', 'VISITANTE', 1, 3, 5, '2022-04-29 18:04:09', '2022-04-29 18:04:09'),
(46, 'daiwer', 'seviyano', '87942121', 'VISITANTE', 1, 1, 5, '2022-05-01 01:20:26', '2022-05-01 01:20:26'),
(47, 'jenri', 'peralta', '12916768', 'EMPLEADO', 1, 1, 5, '2022-05-02 23:23:35', '2022-05-02 23:23:35'),
(48, 'luiscano', 'ronal', '109208298', 'EMPLEADO', 1, 2, 5, '2022-05-03 23:20:18', '2022-05-03 23:20:18'),
(49, 'orlin', 'ortiz', '13053898', 'VISITANTE', 1, 1, 5, '2022-05-04 17:59:34', '2022-05-04 17:59:34'),
(50, 'alexander', 'montaño', '1111765789', 'EMPLEADO', 1, 1, 7, '2022-05-05 18:16:39', '2022-05-05 18:16:39'),
(51, 'brayan', 'ramirez', '0157599935', 'EMPLEADO', 1, 1, 5, '2022-05-08 19:29:27', '2022-05-08 19:29:27'),
(52, 'patricia', 'castro', '27403119', 'EMPLEADO', 1, 7, 5, '2022-05-09 17:27:46', '2022-05-09 17:27:46'),
(53, 'wilfran', 'biojo', '13056190', 'VISITANTE', 1, 3, 5, '2022-05-10 20:14:39', '2022-05-10 20:14:39'),
(54, 'luz marina', 'uribe', '5967399', 'VISITANTE', 1, 1, 5, '2022-05-13 04:27:57', '2022-05-13 04:27:57'),
(55, 'wuilian', 'mera', '76041128', 'VISITANTE', 1, 1, 5, '2022-05-14 03:37:37', '2022-05-14 03:37:37'),
(56, 'neison', 'trejos', '12919265', 'VISITANTE', 1, 1, 5, '2022-05-14 03:39:52', '2022-05-14 03:39:52'),
(57, 'nelson', 'flores', '12919261', 'VISITANTE', 1, 1, 5, '2022-05-14 17:59:07', '2022-05-14 17:59:07'),
(58, 'wiladia', 'mera', '2600119', 'VISITANTE', 1, 1, 5, '2022-05-14 18:15:28', '2022-05-14 18:15:28'),
(59, 'jose', 'nelson', '9099457', 'VISITANTE', 1, 1, 5, '2022-05-14 18:52:53', '2022-05-14 18:52:53'),
(60, 'jose', 'nelson', '1299497', 'VISITANTE', 1, 1, 5, '2022-05-14 19:40:17', '2022-05-14 19:40:17'),
(61, 'jairo', 'hurtado', '98429373', 'VISITANTE', 1, 3, 5, '2022-05-16 17:05:09', '2022-05-16 17:05:09'),
(62, 'samira', 'garcia', '11439646865', 'VISITANTE', 1, 1, 5, '2022-05-16 18:18:42', '2022-05-16 18:18:42'),
(63, 'julio', 'padilla', '87553336', 'VISITANTE', 1, 1, 5, '2022-05-16 20:49:26', '2022-05-16 20:49:26'),
(64, 'jampaul', 'padilla', '1004617137', 'VISITANTE', 1, 1, 5, '2022-05-16 20:50:44', '2022-05-16 20:50:44'),
(65, 'luz marina', 'uribe', '59673193', 'VISITANTE', 1, 1, 5, '2022-05-17 00:43:39', '2022-05-17 00:43:39'),
(66, 'ramiro antonio', 'sanvrano', '13055416', 'VISITANTE', 1, 1, 5, '2022-05-19 20:12:57', '2022-05-19 20:12:57'),
(67, 'wuilian', 'mera', '766041128', 'VISITANTE', 1, 1, 5, '2022-05-19 20:36:18', '2022-05-19 20:36:18'),
(68, 'alejandro', 'naranjo', '114407767', 'VISITANTE', 1, 1, 7, '2022-05-23 01:26:36', '2022-05-23 01:26:36'),
(69, 'alejandro', 'castro', '1047461226', 'VISITANTE', 1, 2, 7, '2022-05-23 04:17:05', '2022-05-23 04:17:05'),
(70, 'luz marina', 'uribe', '98573229', 'VISITANTE', 1, 1, 5, '2022-05-23 17:02:30', '2022-05-23 17:02:30'),
(71, 'alejandro', 'castro', '10474612226', 'VISITANTE', 1, 2, 7, '2022-05-24 19:47:06', '2022-05-24 19:47:06'),
(72, 'alejandro', 'naranjo', '124407767', 'VISITANTE', 1, 1, 7, '2022-05-25 00:39:23', '2022-05-25 00:39:23'),
(73, 'alejandro', 'petro', '1144076767', 'VISITANTE', 1, 1, 7, '2022-05-25 16:11:24', '2022-05-25 16:11:24'),
(74, 'victor', 'bentancurt', '12913189', 'EMPLEADO', 1, 1, 5, '2022-05-27 04:47:14', '2022-05-27 04:47:14'),
(75, 'guido', 'romo', '1082746978', 'VISITANTE', 1, 3, 3, '2022-05-27 19:18:53', '2022-05-27 19:18:53'),
(76, 'ALEXANDER', 'MONTAÑO', '1111', 'VISITANTE', 1, 1, 7, '2022-06-01 22:14:49', '2022-06-01 22:14:49'),
(77, 'renverto', 'gurvano', '12914489', 'VISITANTE', 1, 4, 5, '2022-06-02 16:30:51', '2022-06-02 16:30:51'),
(78, 'brayan', 'ramirez', '157599935', 'VISITANTE', 1, 1, 5, '2022-06-07 02:57:52', '2022-06-07 02:57:52'),
(79, 'luis', 'vela', '1030603585', 'EMPLEADO', 1, 1, 5, '2022-06-07 19:00:25', '2022-06-07 19:00:25'),
(80, 'luz marina', 'uribe', '5973996', 'EMPLEADO', 1, 1, 5, '2022-06-08 17:20:07', '2022-06-08 17:20:07'),
(81, 'diego', 'sanchez', '14326959', 'VISITANTE', 1, 2, 5, '2022-06-10 17:49:38', '2022-06-10 17:49:38'),
(82, 'kathin', 'medina baez', '1087202817', 'VISITANTE', 1, 3, 5, '2022-06-13 18:59:18', '2022-06-13 18:59:18'),
(83, 'orlin', 'ortiz', '130539898', 'EMPLEADO', 1, 1, 5, '2022-06-16 21:27:13', '2022-06-16 21:27:13'),
(84, 'darlin', 'castillo', '59683969', 'VISITANTE', 1, 1, 5, '2022-06-17 18:11:41', '2022-06-17 18:11:41'),
(85, 'hector', 'posos', '16594461', 'VISITANTE', 1, 2, 5, '2022-06-19 22:41:43', '2022-06-19 22:41:43'),
(86, 'rafael', 'padiya', '18389368', 'VISITANTE', 1, 1, 5, '2022-06-19 22:45:36', '2022-06-19 22:45:36'),
(87, 'hector', 'posos', '16594465', 'VISITANTE', 1, 2, 5, '2022-06-19 23:00:21', '2022-06-19 23:00:21'),
(88, 'hector', 'posso', '16544465', 'VISITANTE', 1, 2, 5, '2022-06-20 05:10:31', '2022-06-20 05:10:31'),
(89, 'nelson', 'trejo', '12917365', 'VISITANTE', 1, 1, 5, '2022-06-23 04:20:48', '2022-06-23 04:20:48'),
(90, 'alberto', 'arias', '16282944', 'VISITANTE', 1, 1, 1, '2022-06-24 04:21:07', '2022-06-24 04:21:07'),
(91, 'alexander', 'montaño', '1111765184', 'VISITANTE', 1, 1, 7, '2022-06-24 19:31:12', '2022-06-24 19:31:12'),
(92, 'galo', 'anpudia', '12915856', 'VISITANTE', 1, 1, 5, '2022-06-29 21:56:24', '2022-06-29 21:56:24'),
(93, 'anjel', 'castillo', '87941713', 'VISITANTE', 1, 1, 5, '2022-06-29 21:58:58', '2022-06-29 21:58:58'),
(94, 'laura sesilia', 'bolivar', '59685905', 'VISITANTE', 1, 1, 5, '2022-06-30 21:23:42', '2022-06-30 21:23:42'),
(95, 'laura', 'bolivar', '59685908', 'EMPLEADO', 1, 1, 5, '2022-07-01 17:20:40', '2022-07-01 17:20:40'),
(96, 'rafael', 'rincon', '85154995', 'VISITANTE', 1, 2, 7, '2022-07-02 05:07:59', '2022-07-02 05:07:59'),
(97, 'laura', 'bolivar', '59685968', 'VISITANTE', 1, 1, 5, '2022-07-02 05:27:14', '2022-07-02 05:27:14'),
(98, 'piafeel', 'coral', '85154495', 'VISITANTE', 1, 2, 7, '2022-07-02 18:19:06', '2022-07-02 18:19:06'),
(99, 'martin', 'ferin', '12911855', 'VISITANTE', 1, 1, 6, '2022-07-02 19:59:36', '2022-07-02 19:59:36'),
(100, 'dayon', 'lopes', '84063500', 'VISITANTE', 1, 2, 6, '2022-07-02 20:01:48', '2022-07-02 20:01:48'),
(101, 'alei', 'selin', '1305636', 'VISITANTE', 1, 1, 6, '2022-07-02 20:21:57', '2022-07-02 20:21:57'),
(102, 'YASMIN', 'rosero', '1087674431', 'VISITANTE', 1, 2, 5, '2022-07-06 02:36:01', '2022-07-06 02:36:01'),
(103, 'yasmin jimena', 'rosero', '1087647431', 'VISITANTE', 1, 1, 5, '2022-07-06 21:28:42', '2022-07-06 21:28:42'),
(104, 'luis edwar', 'hurtado', '94330860', 'VISITANTE', 1, 1, 7, '2022-07-10 03:10:25', '2022-07-10 03:10:25'),
(105, 'luis', 'hurbano', '94300860', 'VISITANTE', 1, 5, 7, '2022-07-10 06:04:12', '2022-07-10 06:04:12'),
(106, 'tulio', 'arbear', '16726130', 'EMPLEADO', 1, 1, 1, '2022-07-11 02:52:46', '2022-07-11 02:52:46'),
(107, 'tulio', 'alocar', '1672613', 'VISITANTE', 1, 5, 1, '2022-07-11 10:53:10', '2022-07-11 10:53:10'),
(108, 'tulio', 'arlocar', '1676613', 'VISITANTE', 1, 4, 1, '2022-07-11 16:27:57', '2022-07-11 16:27:57'),
(109, 'jenri', 'ospina', '94385007', 'VISITANTE', 1, 2, 5, '2022-07-11 17:24:29', '2022-07-11 17:24:29'),
(110, 'claudia milena', 'calvache', '27250979', 'VISITANTE', 1, 1, 5, '2022-07-11 17:57:54', '2022-07-11 17:57:54'),
(111, 'diego', 'sanches', '14326954', 'VISITANTE', 1, 2, 5, '2022-07-11 18:41:04', '2022-07-11 18:41:04'),
(112, 'guillermo', 'vidal estupiñan', '12911194', 'VISITANTE', 1, 1, 5, '2022-07-11 20:00:08', '2022-07-11 20:00:08'),
(113, 'juan sebastian', 'ruiz vallejo', '1130638849', 'VISITANTE', 1, 1, 5, '2022-07-11 20:04:19', '2022-07-11 20:04:19'),
(114, 'maira carolina', 'nogera cordoba', '1087192555', 'VISITANTE', 1, 1, 5, '2022-07-11 20:08:21', '2022-07-11 20:08:21'),
(115, 'jairo unberto', 'escruceria mallola', '12913090', 'VISITANTE', 1, 2, 5, '2022-07-11 20:11:29', '2022-07-11 20:11:29'),
(116, 'alexander', 'montaño', '1111165189', 'VISITANTE', 1, 1, 7, '2022-07-12 00:01:00', '2022-07-12 00:01:00'),
(117, 'juan sevastian', 'ruis vallejo', '1130636849', 'VISITANTE', 1, 1, 5, '2022-07-12 03:16:11', '2022-07-12 03:16:11'),
(118, 'victor', 'betancurt', '12913', 'VISITANTE', 1, 1, 5, '2022-07-14 04:13:02', '2022-07-14 04:13:02'),
(119, 'alexander', 'montaño', '1111765186', 'EMPLEADO', 1, 1, 7, '2022-07-14 18:20:57', '2022-07-14 18:20:57'),
(120, 'nelson', 'quijano', '12907194', 'EMPLEADO', 1, 1, 1, '2022-07-16 00:42:38', '2022-07-16 00:42:38'),
(121, 'wiber', 'alban', '98429453', 'VISITANTE', 1, 4, 5, '2022-07-20 00:52:28', '2022-07-20 00:52:28'),
(122, 'gustabo', 'valencia', '1037748999', 'VISITANTE', 1, 1, 5, '2022-07-22 00:58:00', '2022-07-22 00:58:00'),
(123, 'rafael', 'adila', '11389368', 'VISITANTE', 1, 1, 5, '2022-07-28 05:46:36', '2022-07-28 05:46:36'),
(124, 'rafael', 'aldila', '18389386', 'VISITANTE', 1, 1, 5, '2022-07-28 15:24:31', '2022-07-28 15:24:31'),
(125, 'brayan', 'ramires', '1087599935', 'EMPLEADO', 1, 1, 5, '2022-07-29 03:01:27', '2022-07-29 03:01:27'),
(126, 'rafael', 'ardila', '108389338', 'EMPLEADO', 1, 1, 5, '2022-07-29 03:03:26', '2022-07-29 03:03:26'),
(127, 'eliana', 'biberos', '1151959667', 'VISITANTE', 1, 1, 5, '2022-07-30 16:48:08', '2022-07-30 16:48:08'),
(128, 'lu seine', 'suniga', '31531709', 'VISITANTE', 1, 1, 5, '2022-07-30 16:51:29', '2022-07-30 16:51:29'),
(129, 'eliana', 'biveros', '115195966', 'VISITANTE', 1, 1, 5, '2022-07-30 18:00:03', '2022-07-30 18:00:03'),
(130, 'elkin', 'rincon', '1009640610', 'VISITANTE', 1, 2, 5, '2022-08-06 00:41:15', '2022-08-06 00:41:15'),
(131, 'valencia', 'quiñone', '1087209931', 'EMPLEADO', 1, 1, 5, '2022-08-07 17:38:35', '2022-08-07 17:38:35'),
(132, 'gabiria', 'a', '16238611', 'EMPLEADO', 1, 5, 5, '2022-08-07 17:41:57', '2022-08-07 17:41:57'),
(133, 'JOSE LUIS', 'OSPINA', '6247341', 'VISITANTE', 1, 1, 5, '2022-08-11 08:23:35', '2022-08-11 08:23:35'),
(134, 'diego', 'sanches', '14326956', 'VISITANTE', 1, 1, 5, '2022-08-11 17:16:16', '2022-08-11 17:16:16'),
(135, 'jose luis', 'ospina', '6241341', 'VISITANTE', 1, 1, 5, '2022-08-11 18:59:20', '2022-08-11 18:59:20'),
(136, 'anyela fernanda', 'potosi mora', '1082749012', 'VISITANTE', 1, 3, 5, '2022-08-11 21:02:00', '2022-08-11 21:02:00'),
(137, 'efren', 'arsiniegas', '12998757', 'VISITANTE', 1, 1, 5, '2022-08-11 21:05:40', '2022-08-11 21:05:40'),
(138, 'aldair', 'dias', '1089459743', 'VISITANTE', 1, 6, 2, '2022-08-11 21:14:24', '2022-08-11 21:14:24'),
(139, 'rafael', 'ardila', '18369368', 'EMPLEADO', 1, 1, 5, '2022-08-15 05:46:27', '2022-08-15 05:46:27'),
(140, 'jesus alverto', 'landasuri', '1087129980', 'VISITANTE', 1, 1, 5, '2022-08-18 20:53:56', '2022-08-18 20:53:56'),
(141, 'carlo daniel', 'mejia perea', '1004615705', 'VISITANTE', 1, 7, 5, '2022-08-20 01:04:53', '2022-08-20 01:04:53'),
(142, 'breiner', 'vasan', '1087127348', 'VISITANTE', 1, 1, 5, '2022-08-20 01:08:20', '2022-08-20 01:08:20'),
(143, 'rafael', 'ardila', '18399368', 'VISITANTE', 1, 1, 5, '2022-08-28 05:13:22', '2022-08-28 05:13:22'),
(144, 'hunberto', 'cardena', '16674134', 'VISITANTE', 1, 2, 7, '2022-09-01 03:24:47', '2022-09-01 03:24:47'),
(145, 'rafael', 'yura', '85154925', 'VISITANTE', 1, 2, 7, '2022-09-01 03:29:31', '2022-09-01 03:29:31'),
(146, 'josi mar', 'miranda', '1089004257', 'VISITANTE', 1, 4, 7, '2022-09-04 03:02:21', '2022-09-04 03:02:21'),
(147, 'paula', 'gonzalez', '31482031', 'VISITANTE', 1, 2, 5, '2022-09-04 03:05:48', '2022-09-04 03:05:48'),
(148, 'adriana', 'castelblanco', '38600374', 'VISITANTE', 1, 5, 7, '2022-09-05 02:58:00', '2022-09-05 02:58:00'),
(149, 'jairo', 'hurtado', '9442777', 'EMPLEADO', 1, 1, 5, '2022-09-05 17:16:18', '2022-09-05 17:16:18'),
(150, 'santiago ramires', 'dias', '13056260', 'VISITANTE', 1, 1, 2, '2022-09-09 17:48:18', '2022-09-09 17:48:18'),
(151, 'juancarlo', 'batidas', '103759118', 'VISITANTE', 1, 5, 5, '2022-09-12 18:03:58', '2022-09-12 18:03:58'),
(152, 'juan carlos', 'bastias', '1037581158', 'VISITANTE', 1, 2, 5, '2022-09-13 18:04:08', '2022-09-13 18:04:08'),
(153, 'JULIO EDISON', 'PADILLA', '87550336', 'VISITANTE', 1, 1, 5, '2022-09-21 20:12:54', '2022-09-21 20:12:54'),
(154, 'victor', 'bentancurt', '12913540', 'EMPLEADO', 1, 1, 5, '2022-09-26 17:29:11', '2022-09-26 17:29:11'),
(155, 'elkin', 'rincon', '104640610', 'VISITANTE', 1, 1, 5, '2022-10-05 01:04:07', '2022-10-05 01:04:07'),
(156, 'edinson', 'truco', '92547731', 'VISITANTE', 1, 2, 7, '2022-10-05 17:47:46', '2022-10-05 17:47:46'),
(157, 'marta', 'meza', '59672522', 'EMPLEADO', 1, 1, 4, '2022-10-06 21:07:44', '2022-10-06 21:07:44'),
(158, 'oscar', 'amal', '1002461575', 'EMPLEADO', 1, 7, 5, '2022-10-12 19:25:50', '2022-10-12 19:25:50'),
(159, 'wihow', 'aporta', '76061123', 'EMPLEADO', 1, 1, 5, '2022-10-12 19:33:48', '2022-10-12 19:33:48'),
(160, 'brus', 'rosan', '108127398', 'EMPLEADO', 1, 1, 5, '2022-10-12 19:36:35', '2022-10-12 19:36:35'),
(161, 'ruben', 'palma', '13059720', 'EMPLEADO', 1, 1, 5, '2022-10-12 19:38:07', '2022-10-12 19:38:07'),
(162, 'homar', 'trejo', '12912367', 'EMPLEADO', 1, 3, 5, '2022-10-12 19:39:54', '2022-10-12 19:39:54'),
(163, 'homar', 'trejo', '12912267', 'EMPLEADO', 1, 3, 5, '2022-10-12 19:49:26', '2022-10-12 19:49:26'),
(164, 'wilian', 'aportal', '76041127', 'EMPLEADO', 1, 1, 5, '2022-10-13 17:21:09', '2022-10-13 17:21:09'),
(165, 'ruben', 'palma', '13054720', 'EMPLEADO', 1, 1, 5, '2022-10-13 18:59:02', '2022-10-13 18:59:02'),
(166, 'darlei', 'quiñone', '1087118651', 'EMPLEADO', 1, 3, 5, '2022-10-13 19:21:21', '2022-10-13 19:21:21'),
(167, 'jeiner', 'rodrigue', '18145320', 'EMPLEADO', 1, 1, 5, '2022-10-13 19:51:08', '2022-10-13 19:51:08'),
(168, 'dader', 'quiñone', '1087118951', 'EMPLEADO', 1, 3, 5, '2022-10-14 03:22:40', '2022-10-14 03:22:40'),
(169, 'breiner', 'basan', '1087127340', 'EMPLEADO', 1, 1, 5, '2022-10-14 18:20:10', '2022-10-14 18:20:10'),
(170, 'eduber', 'rodrigue', '18145520', 'EMPLEADO', 1, 1, 5, '2022-10-14 18:30:52', '2022-10-14 18:30:52'),
(171, 'MIGUEL', 'enrique', '051196306171', 'EMPLEADO', 1, 1, 5, '2022-10-16 03:38:48', '2022-10-16 03:38:48'),
(172, 'rafael', 'ardila', '1884368', 'EMPLEADO', 1, 1, 7, '2022-10-16 03:40:49', '2022-10-16 03:40:49'),
(173, 'miguel', 'enrique', '1811963171', 'VISITANTE', 1, 1, 5, '2022-10-16 20:14:19', '2022-10-16 20:14:19'),
(174, 'rafael', 'ardila', '18384368', 'VISITANTE', 1, 1, 7, '2022-10-16 20:16:21', '2022-10-16 20:16:21'),
(175, 'DAILER', 'QUIÑONES', '108718651', 'VISITANTE', 1, 1, 5, '2022-10-19 04:06:39', '2022-10-19 04:06:39'),
(176, 'marta', 'meza', '95672322', 'EMPLEADO', 1, 1, 4, '2022-10-20 03:35:07', '2022-10-20 03:35:07'),
(177, 'dalei', 'quiñone', '108711651', 'EMPLEADO', 1, 1, 5, '2022-10-21 18:56:48', '2022-10-21 18:56:48'),
(178, 'alexander', 'montaño', '1111776189', 'VISITANTE', 1, 1, 7, '2022-10-26 18:30:06', '2022-10-26 18:30:06'),
(179, 'victor', 'bentancurt', '129134650', 'EMPLEADO', 1, 1, 5, '2022-10-26 18:31:06', '2022-10-26 18:31:06'),
(180, 'luz marina', 'uribe', '59653996', 'VISITANTE', 1, 1, 5, '2022-10-26 22:47:48', '2022-10-26 22:47:48'),
(181, 'javier', 'rodriges', '1814557', 'VISITANTE', 1, 1, 5, '2022-10-27 18:23:31', '2022-10-27 18:23:31'),
(182, 'dailer', 'quiñones', '1087118631', 'VISITANTE', 1, 1, 5, '2022-10-27 18:51:55', '2022-10-27 18:51:55'),
(183, 'DAINER', 'QUIÑONES', '1887118631', 'VISITANTE', 1, 1, 5, '2022-10-28 04:00:33', '2022-10-28 04:00:33'),
(184, 'luis miguel', 'villarreal burgos', '1085278334', 'VISITANTE', 1, 3, 4, '2022-10-28 22:05:24', '2022-10-28 22:05:24'),
(185, 'brayan', 'arevalo', '1233191008', 'VISITANTE', 1, 2, 1, '2022-10-31 18:18:24', '2022-10-31 18:18:24'),
(186, 'eduar', 'ortega', '1085313929', 'VISITANTE', 1, 2, 1, '2022-10-31 18:20:50', '2022-10-31 18:20:50'),
(187, 'NELSON', 'TREJOS', '1991920', 'VISITANTE', 1, 1, 5, '2022-11-02 19:39:40', '2022-11-02 19:39:40'),
(188, 'NELSON', 'TREJOS', '1291920', 'VISITANTE', 1, 1, 5, '2022-11-02 20:14:06', '2022-11-02 20:14:06'),
(189, 'JAIRO', 'VALENSIA', '1037480999', 'VISITANTE', 1, 1, 5, '2022-11-02 20:30:32', '2022-11-02 20:30:32'),
(190, 'CARLOS DANIEL', 'QUIJANO', '100414705', 'VISITANTE', 1, 7, 5, '2022-11-03 23:48:16', '2022-11-03 23:48:16'),
(191, 'darlei', 'quiñone', '108711865', 'EMPLEADO', 1, 1, 5, '2022-11-04 18:49:26', '2022-11-04 18:49:26'),
(192, 'carlo', 'mejia', '1004615703', 'EMPLEADO', 1, 1, 5, '2022-11-05 18:36:05', '2022-11-05 18:36:05'),
(193, 'DAILER', 'QUIÑONES', '10871118631', 'VISITANTE', 1, 1, 5, '2022-11-08 18:19:05', '2022-11-08 18:19:05'),
(194, 'DANNI', 'CORTES SANDOVAL', '14638017', 'VISITANTE', 1, 1, 7, '2022-11-09 00:12:10', '2022-11-09 00:12:10'),
(195, 'darlei', 'quiñone', '18711865', 'EMPLEADO', 1, 1, 5, '2022-11-11 18:36:58', '2022-11-11 18:36:58'),
(196, 'carlo', 'mejia', '10014615705', 'EMPLEADO', 1, 1, 5, '2022-11-11 18:51:11', '2022-11-11 18:51:11'),
(197, 'CARLOS DANIEL', 'MEJIA', '100461507', 'VISITANTE', 1, 7, 5, '2022-11-16 00:12:57', '2022-11-16 00:12:57'),
(198, 'darlei', 'quiñone', '1087118665', 'EMPLEADO', 1, 1, 5, '2022-11-17 18:36:26', '2022-11-17 18:36:26'),
(199, 'gael', 'chaves', '99620307', 'VISITANTE', 1, 1, 5, '2022-11-19 01:41:04', '2022-11-19 01:41:04'),
(200, 'alexander', 'montaño', '1111755189', 'VISITANTE', 1, 1, 7, '2022-11-25 18:17:56', '2022-11-25 18:17:56'),
(201, 'javier', 'rodrigue', '18145521', 'EMPLEADO', 1, 1, 5, '2022-11-28 18:53:23', '2022-11-28 18:53:23'),
(202, 'luis', 'biyarial', '1085248344', 'VISITANTE', 1, 6, 5, '2022-11-29 21:55:15', '2022-11-29 21:55:15'),
(203, 'sebatian', 'quiñone', '1004609281', 'EMPLEADO', 1, 4, 5, '2022-12-05 18:19:36', '2022-12-05 18:19:36'),
(204, 'diego', 'sanchez', '14326459', 'EMPLEADO', 1, 2, 5, '2022-12-05 18:24:53', '2022-12-05 18:24:53'),
(205, 'jairo', 'hurtado', '98429797', 'EMPLEADO', 1, 2, 5, '2022-12-05 18:29:12', '2022-12-05 18:29:12'),
(206, 'corlo', 'mejia', '100615705', 'EMPLEADO', 1, 1, 5, '2022-12-05 19:31:03', '2022-12-05 19:31:03'),
(207, 'wilian', 'meza', '76041121', 'EMPLEADO', 1, 1, 5, '2022-12-05 19:33:17', '2022-12-05 19:33:17'),
(208, 'calo', 'anpudia', '12915830', 'EMPLEADO', 1, 1, 5, '2022-12-05 19:35:23', '2022-12-05 19:35:23'),
(209, 'luis', 'viyarial', '1085298304', 'VISITANTE', 1, 1, 5, '2022-12-05 19:42:28', '2022-12-05 19:42:28'),
(210, 'segundo', 'hurtado', '1251945', 'VISITANTE', 1, 1, 5, '2022-12-06 17:15:56', '2022-12-06 17:15:56'),
(211, 'galo', 'ampudia', '12915850', 'VISITANTE', 1, 1, 5, '2022-12-06 19:06:13', '2022-12-06 19:06:13'),
(212, 'segundo', 'hurtado', '98428175', 'EMPLEADO', 1, 1, 5, '2022-12-10 17:05:22', '2022-12-10 17:05:22'),
(213, 'paulo', 'torre', '13056895', 'EMPLEADO', 1, 1, 5, '2022-12-11 00:36:32', '2022-12-11 00:36:32'),
(214, 'joseluver', 'viya', '1048328', 'EMPLEADO', 1, 1, 5, '2022-12-11 00:40:10', '2022-12-11 00:40:10'),
(215, 'jhony ferney', 'angulo hurtado', '1087194925', 'VISITANTE', 1, 1, 5, '2022-12-14 19:23:00', '2022-12-14 19:23:00'),
(216, 'anyela', 'mora', '10827490123', 'VISITANTE', 1, 1, 5, '2022-12-14 20:18:41', '2022-12-14 20:18:41'),
(217, 'claudia', 'calvache', '27250974', 'VISITANTE', 1, 1, 5, '2022-12-15 02:14:44', '2022-12-15 02:14:44'),
(218, 'elvin', 'sifuente', '1087123512', 'EMPLEADO', 1, 1, 5, '2022-12-15 17:58:59', '2022-12-15 17:58:59'),
(219, 'jaime', 'segovia', '1006493536', 'EMPLEADO', 1, 1, 5, '2022-12-15 18:15:49', '2022-12-15 18:15:49'),
(220, 'fernando', 'villarreal', '103710131', 'EMPLEADO', 1, 1, 5, '2022-12-17 04:19:19', '2022-12-17 04:19:19'),
(221, 'luis', 'sifunte', '108712556', 'EMPLEADO', 1, 1, 5, '2022-12-17 18:50:45', '2022-12-17 18:50:45'),
(222, 'jaime', 'segura', '1006493530', 'EMPLEADO', 1, 3, 5, '2022-12-17 19:51:34', '2022-12-17 19:51:34'),
(223, 'william', 'valencia', '1086725597', 'EMPLEADO', 1, 1, 5, '2022-12-20 18:51:23', '2022-12-20 18:51:23'),
(224, 'luz m', 'uribe', '59633996', 'VISITANTE', 1, 1, 5, '2022-12-21 01:12:14', '2022-12-21 01:12:14'),
(225, 'jaime', 'segura', '106493530', 'EMPLEADO', 1, 3, 5, '2022-12-22 18:35:23', '2022-12-22 18:35:23'),
(226, 'wilin', 'nalen', '1086225547', 'EMPLEADO', 1, 1, 5, '2022-12-22 18:38:44', '2022-12-22 18:38:44'),
(227, 'jaime', 'segura', '1060493530', 'EMPLEADO', 1, 3, 5, '2022-12-23 18:24:20', '2022-12-23 18:24:20'),
(228, 'segundo', 'hurtado', '98429376', 'VISITANTE', 1, 1, 5, '2022-12-26 17:04:14', '2022-12-26 17:04:14'),
(229, 'jaime', 'segovia', '100593530', 'EMPLEADO', 1, 1, 5, '2022-12-27 19:10:08', '2022-12-27 19:10:08'),
(230, 'alrrio', 'romero', '73076533', 'VISITANTE', 1, 5, 2, '2022-12-27 20:21:47', '2022-12-27 20:21:47'),
(231, 'oscar', 'sara', '126976787', 'VISITANTE', 1, 1, 5, '2022-12-27 20:37:41', '2022-12-27 20:37:41'),
(232, 'carlo', 'mejia', '100460705', 'EMPLEADO', 1, 1, 5, '2022-12-28 20:04:17', '2022-12-28 20:04:17'),
(233, 'ener', 'castiyo', '87941715', 'EMPLEADO', 1, 1, 5, '2022-12-28 20:06:46', '2022-12-28 20:06:46'),
(234, 'juan pablo', 'ansulo', '1193526426', 'EMPLEADO', 1, 1, 5, '2022-12-29 17:42:11', '2022-12-29 17:42:11'),
(235, 'luis', 'borja', '1082846468', 'VISITANTE', 1, 2, 7, '2023-01-02 19:30:31', '2023-01-02 19:30:31'),
(236, 'luis', 'viyarial', '1085278339', 'EMPLEADO', 1, 1, 5, '2023-01-04 01:55:04', '2023-01-04 01:55:04'),
(237, 'luis', 'borja', '108284660', 'EMPLEADO', 1, 2, 7, '2023-01-10 18:01:48', '2023-01-10 18:01:48'),
(238, 'jhonni', 'fernei', '107194925', 'EMPLEADO', 1, 1, 5, '2023-01-10 19:42:29', '2023-01-10 19:42:29'),
(239, 'an jelica', 'velez', '1107051746', 'EMPLEADO', 1, 1, 7, '2023-01-16 18:25:05', '2023-01-16 18:25:05'),
(240, 'JAVIER', 'AREVALO', '98400625', 'VISITANTE', 1, 1, 5, '2023-01-17 08:42:19', '2023-01-17 08:42:19'),
(241, 'JORGE', 'SALASAR', '1085293920', 'VISITANTE', 1, 1, 5, '2023-01-19 18:46:55', '2023-01-19 18:46:55'),
(242, 'maria j', 'mora', '1087210515', 'VISITANTE', 1, 1, 5, '2023-01-23 17:42:06', '2023-01-23 17:42:06'),
(243, 'diana', 'angolo', '1087202086', 'EMPLEADO', 1, 1, 4, '2023-01-24 17:28:47', '2023-01-24 17:28:47'),
(244, 'patricia', 'castro', '27403110', 'EMPLEADO', 1, 7, 5, '2023-01-25 01:36:01', '2023-01-25 01:36:01'),
(245, 'claudia', 'carvache', '27280920', 'EMPLEADO', 1, 1, 5, '2023-01-25 19:02:13', '2023-01-25 19:02:13'),
(246, 'julio', 'nodun', '12913350', 'VISITANTE', 1, 1, 5, '2023-01-25 20:57:29', '2023-01-25 20:57:29'),
(247, 'juan', 'refun', '12513350', 'VISITANTE', 1, 1, 5, '2023-01-25 23:43:56', '2023-01-25 23:43:56'),
(248, 'juan', 'nofue', '12515266', 'VISITANTE', 1, 1, 5, '2023-01-26 03:19:45', '2023-01-26 03:19:45'),
(249, 'claudia', 'carvache', '27280979', 'EMPLEADO', 1, 1, 5, '2023-01-26 03:25:32', '2023-01-26 03:25:32'),
(250, 'lus marina', 'urive', '596732996', 'EMPLEADO', 1, 1, 5, '2023-01-26 03:28:12', '2023-01-26 03:28:12'),
(251, 'julio', 'padiya', '87550376', 'EMPLEADO', 1, 1, 5, '2023-01-26 19:37:57', '2023-01-26 19:37:57'),
(252, 'guiyemo', 'bidal', '12911197', 'VISITANTE', 1, 1, 5, '2023-01-26 20:04:11', '2023-01-26 20:04:11'),
(253, 'julio', 'nosun', '12515356', 'VISITANTE', 1, 1, 5, '2023-01-26 20:06:07', '2023-01-26 20:06:07'),
(254, 'alberto', 'estacio', '9087110353', 'VISITANTE', 1, 3, 5, '2023-01-26 21:01:41', '2023-01-26 21:01:41'),
(255, 'juan', 'nosur', '1251915396', 'VISITANTE', 1, 1, 5, '2023-01-26 22:12:01', '2023-01-26 22:12:01'),
(256, 'SANDRA', 'COSTA', '66917031', 'VISITANTE', 1, 1, 5, '2023-01-27 18:32:46', '2023-01-27 18:32:46'),
(257, 'ERIS AL BERTO', 'ESTASIO', '1087110253', 'VISITANTE', 1, 3, 5, '2023-01-27 20:07:27', '2023-01-27 20:07:27'),
(258, 'JOSE LUIS', 'OSPINA', '247341', 'VISITANTE', 1, 1, 5, '2023-01-27 21:29:49', '2023-01-27 21:29:49'),
(259, 'JUAN CARLOS', 'BASTIDA', '1037581188', 'VISITANTE', 1, 2, 5, '2023-01-27 23:33:24', '2023-01-27 23:33:24'),
(260, 'PAULA', 'GONZALEZ', '31982031', 'VISITANTE', 1, 2, 5, '2023-01-27 23:35:47', '2023-01-27 23:35:47'),
(261, 'JULIO', 'NOGUERA', '12915396', 'VISITANTE', 1, 1, 5, '2023-01-28 01:08:04', '2023-01-28 01:08:04'),
(262, 'alberto', 'estacio', '108740153', 'EMPLEADO', 1, 1, 5, '2023-01-28 19:59:19', '2023-01-28 19:59:19'),
(263, 'VICTOR', 'ARIAS', '99300120', 'VISITANTE', 1, 1, 5, '2023-01-31 00:37:30', '2023-01-31 00:37:30'),
(264, 'angela', 'potosi', '1082744012', 'VISITANTE', 1, 1, 5, '2023-01-31 00:40:36', '2023-01-31 00:40:36'),
(265, 'LUIS', 'FERNANDO', '1030603503', 'VISITANTE', 1, 1, 5, '2023-02-01 00:11:16', '2023-02-01 00:11:16'),
(266, 'alexander', 'montaño', '111775189', 'EMPLEADO', 1, 1, 7, '2023-02-02 18:25:30', '2023-02-02 18:25:30'),
(267, 'elkin', 'rincon', '1009690610', 'EMPLEADO', 1, 1, 5, '2023-02-03 19:31:52', '2023-02-03 19:31:52'),
(268, 'luis roverto', 'diaz castillo', '7694067', 'VISITANTE', 1, 1, 5, '2023-02-07 19:21:42', '2023-02-07 19:21:42'),
(269, 'joseluis', 'quiñone', '108779170', 'EMPLEADO', 1, 1, 5, '2023-02-08 20:31:38', '2023-02-08 20:31:38'),
(270, 'aril', 'estacio', '1083110253', 'EMPLEADO', 1, 3, 5, '2023-02-08 20:44:24', '2023-02-08 20:44:24'),
(271, 'hector', 'fabio', '16787429', 'VISITANTE', 1, 1, 5, '2023-02-08 22:14:58', '2023-02-08 22:14:58'),
(272, 'aril', 'hestacio', '108311253', 'EMPLEADO', 1, 1, 5, '2023-02-09 02:26:49', '2023-02-09 02:26:49'),
(273, 'sandra', 'acosta', '56917031', 'EMPLEADO', 1, 1, 5, '2023-02-09 02:53:08', '2023-02-09 02:53:08'),
(274, 'an jela', 'potasi', '1082744612', 'EMPLEADO', 1, 3, 5, '2023-02-09 20:11:26', '2023-02-09 20:11:26'),
(275, 'kalin', 'becerra', '1087201260', 'EMPLEADO', 1, 1, 5, '2023-02-09 20:16:11', '2023-02-09 20:16:11'),
(276, 'TULIO', 'ARBEAR', '16726300', 'VISITANTE', 1, 1, 1, '2023-02-12 02:27:37', '2023-02-12 02:27:37'),
(277, 'sebastian', 'melendes', '1114830250', 'VISITANTE', 1, 3, 1, '2023-02-12 02:29:07', '2023-02-12 02:29:07'),
(278, 'GUSTAVO', 'VALENSIA', '1037480994', 'VISITANTE', 1, 1, 5, '2023-02-14 17:53:20', '2023-02-14 17:53:20'),
(279, 'CARLOS', 'MEJIA', '1004615706', 'VISITANTE', 1, 7, 5, '2023-02-14 19:31:30', '2023-02-14 19:31:30'),
(280, 'LUIS', 'VILLAREAL', '1085278304', 'VISITANTE', 1, 3, 5, '2023-02-15 03:11:04', '2023-02-15 03:11:04'),
(281, 'carlo', 'mejia', '100461572', 'EMPLEADO', 1, 1, 5, '2023-02-15 18:25:30', '2023-02-15 18:25:30'),
(282, 'cristian', 'cuayun', '1086303342', 'EMPLEADO', 1, 1, 5, '2023-02-15 19:32:04', '2023-02-15 19:32:04'),
(283, 'ever', 'estacio', '1037110253', 'EMPLEADO', 1, 1, 5, '2023-02-15 20:04:42', '2023-02-15 20:04:42'),
(284, 'luis', 'viyarial', '1085298354', 'EMPLEADO', 1, 1, 5, '2023-02-20 18:46:08', '2023-02-20 18:46:08'),
(285, 'juan', 'tifa', '10505215', 'EMPLEADO', 1, 1, 5, '2023-02-20 20:12:35', '2023-02-20 20:12:35'),
(286, 'sandra', 'acosta', '6691503', 'EMPLEADO', 1, 1, 5, '2023-02-22 03:22:53', '2023-02-22 03:22:53'),
(287, 'KAREN JHOANNA', 'CUESTA  PERTUZ', '1152434969', 'VISITANTE', 1, 2, 5, '2023-02-22 05:22:22', '2023-02-22 05:22:22'),
(288, 'angelica', 'veles', '110705174', 'VISITANTE', 1, 1, 5, '2023-02-22 16:52:03', '2023-02-22 16:52:03'),
(289, 'SANDRA', 'ACOSTE', '66217031', 'VISITANTE', 1, 1, 5, '2023-02-24 18:31:17', '2023-02-24 18:31:17'),
(290, 'LUIS', 'BILLAREAL', '1085278331', 'VISITANTE', 1, 1, 5, '2023-02-24 18:44:00', '2023-02-24 18:44:00'),
(291, 'luis', 'segovia', '11971208', 'EMPLEADO', 1, 1, 5, '2023-02-28 00:53:21', '2023-02-28 00:53:21'),
(292, 'willermo', 'valensia', '1080725597', 'VISITANTE', 1, 3, 5, '2023-03-02 18:26:42', '2023-03-02 18:26:42'),
(293, 'elvic', 'sifuente', '1087125512', 'VISITANTE', 1, 1, 5, '2023-03-02 18:29:21', '2023-03-02 18:29:21'),
(294, 'luis', 'villarial', '1085298334', 'VISITANTE', 1, 3, 5, '2023-03-02 19:35:31', '2023-03-02 19:35:31'),
(295, 'jose luis', 'vanegas', '84452354', 'VISITANTE', 1, 1, 5, '2023-03-02 19:45:30', '2023-03-02 19:45:30'),
(296, 'eris', 'estasio', '108711025', 'VISITANTE', 1, 3, 5, '2023-03-03 00:38:28', '2023-03-03 00:38:28'),
(297, 'WILLERMO', 'VALENSIA', '1080785597', 'VISITANTE', 1, 3, 5, '2023-03-03 18:30:32', '2023-03-03 18:30:32'),
(298, 'angela', 'potosi', '1082849012', 'VISITANTE', 1, 1, 5, '2023-03-06 18:01:15', '2023-03-06 18:01:15'),
(299, 'camilo', 'del castillo', '10872111108', 'VISITANTE', 1, 1, 5, '2023-03-06 18:02:46', '2023-03-06 18:02:46'),
(300, 'sandra', 'acosta', '6691703', 'VISITANTE', 1, 1, 5, '2023-03-07 03:44:41', '2023-03-07 03:44:41'),
(301, 'patricia', 'castro', '27403129', 'VISITANTE', 1, 1, 5, '2023-03-07 16:55:12', '2023-03-07 16:55:12'),
(302, 'wuilian', 'valensia', '1086785597', 'VISITANTE', 1, 1, 5, '2023-03-08 18:23:05', '2023-03-08 18:23:05'),
(303, 'DIEGO', 'SANCHEZ', '14326254', 'VISITANTE', 1, 2, 5, '2023-03-08 21:15:38', '2023-03-08 21:15:38'),
(304, 'WILIAN', 'VALENSIA', '1086725598', 'VISITANTE', 1, 3, 5, '2023-03-09 18:19:57', '2023-03-09 18:19:57'),
(305, 'WILSON', 'ERASO', '87511055', 'VISITANTE', 1, 1, 5, '2023-03-09 19:11:27', '2023-03-09 19:11:27'),
(306, 'jesus', 'ortiz', '85155057', 'VISITANTE', 1, 1, 5, '2023-03-10 04:01:11', '2023-03-10 04:01:11'),
(307, 'CLAUDIA', 'CARVACHE', '87280979', 'EMPLEADO', 1, 1, 5, '2023-03-10 18:00:42', '2023-03-10 18:00:42'),
(308, 'SANDRA', 'ACOSTA', '66271031', 'EMPLEADO', 1, 7, 5, '2023-03-10 18:07:28', '2023-03-10 18:07:28'),
(309, 'AUURA', 'REYE', '52265641', 'EMPLEADO', 1, 2, 5, '2023-03-10 18:11:22', '2023-03-10 18:11:22'),
(310, 'JUAN CARLO', 'RIBIIN', '103750138', 'EMPLEADO', 1, 2, 5, '2023-03-10 18:20:10', '2023-03-10 18:20:10'),
(311, 'lus marina', 'urive', '54673996', 'EMPLEADO', 1, 1, 5, '2023-03-11 01:00:04', '2023-03-11 01:00:04'),
(312, 'claudia', 'carvache', '87280997', 'EMPLEADO', 1, 1, 5, '2023-03-11 01:08:19', '2023-03-11 01:08:19'),
(313, 'jesus', 'ortiz', '85155637', 'EMPLEADO', 1, 2, 7, '2023-03-11 01:12:05', '2023-03-11 01:12:05'),
(314, 'WILIAN', 'VALENSIA', '1086725547', 'VISITANTE', 1, 6, 5, '2023-03-14 18:18:36', '2023-03-14 18:18:36'),
(315, 'wilian', 'valensia', '1086725517', 'VISITANTE', 1, 3, 5, '2023-03-21 18:05:28', '2023-03-21 18:05:28'),
(316, 'jose lionardo', 'paz', '1090451251', 'VISITANTE', 1, 2, 7, '2023-03-26 19:47:31', '2023-03-26 19:47:31'),
(317, 'wilian', 'valencia', '10867255597', 'VISITANTE', 1, 3, 5, '2023-03-27 18:54:05', '2023-03-27 18:54:05'),
(318, 'julio', 'colorado martines', '16649221', 'VISITANTE', 1, 3, 7, '2023-04-02 02:43:55', '2023-04-02 02:43:55'),
(319, 'estor ugo', 'urtado', '16587497', 'VISITANTE', 1, 1, 5, '2023-04-02 02:45:36', '2023-04-02 02:45:36'),
(320, 'ewin', 'lugo', '17690251', 'VISITANTE', 1, 1, 5, '2023-04-02 02:47:20', '2023-04-02 02:47:20'),
(321, 'diego', 'valencia', '108749338', 'EMPLEADO', 1, 1, 7, '2023-04-04 03:05:24', '2023-04-04 03:05:24'),
(322, 'LUIS', 'VILLAREAL', '108527338', 'VISITANTE', 1, 1, 5, '2023-04-13 19:23:13', '2023-04-13 19:23:13'),
(323, 'DIANA', 'ANGULO', '108720086', 'VISITANTE', 1, 1, 5, '2023-04-14 23:23:45', '2023-04-14 23:23:45'),
(324, 'elena', 'vivero', '1151954667', 'VISITANTE', 1, 1, 5, '2023-04-17 23:53:58', '2023-04-17 23:53:58'),
(325, 'juan carlos', 'bastidas', '1037581128', 'VISITANTE', 1, 1, 5, '2023-04-17 23:55:39', '2023-04-17 23:55:39'),
(326, 'samuel', 'quiñones', '1087108310', 'VISITANTE', 1, 1, 5, '2023-04-18 20:48:00', '2023-04-18 20:48:00'),
(327, 'JHONY FERNEI', 'ANGULO', '1087194225', 'VISITANTE', 1, 1, 5, '2023-04-19 17:51:58', '2023-04-19 17:51:58'),
(328, 'DANIEL', 'MACANA', '19469017', 'VISITANTE', 1, 2, 5, '2023-04-19 18:08:48', '2023-04-19 18:08:48'),
(329, 'ERIS', 'ESTACIO', '10871110253', 'VISITANTE', 1, 3, 5, '2023-04-19 23:46:01', '2023-04-19 23:46:01'),
(330, 'ERIS', 'ESTASIO', '108711023', 'VISITANTE', 1, 3, 5, '2023-04-20 01:23:42', '2023-04-20 01:23:42'),
(331, 'JUANCARLOS', 'VASTIDAS', '103758158', 'VISITANTE', 1, 1, 5, '2023-04-20 03:43:09', '2023-04-20 03:43:09'),
(332, 'daniel', 'macana', '19469011', 'VISITANTE', 1, 2, 5, '2023-04-21 02:08:09', '2023-04-21 02:08:09'),
(333, 'sandra', 'acosta', '669127031', 'EMPLEADO', 1, 1, 5, '2023-04-22 03:42:44', '2023-04-22 03:42:44'),
(334, 'juan', 'ortiz', '1214213630', 'EMPLEADO', 1, 1, 5, '2023-05-03 19:49:48', '2023-05-03 19:49:48'),
(335, 'sandra', 'acosta', '1002960318', 'VISITANTE', 1, 1, 5, '2023-05-13 00:51:49', '2023-05-13 00:51:49'),
(336, 'luz marina', 'ospina', '51673996', 'VISITANTE', 1, 1, 5, '2023-05-13 00:53:09', '2023-05-13 00:53:09'),
(337, 'CRISTIA IBAN', 'VUCHELI', '1086303543', 'VISITANTE', 1, 1, 5, '2023-05-13 18:51:32', '2023-05-13 18:51:32'),
(338, 'MILTON', 'SANVRANO', '79675384', 'VISITANTE', 1, 3, 5, '2023-05-13 18:56:52', '2023-05-13 18:56:52'),
(339, 'angela', 'potes', '108674901', 'EMPLEADO', 1, 3, 5, '2023-05-15 18:33:15', '2023-05-15 18:33:15'),
(340, 'CARLOS ALBERTO', 'SINISTERA', '1004612954', 'VISITANTE', 1, 3, 5, '2023-05-19 18:51:01', '2023-05-19 18:51:01'),
(341, 'DALMI ALFREDO', 'SANCHES', '1087120857', 'VISITANTE', 1, 3, 4, '2023-05-19 18:53:14', '2023-05-19 18:53:14'),
(342, 'DIEGO', 'SANCHEZ', '14326989', 'VISITANTE', 1, 2, 5, '2023-05-20 00:59:17', '2023-05-20 00:59:17'),
(343, 'JOSE TOMA', 'ORTIZ', '1087203073', 'VISITANTE', 1, 1, 5, '2023-05-25 17:12:56', '2023-05-25 17:12:56'),
(344, 'LUZ MARINA', 'URIBE', '5967', 'VISITANTE', 1, 1, 5, '2023-05-25 17:30:05', '2023-05-25 17:30:05'),
(345, 'CARLOS  ALBERTO', 'SINISTERA', '104612954', 'VISITANTE', 1, 3, 5, '2023-05-26 17:34:48', '2023-05-26 17:34:48'),
(346, 'NELSON', 'TREJOS', '12219261', 'VISITANTE', 1, 1, 5, '2023-05-26 19:37:10', '2023-05-26 19:37:10'),
(347, 'jose luis', 'ospina', '624734', 'VISITANTE', 1, 1, 5, '2023-06-07 17:34:30', '2023-06-07 17:34:30'),
(348, 'ERIS', 'ESTACIO', '1087110251', 'VISITANTE', 1, 3, 5, '2023-06-07 20:53:03', '2023-06-07 20:53:03'),
(349, 'diego', 'valencia', '1087119333', 'EMPLEADO', 1, 2, 5, '2023-06-19 23:28:31', '2023-06-19 23:28:31'),
(350, 'Diana morales', 'arias', '40046567', 'VISITANTE', 2, 2, 5, '2023-06-20 01:26:18', '2023-06-20 01:26:18'),
(351, 'carlo', 'jaramillo', '71688138', 'VISITANTE', 1, 6, 7, '2023-06-22 04:29:02', '2023-06-22 04:29:02'),
(352, 'edgar', 'varga', '77565713', 'VISITANTE', 1, 6, 7, '2023-06-22 04:33:34', '2023-06-22 04:33:34'),
(353, 'herry', 'peralta', '12986768', 'EMPLEADO', 1, 1, 5, '2023-06-24 19:23:00', '2023-06-24 19:23:00'),
(354, 'DIEGO', 'VALENCIA', '1087114333', 'EMPLEADO', 1, 2, 7, '2023-06-25 00:03:54', '2023-06-25 00:03:54'),
(355, 'santiago', 'bolaños', '8028505', 'EMPLEADO', 1, 1, 5, '2023-06-26 00:30:30', '2023-06-26 00:30:30'),
(356, 'maria', 'rodrige', '59674517', 'EMPLEADO', 1, 1, 5, '2023-06-30 17:18:19', '2023-06-30 17:18:19'),
(357, 'diego', 'valencia', '108711933', 'EMPLEADO', 1, 2, 7, '2023-07-06 22:42:22', '2023-07-06 22:42:22'),
(358, 'hurtado', 'dela cruz', '984293730', 'EMPLEADO', 1, 1, 5, '2023-07-07 16:51:00', '2023-07-07 16:51:00'),
(359, 'alejandro', 'petto', '11451677', 'VISITANTE', 1, 2, 7, '2023-07-08 02:19:26', '2023-07-08 02:19:26'),
(360, 'ruben', 'palma', '13054721', 'EMPLEADO', 1, 1, 5, '2023-07-12 20:29:01', '2023-07-12 20:29:01'),
(361, 'herry', 'peralta', '12926768', 'EMPLEADO', 1, 1, 5, '2023-07-12 20:42:28', '2023-07-12 20:42:28'),
(362, 'valeria', 'ospina', '110751755', 'EMPLEADO', 1, 1, 5, '2023-07-13 22:32:41', '2023-07-13 22:32:41'),
(363, 'sandra', 'meza', '66980764', 'VISITANTE', 1, 1, 7, '2023-07-15 09:44:43', '2023-07-15 09:44:43'),
(364, 'critian', 'espiñal', '94513431', 'VISITANTE', 1, 1, 7, '2023-07-15 09:46:11', '2023-07-15 09:46:11'),
(365, 'elicer', 'palacio', '98610152', 'EMPLEADO', 1, 1, 5, '2023-07-19 21:58:20', '2023-07-19 21:58:20'),
(366, 'carlo', 'zalazar', '1087201144', 'EMPLEADO', 1, 1, 5, '2023-07-19 22:00:06', '2023-07-19 22:00:06'),
(367, 'elicer', 'palacio', '9861152', 'EMPLEADO', 1, 1, 5, '2023-07-19 22:11:01', '2023-07-19 22:11:01'),
(368, 'ANGELICA', 'VELEZ', '1107651746', 'VISITANTE', 1, 1, 7, '2023-08-01 19:20:42', '2023-08-01 19:20:42'),
(369, 'fabian', 'quiñones', '1087186822', 'EMPLEADO', 1, 1, 5, '2023-08-05 19:51:06', '2023-08-05 19:51:06'),
(370, 'jose', 'gaviria', '16228611', 'EMPLEADO', 1, 1, 5, '2023-08-05 19:52:15', '2023-08-05 19:52:15'),
(371, 'jorge', 'quiñones', '1087797715', 'EMPLEADO', 1, 1, 5, '2023-08-23 17:08:46', '2023-08-23 17:08:46'),
(372, 'herry', 'peralta', '12911768', 'EMPLEADO', 1, 1, 5, '2023-08-23 23:26:16', '2023-08-23 23:26:16'),
(373, 'martinez', 'gilverto', '1715028260', 'VISITANTE', 1, 1, 5, '2023-08-23 23:57:00', '2023-08-23 23:57:00'),
(374, 'jorge', 'quiñones', '108779715', 'EMPLEADO', 1, 1, 5, '2023-08-24 01:21:30', '2023-08-24 01:21:30'),
(375, 'juan diego duque', 'londoñe', '1053859229', 'VISITANTE', 1, 1, 7, '2023-08-24 02:45:46', '2023-08-24 02:45:46'),
(376, 'gualter', 'cabeza', '13018257', 'VISITANTE', 1, 1, 5, '2023-08-24 20:55:05', '2023-08-24 20:55:05'),
(377, 'efren montenegro', 'sanchez', '13014603', 'VISITANTE', 1, 1, 5, '2023-08-24 21:55:54', '2023-08-24 21:55:54'),
(378, 'federico', 'ledemas', '12930038', 'EMPLEADO', 1, 1, 5, '2023-08-29 17:33:43', '2023-08-29 17:33:43'),
(379, 'sergio', 'godoy', '12904160', 'EMPLEADO', 1, 1, 5, '2023-08-29 18:16:14', '2023-08-29 18:16:14'),
(380, 'hector', 'cuero', '16459291', 'EMPLEADO', 1, 1, 5, '2023-08-29 18:35:04', '2023-08-29 18:35:04'),
(381, 'luz marina', 'uribe', '59675996', 'EMPLEADO', 1, 1, 5, '2023-08-30 01:32:40', '2023-08-30 01:32:40'),
(382, 'federico', 'ledemas', '129990230', 'EMPLEADO', 1, 1, 5, '2023-08-30 17:24:53', '2023-08-30 17:24:53'),
(383, 'breine', 'bazan', '107127348', 'EMPLEADO', 1, 1, 5, '2023-09-10 18:21:40', '2023-09-10 18:21:40'),
(384, 'eduar', 'wisamano', '1087200026', 'EMPLEADO', 1, 1, 5, '2023-09-10 18:23:18', '2023-09-10 18:23:18'),
(385, 'alex', 'suare', '1015414317', 'VISITANTE', 1, 1, 5, '2023-09-24 02:14:21', '2023-09-24 02:14:21'),
(386, 'victor', 'arias', '94300120', 'EMPLEADO', 1, 1, 5, '2023-09-29 18:41:34', '2023-09-29 18:41:34'),
(387, 'jhon jairo', 'santamaria', '1087131811', 'EMPLEADO', 1, 1, 5, '2023-09-29 19:32:18', '2023-09-29 19:32:18'),
(388, 'elliana', 'vivero', '115195662', 'VISITANTE', 1, 1, 7, '2023-10-12 16:25:16', '2023-10-12 16:25:16'),
(389, 'luseine', 'zuñiga', '315317709', 'VISITANTE', 1, 1, 5, '2023-10-12 16:28:10', '2023-10-12 16:28:10'),
(390, 'elliana', 'vivero', '115954663', 'VISITANTE', 1, 1, 5, '2023-10-13 03:45:32', '2023-10-13 03:45:32'),
(391, 'elliana', 'vivero', '115199667', 'VISITANTE', 1, 1, 7, '2023-10-13 18:05:04', '2023-10-13 18:05:04'),
(392, 'eduardo', 'guisamano', '1082200026', 'EMPLEADO', 1, 1, 5, '2023-10-13 18:17:21', '2023-10-13 18:17:21'),
(393, 'breine', 'bazan', '10877127348', 'EMPLEADO', 1, 1, 5, '2023-10-13 18:24:06', '2023-10-13 18:24:06'),
(394, 'allison macia', 'correa', '1151969333', 'VISITANTE', 1, 1, 7, '2023-10-23 17:48:01', '2023-10-23 17:48:01'),
(395, 'karol vila', 'ospina', '1118309806', 'VISITANTE', 1, 2, 5, '2023-10-23 17:50:49', '2023-10-23 17:50:49'),
(396, 'herry fernando', 'ospina', '94385067', 'VISITANTE', 1, 2, 5, '2023-10-25 03:47:04', '2023-10-25 03:47:04'),
(397, 'elliana julieth', 'ospina', '115196333', 'VISITANTE', 1, 2, 5, '2023-10-25 03:50:27', '2023-10-25 03:50:27'),
(398, 'diego', 'benavide', '14328954', 'EMPLEADO', 1, 1, 7, '2023-11-03 18:25:12', '2023-11-03 18:25:12'),
(399, 'nelso', 'trejo', '12919262', 'EMPLEADO', 1, 1, 5, '2023-11-15 20:40:26', '2023-11-15 20:40:26'),
(400, 'diego', 'sanchez', '14326695', 'EMPLEADO', 1, 2, 5, '2023-11-16 17:06:11', '2023-11-16 17:06:11'),
(401, 'diego', 'sanchez', '1432695', 'EMPLEADO', 1, 2, 5, '2023-11-16 17:08:35', '2023-11-16 17:08:35'),
(402, 'diego', 'sanchez', '14326359', 'EMPLEADO', 1, 2, 5, '2023-11-18 05:11:07', '2023-11-18 05:11:07'),
(403, 'diego', 'sanchez', '14326559', 'EMPLEADO', 1, 2, 5, '2023-11-18 05:31:45', '2023-11-18 05:31:45'),
(404, 'Diego', 'sanchez', '143269959', 'VISITANTE', 1, 2, 5, '2023-11-18 16:17:04', '2023-11-18 16:17:04'),
(405, 'nelso', 'trejo', '129192645', 'EMPLEADO', 1, 1, 5, '2023-11-21 19:33:55', '2023-11-21 19:33:55'),
(406, 'nelso', 'trejo', '129192265', 'EMPLEADO', 1, 1, 5, '2023-11-21 20:37:25', '2023-11-21 20:37:25'),
(407, 'nelso', 'trejo', '129192650', 'EMPLEADO', 1, 1, 5, '2023-11-21 20:41:15', '2023-11-21 20:41:15'),
(408, 'jorge paneso', 'paneso', '1087122259', 'EMPLEADO', 1, 1, 5, '2023-11-22 20:46:28', '2023-11-22 20:46:28'),
(409, 'paula', 'gonzale', '72008833', 'VISITANTE', 1, 2, 5, '2023-11-27 17:45:45', '2023-11-27 17:45:45'),
(410, 'juan camilo', 'rebage', '31182031', 'VISITANTE', 1, 2, 5, '2023-11-27 17:47:37', '2023-11-27 17:47:37'),
(411, 'alex', 'ahazo', '94407334', 'VISITANTE', 1, 2, 7, '2023-11-27 19:38:18', '2023-11-27 19:38:18'),
(412, 'aley', 'ahazo', '94407534', 'VISITANTE', 1, 1, 5, '2023-11-27 19:53:16', '2023-11-27 19:53:16'),
(413, 'arley', 'silva', '1305631', 'VISITANTE', 1, 1, 7, '2023-11-27 20:49:39', '2023-11-27 20:49:39'),
(414, 'yriner castillio', 'castillo', '1064711998', 'VISITANTE', 1, 1, 5, '2023-11-27 20:51:33', '2023-11-27 20:51:33'),
(415, 'yeiner', 'castillo', '1064721998', 'VISITANTE', 1, 1, 5, '2023-11-27 21:25:14', '2023-11-27 21:25:14'),
(416, 'sandra', 'acosta', '66911051', 'EMPLEADO', 1, 1, 5, '2023-11-28 01:09:54', '2023-11-28 01:09:54'),
(417, 'alex', 'dhazo', '94405534', 'VISITANTE', 1, 2, 7, '2023-11-28 01:55:16', '2023-11-28 01:55:16'),
(418, 'jorge', 'paneso', '108771222559', 'EMPLEADO', 1, 1, 5, '2023-11-28 03:08:15', '2023-11-28 03:08:15'),
(419, 'jairo', 'escrucero', '12913010', 'VISITANTE', 1, 2, 7, '2023-11-28 03:39:18', '2023-11-28 03:39:18'),
(420, 'sandra', 'acosta', '66917051', 'EMPLEADO', 1, 1, 5, '2023-11-28 17:51:50', '2023-11-28 17:51:50'),
(421, 'jesus', 'ordoñez', '1087203533', 'EMPLEADO', 1, 1, 5, '2023-11-28 20:49:02', '2023-11-28 20:49:02'),
(422, 'jusus', 'ordoñez', '1087723533', 'EMPLEADO', 1, 1, 5, '2023-11-28 20:53:21', '2023-11-28 20:53:21'),
(423, 'diego', 'valencia', '1087714333', 'EMPLEADO', 1, 2, 5, '2023-11-28 21:07:25', '2023-11-28 21:07:25'),
(424, 'juan carlo', 'bastida', '1037081158', 'VISITANTE', 1, 2, 5, '2023-11-29 00:56:25', '2023-11-29 00:56:25'),
(425, 'claudia', 'calvache', '27256979', 'EMPLEADO', 1, 1, 5, '2023-12-04 23:04:40', '2023-12-04 23:04:40'),
(426, 'juan carlo', 'bastide', '10377581158', 'VISITANTE', 1, 2, 5, '2023-12-04 23:07:08', '2023-12-04 23:07:08'),
(427, 'antonio', 'zambramos', '130554160', 'EMPLEADO', 1, 1, 5, '2023-12-09 17:59:40', '2023-12-09 17:59:40'),
(428, 'julio', 'padilla', '8750336', 'EMPLEADO', 1, 1, 5, '2023-12-09 22:34:33', '2023-12-09 22:34:33'),
(429, 'jhonny ferney', 'angulo', '1089194925', 'EMPLEADO', 1, 1, 5, '2023-12-10 21:24:13', '2023-12-10 21:24:13'),
(430, 'leonel angel', 'gecolsa', '70046855', 'VISITANTE', 1, 2, 5, '2023-12-11 02:45:40', '2023-12-11 02:45:40'),
(431, 'jhon diego', 'garcia', '109878374', 'EMPLEADO', 1, 1, 5, '2023-12-15 17:29:01', '2023-12-15 17:29:01'),
(432, 'dniel', 'trego', '1082210136', 'EMPLEADO', 1, 1, 5, '2023-12-15 17:30:26', '2023-12-15 17:30:26'),
(433, 'lusz  marina', 'uribe', '59673359', 'EMPLEADO', 1, 1, 5, '2023-12-16 21:56:08', '2023-12-16 21:56:08'),
(434, 'luz marina', 'uribe', '5967359', 'EMPLEADO', 1, 1, 5, '2023-12-17 00:00:32', '2023-12-17 00:00:32'),
(435, 'jhon fredy', 'mosquera', '1130590875', 'VISITANTE', 1, 1, 7, '2023-12-27 19:57:54', '2023-12-27 19:57:54'),
(436, 'alvaro de jesu', 'rodrigue  doria', '100336961', 'VISITANTE', 1, 1, 7, '2023-12-27 20:01:47', '2023-12-27 20:01:47'),
(437, 'ufael pimentel', 'castillo', '1082846222', 'VISITANTE', 1, 1, 7, '2024-01-02 18:12:36', '2024-01-02 18:12:36'),
(438, 'sandra', 'acosta', '6691731', 'EMPLEADO', 1, 1, 5, '2024-01-09 18:12:41', '2024-01-09 18:12:41'),
(439, 'Gian franco', 'roncallo bolivar', '1140872811', 'VISITANTE', 1, 1, 7, '2024-01-09 18:59:31', '2024-01-09 18:59:31'),
(440, 'jorge paneso', 'paneso', '10877122259', 'EMPLEADO', 1, 1, 5, '2024-01-15 17:39:56', '2024-01-15 17:39:56'),
(441, 'monica concepción', 'cuellar sanchez', '63481125', 'VISITANTE', 1, 1, 2, '2024-01-21 17:07:43', '2024-01-21 17:07:43'),
(442, 'sandra', 'acosta', '66917531', 'EMPLEADO', 1, 1, 5, '2024-01-26 02:41:10', '2024-01-26 02:41:10'),
(443, 'elan', 'pava', '1144183037', 'VISITANTE', 1, 1, 7, '2024-01-31 17:44:44', '2024-01-31 17:44:44'),
(444, 'elan', 'pava', '1144183537', 'EMPLEADO', 1, 2, 7, '2024-02-01 16:53:57', '2024-02-01 16:53:57'),
(445, 'shirley', 'alvarez', '1004640365', 'EMPLEADO', 1, 1, 5, '2024-02-01 18:59:05', '2024-02-01 18:59:05'),
(446, 'juan carlo', 'bastidas', '103758118', 'VISITANTE', 1, 2, 5, '2024-02-02 16:57:35', '2024-02-02 16:57:35'),
(447, 'elan', 'pava', '1149183037', 'VISITANTE', 1, 2, 5, '2024-02-02 16:58:35', '2024-02-02 16:58:35'),
(448, 'ALVERTO', 'SANMARTIN', '18491614', 'VISITANTE', 1, 1, 5, '2024-02-05 19:21:47', '2024-02-05 19:21:47'),
(449, 'FERNANDO', 'GRUESO', '87946384', 'VISITANTE', 1, 1, 5, '2024-02-07 00:58:03', '2024-02-07 00:58:03'),
(450, 'MANUEL', 'RODRIGUEZ ORTEGA', '79353833', 'VISITANTE', 1, 1, 5, '2024-02-08 03:14:07', '2024-02-08 03:14:07'),
(451, 'silva lorena', 'gaviria garcia', '1087354955', 'VISITANTE', 1, 2, 7, '2024-02-13 17:23:24', '2024-02-13 17:23:24'),
(452, 'adnesns', 'castellano', '38660374', 'VISITANTE', 1, 2, 7, '2024-02-13 17:26:39', '2024-02-13 17:26:39'),
(453, 'CARLOS  JEOVANI', 'ANDRADAS', '12993831', 'VISITANTE', 1, 3, 5, '2024-03-08 19:26:53', '2024-03-08 19:26:53'),
(454, 'juan carlo', 'bastida', '1037531158', 'EMPLEADO', 1, 2, 5, '2024-03-20 17:35:24', '2024-03-20 17:35:24'),
(455, 'claudia', 'calvache', '27210979', 'EMPLEADO', 1, 1, 5, '2024-03-20 17:39:50', '2024-03-20 17:39:50'),
(456, 'juan carlo', 'bastidas', '1637581158', 'EMPLEADO', 1, 2, 5, '2024-03-20 22:50:01', '2024-03-20 22:50:01'),
(457, 'eliana', 'vivero', '11519596', 'EMPLEADO', 1, 1, 5, '2024-03-21 00:42:58', '2024-03-21 00:42:58'),
(458, 'MARIO FERNANDO', 'CORTEZ   QUIROZ', '1087201966', 'VISITANTE', 1, 3, 7, '2024-04-02 17:31:02', '2024-04-02 17:31:02'),
(459, 'ORLIN', 'ORTIZ', '13033848', 'VISITANTE', 1, 1, 1, '2024-04-02 18:17:54', '2024-04-02 18:17:54'),
(460, 'MARTHA', 'MESA', '596722322', 'VISITANTE', 1, 1, 5, '2024-04-08 16:40:44', '2024-04-08 16:40:44'),
(461, 'MARSELA', 'MACUASE', '1087114121', 'VISITANTE', 1, 1, 5, '2024-04-26 02:52:24', '2024-04-26 02:52:24'),
(462, 'JULIO', 'PADIYA', '87550536', 'VISITANTE', 1, 1, 5, '2024-04-27 19:19:07', '2024-04-27 19:19:07'),
(463, 'MARTHA', 'MEZA', '59672332', 'VISITANTE', 1, 1, 5, '2024-04-27 21:38:18', '2024-04-27 21:38:18'),
(464, 'ingri', 'urueña', '1143867261', 'VISITANTE', 1, 3, 5, '2024-05-01 04:17:56', '2024-05-01 04:17:56'),
(465, 'DANIEL', 'PRADO', '1017210136', 'VISITANTE', 1, 1, 5, '2024-05-07 17:53:30', '2024-05-07 17:53:30'),
(466, 'DANIEL', 'MURILLO', '87942003', 'VISITANTE', 1, 1, 5, '2024-05-08 17:38:19', '2024-05-08 17:38:19');
INSERT INTO `people` (`id`, `nombres`, `apellidos`, `numero_documento`, `tipo`, `tipo_documento_id`, `eps_id`, `arl_id`, `created_at`, `updated_at`) VALUES
(467, 'ANDRES', 'BALENTA', '108785842', 'VISITANTE', 1, 4, 5, '2024-05-15 00:36:47', '2024-05-15 00:36:47'),
(468, 'duvan', 'valencia', '1087191892', 'VISITANTE', 1, 1, 5, '2024-05-19 21:20:19', '2024-05-19 21:20:19'),
(469, 'ronaldo', 'quñones', '10877114862', 'VISITANTE', 1, 3, 5, '2024-05-21 19:22:37', '2024-05-21 19:22:37'),
(470, 'JAIRO', 'URTADO', '94429372', 'VISITANTE', 1, 1, 5, '2024-05-31 17:14:12', '2024-05-31 17:14:12'),
(471, 'ANJELICA', 'VELEZ', '1107052746', 'VISITANTE', 1, 1, 7, '2024-06-11 18:15:53', '2024-06-11 18:15:53'),
(472, 'DIANY', 'BELEZ', '1087121344', 'VISITANTE', 1, 1, 5, '2024-06-11 18:26:39', '2024-06-11 18:26:39'),
(473, 'MARIO FERNANDO', 'CORTEZ', '1087107966', 'VISITANTE', 1, 3, 7, '2024-06-12 18:08:29', '2024-06-12 18:08:29'),
(474, 'ELSI  CARLINA', 'CORTEZ', '59671956', 'VISITANTE', 1, 1, 7, '2024-07-05 17:55:23', '2024-07-05 17:55:23'),
(475, 'MARIO FERNANDO', 'CORTEZ', '1087101966', 'VISITANTE', 1, 6, 7, '2024-07-05 17:57:19', '2024-07-05 17:57:19'),
(476, 'YINA', 'AROYO', '59674686', 'VISITANTE', 1, 1, 5, '2024-07-05 19:56:05', '2024-07-05 19:56:05'),
(477, 'DUBAN', 'GODOI', '1087111892', 'VISITANTE', 1, 3, 5, '2024-07-05 23:16:51', '2024-07-05 23:16:51'),
(478, 'ELSI', 'CARLINA', '59671959', 'VISITANTE', 1, 1, 7, '2024-07-06 18:02:17', '2024-07-06 18:02:17'),
(479, 'ALEJANDRO', 'REITON', '98356478', 'VISITANTE', 1, 1, 7, '2024-07-24 19:09:00', '2024-07-24 19:09:00'),
(480, 'CRISTIAN ESTEBAN', 'ANGULO', '1087122656', 'VISITANTE', 1, 1, 7, '2024-07-24 19:11:50', '2024-07-24 19:11:50'),
(481, 'REINALDO', 'QUIÑONES', '1087114862', 'VISITANTE', 1, 3, 5, '2024-08-10 20:12:15', '2024-08-10 20:12:15'),
(482, 'LUIS', 'SAMORA', '10333818298', 'VISITANTE', 1, 2, 7, '2024-08-17 17:19:40', '2024-08-17 17:19:40'),
(483, 'JHON DIEGO', 'YALLOS', '1098783742', 'VISITANTE', 1, 1, 5, '2024-08-17 18:30:26', '2024-08-17 18:30:26'),
(484, 'DANIEL', 'TREJOS', '1087210136', 'VISITANTE', 1, 1, 5, '2024-08-17 18:32:11', '2024-08-17 18:32:11'),
(485, 'CARLOS MIGUEL', 'TEJADA', '1087793843', 'VISITANTE', 1, 3, 5, '2024-08-17 18:43:07', '2024-08-17 18:43:07'),
(486, 'jhon', 'loboa', '16764517', 'VISITANTE', 1, 2, 2, '2024-08-24 00:31:00', '2024-08-24 00:31:00'),
(487, 'yamile', 'perez roya', '63343047', 'VISITANTE', 1, 5, 5, '2024-08-26 04:43:59', '2024-08-26 04:43:59'),
(488, 'DARWUI', 'MOSQUERA', '1087125544', 'VISITANTE', 1, 1, 5, '2024-09-03 17:47:27', '2024-09-03 17:47:27'),
(489, 'JOSE WUILIAN', 'MONTAÑO ANGULO', '13053730', 'VISITANTE', 1, 1, 2, '2024-09-06 01:08:09', '2024-09-06 01:08:09'),
(490, 'YONJHAIRO', 'TOREZ', '16768424', 'VISITANTE', 1, 2, 5, '2024-09-17 17:22:52', '2024-09-17 17:22:52'),
(491, 'MARIO FERNANDO', 'CORTEZ', '1087201906', 'VISITANTE', 1, 3, 7, '2024-09-17 18:03:08', '2024-09-17 18:03:08'),
(492, 'ERICK', 'ESTACIO', '108711083', 'VISITANTE', 1, 3, 5, '2024-09-23 19:30:46', '2024-09-23 19:30:46'),
(493, 'oscar fernando', 'dias bareiro', '1144172981', 'VISITANTE', 1, 3, 4, '2024-09-26 00:06:41', '2024-09-26 00:06:41'),
(494, 'oscar fernando', 'dias', '1144172481', 'VISITANTE', 1, 3, 4, '2024-09-26 02:27:34', '2024-09-26 02:27:34'),
(495, 'hector', 'ramires', '87945616', 'VISITANTE', 1, 6, 4, '2024-10-03 18:45:34', '2024-10-03 18:45:34'),
(496, 'KAREN ANDREA', 'SOLARTE', '1151953311', 'VISITANTE', 1, 1, 7, '2024-10-07 04:40:18', '2024-10-07 04:40:18'),
(497, 'maria cristina', 'parado', '1128384466', 'VISITANTE', 1, 7, 7, '2024-10-28 02:08:48', '2024-10-28 02:08:48'),
(498, 'carlos', 'hurtado', '124578', 'EMPLEADO', 1, 8, 2, '2024-11-11 21:20:59', '2024-11-11 21:20:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'browser', '33c8c6f186e3d61008c4f6bad6deb588838c87d7ec3def20946a5eb9a3547729', '[\"*\"]', '2022-03-22 14:02:17', '2022-02-12 14:29:49', '2022-03-22 14:02:17'),
(3, 'App\\Models\\User', 2, 'browser', '96ce5112f541c3d12047ed30f90ff6fb0e19613752cbfa0dc13804e33bd1f749', '[\"*\"]', '2022-02-12 14:36:18', '2022-02-12 14:36:16', '2022-02-12 14:36:18'),
(5, 'App\\Models\\User', 4, 'browser', '2eddc4ddbdf8131394b1f3fc345384834acb59cfe6fe5d0a53a0ace01d60bd9e', '[\"*\"]', '2022-02-12 15:33:16', '2022-02-12 15:33:15', '2022-02-12 15:33:16'),
(7, 'App\\Models\\User', 1, 'browser', '94afeedf7d7877ff5f65dbaa28c1dfacb69f9ae5d291c0cc147308bb049af31f', '[\"*\"]', '2022-03-02 15:27:33', '2022-03-02 15:16:36', '2022-03-02 15:27:33'),
(10, 'App\\Models\\User', 4, 'browser', 'fa946d94421a0fbf0b7b7d70478879ee5a220164642035071426dfc2aa012701', '[\"*\"]', '2022-11-04 21:26:00', '2022-03-02 16:28:17', '2022-11-04 21:26:00'),
(12, 'App\\Models\\User', 1, 'browser', '84b000a34038feb103dcdf2ca335dd4810959e376e9b78f5584d3a1c17ad66da', '[\"*\"]', '2022-03-07 16:53:38', '2022-03-04 15:16:56', '2022-03-07 16:53:38'),
(13, 'App\\Models\\User', 1, 'browser', 'dc1a6349869bc7e954257481c64e19d10e2f1877cd9de4d29371b308687d68e2', '[\"*\"]', '2022-05-31 15:05:37', '2022-05-19 16:25:07', '2022-05-31 15:05:37'),
(14, 'App\\Models\\User', 1, 'browser', 'abe71f48d07084074a1cd085555cf55066996690b93c164af45b3f630da29841', '[\"*\"]', '2022-11-22 16:52:40', '2022-09-12 17:01:14', '2022-11-22 16:52:40'),
(15, 'App\\Models\\User', 2, 'browser', '9d9d2f2ffbdf3d78ab32811b59cef7056e013d284333a500dd54529753d1a44c', '[\"*\"]', '2022-09-12 17:02:28', '2022-09-12 17:02:27', '2022-09-12 17:02:28'),
(16, 'App\\Models\\User', 1, 'browser', 'a044ee63dc221aadea4bbcff69995f184b95cf88a3dd87eeb0bfd7930c5fdf7f', '[\"*\"]', '2024-03-12 21:03:27', '2024-03-12 21:03:27', '2024-03-12 21:03:27'),
(17, 'App\\Models\\User', 5, 'browser', 'a1b1f466269bbffe56542f4965709bef5f2bc4a0aff2f14e7ad66cab8a1992b9', '[\"*\"]', '2024-11-11 19:59:51', '2024-11-11 19:59:50', '2024-11-11 19:59:51'),
(2021, 'App\\Models\\User', 5, 'browser', 'e54deac979a68ae7adee172f329992724f82a5b710ae8e7950e001f0ff94aac7', '[\"*\"]', '2024-11-12 23:26:29', '2024-11-12 23:26:28', '2024-11-12 23:26:29'),
(2026, 'App\\Models\\User', 5, 'browser', '096783c4956db0df8d3440a70ca45e345d45ad5ae23bf3363b9ca3e4f219b6b9', '[\"*\"]', '2024-11-22 19:13:45', '2024-11-22 19:13:44', '2024-11-22 19:13:45'),
(2027, 'App\\Models\\User', 5, 'browser', '01d4763f22feee91c28c1bfc9216b5fac53a9810b70f71dc84999ff3a2202566', '[\"*\"]', '2024-11-26 15:25:46', '2024-11-26 15:25:44', '2024-11-26 15:25:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `record_minutas`
--

CREATE TABLE `record_minutas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `anotaciones` text NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `ubicacion_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sede_id` int(11) DEFAULT NULL COMMENT 'Llave foranea a la tabla sedes',
  `audio` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Ruta de audio.',
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Ruta de video.',
  `latitud` varchar(50) DEFAULT NULL,
  `longitud` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `record_minutas`
--

INSERT INTO `record_minutas` (`id`, `anotaciones`, `foto`, `subject_id`, `ubicacion_id`, `user_id`, `created_at`, `updated_at`, `sede_id`, `audio`, `video`, `latitud`, `longitud`) VALUES
(1, 'prueba desde app de new repo', '/img/minutas/221124142040wifi domingo valle de lili.png', 1, 4, 5, '2024-11-22 19:20:40', '2024-11-22 19:20:40', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `record_people`
--

CREATE TABLE `record_people` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `destino` varchar(255) NOT NULL,
  `entrada_salida` varchar(255) NOT NULL,
  `observaciones` text NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sede_id` int(11) NOT NULL COMMENT 'Llave foranea a la tabla de sedes.',
  `audio` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Ruta de audio.',
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Ruta de video.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `record_vehicles`
--

CREATE TABLE `record_vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `observaciones` text NOT NULL,
  `entrada_salida` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `vehicle_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `origin_id` bigint(20) UNSIGNED NOT NULL,
  `volqueta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sede_id` int(11) NOT NULL COMMENT 'Llave foranea a la tabla de sedes.',
  `audio` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Ruta de audio.',
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Ruta de video.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL COMMENT 'Telefono de la sede del puesto/cliente.',
  `cliente_id` int(11) NOT NULL COMMENT 'Llave foranea a la tabla de clientes',
  `direccion` varchar(255) DEFAULT NULL,
  `estado` enum('ACTIVO','INACTIVO','ELIMINADO') DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subjects`
--

INSERT INTO `subjects` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Ingreso', '2022-03-02 15:20:55', '2022-03-02 15:20:55'),
(2, 'Salida', '2022-03-02 15:21:00', '2022-03-02 15:21:00'),
(3, 'Anotación', '2022-03-02 15:21:10', '2022-03-02 15:21:10'),
(4, 'Ingreso turno', '2022-03-02 15:24:00', '2022-03-02 15:24:00'),
(5, 'Salida turno', '2022-03-02 15:24:08', '2022-03-02 15:24:08'),
(6, 'Inventario', '2022-03-02 15:24:38', '2022-03-02 15:24:38'),
(7, 'TIPO PERSONA', '2022-05-23 20:26:15', '2022-05-23 20:26:15'),
(8, 'INGRESO PRUEBA', '2024-11-11 21:11:46', '2024-11-11 21:11:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos`
--

CREATE TABLE `tipo_documentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `documento` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_documentos`
--

INSERT INTO `tipo_documentos` (`id`, `documento`, `created_at`, `updated_at`) VALUES
(1, 'CEDULA DE CIUDADANIA', '2021-11-26 16:00:00', '2021-11-26 16:00:00'),
(2, 'CEDULA DE EXTRANJERIA', '2021-11-26 16:00:00', '2021-11-26 16:00:00'),
(3, 'PASAPORTE', '2021-11-26 16:00:00', '2021-11-26 16:00:00'),
(4, 'TARJETA IDENTIDAD', '2024-11-11 21:11:58', '2024-11-11 21:11:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacions`
--

CREATE TABLE `ubicacions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ubicacions`
--

INSERT INTO `ubicacions` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'RECEPCION 1', '2021-12-01 09:15:46', '2021-12-01 09:15:46'),
(2, 'RECEPCION 2', '2021-12-01 09:16:15', '2021-12-01 09:16:15'),
(3, 'GRESA JHENRI', '2023-03-08 21:34:28', '2023-03-08 21:34:28'),
(4, 'GRESA', '2024-02-22 15:31:49', '2024-02-22 15:31:49'),
(5, 'gresa alejandro', '2024-03-11 15:19:00', '2024-03-11 15:19:00'),
(6, 'gresa alejandro', '2024-03-11 15:19:00', '2024-03-11 15:19:00'),
(8, 'MEDIOS TECNOLOGICOS', '2021-12-01 14:15:46', '2021-12-01 14:15:46'),
(9, 'PORTERIA', '2021-12-01 14:15:46', '2021-12-01 14:15:46'),
(10, 'RECEPCION 3', '2024-11-11 21:12:14', '2024-11-11 21:12:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `telefono_uno` varchar(15) NOT NULL,
  `telefono_dos` varchar(15) DEFAULT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `tipo_documento_id` bigint(20) UNSIGNED NOT NULL,
  `estado` varchar(2) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `rol`, `fecha_nacimiento`, `direccion`, `ciudad`, `telefono_uno`, `telefono_dos`, `numero_documento`, `tipo_documento_id`, `estado`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ADMINISTRADOR', 'admin@seguridadjbs.com', NULL, '$2y$10$k2/wtZUL02rFhEMg4CpyaOvXuiyZYG/ba.JhS9bwtJRKk9Qg0LPWu', 'ADMINISTRADOR', '2004-05-05', 'PASTO 2', 'PASTO', '3124564445', '312155645', '123456', 1, '1', NULL, '2021-11-27 01:24:55', '2022-02-12 15:24:52'),
(2, 'JOSE LUIS OSPINA', 'joseospina@seguridadjbs.com', NULL, '$2y$10$NSApH.Uqnt2Z7UqHWL.BieRLGNN2tZwfO7A/e72CBRgSOtP4os74m', 'ADMINISTRATIVO', '1989-12-31', 'TUMACO', 'TUMACO', '123456', NULL, '111111111', 1, '1', NULL, '2022-02-12 14:33:28', '2022-02-12 15:33:44'),
(3, 'HENRY FERNANDO  OSPINA M', 'henryospina@seguridadjbs.com', NULL, '$2y$10$SVTSSsiTrREzg7AXQ3Poo.aPZF1h7mEv4SlDxngKo4L.Obxe5AbCu', 'ADMINISTRATIVO', '2001-01-01', 'CALI', 'CALI', '3173639130', NULL, '123456', 1, '1', NULL, '2022-02-12 14:45:43', '2022-02-12 15:33:36'),
(4, 'Registros', 'registros@seguridadjbs.com', NULL, '$2y$10$AkNZVX4.1JeLAS.gxUFRn.pBUiSSIN.0wzvZI7kakF6TVIzz8A6aq', 'REGISTROS', '2000-01-12', 'CALI', 'CALI', '123456789', NULL, '2222222', 1, '1', NULL, '2022-02-12 15:32:32', '2022-02-12 15:32:32'),
(5, 'ADMINISTRADOR2', 'oskre2193@gmail.com', NULL, '$2y$10$Z2jP6Bgz7ytfim65ip61seYFGiWAl.3d34FCf4ak8ObJFezwBDy/q', 'ADMINISTRADOR', '2003-05-05', 'PASTO 2', 'PASTO', '3124564445', '312155645', '123456', 1, '1', NULL, '2021-11-27 06:24:55', '2022-02-12 20:24:52'),
(11, 'Oscar', 'oscarerazo2110@gmail.com', NULL, '$2y$10$uLvTy.yYLuUHX9LJDl9a3.xq.NRj0qNNBxQWJ0LcYf.Fje12KwJVi', 'ADMINISTRATIVO', '1998-10-21', 'el calvario', 'pasto', '3016561915', NULL, '1085308277', 1, '1', NULL, '2024-11-11 21:05:46', '2024-11-11 21:05:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_sedes`
--

CREATE TABLE `users_sedes` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sede_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `placa` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vehicles`
--

INSERT INTO `vehicles` (`id`, `placa`, `created_at`, `updated_at`) VALUES
(1, 'Poy57d', '2022-03-02 15:33:13', '2022-03-02 15:33:13'),
(2, 'Tbb-329', '2022-02-09 00:30:24', '2022-02-09 00:30:24'),
(3, 'KIJ-95E', '2022-04-08 01:14:14', '2022-04-08 01:14:14'),
(4, 'AE-090B', '2022-04-08 01:16:56', '2022-04-08 01:16:56'),
(5, 'SDL 546', '2022-04-11 19:52:27', '2022-04-11 19:52:27'),
(6, 'sjp 539', '2022-04-12 08:53:31', '2022-04-12 08:53:31'),
(7, 'sjp', '2022-04-12 09:10:28', '2022-04-12 09:10:28'),
(8, '539', '2022-04-12 09:15:21', '2022-04-12 09:15:21'),
(9, 'suA 193', '2022-04-12 10:10:00', '2022-04-12 10:10:00'),
(10, 'SBN-844', '2022-04-14 00:30:30', '2022-04-14 00:30:30'),
(11, 'sdf45u', '2022-04-14 16:12:48', '2022-04-14 16:12:48'),
(12, 'SOW - 249', '2022-04-19 03:57:09', '2022-04-19 03:57:09'),
(13, 'ubu304', '2022-04-25 21:16:14', '2022-04-25 21:16:14'),
(14, 'Auw    273', '2022-04-27 20:43:56', '2022-04-27 20:43:56'),
(15, 'BRH952', '2022-05-14 17:43:28', '2022-05-14 17:43:28'),
(16, 'ufx 248', '2022-05-19 01:11:17', '2022-05-19 01:11:17'),
(17, 'SLY-258', '2022-05-28 03:07:13', '2022-05-28 03:07:13'),
(18, 'jmc', '2022-12-14 20:28:23', '2022-12-14 20:28:23'),
(19, 'ufx248', '2022-12-14 20:30:26', '2022-12-14 20:30:26'),
(20, 'Euw956', '2022-12-15 21:13:12', '2022-12-15 21:13:12'),
(21, 'syk934', '2022-12-27 20:24:18', '2022-12-27 20:24:18'),
(22, 'LSU998', '2023-03-08 20:54:31', '2023-03-08 20:54:31'),
(23, 'SWM-757', '2023-11-23 03:19:53', '2023-11-23 03:19:53'),
(24, 'WNR-933', '2024-11-11 21:09:55', '2024-11-11 21:09:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `volquetas`
--

CREATE TABLE `volquetas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `volquetas`
--

INSERT INTO `volquetas` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(2, 'Camión tanque', '2022-02-09 00:50:35', '2022-02-09 00:50:35'),
(3, 'Mula tanque', '2022-02-09 00:50:46', '2022-02-09 00:50:46'),
(4, 'Carro particular', '2022-02-09 00:51:09', '2022-02-09 00:51:09'),
(5, 'Motocicleta particular', '2022-02-09 00:51:29', '2022-02-09 00:51:29'),
(6, 'CAMION PRUEBA', '2024-11-11 21:11:06', '2024-11-11 21:11:06');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arls`
--
ALTER TABLE `arls`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nit_index` (`nit`);

--
-- Indices de la tabla `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opciones_menu`
--
ALTER TABLE `opciones_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `origins`
--
ALTER TABLE `origins`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `people_tipo_documento_id_foreign` (`tipo_documento_id`),
  ADD KEY `people_eps_id_foreign` (`eps_id`),
  ADD KEY `people_arl_id_foreign` (`arl_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `record_minutas`
--
ALTER TABLE `record_minutas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_minutas_ubicacion_id_foreign` (`ubicacion_id`),
  ADD KEY `record_minutas_subject_id_foreign` (`subject_id`),
  ADD KEY `record_minutas_user_id_foreign` (`user_id`),
  ADD KEY `record_minutas_sede_id_foreign` (`sede_id`);

--
-- Indices de la tabla `record_people`
--
ALTER TABLE `record_people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_people_person_id_foreign` (`person_id`),
  ADD KEY `record_people_user_id_foreign` (`user_id`),
  ADD KEY `record_people_sedes_id_foreign` (`sede_id`) USING BTREE;

--
-- Indices de la tabla `record_vehicles`
--
ALTER TABLE `record_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_vehicles_vehicle_id_foreign` (`vehicle_id`),
  ADD KEY `record_vehicles_driver_id_foreign` (`driver_id`),
  ADD KEY `record_vehicles_origin_id_foreign` (`origin_id`),
  ADD KEY `record_vehicles_volqueta_id_foreign` (`volqueta_id`),
  ADD KEY `record_vehicles_user_id_foreign` (`user_id`),
  ADD KEY `record_vehicles_sedes_id_foreign` (`sede_id`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_cliente_id_foreign` (`cliente_id`);

--
-- Indices de la tabla `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubicacions`
--
ALTER TABLE `ubicacions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_tipo_documento_id_foreign` (`tipo_documento_id`);

--
-- Indices de la tabla `users_sedes`
--
ALTER TABLE `users_sedes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_sedes_sede_id_foreign` (`sede_id`),
  ADD KEY `users_sedes_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehicles_placa_unique` (`placa`);

--
-- Indices de la tabla `volquetas`
--
ALTER TABLE `volquetas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `arls`
--
ALTER TABLE `arls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla de clientes';

--
-- AUTO_INCREMENT de la tabla `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `eps`
--
ALTER TABLE `eps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `origins`
--
ALTER TABLE `origins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `people`
--
ALTER TABLE `people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=499;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2028;

--
-- AUTO_INCREMENT de la tabla `record_minutas`
--
ALTER TABLE `record_minutas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `record_people`
--
ALTER TABLE `record_people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `record_vehicles`
--
ALTER TABLE `record_vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2902;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ubicacions`
--
ALTER TABLE `ubicacions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `users_sedes`
--
ALTER TABLE `users_sedes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `volquetas`
--
ALTER TABLE `volquetas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_arl_id_foreign` FOREIGN KEY (`arl_id`) REFERENCES `arls` (`id`),
  ADD CONSTRAINT `people_eps_id_foreign` FOREIGN KEY (`eps_id`) REFERENCES `eps` (`id`),
  ADD CONSTRAINT `people_tipo_documento_id_foreign` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documentos` (`id`);

--
-- Filtros para la tabla `record_minutas`
--
ALTER TABLE `record_minutas`
  ADD CONSTRAINT `record_minutas_sede_id_foreign` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`),
  ADD CONSTRAINT `record_minutas_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `record_minutas_ubicacion_id_foreign` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacions` (`id`),
  ADD CONSTRAINT `record_minutas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `record_people`
--
ALTER TABLE `record_people`
  ADD CONSTRAINT `record_minutas_sedes_id_foreign` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`),
  ADD CONSTRAINT `record_people_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `record_people_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `record_vehicles`
--
ALTER TABLE `record_vehicles`
  ADD CONSTRAINT `record_vehicles_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`),
  ADD CONSTRAINT `record_vehicles_origin_id_foreign` FOREIGN KEY (`origin_id`) REFERENCES `origins` (`id`),
  ADD CONSTRAINT `record_vehicles_sedes_id_foreign` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`),
  ADD CONSTRAINT `record_vehicles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `record_vehicles_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`),
  ADD CONSTRAINT `record_vehicles_volqueta_id_foreign` FOREIGN KEY (`volqueta_id`) REFERENCES `volquetas` (`id`);

--
-- Filtros para la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD CONSTRAINT `clientes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_tipo_documento_id_foreign` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documentos` (`id`);

--
-- Filtros para la tabla `users_sedes`
--
ALTER TABLE `users_sedes`
  ADD CONSTRAINT `users_sedes_sede_id_foreign` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`),
  ADD CONSTRAINT `users_sedes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
