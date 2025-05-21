create database db_sistema_mercado;
use db_sistema_mercado
create table tbl_cliente (
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    cpf varchar(45) not null,
    rg varchar(45) not null,
    email varchar(255) not null,
    unique index unq_nome (nome),
    unique index unq_cpf (cpf),
    unique index unq_rg (rg),
    unique index unq_email (email)
);
create table tbl_funcionario (
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    turno varchar(45) not null,
    setor varchar(45) not null,
    data_admissao date not null,
    email varchar(255) not null,
	salario decimal(10,2) not null,
	cargo varchar(45) not null,
    unique index unq_id (id),
    unique index unq_nome (nome),
    unique index unq_email (email)
);
create table tbl_fornecedor (
	id int not null primary key auto_increment,
    cnpj varchar(45) not null,
    nome varchar(45) not null,
    email varchar(255) not null,
    unique index unq_cnpj (cnpj),
	unique index unq_nome (nome),
	unique index unq_email (email)
);
create table tbl_produto (
	id int not null primary key auto_increment,
    nome varchar(45) not null,
	data_validade date not null,
	preco_venda decimal(10,2) not null,
	estoque_disponivel int not null,
	codigo_barras varchar(45) not null,
	categoria varchar(45) not null,
    preco_custo decimal(10,2) not null
);
create table tbl_forma_pagamento (
	id int not null primary key auto_increment,
	nome_forma_pagamento varchar(45) not null
);