use p8g6
go
create schema  Gestao_Farmacias;
go

create table Gestao_Farmacias.Paciente(
	UtenteID		int primary key,
	P_Name			varchar(20),
	P_Birth			date,
	P_Address		varchar(100)
);

create table Gestao_Farmacias.Medico(
	MedicoID		int primary key,
	M_Name			varchar(20),
	M_Especialidade	varchar(20)
);

create table Gestao_Farmacias.Prescricao(
	PrescricaoID	int primary key,
	UtenteID		int references Gestao_Farmacias.Paciente(UtenteID),
	MedicoID		int references Gestao_Farmacias.Medico(MedicoID),
);

create table Gestao_Farmacias.Farmacia(
	FarmaciaID		varchar(20) primary key,
	F_Address		varchar(100),
	F_Phone			int
);

create table Gestao_Farmacias.Receita(
	R_Date			date,
	P_ID			int references Gestao_Farmacias.Prescricao(PrescricaoID),
	F_ID			varchar(20) references Gestao_Farmacias.Farmacia(FarmaciaID)
);

create table Gestao_Farmacias.Farmaco(
	F_Name			varchar(20),
	Formula			varchar(100) primary key
);

create table Gestao_Farmacias.StockFarmacia(
	Quantity		int,
	Farmacia		varchar(20) references Gestao_Farmacias.Farmacia(FarmaciaID),
	Farmaco			varchar(100) references Gestao_Farmacias.Farmaco(Formula)
);

create table Gestao_Farmacias.Farmaceutica(
	F_Name			varchar(20),
	Farmaco			varchar(100) references Gestao_Farmacias.Farmaco(Formula)
);



