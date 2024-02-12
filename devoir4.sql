USE library;

-- Exercice 1 Obtenir la liste des auteurs dont l’éditeur « Harmattan » n’a publié aucun livre

SELECT a.au_fname 
from authors as a 
where a.au_id  not in (
	SELECT distinct a.au_id
	FROM authors as a 
	INNER JOIN
	library.titleauthor as ta, library.titles as t, library.publishers as p 
    where ta.au_id = a.au_id and t.pub_id = p.pub_id and p.pub_name = "Harmattan");

-- Exercice 2 Obtenir la liste des auteurs dont l’éditeur «Eyrolles » a publié tous les livres

SELECT a.au_fname, a.au_lname
FROM authors AS a
WHERE "Eyrolles" in (
    SELECT t.title_id
    FROM titles AS t
    LEFT JOIN publishers AS p ON t.pub_id = p.pub_id
    WHERE p.pub_name = 'Eyrolles'
    AND t.title_id NOT IN (
        SELECT ta.title_id
        FROM titleauthor AS ta
        WHERE ta.au_id = a.au_id
    )
);

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

