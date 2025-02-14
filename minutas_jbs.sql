-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2024 a las 17:11:18
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
CREATE DATABASE IF NOT EXISTS `minutas_jbs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `minutas_jbs`;

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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `permisos_menu` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Contiene las opciones del menú ' CHECK (json_valid(`permisos_menu`)),
  `permisos_formulario` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Contiene las opciones multimedia' CHECK (json_valid(`permisos_formulario`)),
  `img_header` varchar(255) DEFAULT NULL COMMENT 'img para la sección de encabezado del reporte.',
  `img_footer` varchar(255) DEFAULT NULL COMMENT 'Img para el pie de página.',
  `estado` enum('ACTIVO','INACTIVO','ELIMINADO','MASTER') NOT NULL DEFAULT 'ACTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nit`, `nombre`, `email`, `created_at`, `updated_at`, `permisos_menu`, `permisos_formulario`, `img_header`, `img_footer`, `estado`) VALUES
(1, '324654656', 'exito', 'exito@gmail.com', '2024-12-06 02:10:56', '2024-12-06 02:10:56', '[{\"id\":5,\"nombre\":\"Configuraciones\"},{\"id\":4,\"nombre\":\"Reportes\"},{\"id\":6,\"nombre\":\"Usuarios\"},{\"id\":2,\"nombre\":\"Vehiculos\"},{\"id\":3,\"nombre\":\"Visitantes\"}]', '[{\"id\":3,\"nombre\":\"Adjuntar foto\"},{\"id\":1,\"nombre\":\"Grabar audio\"}]', '/img/clientes/051224211056_headerfondo.jpg', '/img/clientes/051224211056_footerimages (2).jpg', 'ACTIVO'),
(8, '3454', 'La merced', 'niño@gmail.com', '2024-12-08 16:48:27', '2024-12-08 16:48:27', '[{\"id\":6,\"nombre\":\"Usuarios\"},{\"id\":4,\"nombre\":\"Reportes\"},{\"id\":1,\"nombre\":\"Minuta\"}]', '[{\"id\":1,\"nombre\":\"Grabar audio\"}]', '/img/clientes/081224114827_headertado.jpg', '/img/clientes/081224114827_footerpruieba2.jpg', 'ACTIVO'),
(13, '1232-master', 'master', 'master@gmail.com', '2024-12-11 16:08:42', '2024-12-11 16:10:03', '[{\"id\":0,\"nombre\":\"all\"}]', '[{\"id\":0,\"nombre\":\"all\"}]', NULL, NULL, 'MASTER'),
(15, '12457863', 'Talento humano', 'talento@gmail.com', '2025-01-22 16:10:14', '2025-01-22 16:10:14', '[{\"id\":7,\"nombre\":\"Hoja De Vida\"},{\"id\":8,\"nombre\":\"Gestionar Hoja de vida\"},{\"id\":4,\"nombre\":\"Reportes\"}]', '[{\"id\":1,\"nombre\":\"Grabar audio\"},{\"id\":2,\"nombre\":\"Grabar video\"},{\"id\":3,\"nombre\":\"Adjuntar foto\"}]', NULL, NULL, 'ACTIVO');


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
-- Estructura de tabla para la tabla `hojas_de_vida`
--

CREATE TABLE `hojas_de_vida` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `informacion_general` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Contiene la información General' CHECK (json_valid(`informacion_General`)), 
  `informacion_personal` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Contiene la información personal' CHECK (json_valid(`informacion_personal`)), 
  `informacion_familiar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Contiene la información familiar' CHECK (json_valid(`informacion_familiar`)), 
  `educacion_aptitudes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Contiene la información de la educacion y aptitudes' CHECK (json_valid(`educacion_aptitudes`)), 
  `trayectoria_empresas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Contiene la información de la trayectoria en las empresas' CHECK (json_valid(`trayectoria_empresas`)), 
  `experiencia_laboral` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Contiene la información de la experiencia laboral' CHECK (json_valid(`experiencia_laboral`)), 
  `referencias_personales` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Contiene la información de las referencias personales' CHECK (json_valid(`referencias_personales`)), 
  `administracion_proceso_seleccion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Contiene la información de la administración del proceso de selección por el entrevistador' CHECK (json_valid(`administracion_proceso_seleccion`)), 
  `foto` varchar(255) DEFAULT NULL COMMENT 'Contiene la ruta de la foto del usuario de la hoja de vida minerva 1003',
  `firma` varchar(255) DEFAULT NULL COMMENT 'Contiene la ruta de la firma de la hoja de vida minerva 1003',
  `firma_autorizador` varchar(255) DEFAULT NULL COMMENT 'Contiene la ruta de la firma de contratación de la hoja de vida minerva 1003',
  `soportes` varchar(255) DEFAULT NULL COMMENT 'Contiene la ruta del pdf con todos los soportes asociado a la hoja de vida minerva 1003',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendarios`
--
CREATE TABLE `calendarios` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sede_id` bigint(20) UNSIGNED NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('APROBADO','PENDIENTE','RECHAZADO') NOT NULL DEFAULT 'APROBADO',
  `tipo` enum('TURNO','PERMISO') NOT NULL DEFAULT 'TURNO',
  `color` varchar(20) NOT NULL,
  `descripcion` varchar(255) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Estructura de tabla para la tabla `opciones_formulario`
--

CREATE TABLE `opciones_formulario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` enum('ACTIVO','INACTIVO','ELIMINADO') NOT NULL DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `opciones_formulario`
--

INSERT INTO `opciones_formulario` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Grabar audio', 'ACTIVO', '2024-12-05 17:27:49', NULL),
(2, 'Grabar video', 'ACTIVO', '2024-12-05 17:32:18', NULL),
(3, 'Adjuntar foto', 'ACTIVO', '2024-12-05 17:32:00', NULL);

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

--
-- Volcado de datos para la tabla `opciones_menu`
--

INSERT INTO `opciones_menu` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Minuta', 'ACTIVO', '2024-12-05 17:32:43', NULL),
(2, 'Vehiculos', 'ACTIVO', '2024-12-05 17:32:43', NULL),
(3, 'Visitantes', 'ACTIVO', '2024-12-05 17:33:34', NULL),
(4, 'Reportes', 'ACTIVO', '2024-12-05 17:33:34', NULL),
(5, 'Configuraciones', 'ACTIVO', '2024-12-05 17:33:34', NULL),
(6, 'Usuarios', 'ACTIVO', '2024-12-05 17:33:34', NULL);
(7, 'Turnos', 'ACTIVO', '2022-01-29 17:33:34', NULL);
(7, 'Hoja De Vida', 'ACTIVO', '2025-01-19 17:33:34', NULL),
(8, 'Gestionar Hoja de vida', 'ACTIVO', '2025-01-19 17:33:34', NULL);

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
(100, 'dayon', 'lopes', '84063500', 'VISITANTE', 1, 2, 6, '2022-07-02 20:01:48', '2022-07-02 20:01:48');

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
(2027, 'App\\Models\\User', 5, 'browser', '01d4763f22feee91c28c1bfc9216b5fac53a9810b70f71dc84999ff3a2202566', '[\"*\"]', '2024-11-26 15:25:46', '2024-11-26 15:25:44', '2024-11-26 15:25:46'),
(2028, 'App\\Models\\User', 5, 'browser', 'ba4c456bb473c5d1ca45dc995cf511efafee0f3b9b3d9a92409f9850c14d21f0', '[\"*\"]', '2024-12-02 03:08:23', '2024-12-02 02:51:38', '2024-12-02 03:08:23'),
(2029, 'App\\Models\\User', 5, 'browser', 'bd7e52e38ad31db180116e6aeb40ede662c44c2ae9d221715c0fab30c7086688', '[\"*\"]', '2024-12-02 03:27:57', '2024-12-02 03:08:58', '2024-12-02 03:27:57'),
(2030, 'App\\Models\\User', 5, 'browser', 'ff1ef373d4fad8e5266abfdf9c4286e9bfc331a088f3ffb7dd829d746acc9bc6', '[\"*\"]', '2024-12-03 12:09:07', '2024-12-03 12:09:05', '2024-12-03 12:09:07'),
(2031, 'App\\Models\\User', 5, 'browser', 'd8d35e1223c758f0c11555124873de35902dc80cfefc8bc79582ae4d67d26ca3', '[\"*\"]', '2024-12-03 17:12:27', '2024-12-03 17:12:24', '2024-12-03 17:12:27'),
(2032, 'App\\Models\\User', 5, 'browser', '8f98b6cb48ea76de714a69f044ffea53ca988a804f1080b101f421cbcfd6fd95', '[\"*\"]', '2024-12-04 03:52:15', '2024-12-04 02:54:37', '2024-12-04 03:52:15'),
(2033, 'App\\Models\\User', 5, 'browser', 'd8351c1d0fa155e5c0ab89eb59d809ecea47d28a0cebda2301587499c83eb627', '[\"*\"]', '2024-12-04 03:56:19', '2024-12-04 03:52:39', '2024-12-04 03:56:19'),
(2034, 'App\\Models\\User', 5, 'browser', 'bafa0c330498f089befa72f38e78115b813fb304a1b922410b21686c9654b5a2', '[\"*\"]', '2024-12-06 03:42:24', '2024-12-05 17:29:31', '2024-12-06 03:42:24'),
(2035, 'App\\Models\\User', 5, 'browser', 'c3e920ef674f3927cf6029dfcad890298cde71fcc98932ada21060270d3e1c76', '[\"*\"]', '2024-12-08 18:33:03', '2024-12-08 16:42:07', '2024-12-08 18:33:03'),
(2036, 'App\\Models\\User', 5, 'browser', '2364bd67bcd878eb4278e79e3cfa97a64edfdf285228549418fe4770a11bfcbc', '[\"*\"]', '2024-12-09 13:59:55', '2024-12-09 13:14:04', '2024-12-09 13:59:55'),
(2037, 'App\\Models\\User', 5, 'browser', '54aa694e6280892e45267fc75e04014ded8a0c5e9cdd949a6f6eade3134ea45b', '[\"*\"]', '2024-12-10 03:23:07', '2024-12-10 03:04:24', '2024-12-10 03:23:07'),
(2038, 'App\\Models\\User', 5, 'browser', '6200e36e57ba651d594c42be9796c387e90563d5bb6912c866afb2c2fd799ad5', '[\"*\"]', '2024-12-10 13:50:55', '2024-12-10 13:13:42', '2024-12-10 13:50:55'),
(2039, 'App\\Models\\User', 5, 'browser', '420062667d7c036ec708c5d50d7a9c787f00dbf8f88cf01ef0cea75df8b50c17', '[\"*\"]', '2024-12-10 15:00:55', '2024-12-10 13:51:15', '2024-12-10 15:00:55'),
(2040, 'App\\Models\\User', 5, 'browser', 'c41d9526f223c384019728569d7b4552c6e059fa13712adf6255ac5e137afb57', '[\"*\"]', '2024-12-10 18:18:37', '2024-12-10 15:01:32', '2024-12-10 18:18:37'),
(2084, 'App\\Models\\User', 11, 'browser', '4ffb6f896d1e6cd052fb79beb51ce9c8cd8fc6a77aa8fae53648145e74eea89d', '[\"*\"]', NULL, '2024-12-12 14:35:39', '2024-12-12 14:35:39'),
(2086, 'App\\Models\\User', 11, 'browser', '9e917d19bc05a439ee22613b3a16b33d8e74d942db5156898a0119511dbcdf7b', '[\"*\"]', NULL, '2024-12-12 14:37:05', '2024-12-12 14:37:05'),
(2088, 'App\\Models\\User', 11, 'browser', '4ffb141736457db1afd24f957ce101f8376a2a28d26c84d1e51f0497ce1ee639', '[\"*\"]', NULL, '2024-12-12 14:52:36', '2024-12-12 14:52:36'),
(2094, 'App\\Models\\User', 5, 'browser', '4e281ad914dd6f378759e791571ade0e37e3734be65f6ef3b89e9b2bdb9992e1', '[\"*\"]', '2024-12-12 15:13:31', '2024-12-12 15:09:33', '2024-12-12 15:13:31');

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
  `estado` enum('ACTIVO','INACTIVO','ELIMINADO','MASTER') DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id`, `nombre`, `telefono`, `cliente_id`, `direccion`, `estado`, `created_at`, `updated_at`) VALUES
(4, 'Merced sede 2', '34546', 8, 'cra 23', 'ACTIVO', '2024-12-09 13:54:52', '2024-12-09 13:54:52'),
(5, 'Merced sede', '35457', 8, 'cra 23', 'ACTIVO', '2024-12-10 15:43:04', '2024-12-10 15:43:04'),
(6, 'Exito sede', '45645', 1, 'cra 34', 'ACTIVO', '2024-12-10 18:19:07', '2024-12-10 18:19:07'),
(7, 'Sede master', '2314578', 13, NULL, 'MASTER', '2024-12-11 16:12:56', NULL),
(8, 'sede talento humano', NULL, 15, NULL, 'ACTIVO', '2025-01-22 16:10:36', '2025-01-22 16:10:36');


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
  `updated_at` timestamp NULL DEFAULT NULL,
  `sede_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `numero_documento` varchar(20) NOT NULL UNIQUE,
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
(2, 'ADMINISTRADOR2', 'oskre2193@gmail.com', NULL, '$2y$10$Z2jP6Bgz7ytfim65ip61seYFGiWAl.3d34FCf4ak8ObJFezwBDy/q', 'ADMINISTRADOR', '2003-05-05', 'PASTO 2', 'PASTO', '3124564445', '312155645', '1234568', 1, '1', NULL, '2021-11-27 06:24:55', '2022-02-12 20:24:52'),
(4, 'administrativo', 'administrativo@seguridadjbs.com', NULL, '$2y$10$MLV8pN6KgeKjf0sCt3DyzuNlafoMtzD9mnp8MsIMgAdM4VUVVv5V2', 'ADMINISTRATIVO', '1997-06-10', 'pasto', 'pasto', '2345346', NULL, '1231235645', 1, '1', NULL, '2025-01-22 16:12:33', '2025-01-22 16:12:33');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_sedes`
--

CREATE TABLE `users_sedes` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sede_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_sedes`
--

INSERT INTO `users_sedes` (`id`, `user_id`, `sede_id`, `created_at`, `updated_at`) VALUES
(1, 1, 7, '2024-12-11 16:50:32', NULL),
(2, 2, 7, '2024-12-11 21:46:46', NULL),
(6, 4, 8, '2025-01-22 16:12:33', '2025-01-22 16:12:33');

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
-- Indices de la tabla `calendarios`
--
ALTER TABLE `calendarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calendarios_user_id_foreign` (`user_id`);

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
-- Indices de la tabla `hojas_de_vida`
--
ALTER TABLE `hojas_de_vida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hojas_de_vida_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opciones_formulario`
--
ALTER TABLE `opciones_formulario`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `sede_sede_id_foreign` (`sede_id`);

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
-- AUTO_INCREMENT de la tabla `calendarios`
--
ALTER TABLE `calendarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla de calendarios';

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla de clientes', AUTO_INCREMENT=16;

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
-- AUTO_INCREMENT de la tabla `hojas_de_vida`
--
ALTER TABLE `hojas_de_vida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla de hojas_de_vida';

--
-- AUTO_INCREMENT de la tabla `opciones_formulario`
--
ALTER TABLE `opciones_formulario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `opciones_menu`
--
ALTER TABLE `opciones_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2095;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users_sedes`
--
ALTER TABLE `users_sedes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Filtros para la tabla `ubicacions`
--
ALTER TABLE `ubicacions`
  ADD CONSTRAINT `sede_sede_id_foreign` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_tipo_documento_id_foreign` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documentos` (`id`),
  ADD CONSTRAINT `numero_documento_unique` UNIQUE (`numero_documento`);

--
-- Filtros para la tabla `users_sedes`
--
ALTER TABLE `users_sedes`
  ADD CONSTRAINT `users_sedes_sede_id_foreign` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`),
  ADD CONSTRAINT `users_sedes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `hojas_de_vida`
--
ALTER TABLE `hojas_de_vida`
  ADD CONSTRAINT `hojas_de_vida_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `calendarios`
--
ALTER TABLE `calendarios`
  ADD CONSTRAINT `calendarios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `calendarios`
  ADD CONSTRAINT `calendarios_sede_id_foreign` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
