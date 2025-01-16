create database db_quitanda;
create schema db_quitanda; 
use db_quitanda;

create table tb_produtos(
id bigint auto_increment primary key,
nome varchar(255) not null,
quantidade int,
data_validade date,
preco decimal(6,2)
);

insert into tb_produtos (nome,quantidade, data_validade, preco)
values
('Arroz', 100, '2025-12-31', 20.50),
('Feijão', 200, '2025-06-30', 15.75),
('Macarrão', 150, '2026-01-15', 8.20),
('Açúcar', 120, '2025-10-05', 5.50),
('Óleo', 80, '2026-02-20', 12.30);

INSERT INTO tb_produtos (nome, quantidade, data_validade, preco)
VALUES
('Banana', 150, '2025-01-15', 3.50),
('Maçã', 100, '2025-01-20', 4.20),
('Tomate', 80, '2025-01-10', 6.00),
('Cebola', 120, '2025-02-01', 2.30),
('Alface', 50, '2025-01-12', 1.80);

select *from tb_produtos;

select nome, preco, quantidade 
from tb_produtos
 order by nome;
 
 delete from tb_produtos
 where id = 1;
 
alter table tb_produtos
	add column obs varchar(150) null after data_validade ;
 
alter table tb_produtos drop obs;

 SET SQL_SAFE_UPDATES = 0;