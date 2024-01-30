use library;
-- Exercice 1 : À partir de la table « titles », obtenir la liste des titres contenant le mot « computer » Affiche le titre et le prix de chaque livre. 

 select title, price from titles where title like '%computer%' group by title_id;

-- Exercice 2 :À partir de la table « titles », obtenir la liste des titres contenant le mot « computer » (au singulier). Affiche le titre et le prix de chaque livre. (15 pts)

 select title, price from titles where (title like '%computer%') and (title not like '%computers%') group by title_id;

-- Exercice 3 : À partir de la table « titles », obtenir la liste des titres dont l’identifiant (titre ne fait pas de sens but ok) débute par SU ou BU. Affiche le titre et le prix de chaque livre. (15 pts)

 select title, price from titles where title rlike  '[bs]u%'  group by title_id;

-- Exercice 4 : À partir de la table « titles », obtenir la liste des titres dont l’identifiant (titre ne fait pas de sens but ok) ne débute pas par SU ou BU. Affiche le titre et le prix de chaque livre. (15 pts)

 select title, price from titles where title not rlike  '[bs]u%'  group by title_id;

-- Exercice 5 : À partir de la table « titles », obtenir la liste des titres ne débutant ni par S, ni par B, mais dont la seconde lettre est « o ». Affiche le titre et le prix. (15 pts)

 select title, price from titles where title not rlike  '[bs]%' and title like '_o%'  group by title_id;

-- Exercice 6 : À partir de la table « titles », obtenir la liste des titres ne débutant ni par S, ni par B, mais dont la 3ième lettre est « f ». Affiche le titre et le prix. (15 pts)

 select title, price from titles where title not rlike  '[bs]%' and title like '__f%'  group by title_id;

-- Exercice 7 : À partir de la table « titles », obtenir la liste des titres débutant par l’une des 10 premières lettres de l’alphabet. Affiche le titre et le prix. (15 pts)

 select title, price from titles where title rlike '^[a-j]'  group by title_id;
