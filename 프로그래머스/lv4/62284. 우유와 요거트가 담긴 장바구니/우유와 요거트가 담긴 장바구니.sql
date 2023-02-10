-- 코드를 입력하세요


SELECT t1.cart_id
FROM (select cart_id from cart_products where name = "Milk") as t1 
inner join (select cart_id from cart_products where name = "Yogurt") as t2 
on t1.CART_ID = t2.CART_ID