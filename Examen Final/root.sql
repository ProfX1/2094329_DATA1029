-- 2. A quoi servent les instructions des lignes 12 et 440 dans le fichier epharmacy.sql? 3pts
-- (In SQL, specifically in MySQL, the SET FOREIGN_KEY_CHECKS = 0; and SET FOREIGN_KEY_CHECKS = 1; commands are used to disable and enable, respectively, the foreign key constraint checks temporarily.

-- SET FOREIGN_KEY_CHECKS = 0;: This command disables the foreign key checks. It’s useful when you need to load data into tables without worrying about the order of insertion related to parent-child relationships. It allows you to bypass the foreign key constraints, which can be helpful during bulk data imports or migrations12.
-- SET FOREIGN_KEY_CHECKS = 1;: This command re-enables the foreign key checks. After you have completed operations that required disabling the foreign key constraints, you should run this command to ensure the integrity of your data going forward12.
-- It’s important to note that while foreign key checks are disabled, you can insert data that would normally violate foreign key constraints. Therefore, you should use these commands with caution and ensure that you re-enable the checks after completing your tasks to maintain data integrity23.

-- Remember, these settings are session-based. If you set them within a session, they do not affect other sessions. Once the session ends, the settings revert to their defaults1. Always make sure to set FOREIGN_KEY_CHECKS back to 1 after you’re done to avoid any issues with data consistency1.)


-- 3. Créez l’utilisateur pharma avec pour mot de passe 1234. 4pts Proposer une requête SQL permettant de déterminer :
CREATE USER "pharma"@"localhost" identified by "1234";

