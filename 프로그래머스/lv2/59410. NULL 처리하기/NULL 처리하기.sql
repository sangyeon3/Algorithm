-- 코드를 입력하세요
SELECT ANIMAL_TYPE, coalesce(NAME, 'No name') as NAME, SEX_UPON_INTAKE
from animal_ins
order by ANIMAL_ID