use library;

set autocommit=0;
insert into library.stores (`stor_name`, `stor_address`, `city`, `state`, `zip`)values
('bilio ccnb dieppe', '594 rue du college', 'Moncton', 'Nouveau Brunswick', 'E3C2R9'),
('crayon', '233 main st','dieppe', 'nouveau brunswick', 'E2C 5X7');
update authors
set au_fname = "christiono", au_lname="Ronaldo"
where au_id=4;
select * from stores;
select * from authors where au_id=4;
rollback; -- pour annuler les requete 
select * from stores;
select * from authors where au_id=4;