--Consulta para listar ás 5 UF com maior número de pessoas tem como destino
select
    uf.nome_uf as UF,
    count(distinct r.id_pessoa) as total_pessoas,	
	cast(count(r.id_pessoa)*100 / sum(count(r.id_pessoa)) over () as decimal(5,2)) as percentual
from public.tb_repatriacao r
left join public.tb_uf_br uf on uf.id_uf = r.id_UF_destino
group by uf.id_uf, uf.nome_uf, uf.sigla
order by total_pessoas desc
limit 5;