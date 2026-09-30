--Consulta das 5 províncias com maior número de repatriados e comparação percentual do total
select
    n.nome_nacao,
    pv.nome_provincia,
    count(tf.id_pessoa) as total_pessoas,
    cast(count(tf.id_pessoa) * 100.0 / sum(count(tf.id_pessoa)) over() as decimal(5,2)) as percentual
from public.tb_origem o
left join public.tb_familia tf on o.id_familia = tf.id_familia
left join public.tb_provincia_origem pv ON pv.id_provincia = o.id_tb_provincia_origem
left join public.tb_nacao n on n.id_nacao = pv.id_nacao
where o.id_tb_provincia_origem IS NOT NULL
group by pv.nome_provincia, n.nome_nacao
order by total_pessoas desc
limit 5;