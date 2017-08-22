/* Question 1 : Affichez le nom des agences */
	-- select nom from agence;
    
/* Question 2 : Affichez le numéro de l’agence « Orpi » */
-- 	select idAgence 
-- 	from agence 
--     where agence.nom='orpi';
    
/* Question 3 : Affichez le premier enregistrement de la table logement*/
-- 	select * 
--     from logement 
--     limit 1;
    
/* Question 4 : Affichez le nombre de logements (Alias : Nombre_de_logements) */
-- 	select count(*) as 'Nombre_de_logements' 
--     from logement;
    
/* Question 5 : Affichez les logements à vendre à moins de 150 000 € dans l’ordre croissant des prix.*/
-- 	select * 
--     from logement 
--     where logement.prix < 150000 
--     order by logement.prix asc;
    
/* Question 6 : Affichez le nombre de logements à la location (alias : nombre)*/
-- 	select count(*) as 'nombre' 
--     from logement 
--     where logement.categorie='location';
    
/* Question 7 : Affichez les villes différentes recherchées par les personnes demandeuses d'un logement*/
-- 	select distinct ville 
--     from demande;
    
/* Question 8 : Affichez le nombre de biens à vendre par ville */
-- 	select 
-- 		ville, 
-- 		count(*) as 'nombre de biens à vendre' 
--     from logement 
--     where categorie='vente' 
--     group by ville;
    
/* Question 9 : Quelles sont les id des logements destinés à la location ? */
-- 	select idLogement 
--     from logement 
--     where categorie='location';

/* Question 10 : Quels sont les id des logements entre 20 et 30m² ? */
-- 	select idLogement 
--     from logement 
--     where superficie between 20 
-- 		and 30;

/* Question 11 : Quel est le prix vendeur (hors commission) du logement le moins cher à vendre ? (Alias : prix minimum) */
-- 	select min(prix) AS 'prix_minimum'
--     from logement 
--     where categorie='vente';

/* Question 12 : Dans quelle ville se trouve les maisons à vendre ? */
-- 	select distinct ville 
--     from logement 
--     where genre='maison' 
-- 		and categorie='vente';

/* Question 13 : L’agence Orpi souhaite diminuer les frais qu’elle applique sur le logement ayant l'id « 5246 ». Passer les frais de ce logement de 800 à 730€ */
-- 	update logement_agence 
--     left join agence 
-- 		on agence.idAgence=logement_agence.idAgence 
--     set frais=700 
--     where idLogement=5246;

/* Question 14 : Quels sont les logements gérés par l’agence « laforet » */
-- 	select logement.*
--     from logement_agence 
-- 		left join logement 
-- 			on logement.idLogement=logement_agence.idLogement 
-- 		left join agence 
-- 			on agence.nom='laforet';

/* Question 15 : Affichez le nombre de propriétaires dans la ville de Paris (Alias : Nombre) */
-- 	select count(distinct idPersonne) as 'Nombre'
-- 	from logement_personne
-- 		inner join logement 
-- 			on logement_personne.idLogement=logement.idLogement
-- 	where logement.ville = "paris";

/* Question 16 : Affichez les informations des trois premieres personnes souhaitant acheter un logement */
-- 	select personne.* 
--     from personne 
-- 		inner join demande 
-- 			on demande.idPersonne=personne.idPersonne 
--             and categorie='vente' 
-- 	limit 3;

/* Question 17 : Affichez le prénom du vendeur pour le logement ayant la référence « 5770 » */
-- 	select personne.prenom 
--     from logement_personne 
-- 		inner join personne 
-- 			on personne.idPersonne=logement_personne.idPersonne 
--             and logement_personne.idLogement=5770;


/* Question 18 : Affichez les prénoms des personnes souhaitant accéder à un logement sur la ville de Lyon */
-- 	select personne.prenom 
--     from demande 
-- 		inner join personne 
-- 			on personne.idPersonne=demande.idPersonne 
--             and demande.ville='Lyon';
            
/* Question 19 : Affichez les prénoms des personnes souhaitant accéder à un logement en location sur la ville de Paris */
-- 	select personne.prenom 
--     from demande 
--     inner join personne 
-- 		on personne.idPersonne=demande.idPersonne 
--         and demande.ville='Lyon' 
--         and demande.categorie='location';

/* Question 20 : Affichez les prénoms des personnes souhaitant acheter un logement de la plus grande à la plus petite superficie */
-- 	select personne.prenom 
-- 	from demande 
-- 		inner join personne 
-- 			on personne.idPersonne=demande.idPersonne 
-- 			and demande.categorie='vente' 
-- 	order by demande.superficie desc;

/* Question 21 : Quel sont les prix finaux proposés par les agences pour la maison à la vente ayant la référence « 5091 » ? (Alias : prix frais d'agence inclus) */
-- 	select (logement.prix + logement_agence.frais) as 'prix frais d\'agence inclus' 
--     from logement_agence 
-- 		inner join logement 
-- 			on logement.idLogement=5091 
--             and logement.idLogement=logement_agence.idLogement;

/* Question 22 : Question supprimée */

/* Question 23 : Si l’ensemble des logements étaient vendus ou loués demain, quel serait le bénéfice généré grâce aux frais d’agence et pour chaque agence (Alias : benefice, classement : par ordre croissant des gains) */
-- 	select agence.nom, sum(logement_agence.frais) as bénéfice
--     from agence
-- 		inner join logement_agence 
-- 			on agence.idAgence=logement_agence.idAgence
--     group by agence.nom order by bénéfice asc;


/* Question 24 : Affichez les id des biens en location, les prix, suivis des frais d’agence (classement : dans l’ordre croissant des prix)  */
-- 	select 
-- 		logement_agence.idLogement, 
-- 		logement.prix, 
-- 		logement_agence.frais
-- 	from immobilier.logement_agence 
-- 		inner join logement 
-- 			on logement_agence.idLogement=logement.idLogement 
-- 			and logement.categorie="location"; 


/* Question 25 : Quel est le prénom du propriétaire proposant le logement le moins cher à louer ? */


/* Question 26 : Affichez le prénom et la ville où se trouve le logement de chaque propriétaire */

/* Question 27 : Quel est l’agence immobilière s’occupant de la plus grande gestion de logements répertoriés à Paris ? (alias : nombre, classement : trié par ordre décroissant) */

/* Question 28 : Affichez le prix et le prénom des vendeurs dont les logements sont proposés à 130000 € ou moins en prix final avec frais appliqués par les agences (alias : prix final, classement : ordre croissant des prix finaux) : */

/* Question 29 : Afficher toutes les demandes enregistrées avec la personne à l'origine de la demande (Afficher également les demandes d'anciennes personnes n'existant plus dans notre base de données). */

/* Question 30 : Afficher toutes les personnes enregistrées avec leur demandes correspondantes (Afficher également les personnes n'ayant pas formulé de demandes). */