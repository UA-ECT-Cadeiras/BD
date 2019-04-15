/*rent a car*/


create database p8g6;
go
use p8g6
go
create schema Rent_a_Car;
go
create table  Rent_a_Car.Client(
		Nome varchar(25) ,
		Num_carta int ,
		Endereco varchar(50) ,
		NIF int primary key,
);
create table  Rent_a_Car.Balcao(
		Nome varchar(25) ,
		Endereco varchar(50) ,
		Numero int primary key,
);
create table  Rent_a_Car.Tipo_veiculo(
		Designacao varchar(25) ,
		Arcondicionado int ,
		Codigo int primary key,
);

create table  Rent_a_Car.Veiculo(
		Marca varchar(25) ,
		Ano int ,
		Matricula varchar(8) primary key,
		Codigo int references Rent_a_Car.Tipo_veiculo(Codigo),
);


create table  Rent_a_Car.Aluger(
		Duracao int ,
		Data date ,
		Numero int primary key,
		Client_NIF int references Rent_a_car.Client(NIF),
		Vei_Matricula varchar(8) references Rent_a_Car.Veiculo(Matricula),
		NumeroBalcao int references Rent_a_Car.Balcao(Numero),
);

create table  Rent_a_Car.Ligeiro(
		Combustiveis varchar(8) ,
		Num_Lugares int ,
		Portas int ,
		Codigo int references Rent_a_car.Tipo_veiculo(Codigo),
);

create table  Rent_a_Car.Pesado(
		Peso int ,
		Passageiros int,
		Codigo int references Rent_a_car.Tipo_veiculo(Codigo), 
);
create table  Rent_a_Car.Similiaridade(
		Codigo1 int references Rent_a_car.Tipo_veiculo(Codigo),
		Codigo2 int references Rent_a_car.Tipo_veiculo(Codigo),
);


