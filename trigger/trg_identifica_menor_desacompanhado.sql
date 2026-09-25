--Cria a trigger para execultar a função
CREATE TRIGGER trg_identifica_menor_desacompanhado
AFTER INSERT ON public.tb_repatriacao
FOR EACH ROW --Aplica a function linha a linha depois que os registros são feitos na tb_repatriacao
EXECUTE FUNCTION public.fn_identifica_menor_desacompanhado();