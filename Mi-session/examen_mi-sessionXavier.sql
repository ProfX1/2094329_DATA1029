use epharmacy;

-- La liste des utilisateurs de l’application selon leur rôle.(15 points) :
select full_name, name from user as u
join
epharmacy.role as r on r.id = u.id;


-- Noms et quantités des produits achetés par Oumar Moussa.(20 points) :

-- nom produit(product.name, product.id, ) ->product_id(orderLine), quantity, order_id -> order_id(Invoice), Customer_id ->id(user), full_name
select p.name, orderline.quantity from product as p
join
epharmacy.orderline as o on o.product_id = p.product_id
join
epharmacy.invoice as i on i.order_id = o.order_id
join
epharmacy.user as u on u.id = i.customer_id where u.full_name = "Oumar Moussa";



-- Quel sont les noms de produits dont le fournisseur est basé à Moncton ? (25 points)

select p.name from epharmacy.product as p
join
epharmacy.supplier as s on p.supplier_id = s.id where adress = "Moncton";


-- Qui a passé le plus de temps une fois connecté dans l’application (10 points)

select u.full_name from epharmacy.user as u
join
epharmacy.connection_history as c on u.id = c.user_id where max(onsite_time);


-- Quel est le dernier utilisateur à se déconnecter ? (10 points)

select