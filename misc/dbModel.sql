DROP TABLE IF EXISTS rod_crime;
DROP TABLE IF EXISTS ocorrenciaacidente;
DROP TABLE IF EXISTS ocorrenciaveiculo;
DROP TABLE IF EXISTS rod_acidente;
DROP TABLE IF EXISTS ocorrenciapessoa;
DROP TABLE IF EXISTS pessoa;
DROP TABLE IF EXISTS unidadeoperacional;
DROP TABLE IF EXISTS uf;
DROP TABLE IF EXISTS tipoenvolvido;
DROP TABLE IF EXISTS veiculo;
DROP TABLE IF EXISTS ocorrencia;
DROP TABLE IF EXISTS tipoacidente;
DROP TABLE IF EXISTS tipocrime;
DROP TABLE IF EXISTS tiposinalizacao;
DROP TABLE IF EXISTS tipodetencao;
DROP TABLE IF EXISTS tipolocalidade;
DROP TABLE IF EXISTS tiporeceptor;
DROP TABLE IF EXISTS localbr;
DROP TABLE IF EXISTS tipodocumento;
DROP TABLE IF EXISTS tipoobra;
DROP TABLE IF EXISTS tipoveiculo;
DROP TABLE IF EXISTS tipopontonotavel;
DROP TABLE IF EXISTS tipoapreensao;
DROP TABLE IF EXISTS tipocomunicacao;
DROP TABLE IF EXISTS tipopontomedico;
DROP TABLE IF EXISTS tipounidadeoperacional;
DROP TABLE IF EXISTS Municipio;

CREATE TABLE Municipio (
       tmucodigo CHAR(5) NOT NULL
     , tmudenominacao VARCHAR(60)
     , tmuuf CHAR(2)
     , tmuatualiza CHAR(1)
     , PRIMARY KEY (tmucodigo)
);

CREATE TABLE tipounidadeoperacional (
       ttucodigo SERIAL NOT NULL
     , ttudescricao VARCHAR(60)
     , ttuatualiza CHAR(1)
     , PRIMARY KEY (ttucodigo)
);

CREATE TABLE tipopontomedico (
       ttmcodigo SERIAL NOT NULL
     , ttmdescricao VARCHAR(60)
     , ttmatualiza CHAR(1)
     , PRIMARY KEY (ttmcodigo)
);

CREATE TABLE tipocomunicacao (
       tcocodigo SERIAL NOT NULL
     , tcoatualiza CHAR(1)
     , PRIMARY KEY (tcocodigo)
);

CREATE TABLE tipoapreensao (
       ttpcodigo SERIAL NOT NULL
     , ttpatualiza CHAR(1)
     , PRIMARY KEY (ttpcodigo)
);

CREATE TABLE tipopontonotavel (
       ttncodigo SERIAL NOT NULL
     , ttndescricao VARCHAR(60)
     , ttnatualiza CHAR(1)
     , PRIMARY KEY (ttncodigo)
);

CREATE TABLE tipoveiculo (
       tvvcodigo SERIAL NOT NULL
     , tvvatualiza CHAR(1)
     , tvvativo CHAR(1)
     , PRIMARY KEY (tvvcodigo)
);

CREATE TABLE tipoobra (
       ttbcodigo SERIAL NOT NULL
     , ttbdescricao VARCHAR(60)
     , ttbatualiza CHAR(1)
     , PRIMARY KEY (ttbcodigo)
);

CREATE TABLE tipodocumento (
       ttocodigo SERIAL NOT NULL
     , ttoatualiza CHAR(1)
     , ttorelrecuperacao CHAR(1)
     , PRIMARY KEY (ttocodigo)
);

CREATE TABLE localbr (
       lbrid SERIAL NOT NULL
     , lbruf CHAR(2)
     , lbrbr CHAR(3)
     , lbrkm CHAR(5)
     , lbrlatitude CHAR(20)
     , lbrlongitude CHAR(20)
     , lbrpnvid INT
     , lbratualiza CHAR(1)
     , PRIMARY KEY (lbrid)
);

CREATE TABLE tiporeceptor (
       ttrcodigo SERIAL NOT NULL
     , ttratualiza CHAR(1)
     , ttrdelegacia CHAR(1)
     , PRIMARY KEY (ttrcodigo)
);

CREATE TABLE tipolocalidade (
       ttlcodigo SERIAL NOT NULL
     , ttldescricao VARCHAR(60)
     , ttlatualiza CHAR(1)
     , PRIMARY KEY (ttlcodigo)
);

CREATE TABLE tipodetencao (
       ttdcodigo SERIAL NOT NULL
     , ttdatualiza CHAR(1)
     , PRIMARY KEY (ttdcodigo)
);

CREATE TABLE tiposinalizacao (
       ttscodigo SERIAL NOT NULL
     , ttsdescricao VARCHAR(60)
     , ttsatualiza CHAR(1)
     , PRIMARY KEY (ttscodigo)
);

CREATE TABLE tipocrime (
       ttccodigo SERIAL NOT NULL
     , ttcdescricao VARCHAR(60)
     , ttcatualiza CHAR(1)
     , PRIMARY KEY (ttccodigo)
);

CREATE TABLE tipoacidente (
       ttacodigo SERIAL NOT NULL
     , ttaatualiza CHAR(1)
     , ttaativo CHAR(1)
     , PRIMARY KEY (ttacodigo)
);

CREATE TABLE ocorrencia (
       ocoid SERIAL NOT NULL
     , ocolocal INT
     , ocostatus CHAR(1)
     , ocomunicipio CHAR(5)
     , ocosentido CHAR(1)
     , ocodataocorrencia TIMESTAMP
     , ocodataregistro TIMESTAMP
     , ocotipo CHAR(2)
     , ococomid INT
     , ocoidorigem INT
     , ococpfretif CHAR(11)
     , ocodatafim TIMESTAMP
     , ocoresolucao_monta CHAR(10)
     , PRIMARY KEY (ocoid)
);

CREATE TABLE veiculo (
       veiid SERIAL NOT NULL
     , veiano CHAR(4)
     , veiqtdocupantes INT
     , veitevcodigo INT
     , veitcvcodigo INT
     , veitvvcodigo INT
     , veimunicipio CHAR(5)
     , veitcecodigo INT
     , veimunorigem CHAR(5)
     , veipaisorigem INT
     , veimundestino CHAR(5)
     , veipaisdestino INT
     , veitttcodigo INT
     , veitipoproprietario CHAR(1)
     , veiproprietario INT
     , veioenid INT
     , veisequencia INT
     , veitipoplaca CHAR(1)
     , PRIMARY KEY (veiid)
);

CREATE TABLE tipoenvolvido (
       ttecodigo SERIAL NOT NULL
     , tteatualiza CHAR(1)
     , tteativo CHAR(1)
     , PRIMARY KEY (ttecodigo)
);

CREATE TABLE uf (
       tufuf CHAR(2) NOT NULL
     , tufdenominacao VARCHAR(60)
     , PRIMARY KEY (tufuf)
);

CREATE TABLE unidadeoperacional (
       uniid SERIAL NOT NULL
     , uniunidade CHAR(6)
     , unilotacao CHAR(9)
     , unisigla CHAR(15)
     , unittucodigo INT
     , tmucodigo CHAR(5)
     , uniunidaderesponsavel INT
     , unidenominacao VARCHAR(80)
     , uniendereco VARCHAR(60)
     , unimunicipio CHAR(5)
     , unicep CHAR(8)
     , unitelefone VARCHAR(250)
     , uniemail VARCHAR(60)
     , unilocal INT
     , unilatitude CHAR(10)
     , unilongitude CHAR(10)
     , unihelicoptero CHAR(1)
     , unitexto VARCHAR(255)
     , PRIMARY KEY (uniid)
     , CONSTRAINT FK_unidadeoperacional_1 FOREIGN KEY (unittucodigo)
                  REFERENCES tipounidadeoperacional (ttucodigo)
     , CONSTRAINT FK_unidadeoperacional_2 FOREIGN KEY (tmucodigo)
                  REFERENCES Municipio (tmucodigo)
);

CREATE TABLE pessoa (
       pesid SERIAL NOT NULL
     , pesexpedidor CHAR(10)
     , pesufexpedidora CHAR(2)
     , pesdatanascimento DATE
     , pesnaturalidade CHAR(5)
     , pesnacionalidade INT
     , pessexo CHAR(1)
     , pesteccodigo INT
     , pestgicodigo INT
     , pesmunicipio CHAR(5)
     , pestopcodigo INT
     , pesmunicipioor CHAR(5)
     , pespaisori INT
     , pesmunicipiodest CHAR(5)
     , pespaisdest INT
     , pesveiid INT
     , pesestadofisico SMALLINT
     , pescinto CHAR(1)
     , pescapacete CHAR(1)
     , peshabilitado CHAR(1)
     , pessocorrido CHAR(1)
     , pesdormindo CHAR(1)
     , pesalcool CHAR(1)
     , peskmpercorre DECIMAL(5,1)
     , peshorapercorre CHAR(4)
     , pescategcnh CHAR(3)
     , pesregistrocnh CHAR(11)
     , pesufcnh CHAR(2)
     , pespaiscnh INT
     , pesdatahabil DATE
     , pesdatavalidade DATE
     , pesapelido CHAR(30)
     , pesidade INT
     , pesaltura DECIMAL(3,2)
     , pespeso INT
     , pescicatriz CHAR(1)
     , pestatuagem CHAR(1)
     , pessina CHAR(1)
     , peslesao CHAR(1)
     , pestcccodigo INT
     , pestctcodigo INT
     , pestclcodigo INT
     , pespertences TEXT
     , pesdadoscomplement TEXT
     , pesoenid INT
     , PRIMARY KEY (pesid)
     , CONSTRAINT FK_pessoa_1 FOREIGN KEY (pesveiid)
                  REFERENCES veiculo (veiid)
);

CREATE TABLE ocorrenciapessoa (
       opeid SERIAL NOT NULL
     , opeocoid INT
     , opepesid INT
     , opeportenumero CHAR(9)
     , opeportevalidade DATE
     , opettecodigo INT
     , openaoident CHAR(1)
     , opeestrangeiro CHAR(1)
     , opeanexo CHAR(1)
     , opecondalegadas CHAR(1)
     , PRIMARY KEY (opeid)
     , CONSTRAINT FK_ocorrenciapessoa_1 FOREIGN KEY (opettecodigo)
                  REFERENCES tipoenvolvido (ttecodigo)
     , CONSTRAINT FK_ocorrenciapessoa_2 FOREIGN KEY (opepesid)
                  REFERENCES pessoa (pesid)
     , CONSTRAINT FK_ocorrenciapessoa_3 FOREIGN KEY (opeocoid)
                  REFERENCES ocorrencia (ocoid)
);

CREATE TABLE rod_acidente (
       id_rod_acidente SERIAL NOT NULL
     , tipo INT
     , data_ocorrencia TIMESTAMP
     , sentido INT
     , interdicao VARCHAR(1)
     , desc_interdicao VARCHAR
     , num_feridos INT
     , num_mortos INT
     , num_socorridos INT
     , destino VARCHAR
     , resumo VARCHAR
     , municipio VARCHAR(5)
     , tcacodigo INT
     , ttacodigo INT
     , comid INT
     , local INT
     , PRIMARY KEY (id_rod_acidente)
     , CONSTRAINT FK_rod_acidente_1 FOREIGN KEY (ttacodigo)
                  REFERENCES tipoacidente (ttacodigo)
);

CREATE TABLE ocorrenciaveiculo (
       ocvid SERIAL NOT NULL
     , ocvocoid INT
     , ocvveiid INT
     , PRIMARY KEY (ocvid)
     , CONSTRAINT FK_ocorrenciaveiculo_1 FOREIGN KEY (ocvveiid)
                  REFERENCES veiculo (veiid)
     , CONSTRAINT FK_ocorrenciaveiculo_2 FOREIGN KEY (ocvocoid)
                  REFERENCES ocorrencia (ocoid)
);

CREATE TABLE ocorrenciaacidente (
       oacocoid INT NOT NULL
     , oacttacodigo INT
     , oactcacodigo INT
     , oacdano CHAR(1)
     , oacdanoterc CHAR(1)
     , oacdanoamb CHAR(1)
     , oaclatitude CHAR(20)
     , oaclongitude CHAR(20)
     , oacrefera VARCHAR(60)
     , oacreferb VARCHAR(60)
     , oacdistab DECIMAL(5,1)
     , oacdistac DECIMAL(5,1)
     , oacdistbc DECIMAL(5,1)
     , oacmodelopista CHAR(2)
     , oacsentido1 VARCHAR(40)
     , oacsentido2 VARCHAR(40)
     , oacqtdfaixa1 INT
     , oacqtdfaixa2 INT
     , oacacostamento1 CHAR(1)
     , oacacostamento2 CHAR(1)
     , oacimagemlen INT
     , oacimagem BYTEA
     , oacdescdanopat VARCHAR(255)
     , oacdescdanoterc VARCHAR(255)
     , oacdescdanoamb VARCHAR(255)
     , oaccanteiro CHAR(1)
     , oaclinhacentral INT
     , oacorientpista CHAR(1)
     , oacgirafundo CHAR(1)
     , oacversaocroqui CHAR(1)
     , oacsitio INT
     , PRIMARY KEY (oacocoid)
     , CONSTRAINT FK_ocorrenciaacidente_1 FOREIGN KEY (oacocoid)
                  REFERENCES ocorrencia (ocoid)
     , CONSTRAINT FK_ocorrenciaacidente_2 FOREIGN KEY (oacttacodigo)
                  REFERENCES tipoacidente (ttacodigo)
);

CREATE TABLE rod_crime (
       id_rod_crime SERIAL NOT NULL
     , fk_id_comunicacao INT
     , fk_id_cidade INT
     , fk_id_localbr INT
     , fk_id_unidade_operacional INT
     , fk_id_servidor INT
     , fora_rodovia BOOLEAN
     , interdicao_rodovia BOOLEAN
     , numero_mortos INT
     , numero_pessoas_socorridas INT
     , numero_criancas_vitimas INT
     , numero_criancas_infratoras INT
     , numero_vitimas INT
     , numero_autores INT
     , intervencao_prf BOOLEAN
     , data_hora_ocorrencia TIMESTAMP
     , localizacao VARCHAR(30)
     , motivo_fora_rodovia INT
     , sentido_via SMALLINT
     , destino_vitimas VARCHAR
     , PRIMARY KEY (id_rod_crime)
     , CONSTRAINT FK_rod_crime_1 FOREIGN KEY (fk_id_unidade_operacional)
                  REFERENCES unidadeoperacional (uniid)
);

