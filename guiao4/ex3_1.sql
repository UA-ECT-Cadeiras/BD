use p8g6
go
create schema  Gestao_de_Stocks;
go
create table Gestao_de_Stocks.Produto(
	Codigo int primary key,
	Nome varchar(15), 
	Preco int,
	IVA int,
	nUnidades int, 
	);

create table Gestao_de_Stocks.Tipo_Fornecedor(
	codigo int primary key,
	Designacao varchar(20),
	);


create table Gestao_de_Stocks.Fornecedor (
	Nif int primary key,
	Nome varchar(25),
	Fax int,
	Pagamento int,
	Endereco varchar(30),
	Tipo varchar(10), 
	fornecedor int references Gestao_de_Stocks.Tipo_Fornecedor(codigo)
		
	);
	
create table Gestao_de_Stocks.Encomenda (
	nEncomenda int primary key,
	Data date,
	fornecedor int references Gestao_de_Stocks.Fornecedor(NIF)
	
	);
	
	
create table Gestao_de_Stocks.Contem(
	nEncomenda int references Gestao_de_Stocks.Encomenda(nEncomenda),
	Codigo_do_Produto int  references Gestao_de_Stocks.Produto(Codigo),
	Numero int,
	
	);
	 