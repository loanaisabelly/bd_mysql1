-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Classe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Classe` (
  `idClasse` INT NOT NULL AUTO_INCREMENT,
  `classe` VARCHAR(50) NOT NULL,
  `poder` VARCHAR(250) NOT NULL,
  `tipo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idClasse`),
  UNIQUE INDEX `idClasse_UNIQUE` (`idClasse` ASC) VISIBLE,
  UNIQUE INDEX `poder_UNIQUE` (`poder` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_personagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_personagens` (
  `idtb_personagens` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `Ponto_Ataque` INT NOT NULL,
   `Ponto_Defesa` INT NOT NULL,
   `foco_ataque` boolean NOT NULL,
  `Classificacao` VARCHAR(100) NULL,
  `Classe_idClasse` INT NOT NULL,
  PRIMARY KEY (`idtb_personagens`, `Classe_idClasse`),
  UNIQUE INDEX `idtb_personagens_UNIQUE` (`idtb_personagens` ASC) VISIBLE,
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE,
  INDEX `fk_tb_personagens_Classe_idx` (`Classe_idClasse` ASC) VISIBLE,
  CONSTRAINT `fk_tb_personagens_Classe`
    FOREIGN KEY (`Classe_idClasse`)
    REFERENCES `mydb`.`Classe` (`idClasse`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into Classe (classe, poder, tipo)
values ('Guerreiro',' Força com Espada (foco em ataques corpo a corpo com espada)','Ataque'),
('Mago','Feitiçaria (foco em magia)', 'Defesa'),
('Arqueiro','Tiro Longo (foco em ataques à distância com arco)','Ataque'),
('Curandeiro','Cura Rápida (foco em restaurar saúde)','Defesa'),
('Paladino','Defesa Imbatível (foco em proteger a si e aos aliados)','Defesa'),
('Bárbaro','Fúria Bárbara(Um ataque devastador com força bruta)', 'Ataque'),
('Assassino','Golpe Mortal(Um ataque furtivo e mortal)','Ataque'),
('Necromante',' Ressurreição( A habilidade de levantar mortos e controlar espíritos)','Ataque');


insert into tb_personagens (nome, Ponto_Ataque ,Ponto_Defesa, Classificacao, foco_ataque ,Classe_idClasse)
VALUES
('Thorne', 2100, 1100, 'Ouro',TRUE ,1), 
('Alicia', 2200, 1300, 'Platina',TRUE, 1),
('Kaelen', 1700, 1100, 'Prata',TRUE, 3),
('Selene', 1500, 1350, 'Bronze', TRUE, 6),
('Caden', 2400, 1450, 'Platina', TRUE, 7),
('Brom', 1950, 1200, 'Ouro', TRUE, 8),
('Nyssa', 1400, 900, 'Iniciante',TRUE, 7),
('Lucian', 1300, 2300, 'Platina', FALSE ,2), 
('Aeliana', 1500, 1950, 'Ouro',FALSE, 4), 
('Thalindra', 1500, 1850, 'Prata', FALSE, 5),
('Ragnar', 1600, 2100, 'Ouro',FALSE, 4),
('Ivyra', 1100, 1450, 'Bronze',FALSE, 2),
('Vercia', 1500, 2000, 'Ouro',FALSE, 5);

DESCRIBE tb_personagens; 
SELECT * FROM  classe;
SELECT * FROM  tb_personagens;

----------- Verificar Os Personagens com Maior Ataque ---

SELECT tb.nome AS Nome, tb.Ponto_Ataque AS Ataque, cl.classe AS Classe
FROM tb_personagens tb, classe cl 
WHERE cl.idClasse = tb.classe_idclasse
AND Ponto_Ataque > 2000 AND foco_ataque = TRUE
ORDER BY tb.idtb_personagens;

-------- Verificar Os Personagens com Defesa entre 1000 e 2000 ------
SELECT tb.nome AS Nome, tb.Ponto_Defesa AS Defesa, cl.classe AS Classe
FROM tb_personagens tb, classe cl 
WHERE cl.idClasse = tb.classe_idclasse
AND Ponto_Defesa BETWEEN 1000 AND 2000 
AND foco_ataque = FALSE
ORDER BY tb.idtb_personagens;

-------- Verificar Os Personagens com a letra C no nome ------
SELECT nome AS Nome,  Ponto_Ataque AS Ataque ,Ponto_Defesa AS Defesa , Classificacao AS Nivel
FROM tb_personagens 
WHERE nome like '%c%'
ORDER BY idtb_personagens;
 
 -------- INNER JOIN - Verifica as duas tabelas e mostra os personagens com Ataque ------
SELECT idtb_personagens AS Id, nome AS Nome, Classificacao AS Classificação, tipo AS Tipo, classe AS Classe, poder AS Descrição 
FROM tb_personagens  INNER JOIN classe 
ON tb_personagens.Classe_idClasse = idClasse
WHERE tipo = 'Ataque'
ORDER BY nome;

 -------- INNER JOIN - Verifica as duas tabelas e mostra os personagens com Classificação Ouro e Foco de Ataque Falso ------
SELECT idtb_personagens AS Id, nome AS Nome, Classificacao AS Classificação,Ponto_Ataque AS Ataque ,Ponto_Defesa AS Defesa, tipo AS Tipo, classe AS Classe
FROM tb_personagens 
INNER JOIN classe ON tb_personagens.Classe_idClasse = idClasse
WHERE Classificacao = 'Ouro' and foco_ataque = FALSE
ORDER BY nome;


