use epharmacy
-- Analyse (35pts)
-- 1. Dressez le schéma relationnel de la base de données. 8pts




-- 4. Les noms complets utilisateurs de la e-pharmacie et la durée moyenne de chacun une fois connecté dans l’application ? 5pts
select firstname, lastname, avg(onsite_time) from users as u
join
connection_history as c on u.id = c.user_id group by user_id;


-- 5. Le rôle de l’utilisateur ayant passé le plus de temps étant connecté dans l’application ? 3pts
SELECT r.name
FROM roles AS r
JOIN users AS u ON u.role_id = r.id
JOIN connection_history AS c ON c.user_id = u.id
GROUP BY r.name
ORDER BY SUM(c.onsite_time) DESC
LIMIT 1;


-- 6. Les fournisseurs des 3 produits les plus commercialisés ? 7pts



-- 7. Les chiffres d'affaires par entrepôts. 5pts



-- Evolution du schéma (30pts)
-- 8. Modifier la table products de sorte à affecter l’image “medoc.jpg” comme image par défaut aux produits médicaux. 5pts



-- 9. Ajouter une colonne gender spécifiant le sexe des utilisateurs de l’application. Cette colonne doit être une énumération contenant pour valeur MALE, FEMALE et OTHER. 5pts



-- 10.Ecrire une procédure stockée spProfileImage permettant d'affecter une image de profil par défaut aux utilisateurs : 15pts
-- a. Les utilisateurs MALE auront pour image male.jpg
-- b. Les utilisateurs FEMALE auront pour image femage.jpg
-- c. Les autres auront utilisateur auront pour image other.jpg
-- NB : les utilisateurs ayant déjà spécifié leur image de profil ne sont donc pas affectés par l'exécution de cette procédure.



-- 11.Ajouter une contrainte a la table users afin de garantir l’unicité des adresses électroniques(email) des utilisateurs de l’application. 5pts



-- Insertion de données. (25pts)
-- 12.Effectuez sous forme de transactions toutes les insertions nécessaires pour passer les ventes représentées par la capture suivante :
-- a. Insérer un nouvel utilisateur au nom de Alain Foka avec un mot de passe correspondant à la chaine vide. 5pts
-- b. La date de chaque commande doit être à l’instant auquel la commande est insérée 5pts
-- c. Ces commandes sont éditées par l’administrateur Abdoulaye Mohamed 5pts
-- d. Calculez le total de chacune des commandes et insérer convenablement 5pts
-- e. Le taux d’impôt pour chacune des factures s’élève a 10% 5pts



-- Modification de données: (10pts)
-- Modifier les utilisateurs de l’application ainsi qu’il suit: 


