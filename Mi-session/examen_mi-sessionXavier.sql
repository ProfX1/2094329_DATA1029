use epharmacy;

-- La liste des utilisateurs de l’application selon leur rôle.(15 points) :
select full_name, name from user as u
join
epharmacy.role as r on r.id = u.id;


-- Noms et quantités des produits achetés par Oumar Moussa.(20 points) :




-- Quel sont les noms de produits dont le fournisseur est basé à Moncton ? (25 points)




-- Qui a passé le plus de temps une fois connecté dans l’application (10 points) ?




-- Quel est le dernier utilisateur à se déconnecter ? (10 points)