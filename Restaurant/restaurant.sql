/* RESET BRUTAL COMPLET !*/	
    DROP DATABASE restaurant;

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
	-- show tables; 


/***** AJOTUER QUELQUES DONNEES *****/

/* Créer quelques ingrédients */
	INSERT INTO Ingredients VALUES (null, "Paquet de pâtes fusilli - 1kg", 4);
	INSERT INTO Ingredients VALUES (null, "Sauce tomate 100% délicieuse - 250g", 3);
	INSERT INTO Ingredients VALUES (null, "Beurre - 500g", 3);

/* Créer quelques plats */
	INSERT INTO Plat VALUES (null, "Pâtes tomate", "Assiete de pâtes à la sauce tomate", 3);
    INSERT INTO Compose VALUES (null, 1, 1);
    INSERT INTO Compose VALUES (null, 1, 2);
    
	INSERT INTO Plat VALUES (null, "Pâtes beurre", "Assiete de pâtes au beurre", 3);
    INSERT INTO Compose VALUES (null, 2, 1);
    INSERT INTO Compose VALUES (null, 2, 3);
    
	INSERT INTO Plat VALUES (null, "Pâtes nature", "", 3);
	
    
/* Créer qielques commande */
	INSERT INTO Commande VALUES (null, "première commande", "2017-08-22 11:07:50", 0);
    INSERT INTO Contient VALUES (null, 1, 1);

	INSERT INTO Commande VALUES (null, "deuxième commande", "2017-08-22 11:07:50", 0);
    INSERT INTO Contient VALUES (null, 2, 2);

/* Vérifier les données */
	-- select * from Ingredients
    -- select * from Compose
    -- select * from Plat
	-- select * from Commande
	-- select * from Contient
    

/* Afficher les ingrédients d'un plat 
	SELECT Ingredients.designation
	FROM Compose
	RIGHT JOIN Ingredients 
	ON Ingredients.id_j = Compose.Ingredients_id_j AND Compose.Plat_id_p=2;
*/
/* Afficher les ingrédients de chaque plats 
	SELECT Plat.nom, Ingredients.designation
	FROM Plat, Compose, Ingredients 
	where Ingredients.id_j = Compose.Ingredients_id_j AND Compose.Plat_id_p=Plat.id_p;
    */

/* Inclure les plats sans ingrédients */
	SELECT Plat.nom as 'Nom du plat', Ingredients.designation as 'Nom ingredient'
    FROM Compose 
		right join Plat on Plat.id_p=Compose.Plat_id_p
		left join Ingredients on Ingredients.id_j=Compose.Ingredients_id_j;
    

    