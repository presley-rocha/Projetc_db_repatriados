--Conta quantas pessoas no total foram repatriadas por ano-mês 
SELECT
    TO_CHAR(r.data, 'YYYY-MM') AS ano_mes,
    COUNT(DISTINCT r.id_pessoa) AS total_pessoas_repatriadas
FROM public.tb_repatriacao r
GROUP BY DATE_TRUNC('month', r.data), TO_CHAR(r.data, 'YYYY-MM')