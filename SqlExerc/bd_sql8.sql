create view MedAdultos (código, nome, especialidade, idade) 
as select codm, nome, especialidade, idade from Medicos where idade > 40;

drop view MedAdultos;

CREATE USER nome_usuario with password 'sua_senha';

grant select on Pacientes to nome_usuario;
grant select, update on Ambulatorios to nome_usuario;
grant select on MedAdultos to nome_usuario;