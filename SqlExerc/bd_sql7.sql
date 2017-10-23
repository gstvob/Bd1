select * from funcionarios order by salario DESC, idade ASC LIMIT 3;
select nome, nroa from medicos order by nroa;
select data, count(*) from consultas group by data, hora having hora > '12:00';
select andar, sum(capacidade) as total from ambulatorios group by andar;
select andar from ambulatorios group by andar having avg(capacidade) >= 40;
Nome dos médicos que possuem mais de uma consulta marcada
select nome from medicos m, consultas c group by m.codm, c.codm having c.codm = m.codm and count(m.codm) > 3;
