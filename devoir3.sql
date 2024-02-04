use library;

-- 1. La liste des paires (auteur, éditeur) demeurant dans la même ville. (10pts)

select pub_name, au_fname from library.publishers as p
inner join 
library.authors as a on a.city = p.city;


-- 2. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les auteurs qui ne répondent pas à ce critère. (10pts)

select pub_name, au_fname from library.authors as a
left join 
library.publishers as p on (a.city = p.city);

-- 3. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les éditeurs qui ne répondent pas à ce critère. (10pts)

select pub_name, au_fname from library.publishers as p
left join 
library.authors as a on (a.city = p.city);

-- 4. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant les auteurs et les éditeurs qui ne répondent pas à ce critère. (10pts)

select pub_name, au_fname from library.authors as a
left join 
library.publishers as p on a.city = p.city 
UNION
select pub_name, au_fname from library.publishers as p
left join 
library.authors as a on (a.city = p.city);
-- 5. Effectif(nombre) d'employes par niveau d'experience (15pts)
SELECT count(*) as Effectif, job_lvl FROM employees group by job_lvl;


-- 6. Liste des employes par maison d'edition (15pts)

SELECT fname, p.pub_name FROM library.publishers as p
inner join 
library.employees as e where e.pub_id = p.pub_id;

-- 7. Salaires horaires moyens des employes par maison d'edition (15pts)

SELECT avg(salary) AS moyenne, p.pub_name FROM library.publishers AS p
JOIN
library.employees as e where e.pub_id =p.pub_id group by p.pub_id;

-- 8- Effectif(nombre) d'employées de niveau SEINIOR (**?voir dictionnaire Senior?**) par maison d'edition

SELECT count(*) as "Effectif Senior", p.pub_name FROM library.publishers AS p
JOIN 
library.employees as e where e.pub_id = p.pub_id and e.job_lvl = "SEINIOR" group by p.pub_id;