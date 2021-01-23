CREATE DATABASE IF NOT EXISTS `Hospital`;
USE `Hospital`;

CREATE TABLE IF NOT EXISTS `Hospital`.`Pacientes` (
  `CRH` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereco` VARCHAR(45) NULL,
  `Data nascimento` DATE NULL,
  `Sexo` VARCHAR(15) NULL,
  `Fone` VARCHAR(15) NULL,
  `Responsavel` VARCHAR(45) NULL,
  PRIMARY KEY (`CRH`)
);

CREATE TABLE IF NOT EXISTS `Hospital`.`Medicos` (
  `CRM` INT NOT NULL,
  `Cidade` VARCHAR(45) NULL,
  `Endereco` VARCHAR(45) NULL,
  `fones` VARCHAR(15) NULL,
  PRIMARY KEY (`CRM`)
);

CREATE TABLE IF NOT EXISTS `Hospital`.`Leitos` (
  `Numero do leito` INT NOT NULL,
  `Numero do quarto` INT NULL,
  `Tipo` VARCHAR(45) NULL,
  `Ala` VARCHAR(45) NULL,
  PRIMARY KEY (`Numero do leito`)
);

CREATE TABLE IF NOT EXISTS `Hospital`.`Pacientes_has_Medicos` (
  `Pacientes_CRH` INT NOT NULL,
  `Medicos_CRM` INT NOT NULL,
  `Leitos_Numero do leito` INT NOT NULL,
  PRIMARY KEY (`Pacientes_CRH`, `Medicos_CRM`, `Leitos_Numero do leito`),
  CONSTRAINT `fk_Pacientes_has_Medicos_Pacientes`
    FOREIGN KEY (`Pacientes_CRH`)
    REFERENCES `Hospital`.`Pacientes` (`CRH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacientes_has_Medicos_Medicos1`
    FOREIGN KEY (`Medicos_CRM`)
    REFERENCES `Hospital`.`Medicos` (`CRM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacientes_has_Medicos_Leitos1`
    FOREIGN KEY (`Leitos_Numero do leito`)
    REFERENCES `Hospital`.`Leitos` (`Numero do leito`)
);

CREATE TABLE IF NOT EXISTS `Hospital`.`Exames` (
  `Descricao` VARCHAR(45) NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Data de realizacao` DATE NULL,
  `Resultado` VARCHAR(45) NULL,
  `Pacientes_has_Medicos_Pacientes_CRH` INT NOT NULL,
  `Pacientes_has_Medicos_Medicos_CRM` INT NOT NULL,
  PRIMARY KEY (`Pacientes_has_Medicos_Pacientes_CRH`, `Pacientes_has_Medicos_Medicos_CRM`),
  CONSTRAINT `fk_Exames_Pacientes_has_Medicos1`
    FOREIGN KEY (`Pacientes_has_Medicos_Pacientes_CRH` , `Pacientes_has_Medicos_Medicos_CRM`)
    REFERENCES `Hospital`.`Pacientes_has_Medicos` (`Pacientes_CRH` , `Medicos_CRM`)
);

CREATE TABLE IF NOT EXISTS `Hospital`.`Prontuario` (
  `Data constatacao` INT NULL,
  `Cuidados especiais` VARCHAR(45) NULL,
  `Problema` VARCHAR(45) NULL,
  `Receita` VARCHAR(45) NULL,
  `Pacientes_CRH` INT NOT NULL,
  PRIMARY KEY (`Pacientes_CRH`),
  CONSTRAINT `fk_Prontuario_Pacientes1`
    FOREIGN KEY (`Pacientes_CRH`)
    REFERENCES `Hospital`.`Pacientes` (`CRH`)
);
