use epharmacy;

delimiter $;

create procedure productBuyby(in v_fullName Varchar(30))
BEGIN
	select p.name as Designation, ol.quantity as Quantite
    FROM user u
    join invoice i on u.id = i.customer_id
    join orders o on i.order_id = o.id
    join orderline ol on o.id = ol.order_id
    join product p on ol.product_id=p.id
    where u.full_name='Abdoulaye Mane'
END;
    
call productBuyby('Abdoulaye Mane')