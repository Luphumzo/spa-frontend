-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 26, 2021 at 12:47 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_vision_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `start_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_status`
--

CREATE TABLE `leave_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_status`
--

INSERT INTO `leave_status` (`id`, `leave_status`, `created_at`) VALUES
(1, 'Pending', NULL),
(2, 'Declined', NULL),
(3, 'Approved', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_leave_status_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(6, '2016_06_01_000004_create_oauth_clients_table', 2),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('01542aecfaab7d22aa1144fe77ec0cb329ebbd8cd959a7240babfbcd28e1858c00ad6b5b49ccd223', 3, 2, NULL, '[]', 0, '2021-07-20 21:04:27', '2021-07-20 21:04:27', '2022-07-20 23:04:27'),
('020f19b59b077f94260346915de72348a5cf326eee26e158ae4b866b7be9e2be466f06b8e7402468', 3, 2, NULL, '[]', 0, '2021-07-24 22:23:43', '2021-07-24 22:23:43', '2022-07-25 00:23:43'),
('022da90832b37a859afdda6f376b41b7340c3777fe35bc12fd6917e66af8ba7aa66359d04d331c79', 3, 2, NULL, '[]', 0, '2021-07-24 22:15:19', '2021-07-24 22:15:19', '2022-07-25 00:15:19'),
('04590f796b23c7b3b98b31b3d5b2cb94b1b98f6babdc85e9866ffecf5773a07a5c95cc990590d9ce', 4, 2, NULL, '[]', 0, '2021-07-26 05:32:08', '2021-07-26 05:32:08', '2022-07-26 07:32:08'),
('0666f42a21de3a2a976be22d636f1c69526dd33736d637cf0c7f90bbdaeb2750e95c9e17c4533e1b', 3, 2, NULL, '[]', 0, '2021-07-24 22:11:48', '2021-07-24 22:11:48', '2022-07-25 00:11:48'),
('0c6d711a35e5900f615159ebac79ec63fd9f9ff684720ed94fd087cc52a0b89527ce2722a83e6460', 4, 2, NULL, '[]', 0, '2021-07-25 19:42:00', '2021-07-25 19:42:00', '2022-07-25 21:42:00'),
('1475a233ed1d6f9e57b81249bcc6a4247ccc73fe59351d378200cc66185f18caad799ad19fa9cacc', 3, 2, NULL, '[]', 0, '2021-07-25 18:34:54', '2021-07-25 18:34:54', '2022-07-25 20:34:54'),
('1c749055371810bc47fbcbd13c0440b8acb6e2620509e604404c32d528dba5bc9a66cf8b669213bd', 3, 2, NULL, '[]', 0, '2021-07-24 21:51:17', '2021-07-24 21:51:17', '2022-07-24 23:51:17'),
('1dac06db8440da4dd984b6febb7ea78429c59be2cabf97d6873a5991c9c5cff443371a63059d183a', 3, 2, NULL, '[]', 0, '2021-07-24 22:10:47', '2021-07-24 22:10:47', '2022-07-25 00:10:47'),
('2a09f18c4311530bbb142620f6c06bff2c36ff27c8423b3222ec7a20ef8e8bb5ffc188ecd72b4b27', 4, 2, NULL, '[]', 0, '2021-07-26 05:25:28', '2021-07-26 05:25:28', '2022-07-26 07:25:28'),
('3ed17f3bd022b4a6e09f61d1648afae1901b4f7bc3951ba9ccbbb1f6739e89c29452fd8a694e9553', 4, 2, NULL, '[]', 0, '2021-07-26 05:26:22', '2021-07-26 05:26:22', '2022-07-26 07:26:22'),
('45ef163afbd9e15ca5da51f325cb29b6d11dd86f69eb8699815b89d183e6efe5bcc4643fa6a15d67', 3, 2, NULL, '[]', 0, '2021-07-24 22:05:04', '2021-07-24 22:05:04', '2022-07-25 00:05:04'),
('4742d90983ca9680e9b9e010f8a4e5791ef138070fafa4dee0635f2b45022bcc546ae631b19e7c93', 6, 2, NULL, '[]', 0, '2021-07-26 10:45:23', '2021-07-26 10:45:23', '2022-07-26 12:45:23'),
('4e354601228666f575890317521a288107b72a73a6021a29ab36f0d9a556697335989e06ee48169b', 4, 2, NULL, '[]', 0, '2021-07-25 19:44:10', '2021-07-25 19:44:10', '2022-07-25 21:44:10'),
('6cbeeaefbb9849a304043a83a499e8b0e4cf7775deedcb93cd50e95ac9d0a27bf184674811530c28', 3, 2, NULL, '[]', 0, '2021-07-24 21:52:00', '2021-07-24 21:52:00', '2022-07-24 23:52:00'),
('71a8988f8aff2cbe7e1e8ea800fd0a692c313341a837dd6d98ae094c09730c78d5e77d5cbdcd6b07', 3, 2, NULL, '[]', 0, '2021-07-24 22:19:36', '2021-07-24 22:19:36', '2022-07-25 00:19:36'),
('7411c5b09ca8a1d262160e9589bef9d1a34dff920379b308ee011ae998e5460465c4b41e9258a16d', 3, 2, NULL, '[]', 0, '2021-07-24 21:59:16', '2021-07-24 21:59:16', '2022-07-24 23:59:16'),
('7a7bbca5e82e2ea33f231057ed27fd42a962cf9a0d46bae02be3eb31dc7c01ac06a822add9dce0f0', 6, 2, NULL, '[]', 0, '2021-07-26 10:42:57', '2021-07-26 10:42:57', '2022-07-26 12:42:57'),
('7d8bdb1f7c647440c4e935c41366e079a5f557296fee9a90c8284ba3d97f73a9f22f5b189adaf9f3', 3, 2, NULL, '[]', 0, '2021-07-24 21:16:27', '2021-07-24 21:16:27', '2022-07-24 23:16:27'),
('7e53dde956debc9942e7aa3254b19419b95afbe4d2ef2e44a9820bcfbd37f5215511d7b6ef35c390', 3, 2, NULL, '[]', 0, '2021-07-24 21:57:44', '2021-07-24 21:57:44', '2022-07-24 23:57:44'),
('855bd0750f43abe59b48232ce2955f1c67f03060f0222ec099a6077598fa081eb3814ae27c79a9df', 1, 2, NULL, '[]', 0, '2021-07-20 20:50:40', '2021-07-20 20:50:40', '2022-07-20 22:50:40'),
('9030273738ee31ce0163d330d0324e7886780be61ab4f2e41e0448690ed5bb726c88b5e2bf11c8e5', 3, 2, NULL, '[]', 0, '2021-07-24 22:04:13', '2021-07-24 22:04:13', '2022-07-25 00:04:13'),
('95d4f2c26d6583dab21154a3f71758c719c994327f7ddb09e71686005068253bc386429f0d1b8a9a', 3, 2, NULL, '[]', 0, '2021-07-24 22:02:32', '2021-07-24 22:02:32', '2022-07-25 00:02:32'),
('a016b8ad978fa056a413f4594ad0de0acbccff230a86108a3c262812baa892df04f4973beeeb78d1', 3, 2, NULL, '[]', 0, '2021-07-25 14:39:13', '2021-07-25 14:39:13', '2022-07-25 16:39:13'),
('a5e72ac1b68b10ca4a38438f99ce19806059a7651f65faa4e16fb7f5562ee095ea492510504d076f', 3, 2, NULL, '[]', 0, '2021-07-20 21:05:03', '2021-07-20 21:05:03', '2022-07-20 23:05:03'),
('acf3218d2397c0cec9f8a84581cc0643ca4a760637999d6688a9198be087d863739e6148f9dd622e', 5, 2, NULL, '[]', 0, '2021-07-26 04:19:23', '2021-07-26 04:19:23', '2022-07-26 06:19:23'),
('c386b9f03be90fbce8f96ee9d0adb3f8f8dec4898bb30d29a92793f4ad4f2dd7ff749979610d0d49', 1, 2, NULL, '[]', 0, '2021-07-20 20:46:45', '2021-07-20 20:46:45', '2022-07-20 22:46:45'),
('c8f571c2d075a64c5ba0e613c866583745e4bca807c8eede082b733353308d01b9eb67cbe39e293a', 3, 2, NULL, '[]', 0, '2021-07-24 22:07:17', '2021-07-24 22:07:17', '2022-07-25 00:07:17'),
('cf3f31895c62f83c550480d9f0345e5a5122bfd4298e24ce158b5982b965281d2a16d21a2180266f', 5, 2, NULL, '[]', 0, '2021-07-26 04:18:28', '2021-07-26 04:18:28', '2022-07-26 06:18:28'),
('da3b9d050272d3688f415f64febed96886130eea0f4941f9a56ecd0f458bf0b293d6a056fe1b1a45', 7, 2, NULL, '[]', 0, '2021-07-26 10:44:11', '2021-07-26 10:44:11', '2022-07-26 12:44:11'),
('e303867ac78bce6ec237002a7c0734eef022782e30adeb4575f34b3f33f2ca2caa3fd747e3ca464d', 5, 2, NULL, '[]', 0, '2021-07-26 04:17:27', '2021-07-26 04:17:27', '2022-07-26 06:17:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'dENiQcMIhxwn4kgYdvtcK0dCR6idYF4qvU5yKGpY', NULL, 'http://localhost', 1, 0, 0, '2021-07-20 17:56:04', '2021-07-20 17:56:04'),
(2, NULL, 'Laravel Password Grant Client', 'anVTsnf3GHjbZDMGyIe8FCwBdsIH2aEqA61rt8yg', 'users', 'http://localhost', 0, 1, 0, '2021-07-20 17:56:04', '2021-07-20 17:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-07-20 17:56:04', '2021-07-20 17:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('02200386b6ed46c940cc6327684e2fffa4b35be70f6f51a8ca968c23a572009c02c4209ceb37d733', '1f134674a3e368a4fdf21bab062c4a36bffe8cf0576096a6f3fd4a99ad06aea98fc6bacbc995ae9b', 0, '2022-07-24 20:04:44'),
('05d754549defa50b9887946eaf454cfb7344583aab1c331f9f5440f8f4dd7b5de49e41977d86f9f1', '82fd76ad11cfca64100f81e551c687f5119affe9a2823417035b3a69c648a0bd29a13094f49dbdcf', 0, '2022-07-22 10:04:41'),
('061f391a085fc88bc93dfeaf9ce9aee90a89370b10694f4c655d7b077b92c09af2778d9047556b1f', 'dab3039d6a2454c919f55a7e1aba20833fc9db0303afe2df617dece19efca2d2532e944d179b6acf', 0, '2022-07-25 13:56:36'),
('0854e9788dba092030730e863f3ebb48de7cb162e489684364dbb0a5bbf10ff2758ee0f64536ca7d', '3ed17f3bd022b4a6e09f61d1648afae1901b4f7bc3951ba9ccbbb1f6739e89c29452fd8a694e9553', 0, '2022-07-26 07:26:22'),
('085b433254581392b4ebace501ee69e2a3fa9121a1b6951a0943598afc330de38b1b19655256cf7b', 'ff0f71d2c6687473d97514b206aab935d3040c8a4d178768ea6f2105795e71dbb56427acfb32db36', 0, '2022-07-21 14:08:41'),
('09c056ff2aa6087bc5c38c5287e992d7304e0687517d07539dbf6e0da6c9157e7d29d885799225fb', '11a8571f7dc1f0cb4c5cb8245a87ada31cc70cc0f72f6357b0c7ca47f13c958b5a5735d70c2f593c', 0, '2022-07-21 13:44:13'),
('0a84176da6808856ab31211e87c17ad2ccbb79f811de67b62d6f87be923b3e9d51bf2f5ff28f0a0f', 'da3b9d050272d3688f415f64febed96886130eea0f4941f9a56ecd0f458bf0b293d6a056fe1b1a45', 0, '2022-07-26 12:44:11'),
('0cafabfcbf3a2e1b709d68107ec617ff9dec57ca59f00f8bfa01457daaea1853e83fd7599e2b5a58', 'bf69bde7950f8c339f0413ed2ee95838ab850b83a1fad8bb6e647fc58a27442c662bafc30858bc3c', 0, '2022-07-21 15:46:13'),
('0e98740f32d62b2865a7ea4e430b0e75a31522e2077819296b49ea0e081d871cba3ae32c92cc5dd3', '0be16a6dbadf6405eff10f359425ef125a2acdb8b0a9c9125decf656d4d56be8e1b4d3ad3c896d0c', 0, '2022-07-24 20:23:06'),
('0f07469159d629a2b7ac776cd5a65384a880da9ca4135b7b6f634c93b761e551ba4e504d9a7aaf0a', '8405cd1666f37967aca793a67fd82954376a925f0f819cb2a7f486a7df018e0d23490848744cf520', 0, '2022-07-21 11:19:03'),
('109c7f5c2e9c8a7f3da1c246e6f58f5b88aa7b42cfcc71d302189ceb1ce1ffc16d7820367cb13e54', 'd3033538a295f2738964c2354f9229afd7c077f9dbfc9437b41e06dd910ff57e52de6594764290f3', 0, '2022-07-21 10:47:33'),
('11a37cc45b9fd6af88d4f97ab185e907cb2807df011244ba85b9db7b4e07a670a4567755f25d4259', 'fdac7bcc3044195006cb94314bf100fe29d1a89163358bcf70f9b62b4377d37d26cde4c0576c159e', 0, '2022-07-25 20:58:24'),
('1251d1386b094029bf56fddf19e79f2085ecfd24ea5b967d34e841531c9dbd1526bd524b11b00589', 'd66fbde2a0fb38963c0092c8a1c2a1280c57dd80575963b26443922896029f95771e14b1fdc2c866', 0, '2022-07-21 11:13:28'),
('14d7a5f57bfaf4f8bbd7661e4d176aedcadbe5f3850fed6296ca3c2d6a816a76e9ccc20160184007', 'e79c2299bb5882bf3a801d430b4cfcefe80e901c74194d42450b17b71f59af4f76adfed00026d27c', 0, '2022-07-24 20:15:08'),
('210992f1b8a4f05affb37fd70149762b8992a740229f81add965ac12544184b03165c242dc86b506', '3b577b909949b4c9509b76d8c837c7505091393666bdb056dad7042f135405ace7cb7bb9e81b07f6', 0, '2022-07-25 14:05:16'),
('278e88013c8070d7045922746de5156f04a20327087be29dafa84eedb23d9eea583d6b74e14f4889', '15eb779099b69c0d44b2949c81183d45ea4df2eddbeb5813b3b233842df975a724ce15cc2350837a', 0, '2022-07-21 15:43:39'),
('27cb36b892816fbb3835cb89edde386ce831a08caeae97a070b168bab6aa203c662bdb5d688942d8', '3043a7e8b32f54f20070baa917023730829fdfc32fa24a32f71ffdd6b6b0a872347e36051767cb93', 0, '2022-07-25 13:40:28'),
('2bb0b1139d50301b8851cd280f07c5c2b5f972a3774b1ab3bf172398ea09f8c5ad5daa26412be673', 'ef7c940233bec36670ce996a7092ec46255c14127fb0c1ceca1be0ccc59e84c0c031ba9b32d6b3ce', 0, '2022-07-21 14:08:44'),
('2e44ff1a2ccb175149dde0cf7161f8b5b7a37277bf716479becb35a1386ef58e0b0ea3be9ee3fc31', '1c749055371810bc47fbcbd13c0440b8acb6e2620509e604404c32d528dba5bc9a66cf8b669213bd', 0, '2022-07-24 23:51:17'),
('300d6012620988172294af642bf39a8e31cfb83eec4046f6a2c2a664cc48939c3304600b6264c0a9', '20166893ca490622a624a579d54ec26db2fb32b94ce4af4104bcc9ae16420a2b0811b95a82df5f5b', 0, '2022-07-25 21:32:02'),
('33d4e045c90fa98359fb57cd03f3071bcde97ff2420794d30594f810b4703ee486215d7500034809', 'c065a4cf6ef5379abd66dcf27444e3ef9d21003a31a8d4ba194f086df2f71a254d0645af8c6ef83f', 0, '2022-07-25 16:38:37'),
('389d587dfda5ffd2b2f6e16770daf57c48013d25f3d4c49103a2bb59db1ca84c9c055a508f2a84a8', '4e30b718ebf4806448a9078cc3a44eab6504f2fc7ee3db1a2de90dc4dc9bed6f6012a0c39cc86a42', 0, '2022-07-21 10:54:22'),
('3c1f4ace0eee4fdd4b7a88bc07c574b70eb7e99540539c19b390e56915b2fa7afc30b3b124b67cc3', '6ecc22ca0d5cbd073a8c71ae834971bb15d915219f6689cca48f51c6e3dd370a2f7b9933da8342aa', 0, '2022-07-24 20:14:33'),
('3ca557ee827ff27f3716a7048156ffa9b6f1838af9b72aca85b94608d07225f5cf0ad87d127e7e14', 'f2bcc8cf401305a4e1447a8e5478195e916af97a2cce345ab1754dc262066aae186335de0f3595e3', 0, '2022-07-21 09:18:01'),
('3d0e1ce0b2a9649d3d11626aadd37943abf58ffbd5c8ff282730f38ac8def92016ebd54b59cd71e2', '45ef163afbd9e15ca5da51f325cb29b6d11dd86f69eb8699815b89d183e6efe5bcc4643fa6a15d67', 0, '2022-07-25 00:05:04'),
('3ec4ecc8d232fc296d3a2e7cdd817782cf9cef0e110b8f36e4c96069f5f0eb12bdcccc0fae5cb134', '796e335193deaec8147d83fcae85d4a584d904ba6034c275bcc1bfb0d0798cc7638ef7c891d971cf', 0, '2022-07-21 08:57:33'),
('451ef80815132fda406d9a83a1aab30f7d6ab6c23d8767431d6f3bc922d45c08c90ca4678fc6dabe', '95d4f2c26d6583dab21154a3f71758c719c994327f7ddb09e71686005068253bc386429f0d1b8a9a', 0, '2022-07-25 00:02:32'),
('48127d05ec93e5035e87858d008c9fe68ff0cfa4905c31e8cdfaa9f40750e5a45035e77925335c7b', 'c7e83dce1ead20eae354c6d39fb52746fa1978661f4c3e83f806f6cee70f9b634602a62f844f032c', 0, '2022-07-24 20:05:21'),
('48ed83d5b9a9608aaf3f831e1e9141697530fa0d8e61f820ab317b8301ad23c2b624375ccd4f8305', '4d4a9397e67c9ec4d602753647e11d4c0c567a9ad62f6c154cfca3ce1c8719d797b1f3f64bdf7b17', 0, '2022-07-21 11:20:03'),
('4c579e4d2562ee5cb948a8534442f452f24143a3fe800718058a01f0c4ad2fa4d4b7dff242b9f782', '72a0d6f419d1af11f37c9009cf4cb365267306e6af7c4216738a00a120c60011fb36faabfcc014f5', 0, '2022-07-25 14:17:38'),
('4dcd5e8b150f3367e70a1c21b32a922b1bc6cde02a1aa48a66296970e964ebdc9db81855dc2fbe8a', '0666f42a21de3a2a976be22d636f1c69526dd33736d637cf0c7f90bbdaeb2750e95c9e17c4533e1b', 0, '2022-07-25 00:11:48'),
('4f195806b19079bdb2eda355124f73c849e50b1d4e3028c32d66203426668f8860b7078de1b68e0b', 'bb0ac5254cc377ff1e1ac313b643d876a96b1d9b520e87ef0f8e46184c18a57412eeda7f7e41bd4f', 0, '2022-07-24 20:17:25'),
('53b175005141af5ee62d3679d1716e11754954de713daa7aaeffc00f8c634523dcec6ed395d7010d', '958b4c69d0db93abe3457c19c02e7f202894cac4e06ad078797bc7af0b7a0bad8baa837e56c05543', 0, '2022-07-24 20:13:23'),
('549acbe8797bc9018987d5b6d06e986d3a8d27714318bedaaf7aed4c64c88bef24b7c43569f5f87e', '6b9cdfb17b141e01536d80493fd969e383ca926039e3c10c854bafb3915d77b1568b00a4eaafe556', 0, '2022-07-21 15:47:25'),
('568945435fc5d2027cf41bceaa39888d405bf93b340b4237897d87549a4e7a50837ab599044960ff', 'c386b9f03be90fbce8f96ee9d0adb3f8f8dec4898bb30d29a92793f4ad4f2dd7ff749979610d0d49', 0, '2022-07-20 22:46:45'),
('590349e2841927c0b7682a61e7bbbcb7494481bc7d02e90a583c6e936891f7b0aa922fcf38a2b80d', 'f08f1ed2460434cb7f6d4cf61b441201673a215d736cb1c127cc626783fb469adad38c2483a74f9f', 0, '2022-07-21 10:48:56'),
('599b454d5137d1c6c4bb466d1c89dbbfa172788d063c9bee0bf6c45e51a36871006474908a9ac8f8', 'a016b8ad978fa056a413f4594ad0de0acbccff230a86108a3c262812baa892df04f4973beeeb78d1', 0, '2022-07-25 16:39:13'),
('59fa4085f73ad41bfb8fba60c8f12a44d3652c0c7c9718d72f73dd7762537cb17bf0545e2155b23e', 'cb4611acad444672f3d12277d16a9a3a24044fd8708726f875e981f2f370d1af12c50d8e0615472a', 0, '2022-07-21 10:54:57'),
('5bc5a7fb0893051fe023f10520293b0d2fc0f0336fdd576c55532644016b5767cf8ce04aeb471028', '312f84c8e61e4b24ac3e5066b8ec938ac86a7bbc4cb298f73e0c98274c3fe16c41dfee943dec2c29', 0, '2022-07-21 14:05:19'),
('5c33eaf3bfb0c21232adaed494b54dd1d97836a6cb4388207bf8bbe47a85f9d01ed398e5e03cf84b', '7a7bbca5e82e2ea33f231057ed27fd42a962cf9a0d46bae02be3eb31dc7c01ac06a822add9dce0f0', 0, '2022-07-26 12:42:57'),
('5efeebf1a4c807ac11bbb1d16d367787f16495ea623dd8c0a51494ca2ccec590202fdc6f474bfaba', '6193fd9548211e6f670fa071c8d8c509cfced10c66415be0e39a66ca4ddd254cd291b599c9348b73', 0, '2022-07-21 10:10:09'),
('61133efd204afd4838d5ae781a1429d381e995cef68af0a9ec3650535e23b8259272d659eaf0f394', 'dbda4f40921e8918fff8a37bbbfdb7ccb44f7188ee13eb9d3873bd4a6424acc5084ea19f64a99016', 0, '2022-07-25 20:57:27'),
('6194661f1594c6fb7039c4f1ab48c30251be1639531e96c217e59bead0a633c502dfdf11d259adc1', '1475a233ed1d6f9e57b81249bcc6a4247ccc73fe59351d378200cc66185f18caad799ad19fa9cacc', 0, '2022-07-25 20:34:54'),
('653530838d0818e4fa4cb256489aed99741abae9380394afa2023ac3694d9f8b6c5083405330cc2e', '4f8ef8d39cc6b0713bfbd80db49064ff849a76d8cae4c5ff55ad7fc611d5dcd464052b8437411fff', 0, '2022-07-21 13:44:57'),
('678d5878b8cd62b94a20d2fefb648f323a19d837e3523315588b7af1ec6b0338a56636fee61ceb63', '616f15e1bb7b243c55654cad441218decff51b5177b87529a02975f5af1be623596271940451f36b', 0, '2022-07-21 13:45:33'),
('68ca0e864c163945ae827bc588ee63048bda2c47027c70e5d196e26e8ac2ee484da78b0c4cb9fa96', 'f26e8a5ed9115bce09f0876e0baff7c106ecf29ab6cc6d716ab65fd4636b1bf46c2fdb6e7585a415', 0, '2022-07-21 15:45:08'),
('6d98957185a0f33e5dd0ed22e3893ef94a204763feb54b24b77c91e74438a434a0a482bde5e4a365', '099989fdf0602bd4f57c94cf240eb697dadba84bdf326d82fe8d68e4239d52e7eb4ef7ce4707074c', 0, '2022-07-25 13:53:34'),
('6e6b2f5b04258459840bb3e27fdd086c3c59f04f6b8e7b9e3ab67259e0ae293554f65e88f8e60606', 'ad5835e9296789c9aee410dcdaf03392348519241dd3e69d1d7b6e5d81bb97ace4e273f0efebde64', 0, '2022-07-22 10:23:03'),
('6f92b255dca9a4db4c94819179be2254ffccbb8be6fe2d7e3e27615b22f2e65db14431d3b2bdddf9', '04590f796b23c7b3b98b31b3d5b2cb94b1b98f6babdc85e9866ffecf5773a07a5c95cc990590d9ce', 0, '2022-07-26 07:32:08'),
('7367659b4cd28666bbd85bb250d17457edc395913cde5edbb325988c7e18f922fb578fbd483a77f5', 'ccf1226f9203a534421d500e84dca1bb09b2fe2202efbea5566d68e5c4c2ad121ff877a228c0117c', 0, '2022-07-21 13:43:25'),
('73dcc58558f49ab47a4401f43e889fa220b995aa5f26ea0eb760bc57d7688fbb6bf04c4285e3e1c8', '54a74fb7fedf66da91b8de64d370e503ca3ff896a6b28805f5810814ccbe0022e7cb910aa338eab0', 0, '2022-07-21 10:05:20'),
('76df9440b5a836a8b0b2567afc3e195ac0dcc4bca6d7a02faa457a48eff968576deaf048abd888b4', '7d8bdb1f7c647440c4e935c41366e079a5f557296fee9a90c8284ba3d97f73a9f22f5b189adaf9f3', 0, '2022-07-24 23:16:27'),
('78fc0b1644c9fab40c2a8a09cc54be7ff3628f5be907481fc7ba9d999af07c42c5e1cbf2b53df4b6', '4394eabf12b5e2315dc0fbc31823c2fff347bf8aa864be796100e6d3652d990b18b92bcb85511410', 0, '2022-07-25 12:52:48'),
('798dde002e310134103eec6087b866b1296c16e317a7276605ec09eac6e3dbd4d495cf975c186b57', 'f58d040dafeb1b7c92348bbcdb44b4bff794ff01189aa947a83a6fdbee17eb77c0e832d5b9f7bbbd', 0, '2022-07-21 15:41:32'),
('7a07c8097e93afc476ae564d4e3ff315b142610f382cb11310896a628764798b69f47d9cda7ecd6c', 'e303867ac78bce6ec237002a7c0734eef022782e30adeb4575f34b3f33f2ca2caa3fd747e3ca464d', 0, '2022-07-26 06:17:27'),
('7a756c94d17876185f12aefd4bd2a1b28b9f131112489338447741d2e7ad0148284c50bafef90124', 'f9ef2f2e24d15357055fbfb249b6adc62506d2c4f44f02f26e29f1472c37b247106a4d1c77630b4e', 0, '2022-07-24 20:05:54'),
('7bc8d26dab6b2bc592e5fab92e2489349a397aba6295343b64e5a6a481bf7e022411fdef8978507f', 'acf3218d2397c0cec9f8a84581cc0643ca4a760637999d6688a9198be087d863739e6148f9dd622e', 0, '2022-07-26 06:19:23'),
('7bd76c208e55c2ee75afb510a3e6be02fd566a9ec624e6a86c50744e1d795a1ea2f79a544e1934b3', 'c54604152e48014d2cb97e64ddf580187ccc72fb913e3dfd2977606da6f1e0ac4105bb9d267a3c49', 0, '2022-07-21 14:34:35'),
('7e9e5778deea312e12c08d2053ce115546957210b8a4608b15f797bb029a9286b5b781dd7f45bcf1', '46460d3d74f61778f1db534f96d578b597d8f0be36e47751f742af3c5a92790fe555fab252b404ff', 0, '2022-07-24 23:54:35'),
('7fd04e066a77e264d200f465480ebc0de60219ee0c5c8b10238f754ed237f6c830acd939644a5aa9', 'ad12054be2a490a335e30e333999570504bbb18ef7a1f2066cc0bf84f95d5199f284c3e255fbfe27', 0, '2022-07-24 20:12:31'),
('805b7b8ff2ff9819f5815ba4bdbef1704aeb6f7145e7975faddd08243f15dd10514b5ffd3d27bd29', '1dac06db8440da4dd984b6febb7ea78429c59be2cabf97d6873a5991c9c5cff443371a63059d183a', 0, '2022-07-25 00:10:47'),
('818502c5a54a5e345fdc3ad9c0b5234157017f71a1111631e91411f91e7bd366c6e7b72eabc23a0f', '724532e6a2d2d1d70747ab3ad8e5805551202df7a509335b325ba5e6dc66e2febf763f1009948032', 0, '2022-07-21 11:18:33'),
('86bae229c01283e906cfe71b2ba2c48e63f3d33ba29b72783f4fcb1aabd5b604dc89908fd502d793', '571e33f6333d3a9a7e3e46f0359c1131f68e2e02b7fcef1d65ed77ee19829f315a330118bca27e38', 0, '2022-07-22 10:09:22'),
('878f069f199604b2bc98f82b088fd5aab2c0e83a17ddb6332b97e3bfb63cde96534e803cb69019ee', '5790b2055131ecad5b99d8d128933f2296525b463a5ab8299601205db2c9ce19c343d6efacf98e35', 0, '2022-07-25 21:38:01'),
('89affd35f42471dd592a942ef7c0a78241bb550cd85d12ab5628cc78de4b3d8d081a53a6c02dcf7a', 'a5feec58296bc332f86f3dc2beae835bd7f697c19fcbefac34ea7f68cf7137b02afed69c041e623d', 0, '2022-07-25 20:54:41'),
('8a164026f5e7abdf77d688dea023c98bc891850b376144f2b4dd6b007a721f085b1ac0dd05caf487', '71d8e3f06eb294aa6016cae37290fab191f9c4a0fca55d7c27687d92f779654eb566a48b117c485a', 0, '2022-07-21 08:34:37'),
('8b08a75561f108de363c308ba8b20cc8b149c41a07585360c0f17718b89c9d9ace6b3876758c2eab', '89a232c8a56510818c43b286f6f85f42139ed4db8b6c580c4ccb4ba14d2bb0df906ba9b1b87a9c67', 0, '2022-07-25 21:38:49'),
('8cb7c380b95af8296a560f3a6adf85669672e63a4a1195494581af9b718288c3510c6360ae6dff0f', 'cf22b93ac92f5137cf0ff10fd39e4f15c24fa3ed5c0a47e2e9cd94cfea9e42b5bd235254a1d68365', 0, '2022-07-21 14:08:12'),
('8cf8292af8f1fe18cba9c89901503e5fc038bf24749385ac9c92ae5f8554261e5dacbae8bb95969b', '1be363a8f64b97f485cdbdff737a5979f91118203b974c0e9c98e11af38584f38b4497a379ec78fc', 0, '2022-07-25 13:51:39'),
('9925d4af9f215c6010d30ec8c55adc80f6bc1875fbfa1dd6bcfd77dc636f10d6fd41218cb08a7817', '71a8988f8aff2cbe7e1e8ea800fd0a692c313341a837dd6d98ae094c09730c78d5e77d5cbdcd6b07', 0, '2022-07-25 00:19:36'),
('99ff8d7d4285964587368ec9cee3c0518052fabd4f4fe8f816d7b10fa9e3fa611ae6cf55ffcf07f8', '022da90832b37a859afdda6f376b41b7340c3777fe35bc12fd6917e66af8ba7aa66359d04d331c79', 0, '2022-07-25 00:15:19'),
('9d8427b1af598c323f33a046ccbe07fc12c4e415b481c7b4f9e81ef30dd1a00acb24a7049cd5cd6b', '0236615b2ef4a270430fef7638ecdecb061de3c363f28ca99f803be43732de1f4f4af5cda3816dfc', 0, '2022-07-25 21:28:29'),
('9e069baa9601d9bd53a7576a7b40783628ffccfe4e45d1a1b1ebc84702398867ff6fd97bf84a61a8', '8e06cb5f5098409bcbf15ef451678b2abd902fec7fe1154087ab80e0efaaf29176d9ee49d9a1ddbe', 0, '2022-07-25 21:29:26'),
('9e8aa9dcea70324695ca8dbd970dfc754aeb14482321eb03e4e7dd8ca55c5cf1c8f2999d8a577341', 'a5e72ac1b68b10ca4a38438f99ce19806059a7651f65faa4e16fb7f5562ee095ea492510504d076f', 0, '2022-07-20 23:05:03'),
('9f601023a2637152d1fdd34ce735300ec20a14aa928dc09f61a9f2a838a66e521ec74dc3eb670d2b', '855bd0750f43abe59b48232ce2955f1c67f03060f0222ec099a6077598fa081eb3814ae27c79a9df', 0, '2022-07-20 22:50:40'),
('9f96e3cfb2c5e80047c003cb652292536d4b4ed2383c849e59d7f9816edb0b642c295c26165dfc06', '4e354601228666f575890317521a288107b72a73a6021a29ab36f0d9a556697335989e06ee48169b', 0, '2022-07-25 21:44:10'),
('a10abec34e09b2489ae0e0bc9481f5491c08ead77fe4bbbef0889c51c845d7bfbdb9e58e0953c0f9', 'a1f30b83e187a69a541a362306328fe34ba3e74a6422c4adb2f7649b0179a05fa24d28cea4f29b54', 0, '2022-07-22 10:06:37'),
('a4fbf695bac4b0392b39e5aca6393ab57470bd65c0ab6cf52a933583b87a11dde36d60e673fdc5c0', 'cc2130c457d11b769bc3b4bb5c0155236103f9a07d12d34edd667a5e869d8c606783aa3f53f598dc', 0, '2022-07-21 08:58:44'),
('a893ed0cfe57e8429bf0dc13c5b2badbfafffb217706770975a7937f0df7751c29cb97f6266870e4', '10da14cb8fa15c345228137718677d659c91e1f159ccfd1620907a056c6f214576b86b84833bb00b', 0, '2022-07-21 11:18:41'),
('aad42964a08c6c24e41f096f07881c67200a391878a585e7042d7c1d25f3a0563c143042fd5b83a1', '1c55fa9c75b08fc53f823757f497e4f86efe7daf1df90699faa9375f15182780d42f56dbe14d951b', 0, '2022-07-25 21:06:39'),
('abb1b946be207db5519aef6d2906a595fc4e900e99f07ca76600d9ec497ae475cc894490d4badd3a', 'd310cb1da2148f645de5d0d91066e1bddfe764b3abbe19c76bd2c8687095a5fc67bdaf3b9738618e', 0, '2022-07-21 08:51:20'),
('abf9ed1cc2c16c5587fce3b75ecf03dcb913c5ec8e14760fff0d9feefb46142d50666c920a06483f', '438442a520a515c82c73d9c5907184be40f0fdbf768bbea5e72eb4557144560194ce9abeae70625f', 0, '2022-07-21 10:49:57'),
('aebec9a3e89895a576235419a160d5069616e7a89136be741da381538e9698de9da3649121df326b', 'b86ff6efe779fc58d191e834cb4af82a9cfc7bc0fb3fef01dc4fa7f95306ff02bec88a07804234e7', 0, '2022-07-21 11:17:58'),
('b27e209379475cb41aadb3cbb3884e9ca44e06fcba5c23106c29c5fe5cdcda12da92fe52f3935f9f', 'c8f571c2d075a64c5ba0e613c866583745e4bca807c8eede082b733353308d01b9eb67cbe39e293a', 0, '2022-07-25 00:07:17'),
('b2bf8fb49993c78c8950fc14cecbcf21765fc457831dc67c3bdd7664e9aff63f5ce69259838bd9da', 'f2afb3c21c183f0d0b53b17796c290110000e8f46c3d6bfab62e7799c18fb16fdb93c4894455d28b', 0, '2022-07-22 10:42:00'),
('b2c41893fb4d77474cda41d816ccd1f1072da3a59c4e1fa7c07c8ccce17e51263f1cc742ec0ffcde', '7bdc8cef0daff5f7f4dccf3457a650517795912dc733ee33fe7e49fceec807bdd73f5df043f377aa', 0, '2022-07-25 20:55:16'),
('b2cf98ff0bd78d3ed528b515723db7ffbaf706d7c4681eb5880aa2cf1f1cbf89b8153c20d532ee74', '3dba4006b604aef6fefdf0c6c3012065f2481c90a872d3c13283f72265c18828fe83409730b9d2b6', 0, '2022-07-21 13:27:59'),
('b3fdc6bfa42db446d94894f0b00a9437c5314a36f15b07d33fc3116d6a1e405ebc4c4ebd1875d1d4', '7e53dde956debc9942e7aa3254b19419b95afbe4d2ef2e44a9820bcfbd37f5215511d7b6ef35c390', 0, '2022-07-24 23:57:44'),
('b4dc69dee9868fa66b09db64efe6a0a99bdc1919f4f0eba6ed3b92cb874e88b595381cf73550ad58', '00070974176daa77a1767b17e2f9b33206f03f054e6fbafda58a376a014fe696fc65a936092387ca', 0, '2022-07-21 14:10:48'),
('b6940c252d62356e11c19936b38b335047f4a3e6b15a57a99bebae9cd263faf2a0982f7b4561ac05', '6cbeeaefbb9849a304043a83a499e8b0e4cf7775deedcb93cd50e95ac9d0a27bf184674811530c28', 0, '2022-07-24 23:52:00'),
('b86910ad7152c20632dcd3c47bccc682ff0288f213aca98a3af471483c783083a366dc7fc264606c', '9030273738ee31ce0163d330d0324e7886780be61ab4f2e41e0448690ed5bb726c88b5e2bf11c8e5', 0, '2022-07-25 00:04:13'),
('b983eec802db92f58febcc5e37aaae420078be193be9ccc43e1427efeb62b240311c0a7ae3cc507c', '6683e5210a1ea00eb2fc8a03e4bcf5e2927c35adce6e52d9e6f5faade48a2c95d57dd4bf1df4163a', 0, '2022-07-20 23:06:43'),
('ba65ce9774b05850130180519772f54acbbfaaa5871ec5296bb46663d5ae97976cab6b4ea885a616', '9464ba284192e506f8238cdbcc1f045e82fa44b6a9eccb5c89584ab9e94e3fd83ccd18eba949da90', 0, '2022-07-24 20:35:50'),
('ba802c3c40c668bda160b73fab668d25d12471d0024ac74da2e498c696645e40369445c3aa36aaac', 'cf3f31895c62f83c550480d9f0345e5a5122bfd4298e24ce158b5982b965281d2a16d21a2180266f', 0, '2022-07-26 06:18:28'),
('bf4a738c2fc9e233ed149dbe348a7de45290285165681f7ab635cefecd0dc2cbb55b4f81e1a9860a', '2a09f18c4311530bbb142620f6c06bff2c36ff27c8423b3222ec7a20ef8e8bb5ffc188ecd72b4b27', 0, '2022-07-26 07:25:28'),
('c58923e73f4d6d2a5be31a409bdfdc46c2592fc23be6b057aea5b74b9bf4e47d9f2fbed3deb631e8', '4742d90983ca9680e9b9e010f8a4e5791ef138070fafa4dee0635f2b45022bcc546ae631b19e7c93', 0, '2022-07-26 12:45:23'),
('c8543695738bc826e21d2dc58e3f8828945d91d3a968f855e6a7387f94987ca1d8c41d1584418c22', '0d3b4195f35785c5333eb79a204258263b4abf9fc691c23b6116b2ff09f5dba471ae620108fcda45', 0, '2022-07-22 10:14:15'),
('c925ad409860491c6c3d4a7615953d9a0171e3ea6838e6fba93c54d0952aadefcfdbca240f5683a7', '0c6d711a35e5900f615159ebac79ec63fd9f9ff684720ed94fd087cc52a0b89527ce2722a83e6460', 0, '2022-07-25 21:42:00'),
('c9505445e90f97c14b6397475bdca0836860915eeca4c0500382a90b300d7e18109cd476d2442f56', 'dfb9191d154e1f4afd6c48e1d14f87bdf420a86bcf0fbf1830ebb1d7c1879971eda37bfc9bd9dc09', 0, '2022-07-21 10:05:12'),
('c96b5f845f24f30ff845eaead4647110e27ac450f51cc9de91a759902d10f4d5dce6c6bb12fb9bcf', '52ffb7dd99e24f2a146a098e5dd747cd0daa1a6a55f40853f4c123e4215d4028866a8d0fb3938a2e', 0, '2022-07-25 13:17:22'),
('c9d062e0136b44840d1005e592dc7617e30956f3c2d5a57dbb13c357d636f2e7e4e4acbacf622a2b', '2a41d8e133d3936042dd628d1610b622072c5461fb3e27ebe8414885b2d8f77f6cc5e410d85b0d2e', 0, '2022-07-21 09:05:04'),
('ce1a3b24d2d0ffd035b6d17e3943d69da19adb543037d32f2783dcb0a2f60fc7c61c9867ff62bb61', '34a21db55fa4361a627fa92d88fb747afada4a6e0ada2e0b9d58d02877e5eba7ba991f4f322a7453', 0, '2022-07-25 14:22:41'),
('d3d1d7536ccec8d470f95764ca734be3a3d52199e2fde5dc6e36c179d78949b8ded7888f9b13b5c7', '96e585d5e04c8d39e160a0ff8cebf3ec0d71a2da3de5a558eb4ce74e123540ab055ccb10833bf3eb', 0, '2022-07-25 20:56:46'),
('d90e557b9e53eaa9d76cd5d086cbf5ee736aec525091062fe94715b3584d0b10eddcfde85c1b5258', '7411c5b09ca8a1d262160e9589bef9d1a34dff920379b308ee011ae998e5460465c4b41e9258a16d', 0, '2022-07-24 23:59:16'),
('d9a892ffcedf0556e9cd2ecafb4f72e176f998c0d35b131f808b1d231ba482d088b2b6eb6f2a688e', '3e591e4e788b3d5e6f376da3252068b642090946fe66f59c23a6ab81d9e9ac6a6b149f5129ccb6c8', 0, '2022-07-25 14:04:28'),
('dd192c373d30a40113ba1ff84b547ecb8eb8a9240e8e0a7fb52c2023cbdaafb19f8aafb52e65c0b7', '7f59fb0c8c3b1045ec4aea0970b9c54aca0b577e4247497d7ffb4b80c618ebd93e9b1e3d51116dd6', 0, '2022-07-21 15:25:18'),
('df175859e35e478c998da098b19aad241ff5f6666092e0ec2180c13dcda77781fe8e95701682e934', 'fbbcf2b1fb93d174ce17b3e078dd4a99e1ac476017023c980815faf86bfba94ed90cea1500e0a304', 0, '2022-07-25 12:53:58'),
('e041b1f6a0a0b67b08147f72618b3e73c71194b2a68fd6725b6a6620d1946abd18a79e8d810e1c6d', 'e4ef4f2f8c9cef55c05422a1bbac0c24c885bc86d08f0c4413a033edd653b434f418be1986f5a30a', 0, '2022-07-22 10:08:38'),
('e71f463dc78ebceaf8650239db09e7180f4614bd8246724777a21b460926004e5a823c84524455f9', '01542aecfaab7d22aa1144fe77ec0cb329ebbd8cd959a7240babfbcd28e1858c00ad6b5b49ccd223', 0, '2022-07-20 23:04:27'),
('e98f26c21d888773d8a3b20f595e152c6a7cc3e42b9d3631c8d91722092fb67455a83c90aa2c7813', 'c6bd25a88ffc39ec87726b73b98affb5feb604ac693a3c3053fa010a505e57700413db6607b47895', 0, '2022-07-25 21:23:28'),
('f616f34b199c9438261116fd39f626d1cf1cbb32f15b667ffec9949ee8567e534492189d77806eec', '3c37b69847693be38ab3a4aaba44793a684ed15137d2bc9ed87a5e3e945bcff21ea88c3702cfb630', 0, '2022-07-24 20:03:55'),
('f75e3529710773ca530a95932f0f66ab08400ce3b897e1a3cee98c99c5708f1aaeb6aafe479a99d5', '1043da1d82b1e01075d42d1ddad5d78c7111a7d7e1972aadeaeee683d1ade0f86fc6d2f07d8b1223', 0, '2022-07-22 10:10:24'),
('fa07150bc93794d887c9c647d5c9f7df089ef30b6745543281d233eb63cfb2d1980762cf2ecea929', '8336e3b658c8eb88bc65f67ea0101c3ecacd313596d73b9d65d5f514dafde9620ff4dc2456e6c32c', 0, '2022-07-25 14:23:21'),
('fd4efedee9fdd2f3f10607169ac2e260eb4d6e169cbaae3085032c71f3b84dc85d1dc042b0a0426c', '020f19b59b077f94260346915de72348a5cf326eee26e158ae4b866b7be9e2be466f06b8e7402468', 0, '2022-07-25 00:23:43'),
('fd5eca44154b1e5c79f99910e429da4a5f696d00ff859aad0a0c10cef02adce389776c0fd625ae18', '7f1eee3966070516e9a84cef8a9c3d945bb6cd1db305c9de3829ad4fedb7a84ea4e36c75a2bc9c67', 0, '2022-07-25 20:29:59'),
('fefd2c7536204e95a96e4823f01c78d9ffb0b062041614777589f33d73ee055e1c447cf0e1711a8d', '063540e386d4b6552f610163d0bdbe0d7282286c48c2d9fb6ade23b3ae4bef317ed31794c09df83e', 0, '2022-07-21 10:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  `leave_days_left` int(11) NOT NULL DEFAULT '15',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `leave_days_left`, `created_at`, `updated_at`) VALUES
(3, 'luphumzo', 'luphumzo@luphumzo.com', '$2y$10$zrhEVFJU9IUe5w3ji87U9.T77M6j4qwHcptvdbIgsbS5JYEd9fCpO', 2, 15, '2021-07-20 20:56:48', '2021-07-26 04:49:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `role` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role`) VALUES
(1, 'Admin'),
(2, 'Employee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_user_id_foreign` (`user_id`);

--
-- Indexes for table `leave_status`
--
ALTER TABLE `leave_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leave_status_id_unique` (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_id_unique` (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `leave_status`
--
ALTER TABLE `leave_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;