-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 28 Juin 2019 à 12:07
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `sourcing`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Contenu de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add user', 2, 'add_user'),
(5, 'Can change user', 2, 'change_user'),
(6, 'Can delete user', 2, 'delete_user'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add permission', 4, 'add_permission'),
(11, 'Can change permission', 4, 'change_permission'),
(12, 'Can delete permission', 4, 'delete_permission'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add candidat', 7, 'add_candidat'),
(20, 'Can change candidat', 7, 'change_candidat'),
(21, 'Can delete candidat', 7, 'delete_candidat'),
(22, 'Can add recruteur', 8, 'add_recruteur'),
(23, 'Can change recruteur', 8, 'change_recruteur'),
(24, 'Can delete recruteur', 8, 'delete_recruteur'),
(25, 'Can add curriculum', 9, 'add_curriculum'),
(26, 'Can change curriculum', 9, 'change_curriculum'),
(27, 'Can delete curriculum', 9, 'delete_curriculum'),
(28, 'Can add specialite', 10, 'add_specialite'),
(29, 'Can change specialite', 10, 'change_specialite'),
(30, 'Can delete specialite', 10, 'delete_specialite'),
(31, 'Can add candidat offre', 11, 'add_candidatoffre'),
(32, 'Can change candidat offre', 11, 'change_candidatoffre'),
(33, 'Can delete candidat offre', 11, 'delete_candidatoffre'),
(34, 'Can add offre', 12, 'add_offre'),
(35, 'Can change offre', 12, 'change_offre'),
(36, 'Can delete offre', 12, 'delete_offre'),
(37, 'Can add categorie', 13, 'add_categorie'),
(38, 'Can change categorie', 13, 'change_categorie'),
(39, 'Can delete categorie', 13, 'delete_categorie'),
(40, 'Can add postulation', 14, 'add_postulation'),
(41, 'Can change postulation', 14, 'change_postulation'),
(42, 'Can delete postulation', 14, 'delete_postulation'),
(43, 'Can add mot cle', 15, 'add_motcle'),
(44, 'Can change mot cle', 15, 'change_motcle'),
(45, 'Can delete mot cle', 15, 'delete_motcle');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$xFq22pKQSmRH$dTIPdLV0ZFuTUKfGTMC5+9kMPmTMf6sQ5VdAQ6ttfTw=', '2019-05-15 06:00:34.238345', 1, 'aina', '', '', 'raharitsiresy@gmail.com', 1, 1, '2019-05-05 12:15:57.596989'),
(2, 'pbkdf2_sha256$36000$gZAoesFHi7bZ$497UzHzioJlRDOrbuyhBwX3u0VR60UNwmiTlPGWnJMo=', '2019-06-27 07:38:55.126280', 1, 'malto', '', '', 'raharitsiresy@gmail.com', 1, 1, '2019-06-27 07:38:31.665967');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_candidatoffre`
--

CREATE TABLE IF NOT EXISTS `dashboard_candidatoffre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidat_id` int(11) NOT NULL,
  `offre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_candidatof_candidat_id_5ee6f617_fk_myapp_can` (`candidat_id`),
  KEY `dashboard_candidatoffre_offre_id_273260ab_fk_dashboard_offre_id` (`offre_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `dashboard_candidatoffre`
--

INSERT INTO `dashboard_candidatoffre` (`id`, `candidat_id`, `offre_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_categorie`
--

CREATE TABLE IF NOT EXISTS `dashboard_categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `denomination` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `dashboard_categorie`
--

INSERT INTO `dashboard_categorie` (`id`, `denomination`) VALUES
(1, 'Informatique'),
(2, 'Evenementiel'),
(3, 'Comptabilité'),
(4, 'Industriel'),
(5, 'Commerce'),
(6, 'Droit et techniques juridiques'),
(7, 'Saisie/Rédaction');

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_curriculum`
--

CREATE TABLE IF NOT EXISTS `dashboard_curriculum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cv` varchar(200) NOT NULL,
  `chemin` longtext,
  `date_cv` datetime(6) NOT NULL,
  `candicat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_curriculum_candicat_id_0f229737_fk_myapp_candidat_id` (`candicat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_curriculum_specialites`
--

CREATE TABLE IF NOT EXISTS `dashboard_curriculum_specialites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curriculum_id` int(11) NOT NULL,
  `specialite_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboard_curriculum_spe_curriculum_id_specialite_a3a57e7e_uniq` (`curriculum_id`,`specialite_id`),
  KEY `dashboard_curriculum_specialite_id_65159896_fk_dashboard` (`specialite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_motcle`
--

CREATE TABLE IF NOT EXISTS `dashboard_motcle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mot` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `dashboard_motcle`
--

INSERT INTO `dashboard_motcle` (`id`, `mot`) VALUES
(1, 'Mecanique'),
(2, 'commercial'),
(3, 'marketing'),
(4, 'commerce'),
(5, 'informatique'),
(6, 'digital'),
(7, 'infographie'),
(8, 'bâtiment'),
(9, 'btp');

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_offre`
--

CREATE TABLE IF NOT EXISTS `dashboard_offre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intutile` varchar(100) NOT NULL,
  `description` longtext,
  `mission` longtext,
  `date_limite` datetime(6) NOT NULL,
  `date_publication` datetime(6) NOT NULL,
  `recruteur_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_offre_recruteur_id_74829432_fk_myapp_recruteur_id` (`recruteur_id`),
  KEY `dashboard_offre_categorie_id_f82b2871_fk_dashboard_categorie_id` (`categorie_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `dashboard_offre`
--

INSERT INTO `dashboard_offre` (`id`, `intutile`, `description`, `mission`, `date_limite`, `date_publication`, `recruteur_id`, `categorie_id`) VALUES
(1, 'Commercial Pièces de rechanges', 'Bac+2 en commerce, \r\n2 ans d''expériences dans la ventes pièces détachées,\r\nConnaissances solides en pièces détachées automobile,\r\nIntérêt pour l''apprentissage\r\nQualité relationnelle, poli\r\nBon niveau de Français', 'Accueil des clients, recherche références pièces, cotation, vente proprement dite, Intérim du responsable PR en cas d''absence.', '2019-07-31 12:20:42.000000', '2019-05-05 12:20:44.000000', 1, 5),
(2, 'Commercial de terrain', 'Bac+2 en marketing et commerce,\r\nplus de 2 ans d’expérience,\r\norganisé et méthodique,\r\nconnaissance de Sage Gestion Commerciale', 'effectuer les visites journalières,\r\ngérer le portefeuille client,\r\nsuivre les ventes,\r\natteindre les objectifs', '2019-08-23 06:02:54.000000', '2019-05-15 06:02:54.000000', 1, 5),
(3, 'Commercial', 'Minimum bac+3 des universités et/ou expériences réussies des plusieurs années dans le domaine de l''énergie renouvelable,\r\nDynamique,\r\nmotivé,\r\nrigoureux,\r\nautonome,\r\ndisponible de suite', 'Vente en gros et détail des appareils médicaux et appareil solaire,\r\nMission en province', '2019-07-15 06:17:29.000000', '2019-05-15 06:17:29.000000', 1, 5),
(4, 'Developpeur Mobile iOS-android', 'Diplôme en informatique,\r\nExpérience professionnelle sur le même type de poste,\r\nPour iOS natif : Swift ou Objective C et POO,\r\nPour android natif : Java ou Kotlin et POO,\r\nPour Hybrid : Framework JS ou Xamarin,\r\nExpérience avec les API REST,\r\nMaîtrise de l''Anglais,', 'Développer des applications mobiles au sein d''un environnement international,\r\nTravailler à la fois sur des projets locaux et internationaux', '2019-08-01 07:49:10.000000', '2019-06-27 07:49:10.000000', 2, 1),
(5, 'Operateur back office web', 'Bac + 2 en gestion ou commerce,\r\nMaîtrise de la langue française,\r\nBon sens logique et du détail,\r\nRéactif,\r\nDynamique,', 'Recherche de contacts,\r\nMise à jour base de données,\r\nRecherche diverses,', '2019-07-26 07:59:23.000000', '2019-06-27 07:59:23.000000', 1, 5),
(6, 'Infographiste', 'Maîtrise de la PAO-Infographie-3D,\r\nCréatif et organisé,\r\nExpérience réussie,', 'Concevoir des images 3D,\r\nRéaliser une maquette avec les images,\r\nAssurer la création et la réalisation de support de communication en PAO,\r\nTraiter des textes-des images et des dessins,', '2019-07-19 08:05:32.000000', '2019-06-27 08:05:32.000000', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_offre_mot_cle`
--

CREATE TABLE IF NOT EXISTS `dashboard_offre_mot_cle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offre_id` int(11) NOT NULL,
  `motcle_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboard_offre_mot_cle_offre_id_motcle_id_710ee639_uniq` (`offre_id`,`motcle_id`),
  KEY `dashboard_offre_mot__motcle_id_1feb64f9_fk_dashboard` (`motcle_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `dashboard_offre_mot_cle`
--

INSERT INTO `dashboard_offre_mot_cle` (`id`, `offre_id`, `motcle_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 2),
(6, 2, 3),
(7, 2, 4),
(8, 3, 2),
(9, 3, 4),
(10, 4, 5),
(11, 4, 6),
(12, 5, 2),
(13, 5, 3),
(14, 5, 6),
(17, 6, 7),
(15, 6, 8),
(16, 6, 9);

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_postulation`
--

CREATE TABLE IF NOT EXISTS `dashboard_postulation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chemin_lettre` longtext,
  `date_postulation` datetime(6) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `offre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboard_postulation_candidat_id_offre_id_fd273592_uniq` (`candidat_id`,`offre_id`),
  KEY `dashboard_postulation_offre_id_81013467_fk_dashboard_offre_id` (`offre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_specialite`
--

CREATE TABLE IF NOT EXISTS `dashboard_specialite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(200) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_specialite_categorie_id_bb7c05c8_fk_dashboard` (`categorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Contenu de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-05-05 12:17:42.642126', '1', 'Informatique', 1, '[{"added": {}}]', 13, 1),
(2, '2019-05-05 12:17:58.867329', '2', 'Evenementiel', 1, '[{"added": {}}]', 13, 1),
(3, '2019-05-05 12:18:13.189932', '3', 'Comptabilité', 1, '[{"added": {}}]', 13, 1),
(4, '2019-05-05 12:18:25.836804', '4', 'Industriel', 1, '[{"added": {}}]', 13, 1),
(5, '2019-05-05 12:18:53.716404', '5', 'Commerce', 1, '[{"added": {}}]', 13, 1),
(6, '2019-05-05 12:19:15.396489', '6', 'Droit et techniques juridiques', 1, '[{"added": {}}]', 13, 1),
(7, '2019-05-05 12:20:14.826266', '7', 'Saisie/Rédaction', 1, '[{"added": {}}]', 13, 1),
(8, '2019-05-05 12:25:59.893877', '1', 'Mecanique', 1, '[{"added": {}}]', 15, 1),
(9, '2019-05-05 12:26:10.856629', '2', 'commercial', 1, '[{"added": {}}]', 15, 1),
(10, '2019-05-05 12:26:18.905627', '3', 'marketing', 1, '[{"added": {}}]', 15, 1),
(11, '2019-05-05 12:26:32.659728', '4', 'commerce', 1, '[{"added": {}}]', 15, 1),
(12, '2019-05-05 12:26:38.285020', '1', 'Commercial Pièces de rechanges Bac+2 en commerce, \r\n2 ans d''expériences dans la ventes pièces détachées,\r\nConnaissances solides en pièces détachées automobile,\r\nIntérêt pour l''apprentissage\r\nQualité r', 1, '[{"added": {}}]', 12, 1),
(13, '2019-05-05 12:29:12.598453', '1', 'CandidatOffre object', 1, '[{"added": {}}]', 11, 1),
(14, '2019-05-15 06:17:29.543206', '2', 'Commercial de terrain Bac+2 en marketing et commerce,\r\nplus de 2 ans d’expérience,\r\norganisé et méthodique,\r\nconnaissance de Sage Gestion Commerciale', 1, '[{"added": {}}]', 12, 1),
(15, '2019-05-15 06:21:43.597869', '3', 'Commercial Minimum bac+3 des universités et/ou expériences réussies des plusieurs années dans le domaine de l''énergie renouvelable,\r\nDynamique,\r\nmotivé,\r\nrigoureux,\r\nautonome,\r\ndisponible de suite', 1, '[{"added": {}}]', 12, 1),
(16, '2019-05-15 06:22:04.733824', '2', 'CandidatOffre object', 1, '[{"added": {}}]', 11, 1),
(17, '2019-05-15 06:22:10.011920', '3', 'CandidatOffre object', 1, '[{"added": {}}]', 11, 1),
(18, '2019-06-27 07:39:41.659233', '1', 'Commercial Pièces de rechanges Bac+2 en commerce, \r\n2 ans d''expériences dans la ventes pièces détachées,\r\nConnaissances solides en pièces détachées automobile,\r\nIntérêt pour l''apprentissage\r\nQualité r', 2, '[{"changed": {"fields": ["date_limite"]}}]', 12, 2),
(19, '2019-06-27 07:59:00.353418', '5', 'informatique', 1, '[{"added": {}}]', 15, 2),
(20, '2019-06-27 07:59:10.791761', '6', 'digital', 1, '[{"added": {}}]', 15, 2),
(21, '2019-06-27 07:59:23.195190', '4', 'Developpeur Mobile iOS-android Diplôme en informatique,\r\nExpérience professionnelle sur le même type de poste,\r\nPour iOS natif : Swift ou Objective C et POO,\r\nPour android natif : Java ou Kotlin et PO', 1, '[{"added": {}}]', 12, 2),
(22, '2019-06-27 08:05:31.863073', '5', 'Operateur back office web Bac + 2 en gestion ou commerce,\r\nMaîtrise de la langue française,\r\nBon sens logique et du détail,\r\nRéactif,\r\nDynamique,', 1, '[{"added": {}}]', 12, 2),
(23, '2019-06-27 08:10:39.959119', '7', 'infographie', 1, '[{"added": {}}]', 15, 2),
(24, '2019-06-27 08:10:58.383809', '8', 'bâtiment', 1, '[{"added": {}}]', 15, 2),
(25, '2019-06-27 08:11:04.577783', '9', 'btp', 1, '[{"added": {}}]', 15, 2),
(26, '2019-06-27 08:11:13.415903', '6', 'Infographiste Maîtrise de la PAO-Infographie-3D,\r\nCréatif et organisé,\r\nExpérience réussie,', 1, '[{"added": {}}]', 12, 2),
(27, '2019-06-27 10:05:43.222070', '1', 'Commercial Pièces de rechanges Bac+2 en commerce, \r\n2 ans d''expériences dans la ventes pièces détachées,\r\nConnaissances solides en pièces détachées automobile,\r\nIntérêt pour l''apprentissage\r\nQualité r', 2, '[{"changed": {"fields": ["categorie"]}}]', 12, 2),
(28, '2019-06-27 10:05:55.651002', '2', 'Commercial de terrain Bac+2 en marketing et commerce,\r\nplus de 2 ans d’expérience,\r\norganisé et méthodique,\r\nconnaissance de Sage Gestion Commerciale', 2, '[{"changed": {"fields": ["categorie"]}}]', 12, 2),
(29, '2019-06-27 10:06:11.506935', '3', 'Commercial Minimum bac+3 des universités et/ou expériences réussies des plusieurs années dans le domaine de l''énergie renouvelable,\r\nDynamique,\r\nmotivé,\r\nrigoureux,\r\nautonome,\r\ndisponible de suite', 2, '[{"changed": {"fields": ["categorie"]}}]', 12, 2),
(30, '2019-06-27 10:06:22.791157', '4', 'Developpeur Mobile iOS-android Diplôme en informatique,\r\nExpérience professionnelle sur le même type de poste,\r\nPour iOS natif : Swift ou Objective C et POO,\r\nPour android natif : Java ou Kotlin et PO', 2, '[]', 12, 2),
(31, '2019-06-27 10:06:42.281461', '5', 'Operateur back office web Bac + 2 en gestion ou commerce,\r\nMaîtrise de la langue française,\r\nBon sens logique et du détail,\r\nRéactif,\r\nDynamique,', 2, '[{"changed": {"fields": ["categorie"]}}]', 12, 2),
(32, '2019-06-27 10:06:55.960221', '6', 'Infographiste Maîtrise de la PAO-Infographie-3D,\r\nCréatif et organisé,\r\nExpérience réussie,', 2, '[]', 12, 2),
(33, '2019-06-27 12:15:59.025792', '2', 'Commercial de terrain Bac+2 en marketing et commerce,\r\nplus de 2 ans d’expérience,\r\norganisé et méthodique,\r\nconnaissance de Sage Gestion Commerciale', 2, '[{"changed": {"fields": ["date_limite"]}}]', 12, 2),
(34, '2019-06-27 12:16:50.198170', '3', 'Commercial Minimum bac+3 des universités et/ou expériences réussies des plusieurs années dans le domaine de l''énergie renouvelable,\r\nDynamique,\r\nmotivé,\r\nrigoureux,\r\nautonome,\r\ndisponible de suite', 2, '[{"changed": {"fields": ["date_limite"]}}]', 12, 2);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(4, 'auth', 'permission'),
(2, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'dashboard', 'candidatoffre'),
(13, 'dashboard', 'categorie'),
(9, 'dashboard', 'curriculum'),
(15, 'dashboard', 'motcle'),
(12, 'dashboard', 'offre'),
(14, 'dashboard', 'postulation'),
(10, 'dashboard', 'specialite'),
(7, 'myapp', 'candidat'),
(8, 'myapp', 'recruteur'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-05-05 12:06:56.554844'),
(2, 'auth', '0001_initial', '2019-05-05 12:07:21.201520'),
(3, 'admin', '0001_initial', '2019-05-05 12:07:26.086280'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-05-05 12:07:26.220871'),
(5, 'contenttypes', '0002_remove_content_type_name', '2019-05-05 12:07:29.420538'),
(6, 'auth', '0002_alter_permission_name_max_length', '2019-05-05 12:07:31.746903'),
(7, 'auth', '0003_alter_user_email_max_length', '2019-05-05 12:07:34.107070'),
(8, 'auth', '0004_alter_user_username_opts', '2019-05-05 12:07:34.239762'),
(9, 'auth', '0005_alter_user_last_login_null', '2019-05-05 12:07:35.719418'),
(10, 'auth', '0006_require_contenttypes_0002', '2019-05-05 12:07:35.825131'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2019-05-05 12:07:35.930528'),
(12, 'auth', '0008_alter_user_username_max_length', '2019-05-05 12:07:37.998723'),
(13, 'myapp', '0001_initial', '2019-05-05 12:07:44.046367'),
(14, 'myapp', '0002_auto_20190307_1420', '2019-05-05 12:08:08.075965'),
(15, 'dashboard', '0001_initial', '2019-05-05 12:08:56.754689'),
(16, 'sessions', '0001_initial', '2019-05-05 12:08:58.946442'),
(17, 'dashboard', '0002_auto_20190308_1048', '2019-06-27 09:54:52.411993'),
(18, 'dashboard', '0003_auto_20190308_1215', '2019-06-27 09:54:52.514072'),
(19, 'dashboard', '0004_offre_categorie', '2019-06-27 09:54:52.552092'),
(20, 'dashboard', '0005_remove_offre_categorie', '2019-06-27 09:58:57.388735'),
(21, 'dashboard', '0006_offre_categorie', '2019-06-27 10:04:27.175595');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('41jgsoz8lkoofgtut615rrpg3lvw0dbj', 'MjlmMzhmMWE4YjdhM2MxYzE3Njc5MDQzYTg5ZmFkMDhhZDU3NWQ1ZDp7ImlkX3VzZXIiOjEsImVzdFJlYyI6ZmFsc2V9', '2019-07-11 06:47:24.762099'),
('al3en18aqdc76y0gm83ymatsvl13isda', 'M2UxNzRkMjZmMTk1NzcyNjU2NWFjZDgwMzliZTZmZjYwYWIyZTE1Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiZXN0UmVjIjpmYWxzZSwiX2F1dGhfdXNlcl9oYXNoIjoiYmVlMTg0YzY2ZWE0ZjU3ZDEzZGE2M2QxZTBhNTJmYTk5YjNiYzQwNyIsImlkX3VzZXIiOjEsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2019-07-11 07:49:36.809455'),
('ek7z2zrora6zrg445vu03g92gqhr76lq', 'NWFlZGE1NjA0NzU2ZDdlMDE2MDEyNmE2YmM0YjA5OTMzZTBhNjI3Mzp7ImVzdFJlYyI6ZmFsc2UsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjY5Njg1Yjc2MDBiM2NkZDVlYjAwZjU2NzQzNjU2NzA5MzUyYmI2NyIsImlkX3VzZXIiOjEsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-05-29 08:11:51.879607'),
('gw1oaovu0lru2ruca8iweqcelpdkmnpw', 'MjlmMzhmMWE4YjdhM2MxYzE3Njc5MDQzYTg5ZmFkMDhhZDU3NWQ1ZDp7ImlkX3VzZXIiOjEsImVzdFJlYyI6ZmFsc2V9', '2019-07-11 06:47:27.190354'),
('mx6pdxb4ie2hprb7eaifshh44wcruk7y', 'MjZkMDM0ODllYmJlNzA3NWUwMjMyYzlmZGVlOWJmNDBhNzk5ZGRlOTp7ImlkX3VzZXIiOjEsIl9hdXRoX3VzZXJfaGFzaCI6IjY2OTY4NWI3NjAwYjNjZGQ1ZWIwMGY1Njc0MzY1NjcwOTM1MmJiNjciLCJfYXV0aF91c2VyX2lkIjoiMSIsImVzdFJlYyI6dHJ1ZSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2019-05-22 14:24:21.350626'),
('uuwmlpx4k0xwmingoulql04y6fnq7xgh', 'MjlmMzhmMWE4YjdhM2MxYzE3Njc5MDQzYTg5ZmFkMDhhZDU3NWQ1ZDp7ImlkX3VzZXIiOjEsImVzdFJlYyI6ZmFsc2V9', '2019-07-11 06:47:27.550752');

-- --------------------------------------------------------

--
-- Structure de la table `myapp_candidat`
--

CREATE TABLE IF NOT EXISTS `myapp_candidat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `ddn` date NOT NULL,
  `sexe` varchar(1) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `photo_profil` longtext NOT NULL,
  `adresse` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `myapp_candidat`
--

INSERT INTO `myapp_candidat` (`id`, `nom`, `prenom`, `ddn`, `sexe`, `mail`, `password`, `photo_profil`, `adresse`) VALUES
(1, 'Rakoto', 'Jean', '2019-05-05', '', 'rj@gmail.com', 'pbkdf2_sha256$36000$5ENAMUB5BP9h$3LFtdBKBNQ/OP9couspf+R9dskC3yZ3vzySweXzYn/I=', 'user.jpg', '');

-- --------------------------------------------------------

--
-- Structure de la table `myapp_recruteur`
--

CREATE TABLE IF NOT EXISTS `myapp_recruteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `adresse_societe` longtext NOT NULL,
  `ddn` date NOT NULL,
  `logo_societe` longtext NOT NULL,
  `mail` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `nom_societe` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `sexe` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `myapp_recruteur`
--

INSERT INTO `myapp_recruteur` (`id`, `description`, `adresse_societe`, `ddn`, `logo_societe`, `mail`, `nom`, `nom_societe`, `password`, `prenom`, `sexe`) VALUES
(1, '', '', '2019-05-05', 'logo.jpg', 'malto@gmail.com', 'Razafindramanitra', 'Anonyme', 'pbkdf2_sha256$36000$CO5fjhEXPeuK$iTa2Tmt7Qgd607w/YE5CvGIgX9CA+kllFHXDjlSqjo4=', 'Andrianina', ''),
(2, '', '', '2019-06-27', 'logo.jpg', 'tsiky@gmail.com', 'Mada', 'Anonyme', 'pbkdf2_sha256$36000$VpXVMpCjC1KC$rL0nn4lp2AO5N3Efuug9QCDo3HueQaZEohYSA8hfB9c=', 'Tsikitsiky', ''),
(3, '', '', '2019-06-27', 'logo.jpg', 'hcm@gmail.com', 'Benz', 'Anonyme', 'pbkdf2_sha256$36000$0nykwfpPRecx$dtVaFlFtuu1Mcibc3j+6dptaMGYgkP3Jw6USkOKChFQ=', 'hcm', '');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `dashboard_candidatoffre`
--
ALTER TABLE `dashboard_candidatoffre`
  ADD CONSTRAINT `dashboard_candidatoffre_offre_id_273260ab_fk_dashboard_offre_id` FOREIGN KEY (`offre_id`) REFERENCES `dashboard_offre` (`id`),
  ADD CONSTRAINT `dashboard_candidatof_candidat_id_5ee6f617_fk_myapp_can` FOREIGN KEY (`candidat_id`) REFERENCES `myapp_candidat` (`id`);

--
-- Contraintes pour la table `dashboard_curriculum`
--
ALTER TABLE `dashboard_curriculum`
  ADD CONSTRAINT `dashboard_curriculum_candicat_id_0f229737_fk_myapp_candidat_id` FOREIGN KEY (`candicat_id`) REFERENCES `myapp_candidat` (`id`);

--
-- Contraintes pour la table `dashboard_curriculum_specialites`
--
ALTER TABLE `dashboard_curriculum_specialites`
  ADD CONSTRAINT `dashboard_curriculum_curriculum_id_9008c03e_fk_dashboard` FOREIGN KEY (`curriculum_id`) REFERENCES `dashboard_curriculum` (`id`),
  ADD CONSTRAINT `dashboard_curriculum_specialite_id_65159896_fk_dashboard` FOREIGN KEY (`specialite_id`) REFERENCES `dashboard_specialite` (`id`);

--
-- Contraintes pour la table `dashboard_offre`
--
ALTER TABLE `dashboard_offre`
  ADD CONSTRAINT `dashboard_offre_categorie_id_f82b2871_fk_dashboard_categorie_id` FOREIGN KEY (`categorie_id`) REFERENCES `dashboard_categorie` (`id`),
  ADD CONSTRAINT `dashboard_offre_recruteur_id_74829432_fk_myapp_recruteur_id` FOREIGN KEY (`recruteur_id`) REFERENCES `myapp_recruteur` (`id`);

--
-- Contraintes pour la table `dashboard_offre_mot_cle`
--
ALTER TABLE `dashboard_offre_mot_cle`
  ADD CONSTRAINT `dashboard_offre_mot_cle_offre_id_127694a2_fk_dashboard_offre_id` FOREIGN KEY (`offre_id`) REFERENCES `dashboard_offre` (`id`),
  ADD CONSTRAINT `dashboard_offre_mot__motcle_id_1feb64f9_fk_dashboard` FOREIGN KEY (`motcle_id`) REFERENCES `dashboard_motcle` (`id`);

--
-- Contraintes pour la table `dashboard_postulation`
--
ALTER TABLE `dashboard_postulation`
  ADD CONSTRAINT `dashboard_postulation_candidat_id_692d02f4_fk_myapp_candidat_id` FOREIGN KEY (`candidat_id`) REFERENCES `myapp_candidat` (`id`),
  ADD CONSTRAINT `dashboard_postulation_offre_id_81013467_fk_dashboard_offre_id` FOREIGN KEY (`offre_id`) REFERENCES `dashboard_offre` (`id`);

--
-- Contraintes pour la table `dashboard_specialite`
--
ALTER TABLE `dashboard_specialite`
  ADD CONSTRAINT `dashboard_specialite_categorie_id_bb7c05c8_fk_dashboard` FOREIGN KEY (`categorie_id`) REFERENCES `dashboard_categorie` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
