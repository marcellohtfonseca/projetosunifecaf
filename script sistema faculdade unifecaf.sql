show databases;
use db_sistema_faculdade;
create table tbl_alunos (
	id int not null primary key auto_increment,
	nome varchar(45) not null,
	matricula int not null,
    email varchar(255) not null,
    unique index unq_nome (nome),
    unique index unq_matricula (matricula),
    unique index unq_email (email)
);
create table tbl_professores (
	id int not null primary key auto_increment,
	nome varchar(45) not null,
	registro int not null,
	disponibilidade_horario varchar(100) not null,
	carga_horaria decimal(5,2),
    email varchar(255) not null,
    unique index unq_nome (nome),
    unique index unq_registro (registro),
    unique index unq_email (email)
);
create table tbl_materias (
	id int not null primary key auto_increment,
    nome varchar(45) not null,
	carga_horaria decimal(5,2) not null,
	unique index unq_nome (nome)
);
create table tbl_cursos (
	id int not null primary key auto_increment,
	duracao int not null,
	grade_curricular varchar(255) not null,
	modalidade varchar(45) not null,
	nome varchar(45) not null,
	unique index unq_nome (nome)
);
create table tbl_telefone_aluno (
	id int not null primary key auto_increment,
    numero varchar(45) not null,
    id_aluno int not null,
	constraint FK_aluno_telefone foreign key (id_aluno)
    references tbl_alunos(id),
	unique index unq_numero (numero)
);
create table tbl_telefone_professor (
	id int not null primary key auto_increment,
	numero varchar(45) not null,
	id_professor int not null,
	constraint FK_professor_telefone foreign key (id_professor)
    references tbl_professores(id),
    unique index unq_numero (numero)
);
create table tbl_notas (
	id int not null primary key auto_increment,
	nota float not null,
	data_avaliacao date not null,
	situacao varchar(15),
	id_professor int not null,
    id_aluno int not null,
    id_materia int not null,
    constraint FK_professor_nota foreign key (id_professor)
    references tbl_professores(id),
    constraint FK_aluno_nota foreign key (id_aluno)
    references tbl_alunos(id),
    constraint FK_materia_nota foreign key (id_materia)
    references tbl_materias(id)
);
create table tbl_turmas (
	id int not null primary key auto_increment,
	capacidade int not null,
	dia_hora varchar(45),
	numero_turma int not null,
	status varchar(45) not null,
    media_geral float,
    id_curso int not null,
    constraint FK_curso_turma foreign key (id_curso)
    references tbl_cursos(id),
    unique index unq_numero_turma (numero_turma)
);
create table tbl_turma_aluno (
	id int not null primary key auto_increment,
	id_turma int not null,
	id_aluno int not null,
	constraint FK_turma_turma_aluno foreign key (id_turma)
	references tbl_turmas(id),
	constraint FK_aluno_turma_aluno foreign key (id_aluno)
	references tbl_alunos(id)
);
create table tbl_professor_materia (
	id int not null primary key auto_increment,
	id_materia int not null,
	id_professor int not null,
	constraint FK_materia_professor_materia foreign key (id_materia)
    references tbl_materias(id),
    constraint FK_professor_professor_materia foreign key (id_professor)
    references tbl_professores(id)
);
create table tbl_materia_curso (
	id int not null primary key auto_increment,
	id_materia int not null,
	id_curso int not null,
	constraint FK_materia_materia_curso foreign key (id_materia)
	references tbl_materias(id),
    constraint FK_curso_materia_curso foreign key (id_curso)
    references tbl_cursos(id)
);
create table tbl_turma_professor (
	id int not null primary key auto_increment,
	id_turma int not null,
	id_professor int not null,
	constraint FK_turma_turma_professor foreign key (id_turma)
    references tbl_turmas(id),
    constraint FK_professor_turma_professor foreign key (id_professor)
    references tbl_professores(id)
);
create table tbl_materia_turma (
	id int not null primary key auto_increment,
	id_materia int not null,
	id_turma int not null,
    constraint FK_materia_materia_turma foreign key (id_materia)
    references tbl_materias(id),
    constraint FK_turma_materia_turma foreign key (id_turma)
    references tbl_turmas(id)
);

