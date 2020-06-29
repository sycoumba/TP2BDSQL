-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 29 juin 2020 à 18:25
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `banque_peuple`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id_administrateur` int(11) NOT NULL,
  `login_administrateur` varchar(25) NOT NULL,
  `mot_de_passe` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

CREATE TABLE `agence` (
  `id_agence` int(11) NOT NULL,
  `adresse` varchar(25) NOT NULL,
  `id_administrateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `agios`
--

CREATE TABLE `agios` (
  `id_agios` int(11) NOT NULL,
  `montant` double NOT NULL,
  `taux` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `caissiere`
--

CREATE TABLE `caissiere` (
  `id_caissiere` int(11) NOT NULL,
  `login_caissiere` varchar(25) NOT NULL,
  `mot_de_passe` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `adresse` varchar(25) NOT NULL,
  `telephone` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `client_moral`
--

CREATE TABLE `client_moral` (
  `id_entreprise` int(11) NOT NULL,
  `nom_entreprise` varchar(50) NOT NULL,
  `type_entreprise` varchar(25) NOT NULL,
  `raison_social` varchar(25) NOT NULL,
  `identifiant_entreprise` varchar(25) DEFAULT NULL,
  `adresse_entreprise` varchar(25) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `client_non_salarie`
--

CREATE TABLE `client_non_salarie` (
  `id_non_salarie` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `activite` varchar(25) NOT NULL,
  `numero_CNI` int(11) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `client_salarie`
--

CREATE TABLE `client_salarie` (
  `id_salarie` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `profession` varchar(25) DEFAULT NULL,
  `salaire_actuel` double NOT NULL,
  `nom_entreprise` varchar(25) NOT NULL,
  `adresse_entreprise` varchar(25) NOT NULL,
  `identifiant_entreprise` varchar(25) DEFAULT NULL,
  `numero_CNI` int(11) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `comptes`
--

CREATE TABLE `comptes` (
  `id_compte` int(11) NOT NULL,
  `numero_compte` varchar(45) NOT NULL,
  `cle_rib` int(11) NOT NULL,
  `solde_compte` int(11) NOT NULL,
  `numero_agence` int(11) NOT NULL,
  `date_ouverture` date NOT NULL,
  `id_responsable` int(11) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `compte_bloque`
--

CREATE TABLE `compte_bloque` (
  `id_compte_bloque` int(11) NOT NULL,
  `frais_ouverture` double NOT NULL,
  `delai_blocage` date NOT NULL,
  `montant_remuneration` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `compte_courant`
--

CREATE TABLE `compte_courant` (
  `id_compte_courant` int(11) NOT NULL,
  `agios` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `compte_epargne`
--

CREATE TABLE `compte_epargne` (
  `id_compte_epargne` int(11) NOT NULL,
  `frais_ouverture` double NOT NULL,
  `montant_remuneration` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id_employe` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(25) NOT NULL,
  `telephone` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `id_agence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `etat_compte`
--

CREATE TABLE `etat_compte` (
  `id_etat_compte` int(11) NOT NULL,
  `etat_compte` varchar(25) NOT NULL,
  `date_changement_etat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `operation_compte`
--

CREATE TABLE `operation_compte` (
  `id_operation_compte` int(11) NOT NULL,
  `type_opertaion` varchar(25) NOT NULL,
  `montant_operation` double NOT NULL,
  `id_compte_destinataire` int(11) NOT NULL,
  `id_employe` int(11) NOT NULL,
  `date_operation` date NOT NULL,
  `id_caissiere` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `profil_employe`
--

CREATE TABLE `profil_employe` (
  `id_profil` int(11) NOT NULL,
  `nom_fonction` varchar(25) DEFAULT NULL,
  `date_debut_fonction` date NOT NULL,
  `id_employe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `responsable_compte`
--

CREATE TABLE `responsable_compte` (
  `id_responsable` int(11) NOT NULL,
  `login_responsable_compte` varchar(25) NOT NULL,
  `mot_de_passe` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id_administrateur`);

--
-- Index pour la table `agence`
--
ALTER TABLE `agence`
  ADD PRIMARY KEY (`id_agence`),
  ADD KEY `id_administrateur` (`id_administrateur`);

--
-- Index pour la table `agios`
--
ALTER TABLE `agios`
  ADD PRIMARY KEY (`id_agios`);

--
-- Index pour la table `caissiere`
--
ALTER TABLE `caissiere`
  ADD PRIMARY KEY (`id_caissiere`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `client_moral`
--
ALTER TABLE `client_moral`
  ADD PRIMARY KEY (`id_entreprise`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `client_non_salarie`
--
ALTER TABLE `client_non_salarie`
  ADD PRIMARY KEY (`id_non_salarie`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `client_salarie`
--
ALTER TABLE `client_salarie`
  ADD PRIMARY KEY (`id_salarie`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `comptes`
--
ALTER TABLE `comptes`
  ADD PRIMARY KEY (`id_compte`),
  ADD KEY `id_responsable` (`id_responsable`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `compte_bloque`
--
ALTER TABLE `compte_bloque`
  ADD PRIMARY KEY (`id_compte_bloque`),
  ADD KEY `id_compte` (`id_compte`);

--
-- Index pour la table `compte_courant`
--
ALTER TABLE `compte_courant`
  ADD PRIMARY KEY (`id_compte_courant`),
  ADD KEY `id_compte` (`id_compte`);

--
-- Index pour la table `compte_epargne`
--
ALTER TABLE `compte_epargne`
  ADD PRIMARY KEY (`id_compte_epargne`),
  ADD KEY `id_compte` (`id_compte`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id_employe`),
  ADD KEY `id_agence` (`id_agence`);

--
-- Index pour la table `etat_compte`
--
ALTER TABLE `etat_compte`
  ADD PRIMARY KEY (`id_etat_compte`);

--
-- Index pour la table `operation_compte`
--
ALTER TABLE `operation_compte`
  ADD PRIMARY KEY (`id_operation_compte`),
  ADD KEY `id_caissiere` (`id_caissiere`),
  ADD KEY `id_compte` (`id_compte`);

--
-- Index pour la table `profil_employe`
--
ALTER TABLE `profil_employe`
  ADD PRIMARY KEY (`id_profil`),
  ADD KEY `id_employe` (`id_employe`);

--
-- Index pour la table `responsable_compte`
--
ALTER TABLE `responsable_compte`
  ADD PRIMARY KEY (`id_responsable`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id_administrateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `agence`
--
ALTER TABLE `agence`
  MODIFY `id_agence` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `agios`
--
ALTER TABLE `agios`
  MODIFY `id_agios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `caissiere`
--
ALTER TABLE `caissiere`
  MODIFY `id_caissiere` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client_moral`
--
ALTER TABLE `client_moral`
  MODIFY `id_entreprise` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client_non_salarie`
--
ALTER TABLE `client_non_salarie`
  MODIFY `id_non_salarie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client_salarie`
--
ALTER TABLE `client_salarie`
  MODIFY `id_salarie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comptes`
--
ALTER TABLE `comptes`
  MODIFY `id_compte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compte_bloque`
--
ALTER TABLE `compte_bloque`
  MODIFY `id_compte_bloque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compte_courant`
--
ALTER TABLE `compte_courant`
  MODIFY `id_compte_courant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compte_epargne`
--
ALTER TABLE `compte_epargne`
  MODIFY `id_compte_epargne` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id_employe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etat_compte`
--
ALTER TABLE `etat_compte`
  MODIFY `id_etat_compte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `operation_compte`
--
ALTER TABLE `operation_compte`
  MODIFY `id_operation_compte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `profil_employe`
--
ALTER TABLE `profil_employe`
  MODIFY `id_profil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `responsable_compte`
--
ALTER TABLE `responsable_compte`
  MODIFY `id_responsable` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `agence`
--
ALTER TABLE `agence`
  ADD CONSTRAINT `agence_ibfk_1` FOREIGN KEY (`id_administrateur`) REFERENCES `administrateur` (`id_administrateur`);

--
-- Contraintes pour la table `client_moral`
--
ALTER TABLE `client_moral`
  ADD CONSTRAINT `client_moral_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `client_non_salarie`
--
ALTER TABLE `client_non_salarie`
  ADD CONSTRAINT `client_non_salarie_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `client_salarie`
--
ALTER TABLE `client_salarie`
  ADD CONSTRAINT `client_salarie_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `comptes`
--
ALTER TABLE `comptes`
  ADD CONSTRAINT `comptes_ibfk_1` FOREIGN KEY (`id_responsable`) REFERENCES `responsable_compte` (`id_responsable`),
  ADD CONSTRAINT `comptes_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `compte_bloque`
--
ALTER TABLE `compte_bloque`
  ADD CONSTRAINT `compte_bloque_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id_compte`);

--
-- Contraintes pour la table `compte_courant`
--
ALTER TABLE `compte_courant`
  ADD CONSTRAINT `compte_courant_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id_compte`);

--
-- Contraintes pour la table `compte_epargne`
--
ALTER TABLE `compte_epargne`
  ADD CONSTRAINT `compte_epargne_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id_compte`);

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`id_agence`) REFERENCES `agence` (`id_agence`);

--
-- Contraintes pour la table `operation_compte`
--
ALTER TABLE `operation_compte`
  ADD CONSTRAINT `operation_compte_ibfk_1` FOREIGN KEY (`id_caissiere`) REFERENCES `caissiere` (`id_caissiere`),
  ADD CONSTRAINT `operation_compte_ibfk_2` FOREIGN KEY (`id_compte`) REFERENCES `comptes` (`id_compte`);

--
-- Contraintes pour la table `profil_employe`
--
ALTER TABLE `profil_employe`
  ADD CONSTRAINT `profil_employe_ibfk_1` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
