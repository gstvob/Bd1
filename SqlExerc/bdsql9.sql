

CREATE TABLE pacientesjovens
(
  codp integer NOT NULL,
  nome character varying(40) NOT NULL,
  idade smallint NOT NULL,
  cidade character(30),
  cpf numeric(11,0),
  doenca character varying(40) NOT NULL,
  CONSTRAINT pacientesjovens_pkey PRIMARY KEY (codp),
  CONSTRAINT pacientesjovens_cpf_key UNIQUE (cpf),
  CONSTRAINT pacientesjovens_idade_check CHECK (idade < 21)
);



CREATE OR REPLACE FUNCTION PacMaiusculos()
RETURNS trigger AS $$
BEGIN
	Insert into Pacientes(nome) values (NEW.nome);
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER T1 BEFORE INSERT ON Pacientes
FOR EACH ROW EXECUTE PROCEDURE PacMaiusculos();


CREATE OR REPLACE FUNCTION AtualizaMedicos()
RETURNS void AS $$
BEGIN
	Update Medicos set idade = idade + 1;
END;
$$ LANGUAGE plpgsql;
