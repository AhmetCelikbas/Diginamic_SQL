/* Créer la base de données restaurant */
CREATE DATABASE IF NOT EXISTS restaurant;

/* selectionner la base de données restaurant */
use restaurant;

/***** TABLES PRINCIPALES *****/
/* Créer la table Commande */
CREATE TABLE IF NOT EXISTS Commande(
	id_c int NOT NULL primary key auto_increment, 
    nom varchar(100) not null, 
    date datetime, 
    total double not null default 0
) ENGINE=InnoDB;

/* Créer la table Plat */
CREATE TABLE IF NOT EXISTS Plat(
	id_p int NOT NULL primary key auto_increment, 
    nom varchar(100) not null, 
    description varchar(100), 
    prix double not null default 0
    ) ENGINE=InnoDB;

/* Créer la table Ingredients */
CREATE TABLE IF NOT EXISTS Ingredients(
	id_j int NOT NULL primary key auto_increment, 
	designation varchar(100) not null, 
	quantite int not null default 0
) ENGINE=InnoDB;


/***** TABLES RELATIONS *****/
/* Créer la table relation Contient (entre les tables Commande et Plat) */
CREATE TABLE IF NOT EXISTS Contient(
	id int NOT NULL primary key auto_increment, 
	Commande_id_c INT NOT NULL,
    Plat_id_p INT NOT NULL,
	CONSTRAINT `fk_Contient_Commande`
		FOREIGN KEY (`Commande_id_c`)
		REFERENCES `restaurant`.`Commande` (`id_c`),
	CONSTRAINT `fk_Contient_Plat`
		FOREIGN KEY (`Plat_id_p`)
		REFERENCES `restaurant`.`Plat` (`id_p`)    
) ENGINE=InnoDB;

/* Créer la table relation Compose (entre les tables Plat et Ingredient) */
CREATE TABLE IF NOT EXISTS Compose(
	id int NOT NULL primary key auto_increment, 
    Plat_id_p INT NOT NULL,
	Ingredients_id_j INT NOT NULL,
	CONSTRAINT `fk_Compose_Plat`
		FOREIGN KEY (`Plat_id_p`)
		REFERENCES `restaurant`.`Plat` (`id_p`),
	CONSTRAINT `fk_Compose_Ingredients`
		FOREIGN KEY (`Ingredients_id_j`)
		REFERENCES `restaurant`.`Ingredients` (`id_j`)    
) ENGINE=InnoDB;

/* Vérifier que les tables soient créées */
show tables;
