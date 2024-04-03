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
SELECT s.name
FROM suppliers AS s
JOIN products AS p ON p.supplier_id = s.id 
JOIN cart_product AS cp ON cp.product_id = p.id
JOIN carts AS c ON cp.cart_id = c.id
JOIN orders AS o ON o.cart_id = c.id
GROUP BY s.id, s.name
ORDER BY COUNT(cp.product_id) DESC
LIMIT 3;


-- 7. Les chiffres d'affaires par entrepôts. 5pts
SELECT w.name AS warehouse_name, COALESCE(SUM(o.total_amount), 0) AS total_sales
FROM warehouses w
LEFT JOIN products p ON p.warehouse_id = w.id
LEFT JOIN cart_product cp ON cp.product_id = p.id
LEFT JOIN carts c ON c.id = cp.cart_id
LEFT JOIN orders o ON o.cart_id = c.id
GROUP BY w.id, w.name;


-- Evolution du schéma (30pts)
-- 8. Modifier la table products de sorte à affecter l’image “medoc.jpg” comme image par défaut aux produits médicaux. 5pts
DELIMITER $$

CREATE TRIGGER set_default_image_for_medical
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
  IF NEW.type = 'Médicaux' AND NEW.image IS NULL THEN
    SET NEW.image = 'medoc.jpg';
  END IF;
END$$

DELIMITER ;

update products
set image = 'medoc.jpg'
where id > 0 and image is null;

alter table products
alter column image set default 'medoc.jpg';

update products
set image = 'medoc.jpg'
where id > 0 and type = 'Médicaux' and image is null;

-- 9. Ajouter une colonne gender spécifiant le sexe des utilisateurs de l’application. Cette colonne doit être une énumération contenant pour valeur MALE, FEMALE et OTHER. 5pts
alter table users
add column gender 
enum('MALE', 'FEMALE', 'OTHER') not null;


-- 10.Ecrire une procédure stockée spProfileImage permettant d'affecter une image de profil par défaut aux utilisateurs : 15pts
-- a. Les utilisateurs MALE auront pour image male.jpg
-- b. Les utilisateurs FEMALE auront pour image femage.jpg
-- c. Les autres auront utilisateur auront pour image other.jpg
-- NB : les utilisateurs ayant déjà spécifié leur image de profil ne sont donc pas affectés par l'exécution de cette procédure.



-- 11.Ajouter une contrainte a la table users afin de garantir l’unicité des adresses électroniques(email) des utilisateurs de l’application. 5pts
alter table users
add unique (email);


-- Insertion de données. (25pts)
-- 12.Effectuez sous forme de transactions toutes les insertions nécessaires pour passer les ventes représentées par la capture suivante :
-- a. Insérer un nouvel utilisateur au nom de Alain Foka avec un mot de passe correspondant à la chaine vide. 5pts
-- b. La date de chaque commande doit être à l’instant auquel la commande est insérée 5pts
-- c. Ces commandes sont éditées par l’administrateur Abdoulaye Mohamed 5pts
-- d. Calculez le total de chacune des commandes et insérer convenablement 5pts
-- e. Le taux d’impôt pour chacune des factures s’élève a 10% 5pts

start TRANSACTION;

insert into products(id, name, description, code_product, supplier_id, warehouse_id, image, min_quantity, price) values
(6, 'Gravol', 'produit anti-douleur', 'T12344', 1, 1, NULL, 1, 5.50), 
(7, 'Ibuprofen','produit anti-douleur','', 1, 1, NULL, 1, 11), 
(8, 'Multi-Vitamine', 'produit inutile', '', 1, 1, NULL, 1, 25),
(9, 'Ducolax', 'produit de marde', '', 1, 1, NULL, 1, 10);

insert into users (firstname, lastname, country, email, password, image, role_id) values
('Alain', 'Foka', 'Canada', 'Alain.Foka@email.com', '', '', 3);

-- Get the user ID of Fati Amadou
SET @fati_user_id = (SELECT `id` FROM `users` WHERE `firstname` = 'Fati' AND `lastname` = 'Amadou');
set @alain_user_id = (SELECT `id` FROM `users` WHERE `firstname` = 'Alain' AND `lastname` = 'Foka');

-- Get the user ID of Abdoulaye Mohamed
SET @admin_user_id = (SELECT `id` FROM `users` WHERE `firstname` = 'Abdoulaye' AND `lastname` = 'Mohamed');

-- Get the product IDs for Advil, Paracetamol2, and Gravol

SET @advil_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Advile');
SET @ducolax_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Ducolax');
SET @paracetamol_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Paracetamol2');
SET @gravol_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Gravol');
SET @ibuprofen_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Ibuprofen');
SET @multi_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Multi-Vitamine');
SET @tilenol_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Tilenol');
SET @koga_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Bon Koga');

-- Insert orders for Fati Amadou

INSERT INTO `orders` (`customer_id`, `order_date`, `total_amount`, `status`, `user_id`, `cart_id`)
VALUES 
(@fati_user_id, NOW(), 175.48, 0, @admin_user_id, 2), 
(@fati_user_id, NOW(), 60.95, 0, @admin_user_id, 2),
(@fati_user_id, NOW(), 38.5, 0, @admin_user_id, 2),
-- Alain
(@alain_user_id, NOW(), 55, 0, @admin_user_id, 3),
(@alain_user_id, NOW(), 30, 0, @admin_user_id, 3),
(@alain_user_id, NOW(), 93.6, 0, @admin_user_id, 3),
(@alain_user_id, NOW(), 38.5, 0, @admin_user_id, 3),
-- Fati
(@fati_user_id, NOW(), 25, 0, @admin_user_id, 2), 
(@fati_user_id, NOW(), 70.2, 0, @admin_user_id, 2),
(@fati_user_id, NOW(), 55, 0, @admin_user_id, 2);


INSERT INTO `carts` (`user_id`, `actif`)
VALUES (@fati_user_id, 1), (@alain_user_id, 1), (@fati_user_id, 1);

INSERT INTO `cart_product` (`cart_id`, `product_id`, `quantity`, `total`, `tax`, `quantity_remainder`)
VALUES 
  (2, (SELECT `id` FROM `products` WHERE `name` = 'Advile'), 4, 175.48, 10, 0),
  (2, (SELECT `id` FROM `products` WHERE `name` = 'Paracetamol2'), 5, 60.95, 10, 0),
  (2, (SELECT `id` FROM `products` WHERE `name` = 'Gravol'), 7, 38.5, 10, 0),
  (3, (SELECT `id` FROM `products` WHERE `name` = 'Ibuprofen'), 5, 55, 10, 0),
  (3, (SELECT `id` FROM `products` WHERE `name` = 'Ducolax'), 3, 30, 10, 0),
  (3, (SELECT `id` FROM `products` WHERE `name` = 'Tilenol'), 4, 93.6, 10, 0),
  (3, (SELECT `id` FROM `products` WHERE `name` = 'Gravol'), 7, 38.5, 10, 0), 
  (4, (SELECT `id` FROM `products` WHERE `name` = 'Multi-Vitamine'), 1, 25, 10, 0),
  (4, (SELECT `id` FROM `products` WHERE `name` = 'Bon Koga'), 2, 70.2, 10, 0),
  (4, (SELECT `id` FROM `products` WHERE `name` = 'Gravol'), 10, 55, 10, 0);


-- Insert data into invoices table
INSERT INTO `invoices` (`montant`, `tax`, `users_id`)
VALUES 
  ((SELECT SUM(`total`) FROM `cart_product` WHERE `cart_id` = 2), (SELECT SUM(`total`) * 0.1 FROM `cart_product` WHERE `cart_id` = 2), @fati_user_id),
  ((SELECT SUM(`total`) FROM `cart_product` WHERE `cart_id` = 3), (SELECT SUM(`total`) * 0.1 FROM `cart_product` WHERE `cart_id` = 3), @alain_user_id),
  ((SELECT SUM(`total`) FROM `cart_product` WHERE `cart_id` = 4), (SELECT SUM(`total`) * 0.1 FROM `cart_product` WHERE `cart_id` = 4), @fati_user_id);


-- Insert data into invoice_elements table
INSERT INTO `invoice_elements` (`invoice_id` )
values
(1),
(2),
(3);

select firstname, lastname from users as u
join carts as c where c.user_id = u.id
join cart_product as cp where cp.cart_id = c.id
join products as p where p.id = cp.product_id;

COMMIT;


-- Modification de données: (10pts)
-- Modifier les utilisateurs de l’application ainsi qu’il suit: 


START TRANSACTION;  
-- Modifier l'utilisateur Ali Sani 
UPDATE users SET firstname = 'Ali',     
lastname = 'Sani',     
designation = 'Comptable',     
adress = "415 Av. de l’Université",     
province = 'NB',     
postal_code = 'E1A 3E9',     
phone = '4065954526',     
email = 'Ali@ccnb.ca' 
WHERE id = 1;  

-- Modifier l'utilisateur Oumar Moussa 
UPDATE users SET firstname = 'Oumar',     
lastname = 'Moussa',     
designation = 'RH',     
adress = '1750 Rue Crevier',    
province = 'QC',     
postal_code = 'H4L2X5',     
phone = '5665954526',     
email = 'Oumar@gmail.com' 
WHERE id = 2;  

-- Modifier l'utilisateur Dupon Poupi 
UPDATE users SET firstname = 'Dupon',     
lastname = 'Poupi',     
designation = 'Consultant',     
adress = '674 Vanhorne',     
province = 'NS',     
postal_code = 'B4V4V5',     
phone = '7854665265',     
email = 'Foka@ccnb.ca' 
WHERE id = 3; 

COMMIT;