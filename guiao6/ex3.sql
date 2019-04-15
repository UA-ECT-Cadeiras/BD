--Exercicio 6.3

--Create tables

CREATE SCHEMA GetStock;
GO

CREATE TABLE GetStock.fornecedor(
	nif		Int NOT NULL,
	nome VARCHAR(15),
	fax Int,
	endereco varchar(30),
	condpag int,
	tipo int,
	PRIMARY KEY (tipo),
	
);
 

CREATE TABLE GetStock.tipo_fornecedor(
	codigo		Int NOT NULL,
	designacao VARCHAR(15),

	FOREIGN KEY (codigo) REFERENCES GetStock.fornecedor(tipo),
);
 
CREATE TABLE GetStock.produto(
	codigo		Int NOT NULL,
	nome VARCHAR(15),
	preco Int,
	iva int,
	unidades int,
	PRIMARY KEY (codigo),
	
);

CREATE TABLE GetStock.encomenda(
	numero		Int NOT NULL,
	data date,
	fornecedor Int,
	
	PRIMARY KEY (numero),
	FOREIGN KEY (fornecedor) REFERENCES GetStock.fornecedor(tipo),	
);


CREATE TABLE GetStock.item(
	numEnc	Int NOT NULL,
	codProd int,
	unidades Int,
	

	FOREIGN KEY (numEnc) REFERENCES GetStock.encomenda(numero),	
	FOREIGN KEY (codProd) REFERENCES GetStock.produto(codigo),
);

-----------------------------------------------------------------------
--Insert data into tables 

INSERT INTO  GetStock.fornecedor VALUES
	('509111222','LactoSerrano','234872372','NULL','60','102'),
	('509121212','FrescoNorte','221234567','Rua do Complexo Grande - Edf 3','90','102'),
	('509294734','PinkDrinks','2123231732','Rua Poente 723','30','105'),
	('509827353','LactoSerrano','234872372','NULL','60','102'),
	('509836433','LeviClean','229343284','Rua Sol Poente 6243','30','107'),
	('509987654','MaduTex','234873434','Estrada da Cincunvalacao 213','30','104'),
	('590972623','ConservasMac',' 234112233','Rua da Recta 233','30','104');


INSERT INTO  GetStock.tipo_fornecedor VALUES
	('101','Carnes'),
	('102','Laticinios'),
	('103','Frutas e Legumes'),
	('104','Mercearia'),
	('105','Bebidas'),
	('106','Peixe'),
	('107','Detergentes');


INSERT INTO  GetStock.produto VALUES
	('10001','Bife da Pa',' 8.75','23','125'),
	('10002','Laranja Algarve','1.25','23','1000'),
	('10003','Pera Rocha','1.45','23','2000'),
	('10004','Secretos de Porco Preto','10.15','23','342'),
	('10005','Vinho Rose Plus','2.99','13','5232'),
	('10006','Queijo de Cabra da Serra','15.00','23','3243'),
	('10007','Queijo Fresco do Dia','0.65','23','452'),
	('10008','Cerveja Preta Artesanal','1.65','13','937'),
	('10009','Lixivia de Cor', '1.85','23','9382'),
	('10010','Amaciador Neutro', '4.05','23','932432'),
	('10011','Agua Natural','0.55','6','919323'),
	('10012','Pao de Leite','0.15','6','5434'),
	('10013','Arroz Agulha','1.00','13','7665'),
	('10014','Iogurte Natural','0.40','13','998');




INSERT INTO  GetStock.encomenda VALUES
	('1','2015-03-03','509111222'),
	('2','2015-03-04','509121212'),
	('3','2015-03-05','509987654'),
	('4','2015-03-06','509827353'),
	('5','2015-03-07','509294734'),
	('6','2015-03-08','509836433'),
	('7','2015-03-09','509121212'),
	('8','2015-03-10','509987654'),
	('9','2015-03-11','509836433'),
	('10','2015-03-12','509987654');



INSERT INTO	GetStock.item Values
	('1','10001','200'),
	('1','10004','300'),
	('2','10002','1200'),
	('2','10003','3200'),
	('3','10013','900'),
	('4','10006','50'),
	('4','10007','40'),
	('4','10014','200'),
	('5','10005','500'),
	('5','10008','10'),
	('5','10011','1000'),
	('6','10009','200'),
	('6','10010','200'),
	('7','10003','1200'),
	('8','10013','350'),
	('9','10009','100'),
	('9','10010','300'),
	('10','10012','200');

-----------------------------------------------------------------------
--Exercice C 
--6.2.a)
select nome, nif from GetStock.fornecedor EXCEPT select nome, nif from GetStock.fornecedor join GetStock.encomenda on fornecedor=nif;
------------------------
--6.2.b)
select codigo, nome, AVG(item.unidades) as Average from GetStock.produto join GetStock.item on codigo=codProd group by codigo, nome;
------------------------
--6.2.c)
select numero, AVG(produto.unidades) as Average from GetStock.encomenda join GetStock.item on numEnc=numero join GetStock.produto on codProd=codigo group by numero;
------------------------
--6.2.d)
select fornecedor.nome, produto.nome, produto.unidades from GetStock.encomenda join GetStock.fornecedor on nif=fornecedor join GetStock.item on numEnc=numero join GetStock.produto on codProd=codigo order by fornecedor.nome

