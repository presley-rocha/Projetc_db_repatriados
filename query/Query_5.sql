--Consulta para trazer os 10 províncias com mais repatriadas com distinção de sexo e idade.
WITH top_provincias AS (
    --Identifica as 5 províncias com maior número de repatriados
    SELECT 
        pv.id_provincia, 
        pv.nome_provincia
    FROM public.tb_origem o
    LEFT JOIN public.tb_provincia_origem pv ON pv.id_provincia = o.id_tb_provincia_origem
    WHERE o.id_tb_provincia_origem IS NOT NULL
    GROUP BY pv.id_provincia, pv.nome_provincia
    ORDER BY COUNT(o.id_pessoa) DESC),dados_detalhados 
    AS (
    -- Agrupa por gênero, faixa etária e província 
    SELECT 
        g.genero,
        CASE
            WHEN tp.idade BETWEEN 0 AND 10 THEN '0-10'
            WHEN tp.idade BETWEEN 11 AND 20 THEN '11-20'
            WHEN tp.idade BETWEEN 21 AND 30 THEN '21-30'
            WHEN tp.idade BETWEEN 31 AND 40 THEN '31-40'
            WHEN tp.idade BETWEEN 41 AND 50 THEN '41-50'
            WHEN tp.idade BETWEEN 51 AND 60 THEN '51-60'
            WHEN tp.idade > 60 THEN 'Mais de 60'
            ELSE 'Não informado'
        END AS faixa_etaria,
        tpv.nome_provincia,
        COUNT(tf.id_pessoa) AS total_pessoas
    FROM public.tb_origem o
    INNER JOIN top_provincias tpv ON o.id_tb_provincia_origem = tpv.id_provincia
    LEFT JOIN public.tb_familia tf ON o.id_familia = tf.id_familia
    LEFT JOIN public.tb_pessoa tp ON o.id_pessoa = tp.id_pessoa
    LEFT JOIN public.tb_genero g ON g.id = tp.id_genero
    GROUP BY 
        tpv.nome_provincia, 
        g.genero, 
        CASE
            WHEN tp.idade BETWEEN 0 AND 10 THEN '0-10'
            WHEN tp.idade BETWEEN 11 AND 20 THEN '11-20'
            WHEN tp.idade BETWEEN 21 AND 30 THEN '21-30'
            WHEN tp.idade BETWEEN 31 AND 40 THEN '31-40'
            WHEN tp.idade BETWEEN 41 AND 50 THEN '41-50'
            WHEN tp.idade BETWEEN 51 AND 60 THEN '51-60'
            WHEN tp.idade > 60 THEN 'Mais de 60'
            ELSE 'Não informado'
        END)
-- Seleção final do top 10 e calculando o percentual do total
SELECT 
    genero,
    faixa_etaria,
    nome_provincia,
    total_pessoas,
    CAST(total_pessoas * 100.0 / SUM(total_pessoas) OVER() AS DECIMAL(5,2)) AS perct_do_total
FROM dados_detalhados
ORDER BY total_pessoas desc
limit 10;