SELECT id, name, surname, 1500 - prior_month_sum AS summa_dolga
FROM
(
SELECT s.id, s.name, s.surname,
nvl((SELECT sum(p.amount) AS montn_amount 
        FROM Payment p 
        WHERE p.student_id = s.id AND to_char(p.payment_date,'yyyy.mm') = to_char(add_months(SYSDATE,-1),'yyyy.mm')), 0) AS prior_month_sum
FROM Student s
)
WHERE prior_month_sum < 1500 --




