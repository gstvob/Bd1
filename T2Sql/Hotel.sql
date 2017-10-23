
insert into clientes(CPF, nome, origem, fone) values
('25467598411', 'Tester', 'Florianópolis', '1234567890'),
('12345678910', 'Tester2', 'Joinville', '9876543210'),
('10987654321', 'Tester3', 'Blumenau', '1593572684'),
('15975326842', 'Tester4', 'Palhoca', '4832489566'),
('77788899911', 'Tester5', 'Florianópolis', '4833457899');



insert into tipoquartos(codigo, descricao, preco) values 
(1, 'quartoSimples', 200),
(2, 'quartoDuplo', 500),
(3, 'aptoTriplo', 1000),
(4, 'quartoDuplo',350),
(5, 'aptoDuplo', 650);

insert into quartos (numero, frigobar, tipo) values 
(1, 'S', 2),
(2, 'N', 2),
(3, 'N', 1),
(4, 'S', 2),
(5, 'S', 4),
(6, 'S', 5),
(7, 'S', 4);


insert into hospedes (CPF, motivo, placaVeiculo, nroAcomp, dataEnt, dataSai, quarto) values
('12345678910', 'trabalho', 'ABC-123', 1, '2017/10/22', '2017/10/31', 2),
('10987654321', 'turismo', 'CBA-321', 0, '2017/10/12', '2017/10/16', 1),
('15975326842', 'turismo', NULL, 2 ,'2017/10/22', '2017/10/26', 3),
('77788899911', 'turismo', 'DEF-456', 0, '2017/10/23', '2017/10/31', 5),
('25467598411', 'estudo', NULL, 2, '2017/10/12', '2017/10/19', 4);



insert into reservas (cliente, quarto,dataEnt, dataSai) values
('12345678910', 3, '2017/10/29', '2017/11/15'),
('25467598411', 2, '2017/10/27', '2017/11/15'),
('12345678910', 3, '2017/11/18', '2017/11/28'),
('77788899911', 1, '2017/11/19', '2017/11/26'),
('25467598411', 2, '2017/11/19', '2017/11/22');

insert into cardapios(codigo, descricao, preco) values
(1, 'almoço', 30),
(2, 'janta', 30),
(3, 'café', 15),
(4, 'refrigerante', 5),
(5, 'salgado', 3);

insert into consumos (id, hospede, itemCardapio, data, qtde) values 
(1, '12345678910', 1, '2017/10/12', 2),
(2, '12345678910', 2, '2017/10/12', 2),
(3, '10987654321', 1, '2017/10/13', 1),
(4, '10987654321', 3, '2017/10/12', 2),
(5, '15975326842', 1, '2017/10/12', 3),
(6, '77788899911', 1, '2017/10/15', 1),
(7, '25467598411', 1, '2017/10/14', 4);



select nome, CPF, fone from clientes where origem in ('Florianópolis', 'Blumenau', 'Joinville');


select motivo, count(motivo), avg(nroAcomp) acompanhantesMed , avg(dataSai-dataEnt) estadiaMed from hospedes group by motivo;

select count(quarto) as nQuartos from reservas where dataEnt != '2017/10/29';

select quarto from hospedes where CPF in (select DISTINCT hospede from consumos where itemCardapio in (1, 2) and data = '2017/10/12');

select codigo, descricao from cardapios where not exists(select cpf from hospedes where not exists(select itemCardapio, hospede from consumos where cpf = hospede and itemCardapio = codigo));

select count(numero) from quartos join tipoquartos on tipo = codigo where frigobar = 'S' and descricao = 'quartoDuplo' and not exists(select * from hospedes where quarto = numero);

select h.cpf, c.nome, h.placaVeiculo, h.quarto, Q.descricao, h.dataSai from hospedes h 
join clientes c on c.cpf = h.cpf
join (select numero, descricao from quartos join tipoquartos on codigo = tipo) as Q on quarto = Q.numero;

select descricao, preco from cardapios where preco >= ALL(select preco from cardapios) or preco <= ALL(select preco from cardapios);

select descricao, Q.contagem from cardapios join (select itemCardapio, count(itemCardapio) as contagem from consumos group by itemCardapio) as Q on Q.itemCardapio = codigo;

select nome, C.vezes, R.mediaEstadias from clientes left join (
	(select cliente, count(cliente) as vezes from reservas group by cliente) as C
	left join 
	(select cliente, avg(dataSai-dataEnt) as mediaEstadias from reservas group by cliente having count(cliente) >= 2) as R 
	on R.cliente = C.cliente
) on C.cliente = clientes.cpf;


select cpf, nome, fone from clientes c where exists(select cpf from hospedes h where dataSai > '2017/10/12' and dataEnt <= '2017/10/12' and c.cpf = h.cpf);

select * from cardapios where not exists(select * from consumos where codigo = itemCardapio);

select codigo, descricao, preco from cardapios left join consumos on codigo = itemCardapio where hospede is null;


