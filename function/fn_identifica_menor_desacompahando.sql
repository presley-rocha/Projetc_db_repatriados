CREATE OR REPLACE FUNCTION public.fn_identifica_menor_desacompanhado()
RETURNS TRIGGER AS $$
DECLARE
    v_idade INT;
BEGIN
    -- Busca a idade da pessoa vinculada ao registro na tb_repatriacao
    SELECT idade INTO v_idade
    FROM public.tb_pessoa
    WHERE id_pessoa = NEW.id_pessoa;

    -- Verifica se é menor ou igual a 18 anos E se soz_fam está marcado como "Sim"
    IF v_idade IS NOT NULL 
       AND v_idade <= 18 
       AND NEW.soz_fam ILIKE 'sim' THEN

        INSERT INTO public.tb_alerta_menor_desacompanhado (
            id_repatriacao, id_pessoa, idade, soz_fam
        )
        VALUES (
            NEW.id, NEW.id_pessoa, v_idade, NEW.soz_fam
        );

        RAISE NOTICE 'ALERTA: Menor de idade (idade=%) desacompanhado identificado. id_pessoa=%, id_repatriacao=%',
            v_idade, NEW.id_pessoa, NEW.id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;