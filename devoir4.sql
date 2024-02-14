USE library;

-- Exercice 1 Obtenir la liste des auteurs dont l’éditeur « Harmattan » n’a publié aucun livre

SELECT a.au_fname, a.au_lname 
from authors as a 
where a.au_id  not in (
select au_id from titleauthor as ta
WHERE ta.title_id in (select t.title_id from titles as t 
JOIN 
publishers as p on t.pub_id = p.pub_id
WHERE pub_name="Harmattan") group by au_id);

-- Exercice 2 Obtenir la liste des auteurs dont l’éditeur «Eyrolles » a publié tous les livres

SELECT a.au_fname, a.au_lname
FROM authors AS a
WHERE a.au_id in
(select au_id from titleauthor as ta
WHERE ta.title_id in (select t.title_id from titles as t 
JOIN 
publishers as p on t.pub_id = p.pub_id
WHERE pub_name="Eyrolles") group by au_id);

-- Exercice 3  Obtenir la liste des noms d’auteurs ayant touché une avance supérieure à toutes les avances versées par l'éditeur "Harmattan"

SELECT au_fname, au_lname
FROM authors
WHERE au_id IN (
    SELECT au_id
    FROM titleauthor AS ta
    JOIN titles as t ON ta.title_id = t.title_id
    WHERE advance > ALL (
        SELECT advance
        FROM titles AS t
        JOIN publishers AS p ON t.pub_id = p.pub_id
        WHERE pub_name = 'Harmattan'
    )
);

