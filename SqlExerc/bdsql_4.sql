SELECT m.nome, m.CPF from Medicos as m, Pacientes as p where m.CPF = p.CPF;
SELECT m.nome, especialidade From medicos as m, ambulatorios as a where m.nroa = a.nroa and andar = 1;
SELECT medicos.nome, medicos.idade from medicos, pacientes, consultas where consultas.codm = medicos.codm and pacientes.nome = 'Ana' and pacientes.codp = consultas.codp;
SELECT ambs.nroa from ambulatorios as a, ambulatorios as ambs where ambs.andar = a.andar and a.nroa = 5;

SELECT a.nroa, a.andar from Ambulatorios as a JOIN medicos as m ON m.nroa = a.nroa where m.especialidade = 'ortopedia';
SELECT codf, f.nome as nomeF, m.nome as nomeM, codm from Funcionarios as f JOIN medicos as m ON m.cidade = f.cidade;
SELECT medicos.codm, medicos.nome from medicos JOIN consultas ON medicos.codm = consultas.codm JOIN medicos as m ON m.codm = consultas.codm WHERE consultas.hora < '12:00' and m.nome = 'Pedro' and m.idade > medicos.idade;
SELECT funcionarios.nome, funcionarios.salario from funcionarios JOIN funcionarios as f ON f.cidade = funcionarios.cidade WHERE f.nome = 'Carlos' and f.salario < funcionarios.salario;

SELECT codp, nome from pacientes NATURAL JOIN Consultas;
SELECT nroa, andar from ambulatorios NATURAL JOIN consultas WHERE consultas.data = '2010/10/12';
select medicos.nome, medicos.CPF, especialidade from medicos natural join consultas, pacientes where doenca = 'tendinite';

select *, medicos.codm, medicos.codm from ambulatorios LEFT JOIN medicos ON ambulatorios.nroa = medicos.nroa;
select medicos.nome, medicos.CPF, pacientes.nome, pacientes.CPF FROM medicos LEFT JOIN consultas on consultas.codm = medicos.codm LEFT JOIN pacientes ON consultas.codp = pacientes.codp;