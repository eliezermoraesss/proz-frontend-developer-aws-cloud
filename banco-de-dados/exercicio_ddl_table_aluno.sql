CREATE TABLE aluno (
  id_aluno SERIAL PRIMARY KEY,
  ds_nome VARCHAR(40) NOT NULL,
  ds_email VARCHAR(50) UNIQUE NOT NULL,
  ds_endereco VARCHAR(50) NOT NULL
);