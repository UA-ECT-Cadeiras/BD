--Exercicio 6.2

--Create tables 


CREATE SCHEMA Prescricao_5_3;
GO

CREATE TABLE Prescricao_5_3.Medico(
	numSNS INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    especialidade VARCHAR(15) NOT NULL,
    PRIMARY KEY (numSNS),
);

CREATE TABLE Prescricao_5_3.Paciente(
	numUtente INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    dataNasc DATE NOT NULL,
    endereco VARCHAR(30) NOT NULL,
    PRIMARY KEY (numUtente),
);

CREATE TABLE Prescricao_5_3.Farmacia(
    nome VARCHAR(30) NOT NULL,
	telefone INT NOT NULL,
    endereco VARCHAR(30) NOT NULL,
    PRIMARY KEY (nome),
);

CREATE TABLE Prescricao_5_3.Farmaceutica(
    numReg INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    endereco VARCHAR(30) NOT NULL,
    PRIMARY KEY (numReg),
);

CREATE TABLE Prescricao_5_3.Farmaco(
    numRegFarm INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    formula VARCHAR(30) NOT NULL,
    PRIMARY KEY (nome),
    FOREIGN KEY (numRegFarm) REFERENCES Prescricao_5_3.Farmaceutica(numReg),
);

CREATE TABLE Prescricao_5_3.Prescricao(
    numPresc INT NOT NULL,
    numUtente INT NOT NULL,
    numMedico INT NOT NULL,
    farmacia VARCHAR(30),
    dataProc DATE,
    PRIMARY KEY (numPresc),
    FOREIGN KEY (numUtente) REFERENCES Prescricao_5_3.Paciente(numUtente),
    FOREIGN KEY (numMedico) REFERENCES Prescricao_5_3.Medico(numSNS),
    FOREIGN KEY (farmacia) REFERENCES Prescricao_5_3.Farmacia(nome),
);

CREATE TABLE Prescricao_5_3.presc_farmaco(
    numPresc INT NOT NULL,
    numRegFarm INT NOT NULL,
    nomeFarmaco VARCHAR(30) NOT NULL,
    FOREIGN KEY (numPresc) REFERENCES Prescricao_5_3.Prescricao(numPresc),
    FOREIGN KEY (numRegFarm) REFERENCES Prescricao_5_3.Farmaceutica(numReg),
    FOREIGN KEY (nomeFarmaco) REFERENCES Prescricao_5_3.Farmaco(nome),
);
-----------------------------------------------------------------------
--Insert data into tables 

INSERT INTO Prescricao_5_3.Medico VALUES
(101, 'Joao Pires Lima', 'Cardiologia'),
(102, 'Manuel Jose Rosa', 'Cardiologia'),
(103, 'Rui Luis Caraca', 'Pneumologia'),
(104, 'Sofia Sousa Silva', 'Radiologia'),
(105, 'Ana Barbosa', 'Neurologia');

INSERT INTO Prescricao_5_3.Paciente VALUES
(1, 'Renato Manuel Cavaco', '1980-01-03', 'Rua Nova do Pilar 35'),
(2, 'Paula Vasco Silva', '1972-010-30', 'Rua Direita 43'),
(3, 'Ines Couto Souto', '1985-05-12', 'Rua de Cima 144'),
(4, 'Rui Moreira Porto', '1970-12-12', 'Rua Zig Zag 235'),
(5, 'Manuel Zeferico Polaco', '1990-06-05', 'Rua da Baira Rio 1135');

INSERT INTO Prescricao_5_3.Farmacia VALUES
('Farmacia BelaVista', 221234567, 'Avenida Principal 973'),
('Farmacia Central', 234370500, 'Avenida da Liberdade 33'),
('Farmacia Peixoto', 234375111, 'Largo da Vila 523'),
('Farmacia Vitalis', 229876543, 'Rua Visconde Salgado 263');

INSERT INTO Prescricao_5_3.Farmaceutica VALUES
(905, 'Roche', 'Estrada Nacional 249'),
(906, 'Bayer', 'Rua da Quinta do Pinheiro 5'),
(907, 'Pfizer', 'Empreendimento Lagoas Park - Edificio 7'),
(908, 'Merck', 'Alameda Fernão Lopes 12');

INSERT INTO Prescricao_5_3.Farmaco VALUES
(905, 'Boa Saude em 3 Dias', 'XZT9'),
(906, 'Voltaren Spray', 'PLTZ32'),
(906, 'Xelopironi 350', 'FRR-34'),
(906, 'Gucolan 1000', 'VFR-750'),
(907, 'GEROaero Rapid', 'DDFS-XEN9'),
(908, 'Aspirina 1000', 'BIOZZ02');

INSERT INTO Prescricao_5_3.Prescricao VALUES
(10001, 1, 105,'Farmacia Central', '2015-03-03'),
(10002, 1, 105, NULL, NULL),
(10003, 3, 102,'Farmacia Central', '2015-01-17'),
(10004, 3, 101,'Farmacia BelaVista', '2015-02-09'),
(10005, 3, 102,'Farmacia Central', '2015-01-17'),
(10006, 4, 102,'Farmacia Vitalis', '2015-02-22'),
(10007, 5, 103, NULL, NULL),
(10008, 1, 103,'Farmacia Central', '2015-01-02'),
(10009, 3, 102,'Farmacia Peixoto', '2015-02-02');

INSERT INTO Prescricao_5_3.presc_farmaco VALUES
(10001, 905, 'Boa Saude em 3 Dias'),
(10002, 907, 'GEROaero Rapid'),
(10003, 906, 'Voltaren Spray'),
(10003, 906, 'Xelopironi 350'),
(10003, 908, 'Aspirina 1000'),
(10004, 905, 'Boa Saude em 3 Dias'),
(10004, 908, 'Aspirina 1000'),
(10005, 906, 'Voltaren Spray'),
(10006, 905, 'Boa Saude em 3 Dias'),
(10006, 906, 'Voltaren Spray'),
(10006, 906, 'Xelopironi 350'),
(10006, 908, 'Aspirina 1000'),
(10007, 906, 'Voltaren Spray'),
(10008, 905, 'Boa Saude em 3 Dias'),
(10008, 908, 'Aspirina 1000'),
(10009, 905, 'Boa Saude em 3 Dias'),
(10009, 906, 'Voltaren Spray'),
(10009, 908, 'Aspirina 1000');

-----------------------------------------------------------------------
--Exercice C 

--6.3.a)
select Prescricao_5_3.Paciente.numUtente, nome  from Prescricao_5_3.Paciente left join Prescricao_5_3.Prescricao on Prescricao_5_3.Prescricao.numUtente=Prescricao_5_3.Paciente.numUtente WHERE numPresc IS NULL;

--6.3.b)
select especialidade, count(especialidade) as numPresc from Prescricao_5_3.prescricao inner join Prescricao_5_3.medico on numSNS=numMedico group by especialidade;

--6.3.c)
select farmacia, count(farmacia) as numPresc from Prescricao_5_3.prescricao where farmacia is not null group by farmacia;

--6.3.d)

select Prescricao_5_3.farmaco.nome, Prescricao_5_3.farmaco.formula from (select * from Prescricao_5_3.farmaceutica where numReg=906) as farm full outer join Prescricao_5_3.farmaco on numRegFarm=numReg where numReg is null;

--6.3.f )

select Prescricao_5_3.paciente.numUtente, Prescricao_5_3.paciente.nome, count(Prescricao_5_3.paciente.numUtente) as cont from Prescricao_5_3.paciente inner join Prescricao_5_3.prescricao on Prescricao_5_3.paciente.numUtente=prescricao.numUtente inner join medico on numSNS=numMedico group by Prescricao_5_3.paciente.numUtente, Prescricao_5_3.paciente.nome having cont>1;