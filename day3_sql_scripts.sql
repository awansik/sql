SELECT * 
FROM product
-- WHERE productid = 5
WHERE listprice = 57.50
AND code = 'java';

select * from product 
where listprice < 55;

select * from product
order by description desc;

select max(listprice) from product;

select count(*) from product
where listprice = 57.50;