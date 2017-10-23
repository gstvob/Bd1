select nome, CPF from medicos where CPF in (select CPF from pacientes);
select codp, nome from pacientes where codp in (select codp from consultas where hora > '14:00');
select nome, idade from medicos where codm in (select codm from consultas where codp in (select codp from pacientes where nome = 'Ana'));
select nroa, andar from ambulatorios where nroa not in (select nroa from medicos where nroa IS NOT NULL);

select nroa, andar from ambulatorios where capacidade > any(select capacidade from ambulatorios); 
select nome, idade from medicos where idade <= all( select idade from medicos);
select nome, CPF from pacientes where codp = any (select codp from consultas where hora < ALL( select hora from consultas where data='2016/10/14'));
select nome, CPF from medicos where nroa <> ALL(select nroa from ambulatorios where capacidade > all(select capacidade from ambulatorios where andar = 2));