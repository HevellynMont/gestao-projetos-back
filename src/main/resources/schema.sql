-- CASO O BANCO SEJA ATUALIZADO, RODEM LOCALMENTE, DENTRO DO MYSQL, OS COMANDOS:

-- DROP DATABASE gestao_projetos; 
-- CREATE DATABASE gestao_projetos;

-- TODO: Linhas comentadas para que o spring gere automáticamente o banco na sua máquina local caso ainda não exista sem interferencias do script

-- create database if not exists gestao_projetos;
-- use gestao_projetos;

create table projetos(
id bigint auto_increment primary key,
nome varchar(30) not null,
data_inicio date,
data_fim date, 
data_entrega date not null, 
situacao_atual varchar(50) not null,
descricao text not null,
aproveitamento int not null,

constraint unq_projeto_nome unique (nome),
constraint chk_aproveitamento_valido CHECK (aproveitamento >= 0 AND aproveitamento <= 100)
);

create table tarefas(
id bigint auto_increment primary key,
projeto_id bigint not null,
tarefa_id bigint,
nome varchar(30) not null,
situacao_atual varchar(50) not null,
prioridade varchar(50) not null,
descricao text not null,

constraint fk_projeto
foreign key (projeto_id)
references projetos(id)
ON DELETE CASCADE,

CONSTRAINT fk_tarefa
FOREIGN KEY (tarefa_id)
REFERENCES tarefas(id) 
ON DELETE CASCADE,

constraint unq_tarefas_nome_projeto unique (projeto_id, nome)
);

create table alunos(
id bigint auto_increment primary key,
nome varchar(30) not null,

constraint unq_alunos_nome_banco unique (nome)
);

create table tarefas_alunos(
id bigint auto_increment primary key,
tarefa_id bigint not null,
aluno_id bigint not null,

constraint fk_tarefas_alunos_tarefa
foreign key (tarefa_id)
references tarefas(id),

constraint fk_tarefas_alunos_aluno
foreign key (aluno_id)
references alunos(id),

constraint unq_tarefas_alunos_id unique (tarefa_id, aluno_id)
);

create table tecnologias(
id bigint auto_increment primary key,
nome varchar(30) not null,
categoria varchar(30) not null,
area varchar(20) not null,

constraint unq_tecnologia_nome unique (nome)
);

create table professores(
id bigint auto_increment primary key,
nome varchar(30) not null,

constraint unq_nome_professor unique (nome)
);

create table disciplinas(
id bigint auto_increment primary key,
professor_id bigint not null,
nome varchar(30) not null,
etapa varchar(2) not null,

constraint fk_disciplinas_professor
foreign key (professor_id)
references professores(id),

constraint unq_professor_id_nome_disciplina unique (professor_id, nome),
constraint unq_nome_disciplina unique (nome)
);

create table projetos_alunos(
id bigint primary key auto_increment,
aluno_id bigint not null,
projeto_id bigint not null,
cargo varchar(50) not null,
contribuicao int not null,

constraint fk_projetos_alunos_aluno 
foreign key (aluno_id) 
references alunos(id),

constraint fk_projetos_alunos_projeto
foreign key (projeto_id)
references projetos(id),

constraint unq_projetos_alunos_id unique (aluno_id, projeto_id),
constraint chk_contribuicao_aluno check (contribuicao >= 0 and contribuicao <= 100)
);


create table projetos_tecnologias(
id bigint primary key auto_increment,
projeto_id bigint not null,
tecnologia_id bigint not null,

constraint fk_projetos_tecnologias_projeto
foreign key (projeto_id)
references projetos(id),

constraint fk_projetos_tecnologias_tecnologia
foreign key (tecnologia_id)
references tecnologias(id),

constraint unq_projetos_tecnologias_id unique (projeto_id, tecnologia_id)
);

create table disciplinas_projetos(
id bigint primary key auto_increment,
projeto_id bigint not null,
disciplina_id bigint not null,

constraint fk_disciplinas_projetos_projeto
foreign key (projeto_id)
references projetos(id),

constraint fk_disciplinas_projetos_disciplina
foreign key (disciplina_id)
references disciplinas(id),

constraint unq_disciplinas_projetos_id unique (projeto_id, disciplina_id)
);