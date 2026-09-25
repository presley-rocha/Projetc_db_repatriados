--Criando a tb_escolaridade
CREATE TABLE public.tb_escolaridade (
	id int4 NOT NULL,
	escolaridade varchar NULL,
	CONSTRAINT tb_escolaridade_pkey PRIMARY KEY (id)
);

--Criando a tb_genero
CREATE TABLE public.tb_genero (
	id int4 NOT NULL,
	genero varchar NULL,
	CONSTRAINT tb_genero_pkey PRIMARY KEY (id)
);

--Criando a tb_nacao
CREATE TABLE public.tb_nacao (
	id_nacao int4 NOT NULL,
	nome_nacao varchar NULL,
	CONSTRAINT tb_nacao_pkey PRIMARY KEY (id_nacao)
);

--Criando a tb_ocupacao_anterior
CREATE TABLE public.tb_ocupacao_anterior (
	id int4 NOT NULL,
	ocupacao varchar NULL,
	CONSTRAINT tb_ocupacao_anterior_pkey PRIMARY KEY (id)
);

--Criando a tb_ocupacao_destino
CREATE TABLE public.tb_ocupacao_destino (
	id_ocupacao int4 NOT NULL,
	ocupacao varchar NULL,
	CONSTRAINT tb_ocupacao_destino_pkey PRIMARY KEY (id_ocupacao)
);

--Criando a tb_profissao_destino
CREATE TABLE public.tb_profissao_destino (
	id_profissao int4 NOT NULL,
	profissao varchar NULL,
	CONSTRAINT tb_profissao_destino_pkey PRIMARY KEY (id_profissao)
);

--Criando a tb_raca_cor
CREATE TABLE public.tb_raca_cor (
	id int4 NOT NULL,
	raca_cor varchar NULL,
	CONSTRAINT tb_raca_cor_pkey PRIMARY KEY (id)
);

--Criando a tb_relacao_pf_destino
CREATE TABLE public.tb_relacao_pf_destino (
	id_relacao_pf int4 NOT NULL,
	tipo_relacao varchar NULL,
	CONSTRAINT tb_relacao_pf_destino_pkey PRIMARY KEY (id_relacao_pf)
);

--Criando a tb_tipo_estadia_destino
CREATE TABLE public.tb_tipo_estadia_destino (
	id_tipo_estadia int4 NOT NULL,
	tipo_estadia varchar NULL,
	CONSTRAINT tb_tipo_estadia_destino_pkey PRIMARY KEY (id_tipo_estadia)
);

--Criando a tb_uf_br
CREATE TABLE public.tb_uf_br (
	id_uf int4 NOT NULL,
	nome_uf varchar NULL,
	sigla varchar NULL,
	CONSTRAINT tb_uf_br_pkey PRIMARY KEY (id_uf)
);

--Criando a tb_cidade_br
CREATE TABLE public.tb_cidade_br (
	id_cidade_br int4 NOT NULL,
	nome_cidade varchar NULL,
	id_uf_br int4 NULL,
	CONSTRAINT tb_cidade_br_pkey PRIMARY KEY (id_cidade_br),
	CONSTRAINT fk_cidade_uf FOREIGN KEY (id_uf_br) REFERENCES public.tb_uf_br(id_uf)
);

--Criando a tb_pessoa
CREATE TABLE public.tb_pessoa (
	id_pessoa int4 NOT NULL,
	idade int4 NULL,
	id_genero int4 NULL,
	id_raca_cor int4 NULL,
	id_escolaridade int4 NULL,
	id_nacao int4 NULL,
	id_ocupacao_anterior int4 NULL,
	comorbidade varchar NULL,
	hipertensao bool NULL,
	asma bool NULL,
	diabetes bool NULL,
	problema_cardiaco bool NULL,
	saude_mental bool NULL,
	nao_pcd bool NULL,
	pcd_auditivo bool NULL,
	pcd_intelectual bool NULL,
	pcd_motora bool NULL,
	pcd_visual bool NULL,
	pcd_psicossocial bool NULL,
	tea bool NULL,
	gestante bool NULL,
	semanas_gestacao int4 NULL,
	lactante bool NULL,
	uso_remedio_continuo bool NULL,
	id_familia int4 NULL,
	CONSTRAINT tb_pessoa_pkey PRIMARY KEY (id_pessoa),
	CONSTRAINT fk_pessoa_escolaridade FOREIGN KEY (id_escolaridade) REFERENCES public.tb_escolaridade(id),
	CONSTRAINT fk_pessoa_genero FOREIGN KEY (id_genero) REFERENCES public.tb_genero(id),
	CONSTRAINT fk_pessoa_nacao FOREIGN KEY (id_nacao) REFERENCES public.tb_nacao(id_nacao),
	CONSTRAINT fk_pessoa_ocupacao FOREIGN KEY (id_ocupacao_anterior) REFERENCES public.tb_ocupacao_anterior(id),
	CONSTRAINT fk_pessoa_raca FOREIGN KEY (id_raca_cor) REFERENCES public.tb_raca_cor(id)
);

--Criando a tb_provincia_origem
CREATE TABLE public.tb_provincia_origem (
	id_provincia int4 NOT NULL,
	nome_provincia varchar NULL,
	sigla varchar NULL,
	id_nacao int4 NULL,
	CONSTRAINT tb_provincia_origem_pkey PRIMARY KEY (id_provincia),
	CONSTRAINT fk_provincia_nacao FOREIGN KEY (id_nacao) REFERENCES public.tb_nacao(id_nacao)
);

--Criando a tb_repatriacao
CREATE TABLE public.tb_repatriacao (
	id int4 NOT NULL,
	id_pessoa int4 NULL,
	"data" date NOT NULL,
	consentimento bool NULL,
	bo_ocorrencia bool NULL,
	autodeportacao bool NULL,
	membros_fam_permaneceram varchar NULL,
	soz_fam varchar NULL,
	id_tipo_estadia_destino int4 NULL,
	id_ocupacao_destino int4 NULL,
	id_profissao_destino int4 NULL,
	id_relacao_pf_destino int4 NULL,
	id_cidade_br int4 NULL,
	id_uf_destino int4 NULL,
	id_outro_pais_destino int4 NULL,
	CONSTRAINT tb_repatriacao_pkey PRIMARY KEY (id),
	CONSTRAINT fk_repatriacao_cidade FOREIGN KEY (id_cidade_br) REFERENCES public.tb_cidade_br(id_cidade_br),
	CONSTRAINT fk_repatriacao_estadia FOREIGN KEY (id_tipo_estadia_destino) REFERENCES public.tb_tipo_estadia_destino(id_tipo_estadia),
	CONSTRAINT fk_repatriacao_ocupacao FOREIGN KEY (id_ocupacao_destino) REFERENCES public.tb_ocupacao_destino(id_ocupacao),
	CONSTRAINT fk_repatriacao_pais FOREIGN KEY (id_outro_pais_destino) REFERENCES public.tb_nacao(id_nacao),
	CONSTRAINT fk_repatriacao_pessoa FOREIGN KEY (id_pessoa) REFERENCES public.tb_pessoa(id_pessoa),
	CONSTRAINT fk_repatriacao_profissao FOREIGN KEY (id_profissao_destino) REFERENCES public.tb_profissao_destino(id_profissao),
	CONSTRAINT fk_repatriacao_relacao FOREIGN KEY (id_relacao_pf_destino) REFERENCES public.tb_relacao_pf_destino(id_relacao_pf),
	CONSTRAINT fk_repatriacao_uf FOREIGN KEY (id_uf_destino) REFERENCES public.tb_uf_br(id_uf)
);

--Criando a tb_alerta_menor_desacompanhado
CREATE TABLE public.tb_alerta_menor_desacompanhado (
	id serial4 NOT NULL,
	id_repatriacao int4 NOT NULL,
	id_pessoa int4 NOT NULL,
	idade int4 NOT NULL,
	soz_fam varchar NULL,
	data_identificacao timestamp DEFAULT now() NULL,
	CONSTRAINT tb_alerta_menor_desacompanhado_pkey PRIMARY KEY (id),
	CONSTRAINT fk_alerta_pessoa FOREIGN KEY (id_pessoa) REFERENCES public.tb_pessoa(id_pessoa),
	CONSTRAINT fk_alerta_repatriacao FOREIGN KEY (id_repatriacao) REFERENCES public.tb_repatriacao(id)
);

--Criando a tb_familia
CREATE TABLE public.tb_familia (
	id_familia int4 NOT NULL,
	id_pessoa int4 NULL,
	CONSTRAINT tb_familia_pkey PRIMARY KEY (id_familia),
	CONSTRAINT fk_familia_pessoa FOREIGN KEY (id_pessoa) REFERENCES public.tb_pessoa(id_pessoa)
);

--Criando a tb_origem
CREATE TABLE public.tb_origem (
	id_familia int4 NOT NULL,
	tempo_residencia varchar NULL,
	id_tb_provincia_origem int4 NULL,
	id_pessoa int4 NOT NULL,
	CONSTRAINT tb_origem_pkey PRIMARY KEY (id_familia, id_pessoa),
	CONSTRAINT fk_origem_familia FOREIGN KEY (id_familia) REFERENCES public.tb_familia(id_familia),
	CONSTRAINT fk_origem_provincia FOREIGN KEY (id_tb_provincia_origem) REFERENCES public.tb_provincia_origem(id_provincia)
);

--Criando a tb_alerta_menor_desacompanhado(usada para registrar os resultados da trigger de monitoramento de pessoas menores e desacompanhadas )
CREATE TABLE public.tb_alerta_menor_desacompanhado (
    id SERIAL PRIMARY KEY,
    id_repatriacao INT NOT NULL,
    id_pessoa INT NOT NULL,
    idade INT NOT NULL,
    soz_fam VARCHAR,
    data_identificacao TIMESTAMP DEFAULT now(),
    CONSTRAINT fk_alerta_repatriacao FOREIGN KEY (id_repatriacao) REFERENCES public.tb_repatriacao (id),
    CONSTRAINT fk_alerta_pessoa FOREIGN KEY (id_pessoa) REFERENCES public.tb_pessoa (id_pessoa)
);