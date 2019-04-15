use p8g6;
go
create schema gestao_conferencia; 
go
create table gestao_conferencia.instituicao(
    nome                    varchar(15) ,
    endereco                varchar(15) ,
	primary key(nome,endereco),
);

create table gestao_conferencia.artigo(
    n_registo               int,
    titulo                  varchar(10),
    nome_instituicao        varchar(15) ,
    endereco_instituicao    varchar(15) ,
	primary key (n_registo),
	foreign key(nome_instituicao,endereco_instituicao) references gestao_conferencia.instituicao(nome,endereco),
);

create table gestao_conferencia.autor(
    nome                    varchar(15) ,
    email                   varchar(15) ,
    nome_instituicao        varchar(15) ,
    endereco_instituicao    varchar(15), 
	primary key (nome,email),
	foreign key(nome_instituicao,endereco_instituicao) references gestao_conferencia.instituicao(nome,endereco),

);

create table gestao_conferencia.autor_artigo(
    autor                   varchar(15) ,
    artigo                  int ,
	foreign key(artigo) references gestao_conferencia.artigo(n_registo),

);

create table gestao_conferencia.participantes(
    email                   varchar(20) primary key, 
    nome                    varchar(15) ,
    morada                  varchar(15) ,
    data_inscricao          date ,
    nome_instituicao        varchar(15),
    endereco_instituicao    varchar(15),	
	foreign key(nome_instituicao,endereco_instituicao) references gestao_conferencia.instituicao(nome,endereco),
);
 

create table gestao_conferencia.estudantes(
    email                   varchar(20) references gestao_conferencia.participantes(email),
    localizacao_eletronica  varchar(20),
);

create table gestao_conferencia.nao_estudantes(
    email                   varchar(20) references gestao_conferencia.participantes(email),
    ref_bancaria            int,
);