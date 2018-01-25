-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 25 jan 2018 om 17:33
-- Serverversie: 10.1.26-MariaDB
-- PHP-versie: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `periodeopdrachtdb`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 2, 8, 'Hello', '2018-01-21 12:43:07', '2018-01-21 12:43:07');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `dislikes`
--

CREATE TABLE `dislikes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `dislikes`
--

INSERT INTO `dislikes` (`id`, `user_id`, `post_id`, `email`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 'yunus.kartal98@hotmail.com', '2018-01-21 12:06:47', '2018-01-21 12:06:47'),
(2, 2, 8, 'sam@gmail.com', '2018-01-21 12:07:06', '2018-01-21 12:07:06'),
(3, 2, 9, 'sam@gmail.com', '2018-01-21 12:41:32', '2018-01-21 12:41:32'),
(4, 2, 7, 'sam@gmail.com', '2018-01-21 12:42:22', '2018-01-21 12:42:22'),
(5, 2, 11, 'sam@gmail.com', '2018-01-21 16:48:18', '2018-01-21 16:48:18'),
(6, 2, 12, 'sam@gmail.com', '2018-01-21 21:49:22', '2018-01-21 21:49:22');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `email`, `created_at`, `updated_at`) VALUES
(1, 2, 9, 'sam@gmail.com', '2018-01-21 11:49:17', '2018-01-21 11:49:17'),
(2, 2, 8, 'sam@gmail.com', '2018-01-21 11:53:58', '2018-01-21 11:53:58'),
(3, 1, 8, 'yunus.kartal98@hotmail.com', '2018-01-21 11:54:38', '2018-01-21 11:54:38'),
(4, 1, 7, 'yunus.kartal98@hotmail.com', '2018-01-21 12:05:47', '2018-01-21 12:05:47'),
(5, 2, 7, 'sam@gmail.com', '2018-01-21 12:41:15', '2018-01-21 12:41:15'),
(6, 2, 11, 'sam@gmail.com', '2018-01-21 16:48:15', '2018-01-21 16:48:15'),
(7, 2, 12, 'sam@gmail.com', '2018-01-21 21:49:16', '2018-01-21 21:49:16');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2017_12_29_152926_usersposts', 1),
(4, '2017_12_29_161101_create_users_posts', 1),
(33, '2014_10_12_000000_create_users_table', 2),
(34, '2014_10_12_100000_create_password_resets_table', 2),
(35, '2018_01_02_162722_create_posts_table', 2),
(36, '2018_01_02_162744_create_comments_table', 2),
(37, '2018_01_02_162847_create_likes_table', 2),
(38, '2018_01_02_162859_create_dislikes_table', 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `websitelink` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `text`, `websitelink`, `point`, `created_at`, `updated_at`) VALUES
(7, 1, 'Why is only half of Mars magnetized?', 'I\'m working my way through a horrendously high pile of magazines that I haven\'t had time to read, and came across an article in the September 26 issue of Science that is really cool: it neatly explains why only the southern half of Mars is strongly magnetized.\r\n\r\nI\'ll need to begin with a little background. I\'ve talked before about what\'s called the Martian crustal dichotomy. Stated simply, the dichotomy is: Mars\' northern hemisphere is low (in elevation) and flat, while the southern hemisphere is high and rugged. That difference is easy to spot in the marvelous Mars Orbiter Laser Altimeter map of Mars, one of the signal accomplishments of the Mars Global Surveyor mission:\r\n\r\n Mars Orbiter Laser Altimeter (MOLA) map of Mars\r\nNASA / JPL / GSFC\r\n\r\nMARS ORBITER LASER ALTIMETER (MOLA) MAP OF MARS\r\nThe Mars Orbiter Laser Altimeter aboard Mars Global Surveyor produced the first global map of the topography of Mars. MOLA operated by shining a laser at the planet and timing its reflection. The highly detailed along-orbit topographic profiles were resampled into this gridded map. The map is in Mercator projection to 70 degrees North and South, and Polar Stereographic projection for the south (left) and north (right) poles. The most obvious feature of this map is the major contrast in elevation between the southern highlands (mostly orange) and northern lowlands (blue). The highest elevations are found in the Tharsis volcanic province at about 250°E, while the lowest elevations are in the Hellas basin at about 60°E.', 'http://www.planetary.org/blogs/emily-lakdawalla/2008/1710.html', 2, '2018-01-21 11:02:13', '2018-01-21 11:02:13'),
(8, 1, 'Quantitative Trading Summary', 'This summary is an attempt to shed some light on modern quantitative trading since there is limited information available for people who are not already in the industry. Hopefully this is useful for students and candidates coming from outside the industry who are looking to understand what it’s like working for a quantitative trading firm. Job titles like “researcher” or “developer” don’t give a clear picture of the day-to-day roles and responsibilities at a trading firm. Most quantitative trading firms have converged on roughly the same basic organizational framework so this is a reasonably accurate description of the roles at any established quantitative trading firm.', 'https://blog.headlandstech.com/2017/08/03/quantitative-trading-summary/', 1, '2018-01-21 11:06:48', '2018-01-21 11:06:48'),
(9, 2, 'Training Your Brain So That You Don’t Need Reading Glasses', 'By middle age, the lenses in your eyes harden, becoming less flexible. Your eye muscles increasingly struggle to bend them to focus on this print.\r\n\r\nBut a new form of training — brain retraining, really — may delay the inevitable age-related loss of close-range visual focus so that you won’t need reading glasses. Various studies say it works, though no treatment of any kind works for everybody.', 'https://www.nytimes.com/2017/03/27/upshot/training-your-brain-so-that-you-dont-need-reading-glasses.html', 0, '2018-01-21 11:23:23', '2018-01-21 11:23:23'),
(11, 2, 'The London Time Machine', 'On Sunday the 2nd of September 1666, the Great Fire of London began reducing most of the capital to ashes. Among the devastation and the losses were many maps of the city itself. \r\n\r\nThe Morgan Map of 1682 was the first to show the whole of the City of London after the fire. Produced by William Morgan and his dedicated team of Surveyors and Cartographers it took 6 years to produce, and displayed a brighter perspective on city life for a population still mourning their loved ones, possessions, and homes.', 'http://maps.arcgis.com/apps/StorytellingSwipe/index.html?appid=e5160a8d1d3649f09a756c317bd0b56b', 0, '2018-01-21 13:31:46', '2018-01-21 13:31:46'),
(12, 2, 'Choosing between programming in the kernel or in user space', 'Dear KV,\r\n\r\nI\'ve been working at the same company for more than a decade now, and we build what you can think of as an appliance—basically a powerful server that\'s meant to do a single job, instead of operating as a general-purpose system. When we first started building this system, nearly all the functionality we implemented was added to the operating system kernel as extensions and kernel modules. We were a small team and capable C programmers, and we felt that structuring the system this way gave us more control over the system generally, as well as significant performance gains since we didn\'t have to copy memory between the kernel and user space to get work done.', 'https://queue.acm.org/detail.cfm?id=3180444', 0, '2018-01-21 21:39:14', '2018-01-21 21:39:14');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'yunus kartal', 'yunus.kartal98@hotmail.com', '$2y$10$u5bPCdfYIyrzdYwIE/opv.LowK/RE46YVU9qMQzislpvk9vAgVKcC', 'Gfs2tqG2qtm9Og64AaCjSuNOPmfGEQe1VmzpOT1aCkY6bXyz0t1Q5QNL4Fwu', '2018-01-22 19:43:58', '2018-01-22 19:43:58');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usersposts`
--

CREATE TABLE `usersposts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `websitelink` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `dislikes`
--
ALTER TABLE `dislikes`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexen voor tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `usersposts`
--
ALTER TABLE `usersposts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `dislikes`
--
ALTER TABLE `dislikes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT voor een tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `usersposts`
--
ALTER TABLE `usersposts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

DELIMITER $$
--
-- Gebeurtenissen
--
CREATE DEFINER=`root`@`localhost` EVENT `resetusers` ON SCHEDULE EVERY 1 DAY STARTS '2018-01-25 00:00:00' ENDS '2018-04-26 00:00:00' ON COMPLETION PRESERVE ENABLE DO DELETE FROM users$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
