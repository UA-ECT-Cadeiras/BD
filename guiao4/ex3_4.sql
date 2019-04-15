use p8g6;
go
create schema universidade; 
go
create table universidade.pessoa(
    nmec                int primary key,
    nome                varchar(15),
    data_nasc           date,
);
create table universidade.departamento(
    nome                varchar(15) primary key,
    localizacao         varchar(15),
    data_nasc           date,
);


create table universidade.professor(
      nmec              int references universidade.pessoa(nmec),
      categoria         varchar(25),
      area_             varchar(25),
      departamento      varchar(15) references universidade.departamento(nome),
      percentagem       int,
);

create table universidade.projeto(
    id                  int primary key,
    nome                varchar(15),
    data_incio          date,
    data_termino        date,
    entidade_finan      varchar(15),
    gerente             int references universidade.pessoa(nmec),
);

create table universidade.estudante_graduado(
      nmec              int references universidade.pessoa(nmec),
      grau_formacao     int,
      aconselha         int references universidade.pessoa(nmec),
      departamento      varchar(15) references universidade.departamento(nome),
      supervisionado    int references universidade.pessoa(nmec),
);

create table universidade.aluno_em_projeto(
    nmec                int primary key references universidade.pessoa(nmec),
    id_proj             int references universidade.projeto(id),
);

create table universidade.professor_em_projeto(
    nmec                int primary key references universidade.pessoa(nmec),
    id_proj             int references universidade.projeto(id),
);
