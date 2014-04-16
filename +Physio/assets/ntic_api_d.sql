-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 20-Mar-2014 às 19:43
-- Versão do servidor: 5.5.35
-- versão do PHP: 5.4.4-14+deb7u8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `ntic_api_d`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `medical_records`
--

CREATE TABLE IF NOT EXISTS `medical_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `heart_beats` int(11) DEFAULT NULL,
  `min_blood_pressure` int(11) DEFAULT NULL,
  `max_blood_pressure` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `medical_records`
--

INSERT INTO `medical_records` (`id`, `heart_beats`, `min_blood_pressure`, `max_blood_pressure`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 60, 60, 120, 1, '2014-01-21 03:24:25', '2014-01-21 03:24:25'),
(2, 61, 65, 130, 1, '2014-01-21 03:26:25', '2014-01-21 03:26:25'),
(3, 60, 60, 120, 1, '2014-01-21 13:37:04', '2014-01-21 13:37:04'),
(4, 100, 200, 13, 6, '2014-01-21 14:57:51', '2014-01-21 14:57:51'),
(5, 60, 60, 120, 1, '2014-01-22 00:51:39', '2014-01-22 00:51:39'),
(6, 8670, 0, 0, 1, '2014-01-30 14:55:52', '2014-01-30 14:55:52'),
(7, 60, 0, 0, 1, '2014-01-30 15:43:03', '2014-01-30 15:43:03'),
(8, 0, 0, 0, 1, '2014-01-30 23:41:54', '2014-01-30 23:41:54'),
(9, 12, 60, 45, 1, '2014-01-31 18:09:53', '2014-01-31 18:09:53'),
(10, 12, 60, 45, 1, '2014-01-31 18:11:14', '2014-01-31 18:11:14'),
(11, 69, 36, 140, 1, '2014-01-31 21:19:54', '2014-01-31 21:19:54'),
(12, 60, 0, 0, 1, '2014-02-04 12:20:50', '2014-02-04 12:20:50'),
(13, 60, 70, 120, 1, '2014-03-11 15:45:56', '2014-03-11 15:45:56'),
(14, 120, 125, 85, 7, '2014-03-12 16:27:19', '2014-03-12 16:27:19'),
(15, 80, 96, 112, 7, '2014-03-17 23:31:42', '2014-03-17 23:31:42');

-- --------------------------------------------------------

--
-- Estrutura da tabela `routines`
--

CREATE TABLE IF NOT EXISTS `routines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `routines`
--

INSERT INTO `routines` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Rotina Manhã', '2014-01-21 00:00:00', '2014-01-21 00:00:00'),
(2, 'Rotina Tarde', '2014-01-21 00:00:00', '2014-01-21 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20140112193350'),
('20140113155153'),
('20140115231507'),
('20140115231814'),
('20140121210954');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Pedro', 'zok@quobits.com', '$2a$10$fRgbxpgK.se3m2/rTkYGEe77SbHj88FQOMrVVa9Yom5p.1BPvHVLO', '2014-01-21 03:20:21', '2014-01-21 03:20:21'),
(2, 'Ze', 'ze@quobits.com', '$2a$10$MN/b02ZdOgOetCGgU9uHxOG7YWrivCkJ/phGWq/VvtTJ7BBrbEANu', '2014-01-21 03:30:31', '2014-01-21 03:30:31'),
(3, 'zezi', 'zezi@quobits.com', '$2a$10$OhxKxevcOWZae4zu.bASreQ/RZ0QZQ/GLQDulf.7WI5AOpezxPOpu', '2014-01-21 03:33:10', '2014-01-21 03:33:10'),
(4, 'Pedro', 'zok1@quobits.com', '$2a$10$gluYMm8PlJ4G2jiDbyoOg.yXPx4SBoMhgwpxHq2qY7/2jFsgfrNI2', '2014-01-21 03:35:15', '2014-01-21 03:35:15'),
(5, 'Nuno Pinheirinho', 'razbajah@gmail.com', '$2a$10$7GQyzNns3tA/ZQin1FThHes7XzxByEbktxxyE46gCXs1aFYRexMEC', '2014-01-21 03:41:42', '2014-01-21 03:41:42'),
(6, 'ze', 'zeto@gmail.com', '$2a$10$VbXya6Vf51I6r8J5e5IrF.nOPeGvGj/TeDx9gyKCUPRrHK7ljq86C', '2014-01-21 14:54:51', '2014-01-21 14:54:51'),
(7, 'vitor', 'vitor.barbosa@esce.ips.pt', '$2a$10$kus8iJ/JmTLUnDKCBWOvfOcGaBTBgnSGp9q1V3xNBVXVTlojwY1Ky', '2014-02-20 22:28:00', '2014-02-20 22:28:00'),
(8, 'zoktest', 'zoktest@gmail.com', '$2a$10$E54Ig3qE7ZU2LpQOXjpGgueIVNuHzmdvPzapBVF21wCPzuLvwkFeO', '2014-03-12 16:21:20', '2014-03-12 16:21:20'),
(9, 'vitor barbosa', 'vbarbosa@esce.ips.pt', '$2a$10$kus8iJ/JmTLUnDKCBWOvfOcGaBTBgnSGp9q1V3xNBVXVTlojwY1Ky', '2014-03-12 16:25:01', '2014-03-12 16:25:01'),
(10, 'Diogo Branco', 'dbranco1986@gmail.com', '$2a$10$fVQYkom3kcUh4lXLJqLuKuDviTnICbhDb/LUTaekwKf77.FnC2D5a', '2014-03-20 18:08:50', '2014-03-20 18:08:50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_routines`
--

CREATE TABLE IF NOT EXISTS `user_routines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL,
  `routines_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `user_routines`
--

INSERT INTO `user_routines` (`id`, `users_id`, `routines_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Rotina Manhã', '2014-01-21 00:00:00', '2014-01-21 00:00:00'),
(2, 1, 2, 'Rotina Tarde', '2014-01-21 00:00:00', '2014-01-21 00:00:00'),
(3, 7, 1, 'qw', '2014-03-12 00:00:00', '2014-03-12 00:00:00'),
(4, 7, 2, 'qewrty', '2014-03-12 00:00:00', '2014-03-12 00:00:00'),
(5, 8, 1, 'Test Routina', '2014-03-12 00:00:00', '2014-03-12 00:00:00'),
(6, 10, 1, 'abcd', '2014-03-20 00:00:00', '2014-03-20 00:00:00'),
(7, 10, 2, '1234', '2014-03-20 00:00:00', '2014-03-20 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `workouts`
--

CREATE TABLE IF NOT EXISTS `workouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routine_id` int(11) DEFAULT NULL,
  `pic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `workouts`
--

INSERT INTO `workouts` (`id`, `routine_id`, `pic`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, '1.jpg', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '2014-01-21 00:00:00', '2014-01-21 00:00:00'),
(2, 1, '2.jpg', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '2014-01-21 00:00:00', '2014-01-21 00:00:00'),
(3, 2, '3.jpg', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '2014-01-21 00:00:00', '2014-01-21 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
