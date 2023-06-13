-- 코드를 입력하세요
SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, coalesce(FREEZER_YN, 'N') as FREEZER_YN
from food_warehouse
where ADDRESS LIKE '%경기도%'
order by WAREHOUSE_ID