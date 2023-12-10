-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-12-04 20:02:20 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE perfil_acesso (
    id_perfil     NUMBER NOT NULL,
    ds_autoridade VARCHAR2(10) NOT NULL
);

ALTER TABLE perfil_acesso ADD CONSTRAINT perfil_acesso_pk PRIMARY KEY ( id_perfil );

CREATE TABLE tb_adocoes (
    id_adotante                NUMBER(8) NOT NULL,
    dt_adocao                  DATE NOT NULL,
    id_usuario                 NUMBER(8) NOT NULL,
    ds_observacao              VARCHAR2(2000),
    tb_usuarios_tb_usuarios_id NUMBER NOT NULL
);

ALTER TABLE tb_adocoes ADD CONSTRAINT tb_adocoes_pk PRIMARY KEY ( id_adotante );

CREATE TABLE tb_animais (
    id_animal              NUMBER(8) NOT NULL,
    nm_nome                VARCHAR2(50) NOT NULL,
    nr_idade               NUMBER(2) NOT NULL,
    ds_especie             VARCHAR2(10) NOT NULL,
    st_adotado             VARCHAR2(1) NOT NULL,
    tb_adocoes_id_adotante NUMBER(8) NOT NULL,
    ds_observacao          VARCHAR2(2000),
    tb_doacoes_id_doador   NUMBER(8) NOT NULL
);

ALTER TABLE tb_animais ADD CONSTRAINT t_conpet_animais_pk PRIMARY KEY ( id_animal );

CREATE TABLE tb_doacoes (
    id_doador                  NUMBER(8) NOT NULL,
    dt_doacao                  DATE NOT NULL,
    id_usuario                 NUMBER(8) NOT NULL,
    ds_observacao              VARCHAR2(2000),
    tb_usuarios_tb_usuarios_id NUMBER NOT NULL
);

ALTER TABLE tb_doacoes ADD CONSTRAINT tb_doador_pk PRIMARY KEY ( id_doador );

CREATE TABLE tb_enderecos (
    id_endereco                 NUMBER(8) NOT NULL,
    nr_cep                      VARCHAR2(10) NOT NULL,
    ds_logradouro               VARCHAR2(50) NOT NULL,
    nr_numero                   NUMBER(8) NOT NULL,
    ds_complemento              VARCHAR2(20),
    ds_cidade                   VARCHAR2(20) NOT NULL,
    sg_estado                   VARCHAR2(2) NOT NULL,
    ds_pais                     VARCHAR2(20) NOT NULL,
    id_usuario                  NUMBER NOT NULL,
    tb_usuarios_tb_usuarios_id  NUMBER NOT NULL,
    tb_usuarios_tb_usuarios_id1 NUMBER NOT NULL
);

CREATE UNIQUE INDEX tb_enderecos__idx ON
    tb_enderecos (
        tb_usuarios_tb_usuarios_id
    ASC );

CREATE UNIQUE INDEX tb_enderecos__idxv1v1 ON
    tb_enderecos (
        tb_usuarios_tb_usuarios_id1
    ASC );

ALTER TABLE tb_enderecos ADD CONSTRAINT tb_enderecos_pk PRIMARY KEY ( id_endereco );

CREATE TABLE tb_posts (
    id_post                    NUMBER(8) NOT NULL,
    ds_mensagem                VARCHAR2(1000) NOT NULL,
    id_usuario                 NUMBER(8) NOT NULL,
    nm_curtidas                NUMBER(10),
    tb_usuarios_tb_usuarios_id NUMBER NOT NULL
);

ALTER TABLE tb_posts ADD CONSTRAINT tb_posts_pk PRIMARY KEY ( id_post );

CREATE TABLE tb_respostas (
    id_resposta                NUMBER(8) NOT NULL,
    ds_msg_resposta            VARCHAR2(1000) NOT NULL,
    tb_posts_id_post           NUMBER(8) NOT NULL,
    id_usuario                 NUMBER(8) NOT NULL,
    nm_curtidas                NUMBER(10),
    tb_usuarios_tb_usuarios_id NUMBER NOT NULL
);

ALTER TABLE tb_respostas ADD CONSTRAINT tb_respostas_pk PRIMARY KEY ( id_resposta );

CREATE TABLE tb_telefones (
    id_telefone                       NUMBER(8) NOT NULL,
    nr_telefone                       NUMBER(20) NOT NULL,
    id_usuario                        NUMBER(8) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    tb_tipo_telefone_id_tipo_telefone NUMBER(10) NOT NULL,
    tb_usuarios_tb_usuarios_id        NUMBER NOT NULL
);

ALTER TABLE tb_telefones ADD CONSTRAINT tb_telefones_pk PRIMARY KEY ( id_telefone );

CREATE TABLE tb_tipo_telefone (
    id_tipo_telefone NUMBER(10) NOT NULL,
    ds_tipo          VARCHAR2(10) NOT NULL
);

ALTER TABLE tb_tipo_telefone ADD CONSTRAINT tb_tipo_telefone_pk PRIMARY KEY ( id_tipo_telefone );

CREATE TABLE tb_usuarios (
    tb_usuarios_id           NUMBER NOT NULL,
    id_usuario               NUMBER(8) NOT NULL,
    ds_nome                  VARCHAR2(50) NOT NULL,
    ds_genero                VARCHAR2(10) NOT NULL,
    dt_nascimento            DATE NOT NULL,
    st_doador                VARCHAR2(1),
    ds_email                 VARCHAR2(50) NOT NULL,
    ds_senha                 VARCHAR2(30) NOT NULL,
    tb_enderecos_id_endereco NUMBER(8) NOT NULL
);

CREATE UNIQUE INDEX tb_usuarios__idx ON
    tb_usuarios (
        tb_enderecos_id_endereco
    ASC );

-- Error - Index TB_USUARIOS__IDXv3 has no columns

ALTER TABLE tb_usuarios ADD CONSTRAINT tb_usuarios_pk PRIMARY KEY ( tb_usuarios_id );

CREATE TABLE usuario_possuir_perfil_acesso (
    tb_usuarios_id_usuario     NUMBER(8) NOT NULL,
    perfil_acesso_id_perfil    NUMBER NOT NULL,
    tb_usuarios_tb_usuarios_id NUMBER NOT NULL
);

--  ERROR: PK name length exceeds maximum allowed length(30) 
ALTER TABLE usuario_possuir_perfil_acesso
    ADD CONSTRAINT usuario_possuir_perfil_acesso_pk PRIMARY KEY ( tb_usuarios_id_usuario,
                                                                  perfil_acesso_id_perfil,
                                                                  tb_usuarios_tb_usuarios_id );

ALTER TABLE tb_adocoes
    ADD CONSTRAINT tb_adocoes_tb_usuarios_fk FOREIGN KEY ( tb_usuarios_tb_usuarios_id )
        REFERENCES tb_usuarios ( tb_usuarios_id );

ALTER TABLE tb_animais
    ADD CONSTRAINT tb_animais_tb_adocoes_fk FOREIGN KEY ( tb_adocoes_id_adotante )
        REFERENCES tb_adocoes ( id_adotante );

ALTER TABLE tb_animais
    ADD CONSTRAINT tb_animais_tb_doacoes_fk FOREIGN KEY ( tb_doacoes_id_doador )
        REFERENCES tb_doacoes ( id_doador );

ALTER TABLE tb_doacoes
    ADD CONSTRAINT tb_doacoes_tb_usuarios_fk FOREIGN KEY ( tb_usuarios_tb_usuarios_id )
        REFERENCES tb_usuarios ( tb_usuarios_id );

ALTER TABLE tb_enderecos
    ADD CONSTRAINT tb_enderecos_tb_usuarios_fk FOREIGN KEY ( tb_usuarios_tb_usuarios_id1 )
        REFERENCES tb_usuarios ( tb_usuarios_id );

ALTER TABLE tb_posts
    ADD CONSTRAINT tb_posts_tb_usuarios_fk FOREIGN KEY ( tb_usuarios_tb_usuarios_id )
        REFERENCES tb_usuarios ( tb_usuarios_id );

ALTER TABLE tb_respostas
    ADD CONSTRAINT tb_respostas_tb_posts_fk FOREIGN KEY ( tb_posts_id_post )
        REFERENCES tb_posts ( id_post );

ALTER TABLE tb_respostas
    ADD CONSTRAINT tb_respostas_tb_usuarios_fk FOREIGN KEY ( tb_usuarios_tb_usuarios_id )
        REFERENCES tb_usuarios ( tb_usuarios_id );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE tb_telefones
    ADD CONSTRAINT tb_telefones_tb_tipo_telefone_fk FOREIGN KEY ( tb_tipo_telefone_id_tipo_telefone )
        REFERENCES tb_tipo_telefone ( id_tipo_telefone );

ALTER TABLE tb_telefones
    ADD CONSTRAINT tb_telefones_tb_usuarios_fk FOREIGN KEY ( tb_usuarios_tb_usuarios_id )
        REFERENCES tb_usuarios ( tb_usuarios_id );

-- Error - Foreign Key TB_USUARIOS_TB_ENDERECOS_FK has no columns

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE usuario_possuir_perfil_acesso
    ADD CONSTRAINT usuario_possuir_perfil_acesso_perfil_acesso_fk FOREIGN KEY ( perfil_acesso_id_perfil )
        REFERENCES perfil_acesso ( id_perfil );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE usuario_possuir_perfil_acesso
    ADD CONSTRAINT usuario_possuir_perfil_acesso_tb_usuarios_fk FOREIGN KEY ( tb_usuarios_tb_usuarios_id )
        REFERENCES tb_usuarios ( tb_usuarios_id );

CREATE SEQUENCE tb_usuarios START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_usuarios BEFORE
    INSERT ON tb_usuarios
    FOR EACH ROW
    WHEN ( new.tb_usuarios_id IS NULL )
BEGIN
    :new.tb_usuarios_id := tb_usuarios.nextval;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             3
-- ALTER TABLE                             23
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   7
-- WARNINGS                                 0
