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

