-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ferramentas-saep
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ferramentas-saep
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ferramentas-saep` DEFAULT CHARACTER SET utf8 ;
USE `ferramentas-saep` ;

-- -----------------------------------------------------
-- Table `ferramentas-saep`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferramentas-saep`.`Categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nome_categoria` VARCHAR(100) NULL,
  `descricao` TEXT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferramentas-saep`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferramentas-saep`.`Produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nome_produto` VARCHAR(100) NULL,
  `cor` VARCHAR(45) NULL,
  `textura` VARCHAR(45) NULL,
  `peso` DECIMAL(10,2) NULL,
  `unidade_medida` VARCHAR(100) NULL,
  `data_validade` DATE NULL,
  `estoque_minimo` INT NULL,
  `estoque_atual` INT NULL,
  `preco_unitario` DECIMAL NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_produto`),
  INDEX `fk_Produto_Categoria_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_Categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `ferramentas-saep`.`Categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferramentas-saep`.`movimentacao_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferramentas-saep`.`movimentacao_estoque` (
  `id_movimentacao_estoque` INT NOT NULL AUTO_INCREMENT,
  `tipo_movimentacao` VARCHAR(45) NULL,
  `quantidade` INT NULL,
  `data_movimentacao` DATETIME NULL,
  PRIMARY KEY (`id_movimentacao_estoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferramentas-saep`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferramentas-saep`.`Usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(100) NULL,
  `login` VARCHAR(100) NULL,
  `senha` VARCHAR(50) NULL,
  `id_usuario` INT NOT NULL,
  `id_produto` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_Usuario_movimentacao_estoque1_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_Usuario_Produto1_idx` (`id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_movimentacao_estoque1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `ferramentas-saep`.`movimentacao_estoque` (`id_movimentacao_estoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Produto1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `ferramentas-saep`.`Produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
