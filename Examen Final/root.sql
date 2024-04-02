-- 2. A quoi servent les instructions des lignes 12 et 440 dans le fichier epharmacy.sql? 3pts
-- les commandes SET FOREIGN_KEY_CHECKS = 0 ; et SET FOREIGN_KEY_CHECKS = 1 ; sont utilisées pour désactiver et activer, respectivement, les contrôles de contraintes de clés étrangères de manière temporaire.

-- SET FOREIGN_KEY_CHECKS = 0; : Cette commande désactive les vérifications des clés étrangères. Elle est utile lorsque vous devez charger des données dans des tables sans vous soucier de l'ordre d'insertion lié aux relations parent-enfant. Elle vous permet de contourner les contraintes de clés étrangères, ce qui peut s'avérer utile lors d'importations ou de migrations de données en masse.

-- SET FOREIGN_KEY_CHECKS = 1; : Cette commande réactive les contrôles des clés étrangères. Après avoir effectué des opérations qui ont nécessité la désactivation des contraintes de clés étrangères, vous devez exécuter cette commande pour garantir l'intégrité de vos données à l'avenir.
-- Il est important de noter que lorsque les contrôles de clés étrangères sont désactivés, vous pouvez insérer des données qui violeraient normalement les contraintes de clés étrangères. Par conséquent, vous devez utiliser ces commandes avec prudence et vous assurer que vous réactivez les contrôles après avoir terminé vos tâches pour maintenir l'intégrité des données.


-- 3. Créez l’utilisateur pharma avec pour mot de passe 1234. 4pts Proposer une requête SQL permettant de déterminer :
CREATE USER "pharma"@"localhost" identified by "1234";

