-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema publicacoes_cientificas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema publicacoes_cientificas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `publicacoes_cientificas` DEFAULT CHARACTER SET utf8 ;
USE `publicacoes_cientificas` ;

-- -----------------------------------------------------
-- Table `publicacoes_cientificas`.`Instituicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publicacoes_cientificas`.`Instituicao` (
  `Cod_Instituicao` INT NOT NULL,
  `Nome` VARCHAR(60) NULL,
  `Sigla` VARCHAR(10) NULL,
  `Categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Instituicao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publicacoes_cientificas`.`Pesquisador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publicacoes_cientificas`.`Pesquisador` (
  `Cod_Pesq` INT NOT NULL,
  `Nome_Pesq` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(90) NOT NULL,
  `Data_Nascimento` DATE NOT NULL,
  `Curriculo_Lattes` VARCHAR(200) NOT NULL,
  `Ocupacao` VARCHAR(45) NOT NULL,
  `Cod_Instituicao` INT NOT NULL,
  PRIMARY KEY (`Cod_Pesq`),
  INDEX `fk_Pesquisador_Instituicao_idx` (`Cod_Instituicao` ASC) VISIBLE,
  CONSTRAINT `fk_Pesquisador_Instituicao`
    FOREIGN KEY (`Cod_Instituicao`)
    REFERENCES `publicacoes_cientificas`.`Instituicao` (`Cod_Instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publicacoes_cientificas`.`Artigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publicacoes_cientificas`.`Artigo` (
  `Cod_Artigo` INT NOT NULL,
  `Titulo` VARCHAR(45) NOT NULL,
  `Qtd_Paginas` INT NOT NULL,
  `Ano_Publicacao` DATE NOT NULL,
  `Area_Conhecimento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Artigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publicacoes_cientificas`.`Artigo_Congresso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publicacoes_cientificas`.`Artigo_Congresso` (
  `Cod_Artigo` INT NOT NULL,
  `Nome_Congresso` VARCHAR(45) NOT NULL,
  `Sigla` VARCHAR(10) NOT NULL,
  `Cidade_Congresso` VARCHAR(60) NOT NULL,
  `Data_Congresso` DATE NOT NULL,
  INDEX `fk_Artigo_Congresso_Artigo1_idx` (`Cod_Artigo` ASC) VISIBLE,
  PRIMARY KEY (`Cod_Artigo`),
  UNIQUE INDEX `Cod_Artigo_UNIQUE` (`Cod_Artigo` ASC) VISIBLE,
  CONSTRAINT `fk_Artigo_Congresso_Artigo1`
    FOREIGN KEY (`Cod_Artigo`)
    REFERENCES `publicacoes_cientificas`.`Artigo` (`Cod_Artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publicacoes_cientificas`.`Revista_Cientifica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publicacoes_cientificas`.`Revista_Cientifica` (
  `Cod_Revista` INT NOT NULL,
  `Nome_Revista` VARCHAR(45) NOT NULL,
  `Sigla` VARCHAR(15) NOT NULL,
  `ISSN` VARCHAR(45) NOT NULL,
  `DOI` VARCHAR(200) NULL,
  `URL` VARCHAR(200) NOT NULL,
  `Revista_Cientificacol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Revista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publicacoes_cientificas`.`Artigo_Periodico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publicacoes_cientificas`.`Artigo_Periodico` (
  `Cod_Artigo` INT NOT NULL,
  `Cod_Revista` INT NOT NULL,
  `Volume` INT NULL,
  `Numero` INT NULL,
  PRIMARY KEY (`Cod_Revista`, `Cod_Artigo`),
  INDEX `fk_Artigo_Periodico_Revista_Cientifica1_idx` (`Cod_Revista` ASC) VISIBLE,
  INDEX `fk_Artigo_Periodico_Artigo1_idx` (`Cod_Artigo` ASC) VISIBLE,
  UNIQUE INDEX `Cod_Artigo_UNIQUE` (`Cod_Artigo` ASC) VISIBLE,
  UNIQUE INDEX `Cod_Revista_UNIQUE` (`Cod_Revista` ASC) VISIBLE,
  CONSTRAINT `fk_Artigo_Periodico_Revista_Cientifica1`
    FOREIGN KEY (`Cod_Revista`)
    REFERENCES `publicacoes_cientificas`.`Revista_Cientifica` (`Cod_Revista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artigo_Periodico_Artigo1`
    FOREIGN KEY (`Cod_Artigo`)
    REFERENCES `publicacoes_cientificas`.`Artigo` (`Cod_Artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publicacoes_cientificas`.`Palavra_Chave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publicacoes_cientificas`.`Palavra_Chave` (
  `Cod_Artigo` INT NOT NULL,
  `Palavra_Chave` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Artigo`, `Palavra_Chave`),
  INDEX `fk_Palavra_Chave_Artigo1_idx` (`Cod_Artigo` ASC) VISIBLE,
  CONSTRAINT `fk_Palavra_Chave_Artigo1`
    FOREIGN KEY (`Cod_Artigo`)
    REFERENCES `publicacoes_cientificas`.`Artigo` (`Cod_Artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publicacoes_cientificas`.`Autoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publicacoes_cientificas`.`Autoria` (
  `Cod_Artigo` INT NOT NULL,
  `Cod_Pesq` INT NOT NULL,
  `Posicao_Autor` INT NOT NULL,
  INDEX `fk_Autoria_Artigo1_idx` (`Cod_Artigo` ASC) VISIBLE,
  PRIMARY KEY (`Cod_Artigo`, `Cod_Pesq`),
  INDEX `fk_Autoria_Pesquisador1_idx` (`Cod_Pesq` ASC) VISIBLE,
  CONSTRAINT `fk_Autoria_Artigo1`
    FOREIGN KEY (`Cod_Artigo`)
    REFERENCES `publicacoes_cientificas`.`Artigo` (`Cod_Artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Autoria_Pesquisador1`
    FOREIGN KEY (`Cod_Pesq`)
    REFERENCES `publicacoes_cientificas`.`Pesquisador` (`Cod_Pesq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
