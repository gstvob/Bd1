Select m.nome, m.CPF from medicos m where exists(select p.CPF from pacientes p where p.CPF = m.CPF);

select m.nome, m.CPF, c.data from medicos m, consultas c where m.especialidade = 'ortopedia' and c.codm = m.codm and  
exists(select p.nome, p.codp from pacientes p where p.codp = c.codp and p.nome = 'Ana');

select m.nome, m.cpf from medicos m where not exists(select * from pacientes p where not exists(select * from consultas c where c.codp = p.codp and m.codm = c.codm));

select m.nome, m.cpf from medicos m where m.especialidade = 'ortopedia' and not exists(select * from pacientes p where p.cidade='Florianopolis' and 
not exists(select * from consultas c where c.codm = m.codm and p.codp = c.codp));


select p.nome, p.cidade from pacientes p JOIN 
((select medicos.codm from medicos where especialidade='ortopedia') as Med JOIN (select c.codp, c.codm from consultas c) as CO on CO.codm = Med.codm) as MC on p.codp = MC.codp;

select Me1.nome, Me1.CPF from medicos Me1 JOIN (select m.nroa from medicos m where m.nome = 'Pedro') as Me2 on Me1.nroa = Me2.nroa;