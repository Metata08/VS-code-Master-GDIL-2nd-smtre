-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 04 avr. 2025 à 08:20
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ugbvote`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Admin principal', 'admin@gmail.com', 'admin123', '2025-04-04 15:43:34', '2025-04-04 15:43:34');

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

CREATE TABLE `etudiants` (
  `id_etudiant` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `code_etudiant` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `ufr_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`id_etudiant`, `nom`, `prenom`, `code_etudiant`, `email`, `mdp`, `ufr_id`, `created_at`, `updated_at`) VALUES
(1, 'gueye', 'amteh', 'p31 2127', 'ameth@gmail.com', '$2y$12$td2rt3iFfQ0SJSjry76OH.7/a/ctPVDBlJBPcQK3W0l74OK5L1yja', 1, '2025-04-04 15:43:32', '2025-04-04 15:43:32'),
(2, 'diop', 'anta', 'p31 2327', 'anta@gmail.com', '$2y$12$qnAHCvqmPuv1aOdV9.lk1OuVE1B4edi3xZtTcQMNp01rWA0Qj7GPy', 1, '2025-04-04 15:43:33', '2025-04-04 15:43:33'),
(3, 'fickou', 'daouda', 'p31 2227', 'daouda@gmail.com', '$2y$12$g9p8r7otQMkcZIUTKPXas.4yIdjxhEsJA3En7IjmB.VysXiU1zXZ2', 1, '2025-04-04 15:43:33', '2025-04-04 15:43:33'),
(4, 'test1', 'test1', 'p312121', 'test1@gmail.com', '$2y$12$jjM9UrzPFU9t9zJjLUzR/OP26KtMWwDoU4lWfBtGD1L0QQCx0U/JS', 1, '2025-04-01 08:35:16', '2025-04-01 08:35:16'),
(5, 'gueye', 'Mouhamdou', 'p312277', 'gueye.mouhamadou7@ugb.edu.sn', '$2y$12$hGNPXW8VyTNB.30624vx6OoRIQ/fvI87m18yNZErjst..4LRIlsVa', 1, '2025-04-02 13:11:42', '2025-04-02 13:11:42'),
(6, 'gueye', 'Mouhamdou2', 'p310000', '2gueye.mouhamadou7@ugb.edu.sn', '$2y$12$SfzCN3bWv9GG6sQBa11V/.DuORS/PXpvoVo0AwAqxQMUmaCzSV6Cq', 1, '2025-04-02 13:48:33', '2025-04-02 13:48:33'),
(7, 'Nom', 'Prenom', 'p312278', 'prenom@gmaill.com', '$2y$12$WrwAV5hPfKoq8Kc7KcyQXOnSsVaQiCscne7RMe.UU6T2rGUnHkfXO', 1, '2025-04-03 05:20:27', '2025-04-03 05:20:27'),
(8, 'Nom', 'Prenom', 'p310001', 'exemple@gmail.com', '$2y$12$cichfOIiJN0pKMZAlRClru3/ZhyHkaDzB2M14mz/Rlf6ySuVxHYHW', 1, '2025-04-03 06:34:18', '2025-04-03 06:34:18');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_officiels`
--

CREATE TABLE `etudiant_officiels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant_officiels`
--

INSERT INTO `etudiant_officiels` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, 'p31 2127', '2025-03-30 06:05:03', '2025-03-30 06:05:03'),
(2, 'p31 2227', '2025-03-30 06:05:03', '2025-03-30 06:05:03'),
(3, 'p31 2327', '2025-03-30 06:05:03', '2025-03-30 06:05:03'),
(4, 'p312121', '2025-04-02 13:47:52', '2025-04-02 13:47:55'),
(5, 'p312277', '2025-04-03 05:17:21', '2025-04-03 05:17:25'),
(6, 'p310000', '2025-04-03 05:37:55', '2025-04-03 05:37:57'),
(7, 'p312278', '2025-04-03 05:37:55', '2025-04-03 05:37:57'),
(8, 'p310001', '2025-04-03 05:37:55', '2025-04-03 05:37:57');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
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
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `listes`
--

CREATE TABLE `listes` (
  `id_list` bigint(20) UNSIGNED NOT NULL,
  `programme` text NOT NULL,
  `name_list` varchar(255) NOT NULL,
  `ufr_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `listes`
--

INSERT INTO `listes` (`id_list`, `programme`, `name_list`, `ufr_id`, `created_at`, `updated_at`) VALUES
(1, 'programme d\'election de la liste', 'Convergeons vers un avenir meilleur', 1, '2025-04-04 15:43:33', '2025-04-04 15:43:33'),
(2, 'programme d\'election de la liste', 'craquer pour crack', 1, '2025-04-04 15:43:33', '2025-04-04 15:43:33'),
(3, 'Et est dolor enim elit ad labore sint ex aute. Nostrud ipsum cillum voluptate nisi labore laborum nisi. Labore aliqua exercitation eiusmod voluptate culpa aliquip voluptate minim incididunt eu eiusmod. Aliquip officia minim fugiat proident dolor nulla est aute in dolor sit laboris occaecat. Ut pariatur nisi mollit commodo. Est aute veniam exercitation excepteur mollit. Tempor sit proident do nisi sunt incididunt Lorem dolore. Velit ut cillum incididunt id mollit dolore est ea. Labore labore pariatur commodo consectetur nisi amet qui nisi commodo. Dolore tempor anim Lorem reprehenderit voluptate labore excepteur sit sint magna. Ut incididunt sit consectetur non velit minim veniam quis cupidatat nostrud nostrud. Excepteur in do sint cupidatat cillum nostrud aliqua reprehenderit nulla in labore Lorem magna. Voluptate ea adipisicing Lorem non cupidatat pariatur commodo eiusmod mollit pariatur velit ex et aute. Consequat laborum in irure veniam non dolore et quis esse eu cillum proident nisi non. Aliqua officia laborum proident non veniam id reprehenderit sunt. Labore excepteur laborum quis ea fugiat ullamco excepteur eu ipsum. Minim ad ut cupidatat mollit ea eu. Ea duis duis eu magna reprehenderit elit voluptate tempor est do. Labore reprehenderit consequat duis elit do amet commodo est minim. Voluptate adipisicing id tempor sint eiusmod aliquip ipsum incididunt laboris ut. Exercitation eu irure consequat deserunt culpa do. Excepteur mollit dolor do est tempor. Ea dolor amet non amet Lorem cillum nulla sit est. Dolor velit labore ea dolore fugiat reprehenderit. Consequat dolor eu id labore excepteur elit. Irure ea cupidatat irure elit nulla minim velit eu mollit dolor tempor anim ipsum pariatur. Culpa consequat commodo Lorem anim ullamco qui non qui ad cupidatat ad culpa voluptate. Ad eu occaecat proident ullamco ad elit ipsum est dolor. Ea exercitation culpa dolor irure adipisicing. Magna pariatur laboris voluptate Lorem nisi consequat occaecat nulla excepteur dolor proident deserunt commodo duis. Anim laboris labore aliqua aliqua deserunt duis labore Lorem qui tempor dolore. Esse et proident sunt sit nostrud sint. Ad aliqua adipisicing qui proident in aliqua do reprehenderit duis. Ex dolore exercitation aute veniam ut aliqua adipisicing adipisicing laborum nulla ea anim eu. Officia nostrud dolore magna amet. Magna pariatur fugiat pariatur velit tempor culpa occaecat ullamco id. Id pariatur nulla anim tempor aute amet. Deserunt velit laborum ea incididunt enim in amet cupidatat deserunt laborum et ullamco sunt do. Aliquip aliqua consectetur consequat sit enim est est id anim pariatur elit voluptate. Quis cillum irure labore commodo excepteur. Et commodo in laborum quis esse in quis. Dolor amet ut consectetur cupidatat minim esse.', 'TitreDuProgramme', 1, '2025-04-04 15:43:33', '2025-04-04 15:43:33');

-- --------------------------------------------------------

--
-- Structure de la table `membres_listes`
--

CREATE TABLE `membres_listes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tete_liste` tinyint(1) NOT NULL DEFAULT 0,
  `list_id` bigint(20) UNSIGNED NOT NULL,
  `id_membre` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `membres_listes`
--

INSERT INTO `membres_listes` (`id`, `tete_liste`, `list_id`, `id_membre`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '2025-04-04 15:43:33', '2025-04-04 15:43:33'),
(2, 0, 1, 3, '2025-04-04 15:43:33', '2025-04-04 15:43:33'),
(3, 1, 2, 1, '2025-04-04 15:43:33', '2025-04-04 15:43:33'),
(4, 0, 2, 3, '2025-04-04 15:43:33', '2025-04-04 15:43:33'),
(5, 1, 3, 1, '2025-04-04 15:43:33', '2025-04-04 15:43:33'),
(6, 0, 3, 2, '2025-04-04 15:43:33', '2025-04-04 15:43:33'),
(7, 0, 3, 3, '2025-04-04 15:43:33', '2025-04-04 15:43:33');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_29_161151_create_etudiant_officiels_table', 1),
(5, '2025_04_01_123350_create_admins_table', 1),
(6, '2025_04_01_130122_create_ufrs_table', 1),
(7, '2025_04_01_133423_create_etudiants_table', 1),
(8, '2025_04_02_012537_create_votes_table', 1),
(9, '2025_04_02_013118_add_vote_id_to_ufrs_table', 1),
(10, '2025_04_02_142742_update_foreign_key_in_listes_table', 1),
(11, '2025_04_02_143105_create_listes_table', 1),
(12, '2025_04_04_003722_create_vote_etudiants_table', 1),
(13, '2025_04_04_003849_add_list_id_to_vote_etudiants_table', 1),
(14, '2025_04_04_005240_create_membres_listes_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Pvs28YYYJEdJiIrxKwzSkA02jmk80TKh0e8YWlJ7', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN284UmZtZVNjQ1dTQUxhNWxidWpJdTNhTzFmZFlFckRrUVB1VnRxdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtzOjE6IjEiO30=', 1743741320);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-04-04 15:43:28', '$2y$12$f5k6uwmINH0OU2.gT.RXou.r4m9VLUgKw/vfbXGzqV/3DBsc7/any', 'J96FzWmmHt', '2025-04-04 15:43:29', '2025-04-04 15:43:29');

-- --------------------------------------------------------

--
-- Structure de la table `u_f_r_s`
--

CREATE TABLE `u_f_r_s` (
  `id_ufr` bigint(20) UNSIGNED NOT NULL,
  `vote_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nom` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `u_f_r_s`
--

INSERT INTO `u_f_r_s` (`id_ufr`, `vote_id`, `nom`, `created_at`, `updated_at`) VALUES
(1, 1, 'sat', '2025-04-04 15:43:29', '2025-04-04 15:43:29'),
(2, NULL, 'sjp', '2025-04-04 15:43:29', '2025-04-04 15:43:29');

-- --------------------------------------------------------

--
-- Structure de la table `votes`
--

CREATE TABLE `votes` (
  `id_vote` bigint(20) UNSIGNED NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `etudiant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `votes`
--

INSERT INTO `votes` (`id_vote`, `date_debut`, `date_fin`, `etudiant_id`, `created_at`, `updated_at`) VALUES
(1, '2025-04-02', '2025-05-05', 1, '2025-04-04 15:43:34', '2025-04-04 15:43:34'),
(2, '2025-04-01', '2025-04-15', 2, '2025-04-04 15:43:34', '2025-04-04 15:43:34');

-- --------------------------------------------------------

--
-- Structure de la table `vote_etudiants`
--

CREATE TABLE `vote_etudiants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `etudiant_id` bigint(20) UNSIGNED NOT NULL,
  `vote_id` bigint(20) UNSIGNED NOT NULL,
  `list_id` bigint(20) UNSIGNED NOT NULL,
  `voted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vote_etudiants`
--

INSERT INTO `vote_etudiants` (`id`, `etudiant_id`, `vote_id`, `list_id`, `voted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2025-04-02 01:01:25', '2025-04-04 15:43:34', '2025-04-04 15:43:34'),
(2, 2, 1, 2, '2025-04-02 05:43:01', '2025-04-04 15:43:34', '2025-04-04 15:43:34'),
(3, 3, 1, 1, '2025-04-02 13:14:54', '2025-04-04 15:43:34', '2025-04-04 15:43:34'),
(4, 4, 1, 2, '2025-04-03 05:21:45', '2025-04-04 15:43:34', '2025-04-04 15:43:34'),
(5, 5, 1, 3, '2025-04-03 06:44:55', '2025-04-04 15:43:34', '2025-04-04 15:43:34');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD UNIQUE KEY `etudiants_code_etudiant_unique` (`code_etudiant`),
  ADD UNIQUE KEY `etudiants_email_unique` (`email`),
  ADD KEY `etudiants_ufr_id_foreign` (`ufr_id`);

--
-- Index pour la table `etudiant_officiels`
--
ALTER TABLE `etudiant_officiels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `etudiant_officiels_code_unique` (`code`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `listes`
--
ALTER TABLE `listes`
  ADD PRIMARY KEY (`id_list`),
  ADD KEY `listes_ufr_id_foreign` (`ufr_id`);

--
-- Index pour la table `membres_listes`
--
ALTER TABLE `membres_listes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `membres_listes_list_id_foreign` (`list_id`),
  ADD KEY `membres_listes_id_membre_foreign` (`id_membre`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `u_f_r_s`
--
ALTER TABLE `u_f_r_s`
  ADD PRIMARY KEY (`id_ufr`),
  ADD UNIQUE KEY `u_f_r_s_nom_unique` (`nom`),
  ADD KEY `u_f_r_s_vote_id_foreign` (`vote_id`);

--
-- Index pour la table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id_vote`),
  ADD KEY `votes_etudiant_id_foreign` (`etudiant_id`);

--
-- Index pour la table `vote_etudiants`
--
ALTER TABLE `vote_etudiants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote_etudiants_etudiant_id_foreign` (`etudiant_id`),
  ADD KEY `vote_etudiants_vote_id_foreign` (`vote_id`),
  ADD KEY `vote_etudiants_list_id_foreign` (`list_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `id_etudiant` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `etudiant_officiels`
--
ALTER TABLE `etudiant_officiels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `listes`
--
ALTER TABLE `listes`
  MODIFY `id_list` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `membres_listes`
--
ALTER TABLE `membres_listes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `u_f_r_s`
--
ALTER TABLE `u_f_r_s`
  MODIFY `id_ufr` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `votes`
--
ALTER TABLE `votes`
  MODIFY `id_vote` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `vote_etudiants`
--
ALTER TABLE `vote_etudiants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `etudiants_code_etudiant_foreign` FOREIGN KEY (`code_etudiant`) REFERENCES `etudiant_officiels` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `etudiants_ufr_id_foreign` FOREIGN KEY (`ufr_id`) REFERENCES `u_f_r_s` (`id_ufr`) ON DELETE CASCADE;

--
-- Contraintes pour la table `listes`
--
ALTER TABLE `listes`
  ADD CONSTRAINT `listes_ufr_id_foreign` FOREIGN KEY (`ufr_id`) REFERENCES `u_f_r_s` (`id_ufr`) ON DELETE CASCADE;

--
-- Contraintes pour la table `membres_listes`
--
ALTER TABLE `membres_listes`
  ADD CONSTRAINT `membres_listes_id_membre_foreign` FOREIGN KEY (`id_membre`) REFERENCES `etudiants` (`id_etudiant`) ON DELETE CASCADE,
  ADD CONSTRAINT `membres_listes_list_id_foreign` FOREIGN KEY (`list_id`) REFERENCES `listes` (`id_list`) ON DELETE CASCADE;

--
-- Contraintes pour la table `u_f_r_s`
--
ALTER TABLE `u_f_r_s`
  ADD CONSTRAINT `u_f_r_s_vote_id_foreign` FOREIGN KEY (`vote_id`) REFERENCES `votes` (`id_vote`) ON DELETE SET NULL;

--
-- Contraintes pour la table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_etudiant_id_foreign` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants` (`id_etudiant`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vote_etudiants`
--
ALTER TABLE `vote_etudiants`
  ADD CONSTRAINT `vote_etudiants_etudiant_id_foreign` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants` (`id_etudiant`) ON DELETE CASCADE,
  ADD CONSTRAINT `vote_etudiants_list_id_foreign` FOREIGN KEY (`list_id`) REFERENCES `listes` (`id_list`) ON DELETE CASCADE,
  ADD CONSTRAINT `vote_etudiants_vote_id_foreign` FOREIGN KEY (`vote_id`) REFERENCES `votes` (`id_vote`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
