-- ╰(*°▽°*)╯
use library;
-- 1. Noms complets des employés de plus haut grade par employeurs. (10 pts)

select e.fname, e.lname, p.pub_name from employees as e
join
publishers as p on p.pub_id = e.pub_id
where e.job_lvl = 'SEINIOR' order by p.pub_id DESC;

-- 2. Noms complets des employés ayant un salaire supérieur à celui de Norbert Zongo. (10 pts)

select fname, lname from employees as e 
where salary>(
select salary from employees 
where fname = 'Norbert' 
and lname = 'Zongo');

-- 3. Noms complets des employés des éditeurs canadiens. (10 pts)

select e.fname, e.lname, p.pub_name from employees as e
join
publishers as p on e.pub_id = p.pub_id
where country = 'Canada';

-- 4. Noms complets des employés qui ont un manager. (10pts) 'SEINIOR' works

SELECT e.fname AS first_name, e.lname AS last_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.max_lvl = 'MANAGER';

-- 5. Noms complets des employés qui ont un salaire au-dessus de la moyenne de salaire chez leur employeur. (10 pts)

select e.fname, e.lname, p.pub_name from employees as e
join
publishers as p on p.pub_id = e.pub_id
where e.salary > (
select avg(salary) from employees 
where e.pub_id = p.pub_id);

-- 6. Noms complets des employés qui ont le salaire minimum de leur grade (10 pts)

select e.fname, e.lname, e.salary from employees as e
join
jobs as j on j.job_id = e.job_id
where e.salary = (
select min(salary)from employees 
where job_id = e.job_id);

-- 7. De quels types sont les livres les plus vendus? (10 pts)

select t.`type` from titles as t
where title_id =(
select title_id from sales
group by title_id order by sum(qty)desc limit 1
); 

-- 8. Pour chaque boutique, les 2 livres les plus vendus et leurs prix. (10 pts)

select s.stor_name, t.title, t.price from stores as s
join 
sales as sa on s.stor_id = sa.stor_id
join
titles as t on sa.title_id = t.title_id
where sa.stor_id in (
select stor_id from sales
group by stor_id
order by sum(qty) desc
limit 2
) and t.title_id in (
select title_id from sales
group by title_id
order by sum(qty) desc
limit 2
);

-- 9. Les auteurs des 5 livres les plus vendus. (10 pts)

select a.au_fname, a.au_lname from authors as a
join
titleauthor as ta on a.au_id = ta.au_id
join
titles as t on t.title_id = ta.title_id
join
sales as s on t.title_id = s.title_id
group by a.au_id
order by sum(s.qty) DESC
limit 5;

-- 10. Prix moyens des livres par maisons d’édition. (10 pts)

select round(avg(t.price)) as average_price, p.pub_name from publishers as p
join titles as t on t.pub_id = p.pub_id
group by p.pub_name;

-- 11. Les 3 auteurs ayant les plus de livres (10 pts)

select a.au_fname, a.au_lname , count(*) as amount_of_books from authors as a
join
titleauthor as ta on ta.au_id = a.au_id
group by a.au_id
order by amount_of_books DESC
limit 3;
