
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_pizzaria_legal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_pizzaria_legal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_pizzaria_legal` DEFAULT CHARACTER SET utf8 ;
USE `db_pizzaria_legal` ;

-- -----------------------------------------------------
-- Table `db_pizzaria_legal`.`tb_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_pizzaria_legal`.`tb_categoria` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_pizzaria_legal`.`tb_massas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_pizzaria_legal`.`tb_massas` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `tipo_massa` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_pizzaria_legal`.`tb_pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_pizzaria_legal`.`tb_pizza` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `preco` DECIMAL(6,2) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `ingredientes` VARCHAR(500) NOT NULL,
  `tb_categoria_id` BIGINT NOT NULL,
  `tb_massas_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_pizza_tb_categoria_idx` (`tb_categoria_id` ASC) VISIBLE,
  INDEX `fk_tb_pizza_tb_massas1_idx` (`tb_massas_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_pizza_tb_categoria`
    FOREIGN KEY (`tb_categoria_id`)
    REFERENCES `db_pizzaria_legal`.`tb_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_pizza_tb_massas1`
    FOREIGN KEY (`tb_massas_id`)
    REFERENCES `db_pizzaria_legal`.`tb_massas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO tb_categoria(tipo, descricao)
VALUES ('Tradicional','Pizzas com ingredientes tradicionais'),
('Gourmet','Pizzas com ingredientes diferenciados'),
('Vegana','Pizzas sem ingredientes de origem animal'),
('Doce','Pizzas com massa de chocolate branco ou preto');

INSERT INTO tb_massas(tipo_massa)
VALUES('Fina'),
('Grossa'),
('Integral'),
('Recheada'),
('Sem glúten');


INSERT INTO tb_pizza(nome, preco, descricao, ingredientes, tb_categoria_id, tb_massas_id)
VALUES('Calabresa',	35.00 ,'Pizza de calabresa com cebola e azeitona','Calabresa, cebola, azeitona, queijo', 1, 2),
('Frango com Catupiry',35.00 ,'Pizza de frango desfiado com catupiry','Frango, catupiry, cebola, tomate', 1, 2),
('Frango',35.00 ,'Pizza de frango desfiado','Frango, cebola,azeitona, queijo', 1, 5),
('Pizza 4 Queijos', 45.00, 'Deliciosa pizza com quatro tipos de queijo.', 'Mussarela, parmesão, gorgonzola, provolone', 2, 1), 
('Pizza Margherita', 38.00, 'Pizza clássica com molho de tomate, mussarela e manjericão.', 'Mussarela, molho de tomate, manjericão', 1, 1),  
('Pizza Hawaiana', 42.00, 'Pizza com molho de tomate, presunto e abacaxi.', 'Presunto, abacaxi, molho de tomate', 2, 1),
('Pizza Portuguesa', 50.00, 'Pizza com presunto, ovos, cebola e azeitonas.', 'Presunto, ovos, cebola, azeitonas', 2, 5),
('Pizza de Morango com Chocolate e m&ms', 41.00, 'Pizza doce com morangos frescos e chocolate branco.', 'Morango fresco, chocolate branco', 4, 1), 
('Pizza Mexicana', 40.00, 'Pizza com carne moída, jalapeños e queijo cheddar.', 'Carne moída, jalapeños, queijo cheddar', 2, 2), 
('Pizza de Bacon e Queijo', 42.00, 'Pizza com bacon crocante e uma combinação de queijos.', 'Bacon, queijo prato, queijo mussarela', 1, 1), 
('Pizza de Pesto com Tomate Seco', 45.00, 'Pizza com molho pesto, tomate seco e queijo parmesão.', 'Molho pesto, tomate seco, queijo parmesão', 3, 3),
('Pizza Caprese', 70.00, 'Pizza com molho de tomate, mussarela de búfala e manjericão.', 'Mussarela de búfala, manjericão, molho de tomate', 2, 4),
('Pizza de Carne Seca com Abóbora', 58.00, 'Pizza com carne seca desfiada e abóbora assada.', 'Carne seca desfiada, abóbora assada, queijo coalho', 2, 1), 
('Pizza de Picanha com Queijo', 78.00, 'Pizza com picanha, queijo prato e molho especial.', 'Picanha, queijo prato, molho especial', 2, 4),
('Pizza de Trufas', 80.00,'Pizza gourmet com trufas e queijo brie','Trufas, queijo brie',2, 3),
('Pizza Doce de Nutella', 60.00, 'Pizza doce com Nutella e morangos frescos.', 'Nutella, morangos frescos', 4, 3),
('Pizza de Morango com Chocolate Branco', 46.00, 'Pizza doce com morangos frescos e chocolate branco.', 'Morango fresco, chocolate branco', 4, 5),
('Pizza de Cogumelos e Trufas', 65.00, 'Pizza com cogumelos frescos e azeite de trufas.', 'Cogumelos frescos, azeite de trufas, queijo de ricota', 3, 1),
('	Pizza Vegana', 40.00,'	Pizza sem produtos de origem animal','Tomate, cogumelos, manjericão', 3, 5),
('Pizza Vegetariana', 36.00, 'Pizza com diversos legumes e molho de tomate.', 'Berinjela, abobrinha, cogumelo, pimentão, tomate', 3, 5);

SELECT * FROM tb_categoria; 
SELECT * FROM tb_pizza;
SELECT * FROM tb_massas;

----- SELECT Para verificar as Pizzas que com preço acima de 45,00 ----
SELECT pi.id AS Id, pi.nome AS Nome, pi.preco AS Preço, pi.descricao AS Descrições, ca.tipo AS Tipo
FROM tb_pizza pi, tb_categoria ca
WHERE pi.tb_categoria_id = ca.id AND
preco >= 45.00 
ORDER BY pi.id;

----- SELECT Para verificar as Pizzas que com preço entre 40,00 a 55,00----
SELECT nome AS Nome, preco AS Preço, descricao AS Descrções, ingredientes AS Ingredientes 
FROM tb_pizza
WHERE preco BETWEEN 40.00 AND 55.00
ORDER BY nome;

----- SELECT Para verificar as Pizzas que tem a letra M no seu Nome ----
SELECT id AS Id, nome AS Nome, descricao AS Descrções, ingredientes AS Ingredientes 
FROM tb_pizza
WHERE nome LIKE '%M%'
ORDER BY id;

----- SELECT que junta as três tabelas na mesma pesquisa  ----
SELECT pi.id AS Id, pi.nome AS Nome, ca.tipo AS Tipo, ma.tipo_massa AS Massa, pi.ingredientes AS Ingredientes 
FROM tb_pizza pi 
INNER JOIN tb_categoria ca ON pi.tb_categoria_id = ca.id
INNER JOIN tb_massas ma ON pi.tb_massas_id = ma.id
ORDER BY pi.id;

----- SELECT que mostra uma categoria de Pizza epecífica  ----
SELECT pi.id AS Id, pi.nome AS Nome, ca.tipo AS Tipo, ma.tipo_massa AS Massa, pi.ingredientes AS Ingredientes 
FROM tb_pizza pi 
INNER JOIN tb_categoria ca ON pi.tb_categoria_id = ca.id
INNER JOIN tb_massas ma ON pi.tb_massas_id = ma.id
WHERE ca.tipo = 'Tradicional'
ORDER BY pi.id;
