CREATE TABLE alunos (
  aluno_id SERIAL PRIMARY KEY,
  p_nome VARCHAR(50) NOT NULL,
  u_nome VARCHAR(50) NOT NULL,
  matricula INTEGER NOT NULL,
  serie VARCHAR(50) NOT NULL,
  disciplina VARCHAR(50) NOT NULL,
  nota DECIMAL(2,1) NOT NULL
);

INSERT INTO alunos (p_nome, u_nome, matricula, serie, disciplina, nota)
VALUES
  ('Vitória', 'Claudino', 5542, '2º ano', 'Matemática', 7.0),
  ('Luiz', 'Silva', 6215, '1º ano', 'Português', 8.0),
  ('André', 'Carvalho', 4521, '3º ano', 'Matemática', 9.5),
  ('Alan', 'Vilela', 3285, '1º ano', 'História', 8.0),
  ('Figueiredo', 'Santos', 4598, '2º ano', 'Geografia', 9.0);
  
  SELECT * FROM alunos;
  
  SELECT * FROM alunos WHERE nota > 7;
  
  SELECT * FROM alunos WHERE serie = '1º ano' AND nota >= 8;
  
  SELECT p_nome, u_nome, nota FROM alunos;
  
  CREATE TABLE professor (
  professor_id SERIAL PRIMARY KEY,
  p_nome VARCHAR(50) NOT NULL,
  u_nome VARCHAR(50) NOT NULL
);
  
  INSERT INTO professor (p_nome, u_nome)
VALUES
  ('Gilberto', 'Ferreira'),
  ('Elon', 'Musk'),
  ('Bill', 'Gates'),
  ('Alan', 'Turing'),
  ('Eliezer', 'Moraes');
  
SELECT * FROM professor;

SELECT p_nome, u_nome FROM alunos
UNION
SELECT p_nome, u_nome FROM professor;

UPDATE professor SET p_nome = 'Alan', u_nome = 'Vilela' WHERE p_nome = 'Gilberto';
UPDATE professor SET p_nome = 'André', u_nome = 'Carvalho' WHERE p_nome = 'Elon';

SELECT p_nome, u_nome FROM alunos
INTERSECT
SELECT p_nome, u_nome FROM professor;

SELECT p_nome, u_nome FROM alunos
EXCEPT
SELECT p_nome, u_nome FROM professor;
    
