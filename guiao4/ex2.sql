create schema Gestao_airport;
go
create table Gestao_airport.airport(
	airport_code int primary key,
	city varchar(10),
	Stat varchar(10),
	name varchar(10),
	);

create table Gestao_airport.airplane_type(
	type_nam varchar(10) primary key,
	company varchar(10),
	max_seats int,
	
	);

create table Gestao_airport.airplane(
	typ varchar(10) references Gestao_airport.airplane_type(type_nam),
	airplane_id int primary key,
	total_num_seats int,
	);

create table Gestao_airport.can_land(
	airport_code int references Gestao_airport.airport(airport_code),
	type_nam varchar(10) references Gestao_airport.airplane_type(type_nam),
	
	);

create table Gestao_airport.flight(
	number int primary key,
	airline varchar(10),
	weekdays varchar(10),
	
	
	);

create table Gestao_airport.flight_leg(
	leg_no int primary key,
	flight_num int references Gestao_airport.flight(number),
	derpature_Airp int references Gestao_airport.airport(airport_code),
	arrival_Airp int references Gestao_airport.airport(airport_code),
	s_dep_time int,
	s_arr_time int,
	);

create table Gestao_airport.Leg_instance(
	flight_num int references Gestao_airport.flight(number),
	leg_no int  references Gestao_airport.flight_leg(leg_no),
	data date primary key,
	No_avail_seats int,
	derpature_Airp int references Gestao_airport.airport(airport_code),
	arrival_Airp int references Gestao_airport.airport(airport_code),
	dep_time int,
	arr_time int,
	assignd int references Gestao_airport.airplane(airplane_id),
);

create table  Gestao_airport.seat(
	seat_number int primary key,
	data date references Gestao_airport.Leg_instance(data),
	leg_no int  references Gestao_airport.flight_leg(leg_no),
	costumer_name varchar(30),
	chpone int,
	flight_num int references Gestao_airport.flight(number),

	);
	
create table  Gestao_airport.fare(
	code int primary key,
	amount int,
	restrictions varchar(100),
	flight_num int references Gestao_airport.flight(number),
	
	);