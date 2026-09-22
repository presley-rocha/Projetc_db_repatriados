CREATE TABLE pessoa 
( 
 id_pessoa INT PRIMARY KEY,  
 idade INT,  
 ocupacao VARCHAR,  
 genero VARCHAR,  
 raca_cor VARCHAR,  
 escolaridade VARCHAR,  
 nacionalidade VARCHAR,  
 faixa_etaria VARCHAR,  
 comorbidade VARCHAR,  
 hipertensao BOOLEAN,  
 asma BOOLEAN,  
 diabetes BOOLEAN,  
 saude_mental BOOLEAN,  
 problema_cardiaco BOOLEAN,  
 não_pcd BOOLEAN,  
 pcd_auditivo BOOLEAN,  
 pcd_intelectual BOOLEAN,  
 pcd_motora BOOLEAN,  
 pcd_visual BOOLEAN,  
 pcd_psicossocial BOOLEAN,  
 tea BOOLEAN,  
 gestante BOOLEAN,  
 semanas_gestacao INT,  
 lactante BOOLEAN,  
 uso_remedio_continuo BOOLEAN,  
); 

CREATE TABLE repatriacao 
( 
 id INT PRIMARY KEY,  
 id_pessoa INT,  
 data DATE NOT NULL,  
 consentimento BOOLEAN,  
 BO_ocorrencia BOOLEAN,  
 autodeportacao BOOLEAN,  
 membros_fam_permaneceram INT,  
 soz_fam BOOLEAN,  
 id_tipo_estadia_destino INT,  
 id_ocupacao_destino INT,  
 id_profissao_destino INT,  
 id_relacao_PF_destino INT,  
 id_outro_pais_destino INT,  
 id_cidade_br INT,  
 id_UF_destino INT,  
); 

CREATE TABLE cidade_br 
( 
 id_cidade_br INT PRIMARY KEY,  
 nome_cidade VARCHAR,  
 id_UF_BR INT,  
); 

CREATE TABLE nacao 
( 
 id_nacao INT PRIMARY KEY,  
 nome_nacao VARCHAR,  
); 

CREATE TABLE provincia 
( 
 id_provincia INT PRIMARY KEY,  
 nome_provincia VARCHAR,  
 sigla VARCHAR,  
 idnacao INT,  
); 

CREATE TABLE cidade_origem 
( 
 id_cidade INT PRIMARY KEY,  
 nome_cidade VARCHAR,  
 id_provincia INT,  
); 

CREATE TABLE tipo_estadia_destino 
( 
 id_tipo_estadia INT PRIMARY KEY,  
 tipo_estadia VARCHAR,  
); 

CREATE TABLE uf_br 
( 
 id_uf INT PRIMARY KEY,  
 nome_UF VARCHAR,  
 sigla VARCHAR,  
); 

CREATE TABLE familia 
( 
 id_familia INT PRIMARY KEY,  
 idpessoa INT,  
); 

CREATE TABLE ocupacao_destino 
( 
 id_ocupacao INT PRIMARY KEY,  
 ocupacao VARCHAR,  
); 

CREATE TABLE profissao_destino 
( 
 id_profissao INT PRIMARY KEY,  
 profissao VARCHAR,  
); 

CREATE TABLE relacao_PF_destino 
( 
 id_relacao_PF INT PRIMARY KEY,  
 tipo_relacao VARCHAR,  
); 

CREATE TABLE residia 
( 
 id_cidade INT PRIMARY KEY,  
 id_familia INT PRIMARY KEY,  
 tempo_residencia VARCHAR,  
); 

ALTER TABLE repatriacao ADD FOREIGN KEY(id_pessoa) REFERENCES pessoa (id_pessoa)
ALTER TABLE repatriacao ADD FOREIGN KEY(id_tipo_estadia_destino) REFERENCES tipo_estadia_destino (id_tipo_estadia_destino)
ALTER TABLE repatriacao ADD FOREIGN KEY(id_ocupacao_destino) REFERENCES ocupacao_destino (id_ocupacao_destino)
ALTER TABLE repatriacao ADD FOREIGN KEY(id_profissao_destino) REFERENCES profissao_destino (id_profissao_destino)
ALTER TABLE repatriacao ADD FOREIGN KEY(id_relacao_PF_destino) REFERENCES relacao_PF_destino (id_relacao_PF_destino)
ALTER TABLE repatriacao ADD FOREIGN KEY(id_outro_pais_destino) REFERENCES nacao (id_outro_pais_destino)
ALTER TABLE repatriacao ADD FOREIGN KEY(id_cidade_br) REFERENCES cidade_br (id_cidade_br)
ALTER TABLE repatriacao ADD FOREIGN KEY(id_UF_destino) REFERENCES uf_br (id_UF_destino)
ALTER TABLE cidade_br ADD FOREIGN KEY(id_UF_BR) REFERENCES uf_br (id_UF_BR)
ALTER TABLE provincia ADD FOREIGN KEY(idnacao) REFERENCES nacao (idnacao)
ALTER TABLE cidade_origem ADD FOREIGN KEY(id_provincia) REFERENCES provincia (id_provincia)
ALTER TABLE familia ADD FOREIGN KEY(idpessoa) REFERENCES pessoa (idpessoa)
ALTER TABLE residia ADD FOREIGN KEY(id_cidade) REFERENCES cidade_origem (id_cidade)
ALTER TABLE residia ADD FOREIGN KEY(id_familia) REFERENCES familia (id_familia)
