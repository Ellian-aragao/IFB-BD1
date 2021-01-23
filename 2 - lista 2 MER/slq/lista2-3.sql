CREATE DATABASE IF NOT EXISTS `Fazenda`;
USE `Fazenda`;

CREATE TABLE IF NOT EXISTS `Fazenda`.`Proprietario` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `Endereco` VARCHAR(45) NULL,
  `Fone` VARCHAR(45) NULL,
  PRIMARY KEY (`Codigo`)
);

CREATE TABLE IF NOT EXISTS `Fazenda`.`Fazendas` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Tamanho` DECIMAL NULL,
  `Localizacao` VARCHAR(45) NULL,
  `Proprietario_Codigo` INT NOT NULL,
  PRIMARY KEY (`Codigo`, `Proprietario_Codigo`),
  CONSTRAINT `fk_Fazendas_Proprietario1`
    FOREIGN KEY (`Proprietario_Codigo`)
    REFERENCES `Fazenda`.`Proprietario` (`Codigo`)
);

CREATE TABLE IF NOT EXISTS `Fazenda`.`Produtos` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(45) NULL,
  `Tempo de vida` INT NULL,
  PRIMARY KEY (`Codigo`)
);

CREATE TABLE IF NOT EXISTS `Fazenda`.`Cultivo` (
  `Fazendas_Codigo` INT NOT NULL,
  `Produtos_Codigo` INT NOT NULL,
  PRIMARY KEY (`Fazendas_Codigo`, `Produtos_Codigo`),
  CONSTRAINT `fk_Fazendas_has_Produtos_Fazendas`
    FOREIGN KEY (`Fazendas_Codigo`)
    REFERENCES `Fazenda`.`Fazendas` (`Codigo`),
  CONSTRAINT `fk_Fazendas_has_Produtos_Produtos1`
    FOREIGN KEY (`Produtos_Codigo`)
    REFERENCES `Fazenda`.`Produtos` (`Codigo`)
);

CREATE TABLE IF NOT EXISTS `Fazenda`.`Praga` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Nome popular` VARCHAR(45) NULL,
  `Nome cientifico` VARCHAR(45) NULL,
  `Tempo de vida` INT NULL,
  PRIMARY KEY (`Codigo`)
);

CREATE TABLE IF NOT EXISTS `Fazenda`.`Defensivos` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Codigo`)
);

CREATE TABLE IF NOT EXISTS `Fazenda`.`Quimicos` (
  `Volume` INT NOT NULL,
  `Prazo de validade` VARCHAR(45) NULL,
  `Prazo de contaminacao` VARCHAR(45) NULL,
  `Descricao dos componentes` VARCHAR(45) NULL,
  `Efeitos colaterais` VARCHAR(45) NULL,
  `Defensivos_Codigo` INT NOT NULL,
  PRIMARY KEY (`Defensivos_Codigo`),
  CONSTRAINT `fk_Quimicos_Defensivos1`
    FOREIGN KEY (`Defensivos_Codigo`)
    REFERENCES `Fazenda`.`Defensivos` (`Codigo`)
);

CREATE TABLE IF NOT EXISTS `Fazenda`.`Biologico` (
  `Nome cientifico` INT NOT NULL,
  `Defensivos_Codigo` INT NOT NULL,
  PRIMARY KEY (`Nome cientifico`, `Defensivos_Codigo`),
  CONSTRAINT `fk_Biologico_Defensivos1`
    FOREIGN KEY (`Defensivos_Codigo`)
    REFERENCES `Fazenda`.`Defensivos` (`Codigo`)
);

CREATE TABLE IF NOT EXISTS `Fazenda`.`Praga_has_Produtos` (
  `Praga_Codigo` INT NOT NULL,
  `Produtos_Codigo` INT NOT NULL,
  PRIMARY KEY (`Praga_Codigo`, `Produtos_Codigo`),
  CONSTRAINT `fk_Praga_has_Produtos_Praga1`
    FOREIGN KEY (`Praga_Codigo`)
    REFERENCES `Fazenda`.`Praga` (`Codigo`),
  CONSTRAINT `fk_Praga_has_Produtos_Produtos1`
    FOREIGN KEY (`Produtos_Codigo`)
    REFERENCES `Fazenda`.`Produtos` (`Codigo`)
);

CREATE TABLE IF NOT EXISTS `Fazenda`.`Praga_has_Defensivos` (
  `Praga_Codigo` INT NOT NULL,
  `Defensivos_Codigo` INT NOT NULL,
  PRIMARY KEY (`Praga_Codigo`, `Defensivos_Codigo`),
  CONSTRAINT `fk_Praga_has_Defensivos_Praga1`
    FOREIGN KEY (`Praga_Codigo`)
    REFERENCES `Fazenda`.`Praga` (`Codigo`),
  CONSTRAINT `fk_Praga_has_Defensivos_Defensivos1`
    FOREIGN KEY (`Defensivos_Codigo`)
    REFERENCES `Fazenda`.`Defensivos` (`Codigo`)
);
