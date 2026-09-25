-- View: public.vw_repatriacao

CREATE OR REPLACE VIEW public.vw_repatriacao
 AS
 SELECT r.id_pessoa,
    r.data,
        CASE
            WHEN r.consentimento IS TRUE THEN 'Sim'::text
            WHEN r.consentimento IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS consentimento,
        CASE
            WHEN r.bo_ocorrencia IS TRUE THEN 'Sim'::text
            WHEN r.bo_ocorrencia IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS bo_ocorrencia,
        CASE
            WHEN r.autodeportacao IS TRUE THEN 'Sim'::text
            WHEN r.autodeportacao IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS autodeportacao,
    r.membros_fam_permaneceram,
    r.soz_fam,
    te.tipo_estadia,
    od.ocupacao AS ocupacao_destino,
    pd.profissao AS profissao_destino,
    rp.tipo_relacao AS relacao_pf_destino,
    cb.nome_cidade,
    uf.nome_uf,
    uf.sigla AS sigla_uf,
    n.nome_nacao AS pais_destino
   FROM tb_repatriacao r
     LEFT JOIN tb_tipo_estadia_destino te ON r.id_tipo_estadia_destino = te.id_tipo_estadia
     LEFT JOIN tb_ocupacao_destino od ON r.id_ocupacao_destino = od.id_ocupacao
     LEFT JOIN tb_profissao_destino pd ON r.id_profissao_destino = pd.id_profissao
     LEFT JOIN tb_relacao_pf_destino rp ON r.id_relacao_pf_destino = rp.id_relacao_pf
     LEFT JOIN tb_cidade_br cb ON r.id_cidade_br = cb.id_cidade_br
     LEFT JOIN tb_uf_br uf ON r.id_uf_destino = uf.id_uf
     LEFT JOIN tb_nacao n ON r.id_outro_pais_destino = n.id_nacao;