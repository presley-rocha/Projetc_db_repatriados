--Consulta para agrupor a quantidade de pessoas repatriadas com faixa de idade para cada estrato de sexo.
select
 g.genero,
    CASE
        WHEN p.idade BETWEEN 0 AND 10 THEN '0-10'
        WHEN p.idade BETWEEN 11 AND 20 THEN '11-20'
        WHEN p.idade BETWEEN 21 AND 30 THEN '21-30'
        WHEN p.idade BETWEEN 31 AND 40 THEN '31-40'
        WHEN p.idade BETWEEN 41 AND 50 THEN '41-50'
        WHEN p.idade BETWEEN 51 AND 60 THEN '51-60'
        WHEN p.idade > 60 THEN 'Mais de 60'
        ELSE 'Não informado'
    END AS faixa_etaria,
    COUNT(DISTINCT p.id_pessoa) AS total_pessoas_repatriadas
FROM public.tb_pessoa p
JOIN public.tb_repatriacao r ON r.id_pessoa = p.id_pessoa
LEFT JOIN public.tb_genero g ON g.id = p.id_genero
GROUP by
g.genero,
    CASE
        WHEN p.idade BETWEEN 0 AND 10 THEN '0-10'
        WHEN p.idade BETWEEN 11 AND 20 THEN '11-20'
        WHEN p.idade BETWEEN 21 AND 30 THEN '21-30'
        WHEN p.idade BETWEEN 31 AND 40 THEN '31-40'
        WHEN p.idade BETWEEN 41 AND 50 THEN '41-50'
        WHEN p.idade BETWEEN 51 AND 60 THEN '51-60'
        WHEN p.idade > 60 THEN 'Mais de 60'
        ELSE 'Não informado'
    END 
ORDER BY faixa_etaria, g.genero;