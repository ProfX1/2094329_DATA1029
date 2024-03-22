use epharmacy;

ALTER table user
add address varchar(255);

update user  set address = "655, avenue Main, Moncton, NB E1C 1E8" where role_id = 1 ;
update user  set address = "600, rue de la Gauchetière Ouest Montréal, Québec H3B 4L2" where role_id = 2 ;
update user  set address = "397, rue Queen Fredericton, NB E3B 1B5" where role_id = 3 ;
update orders set sum = 160 where id=6;
select * from user;

insert into user set address = "644, rue Main, Moncton, NB E1C 1E2", email = "Emily2macdo@gmail.com", full_name = "Emily MacDonald", role_id = 3, `password` = "password123";
insert into user set address = "123 Rue Principale Bathurst, NB E2A 1A1", email = "smith@ccnb.ca", full_name = "John Smith", role_id = 3, `password` = "password123";
insert into user set address = "456, rue Principale, Campbelton, NB E3N 1A1", email = "amadou.ndiaye@ccnb.ca ", full_name = "Amadou Ndiaye", role_id = 3, `password` = "password123";

select * from orders;
select * from invoice;
select * from OrderLine;
select * from connection_history;
-- total order = 12
insert into orders set sum=12;

-- tilenol(1) x5, efferalgan(6) x3, advile(3) x4
insert into OrderLine set product_id = 1, order_id = 6, quantity = 5;
insert into OrderLine set product_id = 3, order_id = 6, quantity = 4;
insert into OrderLine set product_id = 6, order_id = 6, quantity = 3;


-- Emily(5), order_id(6), 
insert into invoice set date = ('2024-03-12 10:00:00'), order_id = 6, user_id = 5, customer_id = 5, supplier_id = 1;

insert into connection_history set login_date = ('2024-03-12 08:00:00'), logout_date = ('2024-03-12 10:00:00'), onsite_time = ('02:00:00'), user_id = 5;

-- tilenol = 1 advile =3 eff =6 order_id=6
select * from product;
ALTER table product
add stock int;

update product set stock = 25 where id = 1;
update product set stock = 43 where id = 6;
update product set stock = 34 where id = 3;
update product set stock = 30 where id = 4;
update product set stock = 35 where id = 2;
update product set stock = 12 where id = 5;
select name, stock from product;