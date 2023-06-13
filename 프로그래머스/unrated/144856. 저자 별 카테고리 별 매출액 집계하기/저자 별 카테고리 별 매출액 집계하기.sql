-- 코드를 입력하세요

select a.AUTHOR_ID, a.AUTHOR_NAME, b.CATEGORY, sum((s.sales * b.price)) as TOTAL_SALES
from book_sales s
join book b on s.book_id = b.book_id
join author a on b.AUTHOR_ID = a.AUTHOR_ID
where year(s.sales_date) = '2022' and month(s.sales_date) = '1'
group by AUTHOR_ID, CATEGORY
order by a.author_id, category desc

# select t1.author_id, author.author_name, t1.category, t1.sales
# from (select book.author_id, book.category, sum((salesByBookID.sales * book.price)) as sales
#     from (book 
#         inner join (select book_id, sum(sales) as sales
#             from book_sales
#             where sales_date > DATE_FORMAT('20211231', '%Y-%m-%d') && sales_date < DATE_FORMAT('20220201', '%Y-%m-%d')
#             group by book_id) as salesByBookID
#         on book.book_id = salesByBookID.book_id)
#     group by category, author_id) as t1
#     inner join author
#     on t1.author_id = author.author_id
# order by author_id, category desc