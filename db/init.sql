CREATE DATABASE IF NOT EXISTS matchmaking;
USE matchmaking;

-- Table joueurs
CREATE TABLE IF NOT EXISTS joueurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pseudo VARCHAR(50) NOT NULL,
    statut ENUM('en_attente', 'en_match', 'deconnecte') DEFAULT 'en_attente',
    date_connexion DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table matchs
CREATE TABLE IF NOT EXISTS matchs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    joueur1_id INT,
    joueur2_id INT,
    date_debut DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_fin DATETIME NULL,
    resultat VARCHAR(100) DEFAULT NULL,

    FOREIGN KEY (joueur1_id) REFERENCES joueurs(id),
    FOREIGN KEY (joueur2_id) REFERENCES joueurs(id)
);
