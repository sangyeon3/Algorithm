-- 코드를 입력하세요
SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE 
from food_product
where PRICE = (
    select max(PRICE)
    from food_product
);