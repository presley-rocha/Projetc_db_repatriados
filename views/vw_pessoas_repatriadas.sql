CREATE OR REPLACE VIEW public.vw_pessoas_repatriadas
 AS
 SELECT p.id_pessoa,
    p.idade,
        CASE
            WHEN g.genero IS NULL THEN 'Sem informação'::character varying
            ELSE g.genero
        END AS genero,
        CASE
            WHEN rc.raca_cor IS NULL THEN 'Sem informação'::character varying
            ELSE rc.raca_cor
        END AS raca_cor,
        CASE
            WHEN n.nome_nacao IS NULL THEN 'Sem informação'::character varying
            ELSE n.nome_nacao
        END AS nome_nacao,
        CASE
            WHEN e.escolaridade IS NULL THEN 'Sem informação'::character varying
            ELSE e.escolaridade
        END AS escolaridade,
        CASE
            WHEN oa.ocupacao IS NULL THEN 'Sem informação'::character varying
            ELSE oa.ocupacao
        END AS ocupacao_anterior,
    p.comorbidade,
        CASE
            WHEN p.hipertensao IS TRUE THEN 'Sim'::text
            WHEN p.hipertensao IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS hipertensao,
        CASE
            WHEN p.asma IS TRUE THEN 'Sim'::text
            WHEN p.asma IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS asma,
        CASE
            WHEN p.diabetes IS TRUE THEN 'Sim'::text
            WHEN p.diabetes IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS diabetes,
        CASE
            WHEN p.problema_cardiaco IS TRUE THEN 'Sim'::text
            WHEN p.problema_cardiaco IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS problema_cardiaco,
        CASE
            WHEN p.saude_mental IS TRUE THEN 'Sim'::text
            WHEN p.saude_mental IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS saude_mental,
        CASE
            WHEN p.nao_pcd IS TRUE THEN 'Sim'::text
            WHEN p.nao_pcd IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS nao_pcd,
        CASE
            WHEN p.pcd_auditivo IS TRUE THEN 'Sim'::text
            WHEN p.pcd_auditivo IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS pcd_auditivo,
        CASE
            WHEN p.pcd_intelectual IS TRUE THEN 'Sim'::text
            WHEN p.pcd_intelectual IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS pcd_intelectual,
        CASE
            WHEN p.pcd_motora IS TRUE THEN 'Sim'::text
            WHEN p.pcd_motora IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS pcd_motora,
        CASE
            WHEN p.pcd_visual IS TRUE THEN 'Sim'::text
            WHEN p.pcd_visual IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS pcd_visual,
        CASE
            WHEN p.pcd_psicossocial IS TRUE THEN 'Sim'::text
            WHEN p.pcd_psicossocial IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS pcd_psicossocial,
        CASE
            WHEN p.tea IS TRUE THEN 'Sim'::text
            WHEN p.tea IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS tea,
        CASE
            WHEN p.gestante IS TRUE THEN 'Sim'::text
            WHEN p.gestante IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS gestante,
    p.semanas_gestacao,
        CASE
            WHEN p.lactante IS TRUE THEN 'Sim'::text
            WHEN p.lactante IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS lactante,
        CASE
            WHEN p.uso_remedio_continuo IS TRUE THEN 'Sim'::text
            WHEN p.uso_remedio_continuo IS FALSE THEN 'Não'::text
            ELSE 'Não informado'::text
        END AS uso_remedio_continuo,
    p.id_familia
   FROM tb_pessoa p
     LEFT JOIN tb_genero g ON p.id_genero = g.id
     LEFT JOIN tb_raca_cor rc ON p.id_raca_cor = rc.id
     LEFT JOIN tb_nacao n ON p.id_nacao = n.id_nacao
     LEFT JOIN tb_escolaridade e ON p.id_escolaridade = e.id
     LEFT JOIN tb_ocupacao_anterior oa ON p.id_ocupacao_anterior = oa.id;