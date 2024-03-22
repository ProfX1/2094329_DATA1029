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



-- 9. Les auteurs des 5 livres les plus vendus. (10 pts)



-- 10. Prix moyens des livres par maisons d’édition. (10 pts)



-- 11. Les 3 auteurs ayant les plus de livres (10 pts)


