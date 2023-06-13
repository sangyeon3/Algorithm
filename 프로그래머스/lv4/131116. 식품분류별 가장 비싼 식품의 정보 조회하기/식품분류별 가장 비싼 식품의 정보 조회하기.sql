-- 코드를 입력하세요
SELECT CATEGORY, PRICE as MAX_PRICE, PRODUCT_NAME
from food_product
where PRICE IN (select max(price) from food_product group by category) and CATEGORY IN ('과자', '국', '식용유', '김치')
order by price desc