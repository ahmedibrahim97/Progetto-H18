-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema servizioferrovario
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema servizioferrovario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `servizioferrovario` DEFAULT CHARACTER SET utf8 ;
USE `servizioferrovario` ;

-- -----------------------------------------------------
-- Table `servizioferrovario`.`COMPAGNIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `servizioferrovario`.`COMPAGNIA` (
  `NOME` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`NOME`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servizioferrovario`.`TRENO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `servizioferrovario`.`TRENO` (
  `CODTRENO` VARCHAR(20) NOT NULL,
  `COMPAGNIA_NOME` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`CODTRENO`),
  INDEX `fk_TRENO_COMPAGNIA_idx` (`COMPAGNIA_NOME` ASC),
  CONSTRAINT `fk_TRENO_COMPAGNIA`
    FOREIGN KEY (`COMPAGNIA_NOME`)
    REFERENCES `servizioferrovario`.`COMPAGNIA` (`NOME`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servizioferrovario`.`VAGONE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `servizioferrovario`.`VAGONE` (
  `NUMVAG` INT NOT NULL,
  `CODTRENO` VARCHAR(20) NOT NULL,
  `TIPOLOGIA` VARCHAR(25) NULL,
  `NUMPOSTI` INT NULL,
  PRIMARY KEY (`NUMVAG`, `CODTRENO`),
  INDEX `fk_VAGONE_TRENO1_idx` (`CODTRENO` ASC),
  CONSTRAINT `fk_VAGONE_TRENO1`
    FOREIGN KEY (`CODTRENO`)
    REFERENCES `servizioferrovario`.`TRENO` (`CODTRENO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servizioferrovario`.`ITINERARI`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `servizioferrovario`.`ITINERARI` (
  `NOME` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`NOME`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servizioferrovario`.`TRATTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `servizioferrovario`.`TRATTE` (
  `NUMTRATTA` INT NOT NULL,
  `ITINERARI_NOME` VARCHAR(30) NOT NULL,
  `STAZIONE1` VARCHAR(45) NULL,
  `STAZIONE2` VARCHAR(45) NULL,
  `DURATA` INT NULL,
  `TRATTEcol` INT NULL,
  PRIMARY KEY (`NUMTRATTA`, `ITINERARI_NOME`),
  INDEX `fk_TRATTE_ITINERARI1_idx` (`ITINERARI_NOME` ASC),
  CONSTRAINT `fk_TRATTE_ITINERARI1`
    FOREIGN KEY (`ITINERARI_NOME`)
    REFERENCES `servizioferrovario`.`ITINERARI` (`NOME`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servizioferrovario`.`VIAGGIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `servizioferrovario`.`VIAGGIO` (
  `CODVIAGGIO` VARCHAR(45) NOT NULL,
  `COMPAGNIA_NOME` VARCHAR(20) NOT NULL,
  `TRENO_CODTRENO` VARCHAR(20) NOT NULL,
  `ITINERARI_NOME` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CODVIAGGIO`),
  INDEX `fk_VIAGGIO_COMPAGNIA1_idx` (`COMPAGNIA_NOME` ASC),
  INDEX `fk_VIAGGIO_TRENO1_idx` (`TRENO_CODTRENO` ASC),
  INDEX `fk_VIAGGIO_ITINERARI1_idx` (`ITINERARI_NOME` ASC),
  CONSTRAINT `fk_VIAGGIO_COMPAGNIA1`
    FOREIGN KEY (`COMPAGNIA_NOME`)
    REFERENCES `servizioferrovario`.`COMPAGNIA` (`NOME`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VIAGGIO_TRENO1`
    FOREIGN KEY (`TRENO_CODTRENO`)
    REFERENCES `servizioferrovario`.`TRENO` (`CODTRENO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VIAGGIO_ITINERARI1`
    FOREIGN KEY (`ITINERARI_NOME`)
    REFERENCES `servizioferrovario`.`ITINERARI` (`NOME`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servizioferrovario`.`REGISTRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `servizioferrovario`.`REGISTRO` (
  `idREGISTRO` INT NOT NULL AUTO_INCREMENT,
  `VIAGGIO_CODVIAGGIO` VARCHAR(45) NOT NULL,
  `STAZIONEP` VARCHAR(45) NULL,
  `STAZIONEA` VARCHAR(45) NULL,
  PRIMARY KEY (`idREGISTRO`, `VIAGGIO_CODVIAGGIO`),
  INDEX `fk_REGISTRO_VIAGGIO1_idx` (`VIAGGIO_CODVIAGGIO` ASC),
  CONSTRAINT `fk_REGISTRO_VIAGGIO1`
    FOREIGN KEY (`VIAGGIO_CODVIAGGIO`)
    REFERENCES `servizioferrovario`.`VIAGGIO` (`CODVIAGGIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
