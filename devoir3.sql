use library;

-- 1. La liste des paires (auteur, éditeur) demeurant dans la même ville. (10pts)

select pub_name, au_fname from library.publishers as p
inner join 
library.authors as a on a.city = p.city;


-- 2. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les auteurs qui ne répondent pas à ce critère. (10pts)

select pub_name, au_fname from library.authors as a
left join 
library.publishers as p on (a.city = p.city);


-- 5. Effectif(nombre) d'employes par niveau d'experience (15pts)


-- 6. Liste des employes par maison d'edition (15pts)


-- 7. Salaires horaires moyens des employes par maison d'edition (15pts)


-- 8- Effectif(nombre) d'employées de niveau SEINIOR par maison d'edition
