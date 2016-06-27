select id, name, surname, summa_dolga
from
(
select id, name, surname, 1500 - prior_month_sum as summa_dolga, 
row_number() over (order by prior_month_sum) as rn 
from
(
SELECT s.id, s.name, s.surname,
nvl((select sum(p.amount) as montn_amount from Payment p where p.student_id = s.id and to_char(p.payment_date,'yyyy.mm') = to_char(add_months(SYSDATE,-1),'yyyy.mm')), 0) as prior_month_sum
FROM Student s
)
where prior_month_sum < 1500
)
where rn <= 3 


