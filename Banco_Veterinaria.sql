
/* 1. CRIACAO DO BANCO ===================================== */ 
create database veterinaria;

use veterinaria;

/* 2. CRIACAO DAS TABELAS ===================================== */ 


create table clientes (
idclientes int auto_increment primary key,
nome varchar(100),
cpf varchar(15),
telefone varchar(15),
endereco varchar(200));

create table animais(
idanimais int auto_increment primary key,
nome varchar(100),
idade int,
especie varchar(80),
raca varchar(80),
idclientes int,
constraint clientes_fk foreign key (idclientes)
	references clientes(idclientes));

create table veterinarios(
idveterinario int auto_increment primary key,
nome varchar(100),
crmv varchar(20),
especialidade varchar(100)
);

create table consultas(
idconsulta int auto_increment primary key,
data_consulta datetime default current_timestamp,
idanimais int,
constraint animais_fk  foreign key (idanimais)
	references animais(idanimais),
idveterinario int,
	constraint veterinario_fk foreign key (idveterinario)
		references veterinarios(idveterinario)
);


create table medicamentos(
idmedicamento int auto_increment primary key,
nome varchar(100),
modalidade varchar(100),
indicacao varchar(220),
data_validade date,
laboratorio varchar(100)
);

create table prescricoes(
idprescricao int auto_increment primary key,
data_prescricao datetime default current_timestamp,
data_fim datetime,
idconsulta int,
constraint consulta_fk foreign key (idconsulta)
	references consultas(idconsulta),
idmedicamento int,
constraint medicamento_fk foreign key (idmedicamento)
	references medicamentos(idmedicamento)
);

create table exames(
idexame int auto_increment primary key,
nome varchar(100),
modalidade varchar(100)
);

create table consulta_exames (
idconsulta int not null,
idexame int not null,
resultado text,
data_resultado datetime,
constraint pk_consulta_exames primary key (idconsulta, idexame),
    
constraint fk_ce_consultas foreign key (idconsulta)
	references consultas(idconsulta),
constraint fk_ce_exames foreign key (idexame)
	references exames(idexame)
);


/*  3. INSERTS ===================================== */ 

-- CLIENTES 
insert into clientes (nome, cpf, telefone, endereco) values
('Ana Paula Ferreira', '111.222.333-01', '(46) 99811-1001', 'Rua das Flores, 100'),
('Carlos Eduardo Souza', '111.222.333-02', '(46) 99811-1002', 'Av. Brasil, 250'),
('Mariana Lopes', '111.222.333-03', '(46) 99811-1003', 'Rua Sete de Setembro, 45'),
('João Pedro Martins', '111.222.333-04', '(46) 99811-1004', 'Rua XV de Novembro, 320'),
('Fernanda Costa', '111.222.333-05', '(46) 99811-1005', 'Rua Paraná, 88'),
('Ricardo Almeida', '111.222.333-06', '(46) 99811-1006', 'Av. Independência, 512'),
('Juliana Rocha', '111.222.333-07', '(46) 99811-1007', 'Rua das Palmeiras, 210'),
('Bruno Henrique', '111.222.333-08', '(46) 99811-1008', 'Rua Santa Catarina, 75'),
('Patrícia Nunes', '111.222.333-09', '(46) 99811-1009', 'Rua Rio Grande, 130'),
('Diego Ferreira', '111.222.333-10', '(46) 99811-1010', 'Av. Governador, 990');

-- ANIMAIS ( alguns clientes tem mais de 1 animal)
insert into animais (nome, idade, especie, raca, idclientes) values
('Rex', 3, 'Cachorro', 'Labrador', 1),
('remi', 2, 'Gato', 'Siamês', 1),
('Thor', 5, 'Cachorro', 'Pastor Alemão', 2),
('kiara', 1, 'Gato', 'Persa', 3),
('Bidu', 7, 'Cachorro', 'Sem raça definida', 4),
('Nina', 4, 'Cachorro', 'Poodle', 5),
('Garfield', 6, 'Gato', 'Bengal', 6),
('luna', 2, 'Cachorro', 'Beagle', 7),
('Duque', 8, 'Cachorro', 'Rottweiler', 8),
('Amora', 1, 'Gato', 'Sem raça definida', 9),
('Zuko', 3, 'Cachorro', 'Yorkshire', 10),
('Arthemis', 5, 'Gato', 'Sem raça definida', 2);

-- VETERINARIOS 
insert into veterinarios (nome, crmv, especialidade) values
('Dr. Rafael Dias', 'CRMV-PR 12345', 'Clínica Geral'),
('Dra. Camila Teixeira', 'CRMV-PR 12346', 'Dermatologia'),
('Dr. André Barbosa', 'CRMV-PR 12347', 'Cirurgia'),
('Dra. Beatriz Correia', 'CRMV-PR 12348', 'Cardiologia'),
('Dr. Lucas Fontana', 'CRMV-PR 12349', 'Clínica Geral'),
('Dra. Helena Vidal', 'CRMV-PR 12350', 'Oftalmologia'),
('Dr. Otávio Ramos', 'CRMV-PR 12351', 'Ortopedia'),
('Dra. Vanessa Prado', 'CRMV-PR 12352', 'Clínica Geral'),
('Dr. Igor Salles', 'CRMV-PR 12353', 'Endocrinologia'),
('Dra. Renata Vieira', 'CRMV-PR 12354', 'Oncologia');

-- CONSULTAS ( algumas consultas com mesmo animal porem em  datas diferentes)
insert into consultas (data_consulta, idanimais, idveterinario) values
('2026-01-10 09:00:00', 1, 1),
('2026-01-15 10:30:00', 2, 2),
('2026-02-02 14:00:00', 3, 3),
('2026-02-05 08:45:00', 4, 6),
('2026-02-10 11:15:00', 5, 1),
('2026-03-01 09:30:00', 6, 5),
('2026-03-03 16:00:00', 7, 4),
('2026-03-12 13:00:00', 8, 8),
('2026-03-20 10:00:00', 9, 7),
('2026-04-02 09:00:00', 10, 1),
('2026-04-08 15:30:00', 11, 9),
('2026-04-15 11:00:00', 12, 2),
('2026-05-01 09:00:00', 1, 1),
('2026-05-10 14:20:00', 3, 10),
('2026-05-18 10:00:00', 5, 3);

-- MEDICAMENTOS 
insert into medicamentos (nome, modalidade, indicacao, data_validade, laboratorio) values
('Amoxicilina 250mg', 'Comprimido', 'Infecções bacterianas', '2027-06-30', 'VetPharma'),
('Meloxicam 2mg', 'Comprimido', 'Anti-inflamatório e analgésico', '2027-01-15', 'Zoetis'),
('Ivermectina', 'Injetável', 'Antiparasitário', '2026-12-01', 'MSD Saúde Animal'),
('Cetoconazol', 'Pomada', 'Infecção fúngica de pele', '2026-09-20', 'VetPharma'),
('Doxiciclina 100mg', 'Comprimido', 'Infecções respiratórias', '2027-03-10', 'Ourofino'),
('Dipirona Veterinária', 'Gotas', 'Dor e febre', '2027-08-01', 'Agener União'),
('Prednisolona 20mg', 'Comprimido', 'Anti-inflamatório', '2026-11-05', 'Zoetis'),
('Furosemida', 'Comprimido', 'Diurético cardíaco', '2027-02-28', 'MSD Saúde Animal'),
('Colírio Lubrificante', 'Colírio', 'Ressecamento ocular', '2026-10-15', 'Ourofino'),
('Vacina V10', 'Injetável', 'Imunização múltipla canina', '2027-05-01', 'Zoetis');

-- PRESCRICOES (as que estão sem data_fim são tratamento contínuo)
insert into prescricoes (data_prescricao, data_fim, idconsulta, idmedicamento) values
('2026-01-10 09:20:00', '2026-01-20 00:00:00', 1, 1),
('2026-01-15 10:45:00', null, 2, 4),
('2026-02-02 14:20:00', '2026-02-16 00:00:00', 3, 2),
('2026-02-05 09:00:00', '2026-02-12 00:00:00', 4, 9),
('2026-02-10 11:30:00', null, 5, 6),
('2026-03-01 09:50:00', '2026-03-08 00:00:00', 6, 3),
('2026-03-03 16:20:00', '2026-03-17 00:00:00', 7, 5),
('2026-03-12 13:20:00', null, 8, 7),
('2026-03-20 10:15:00', '2026-03-27 00:00:00', 9, 1),
('2026-04-02 09:20:00', '2026-04-16 00:00:00', 10, 8),
('2026-04-08 15:50:00', null, 11, 6),
('2026-05-01 09:20:00', '2026-05-08 00:00:00', 13, 2);

-- criado posteriormente ao insert antigo de prescrições para ter mais dados para o select
insert into prescricoes (data_prescricao, data_fim, idconsulta, idmedicamento) values
('2026-05-10 08:40:00', '2026-05-17 00:00:00', 9, 2),
('2026-05-20 11:15:00', null, 10, 2),
('2026-06-02 09:30:00', '2026-06-09 00:00:00', 11, 2),
('2026-06-15 14:00:00', null, 15, 2);

-- EXAMES 
insert into exames (nome, modalidade) values
('Hemograma Completo', 'Exame de Sangue'),
('Raio-X Torácico', 'Imagem'),
('Ultrassonografia Abdominal', 'Imagem'),
('Urinálise', 'Exame de Urina'),
('Perfil Bioquímico', 'Exame de Sangue'),
('Eletrocardiograma', 'Cardíaco'),
('Ecocardiograma', 'Cardíaco'),
('Citologia de Pele', 'Dermatológico'),
('Teste de Glicemia', 'Exame de Sangue'),
('Coprológico (Fezes)', 'Exame de Fezes');

-- CONSULTA_EXAMES (alguns já estão com o resultado lançado, outros não)
insert into consulta_exames (idconsulta, idexame, resultado, data_resultado) values
(1, 1, 'Dentro dos parâmetros normais', '2026-01-11 08:00:00'),
(2, 8, 'Presença de fungos - confirmada dermatofitose', '2026-01-16 09:00:00'),
(3, 2, 'Sem alterações pulmonares', '2026-02-03 10:00:00'),
(4, 3, null, null),
(5, 1, 'Leve anemia detectada', '2026-02-11 08:30:00'),
(6, 9, 'Glicemia elevada, recomendado acompanhamento', '2026-03-02 09:00:00'),
(7, 5, null, null),
(8, 6, 'Ritmo cardíaco normal', '2026-03-13 14:00:00'),
(9, 7, 'Leve sopro identificado', '2026-03-21 11:00:00'),
(10, 4, 'Sem indícios de infecção urinária', '2026-04-03 08:00:00'),
(11, 10, null, null),
(13, 1, 'Resultado dentro da normalidade', '2026-05-02 08:00:00');


/*  4. UPDATES ===================================== */ 

update animais
set idade = 4
where idanimais = 1;

update medicamentos
set nome = "Amoxicilina 300mg"
where nome = "Amoxicilina 250mg";


update consulta_exames
set resultado = "Gastroenterite aguda",
	data_resultado = "2026-05-12 19:30:00"
where idconsulta = 11;

update clientes
set endereco = "Av. dos extrangeiros, 343"
where endereco = "Rua Sete de Setembro, 45";
	

update prescricoes
set data_fim = "2026-07-18 00:00:00"
where idprescricao = 1;

/* 5. DELETES ===================================== */ 

delete from consulta_exames 
where idconsulta in (select idconsulta from consultas where idanimais in (3, 12));

delete from prescricoes 
where idconsulta in (select idconsulta from consultas where idanimais in (3, 12));

delete from consultas where idanimais  in (3, 12);

delete from animais where idanimais  in (3, 12);

delete from clientes
where idclientes = 2;


/* 6. RELATORIOS ===================================== */ 

-- RELATORIO 01: 

select * from animais
where idade >= 5 and idade < 10
order by idade asc;

/*este relatorio permite visualizar
 * quais são os pacientes (animais) que estão em sua meia idade.
 * 
 * O que é util pois ajuda a planejar checkups preventivos e a saber
 * quais deles prescisam de maior atenção nesta etapa da vida
 */ 


-- RELATORIO 02: 

select modalidade, count(*) as total
from exames
group by modalidade
having total > 2
order by modalidade ;



/* Este relatório permite visualizar
 * quais são as modalidades de exames que possuem
 * maior quantidade de exames cadastrados na clínica.
 *
 * É útil para identificar quais tipos de exames estão
 * mais presentes no cadastro da clínica, auxiliando na
 * organização e no gerenciamento dos exames disponíveis.
 */


-- RELATORIO 03 : 

select 
	veterinarios.nome as nome_veterinario,
	animais.nome as nome_animal,
	consultas.data_consulta,
	clientes.nome as nome_cliente
from 
	veterinarios,
	animais,
	clientes,
	consultas
where
	clientes.idclientes = animais.idclientes and
	animais.idanimais = consultas.idanimais and 
	consultas.idveterinario = veterinarios.idveterinario;


/*Este relatorio permite visualizar 
 * o historico de consultas já realizados
 * 
 * é util de diversas formas, a principal seria facilitar
 * a analize e a reincidencia dos pacientes na clinica
 * podendo visualizar se é frequente e quem o atendeu
 */


-- RELATORIO 04 : 
	
select
	animais.nome as nome_animal,
	consultas.data_consulta,
	veterinarios.nome as nome_veterinario,
	exames.nome as nome_exame,
	consulta_exames.resultado
from
	consultas
inner join animais
	on animais.idanimais = consultas.idanimais
inner join veterinarios
	on veterinarios.idveterinario = consultas.idveterinario
left join consulta_exames
	on consultas.idconsulta = consulta_exames.idconsulta
left join exames
	on exames.idexame = consulta_exames.idexame;
	
/*Este relatorio permite visualizar 
 * um painel completo por consulta incluindo o resultado
 * 
 * é util de varias formas, mas a principal é
 * entender quando e o que cada paciente faz, permitindo acompanhar 
 * o quadro clinico com mais precisão
 */
	


-- RELATORIO 05 : 
	

select idmedicamento, nome,modalidade,data_validade
from medicamentos
where idmedicamento not in (select idmedicamento from prescricoes);


/*Este relatorio permite visualizar 
 * dinamicamente quais os medicamentos nunca prescritos
 * 
 *O relatório é util pois ajuda a realizar a gestão do estoque
 *um remédio que está cadastrado no sistema mas nunca foi prescrito, 
 *indica que o estoque esta parado, ou seja dinheiro investido em algo que
 *nao gera lucro, além disso 
 *ajuda a cuidar a data de validade de algo que nunca foi utilizado
 */



/* 7. TRIGGERS ===================================== */ 

-- 1 trigger
-- a forma correta pede o uso do delimiter, porem no dbeaver (onde estou criando o banco) não se faz necessário,
-- então, a menos que esteja rodando o arquivo inteiro como script sql, rode o comande sem incluir o delimiter na seleção
delimiter //

create trigger Impedir_duplicidade_CRMV
before insert on veterinarios
for each row
begin
	if exists (select 1 from veterinarios where crmv = NEW.crmv) then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: O CRMV não pode ser duplicado.';
    END if ;
end //

delimiter ;


-- testes

/* 
 insert into veterinarios (nome, crmv, especialidade)
values ('Dr. Teste', 'CRMV-PR 12345', 'Clínica Geral');

insert into veterinarios (nome, crmv, especialidade)
values ('Dr. Teste', 'CRMV-PR 99999', 'Clínica Geral');

select * from veterinarios;;
where crmv = 'CRMV-PR 99999';

delete from veterinarios
where crmv = 'CRMV-PR 99999';
*/


-- 2 trigger
delimiter //

create trigger verifica_idade_animal
before insert on animais
for each row
begin
	if (new.idade < 0 ) then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: A idade não pode ser inferior a 0.';
	end if;
end //

delimiter ;

-- teste

-- insert into animais (nome, idade, especie, raca, idclientes)
-- values ('Teste', -1, 'Cachorro', 'Labrador', 1);



-- 3 trigger
delimiter //

create trigger trava_resultado_exames
before update on consulta_exames
for each row
begin
	 if old.resultado is not null and not (new.resultado <=> old.resultado) then
		 SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O resultado de um exame antigo não pode ser alterado (realize um novo exame)';
	end if ;
end //

delimiter ;
-- testes 

-- TESTE 1: trocar o resultado já preenchido (esperado: erro)
/*
START TRANSACTION;
UPDATE consulta_exames SET resultado = 'valor diferente' WHERE idconsulta = 1 AND idexame = 1;
ROLLBACK;
*/

-- TESTE 2: apagar o resultado já preenchido (esperado: erro)

/*
 * START TRANSACTION;
UPDATE consulta_exames SET resultado = NULL WHERE idconsulta = 1 AND idexame = 1;
 ROLLBACK;
*/

-- TESTE 3: mexer só na data (esperado: passa)

/* 
 * START TRANSACTION;
UPDATE consulta_exames SET data_resultado = NOW() WHERE idconsulta = 1 AND idexame = 1;
ROLLBACK;
*/

-- TESTE 4: preencher um resultado vazio (esperado: passa)

/* 
 START TRANSACTION;
UPDATE consulta_exames SET resultado = 'normal' WHERE idconsulta = 4 AND idexame = 3;
ROLLBACK;
*/

