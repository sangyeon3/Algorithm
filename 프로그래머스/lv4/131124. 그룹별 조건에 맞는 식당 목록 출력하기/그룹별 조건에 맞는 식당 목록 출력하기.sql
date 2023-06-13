-- 코드를 입력하세요
SELECT m.member_NAME as MEMBER_NAME, r.review_text as REVIEW_TEXT, date_format(r.review_date, '%Y-%m-%d') as REVIEW_DATE
from rest_review r
join member_profile m on r.member_id = m.member_id
where m.member_id = (
    select member_id from rest_review group by member_id 
    order by count(*) desc limit 1
)
order by REVIEW_DATE, REVIEW_TEXT