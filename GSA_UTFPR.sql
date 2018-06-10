-- MySQL Workbench Synchronization
-- Generated: 2018-06-10 00:07
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: thais

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `GSA_UTFPR` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`cursos` (
  `sigla` VARCHAR(5) NOT NULL,
  `Nome` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`sigla`),
  UNIQUE INDEX `sigla_UNIQUE` (`sigla` ASC),
  UNIQUE INDEX `Nome_UNIQUE` (`Nome` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`pessoas` (
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(500) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `resgistro` VARCHAR(10) NULL DEFAULT NULL,
  `observacao` VARCHAR(500) NULL DEFAULT NULL,
  `cursos_sigla` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC),
  INDEX `fk_pessoas_cursos1_idx` (`cursos_sigla` ASC),
  CONSTRAINT `fk_pessoas_cursos1`
    FOREIGN KEY (`cursos_sigla`)
    REFERENCES `GSA_UTFPR`.`cursos` (`sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`organizadores` (
  `id` INT(11) NOT NULL,
  `funcao` VARCHAR(500) NULL DEFAULT NULL,
  `pessoas_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_organizadores_pessoas1_idx` (`pessoas_cpf` ASC),
  CONSTRAINT `fk_organizadores_pessoas1`
    FOREIGN KEY (`pessoas_cpf`)
    REFERENCES `GSA_UTFPR`.`pessoas` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`ministrantes` (
  `id` INT(11) NOT NULL,
  `pessoas_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_ministrantes_pessoas1_idx` (`pessoas_cpf` ASC),
  CONSTRAINT `fk_ministrantes_pessoas1`
    FOREIGN KEY (`pessoas_cpf`)
    REFERENCES `GSA_UTFPR`.`pessoas` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`eventos` (
  `sigla` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(500) NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_fim` DATE NOT NULL,
  `cursos_sigla` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`sigla`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC),
  UNIQUE INDEX `sigla_UNIQUE` (`sigla` ASC),
  INDEX `fk_eventos_cursos1_idx` (`cursos_sigla` ASC),
  CONSTRAINT `fk_eventos_cursos1`
    FOREIGN KEY (`cursos_sigla`)
    REFERENCES `GSA_UTFPR`.`cursos` (`sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`atividades` (
  `id` INT(11) NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `horas` FLOAT(11) NOT NULL,
  `horario` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`atividades_has_ministrantes` (
  `atividades_id` INT(11) NOT NULL,
  `ministrantes_id` INT(11) NOT NULL,
  `eventos_sigla` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`atividades_id`, `ministrantes_id`, `eventos_sigla`),
  INDEX `fk_atividades_has_ministrantes_ministrantes1_idx` (`ministrantes_id` ASC),
  INDEX `fk_atividades_has_ministrantes_atividades1_idx` (`atividades_id` ASC),
  INDEX `fk_atividades_has_ministrantes_eventos1_idx` (`eventos_sigla` ASC),
  CONSTRAINT `fk_atividades_has_ministrantes_atividades1`
    FOREIGN KEY (`atividades_id`)
    REFERENCES `GSA_UTFPR`.`atividades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividades_has_ministrantes_ministrantes1`
    FOREIGN KEY (`ministrantes_id`)
    REFERENCES `GSA_UTFPR`.`ministrantes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividades_has_ministrantes_eventos1`
    FOREIGN KEY (`eventos_sigla`)
    REFERENCES `GSA_UTFPR`.`eventos` (`sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`palestras` (
  `titulo` VARCHAR(500) NOT NULL,
  `id` INT(11) NOT NULL,
  `atividades_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `atividades_id`),
  INDEX `fk_palestras_atividades1_idx` (`atividades_id` ASC),
  CONSTRAINT `fk_palestras_atividades1`
    FOREIGN KEY (`atividades_id`)
    REFERENCES `GSA_UTFPR`.`atividades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`minicursos` (
  `tema` VARCHAR(500) NOT NULL,
  `id` INT(11) NOT NULL,
  `atividades_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `atividades_id`),
  INDEX `fk_minicursos_atividades1_idx` (`atividades_id` ASC),
  CONSTRAINT `fk_minicursos_atividades1`
    FOREIGN KEY (`atividades_id`)
    REFERENCES `GSA_UTFPR`.`atividades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`lista_presenca` (
  `atividades_id` INT(11) NOT NULL,
  `pessoas_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`atividades_id`, `pessoas_cpf`),
  INDEX `fk_atividades_has_pessoas_pessoas1_idx` (`pessoas_cpf` ASC),
  INDEX `fk_atividades_has_pessoas_atividades1_idx` (`atividades_id` ASC),
  CONSTRAINT `fk_atividades_has_pessoas_atividades1`
    FOREIGN KEY (`atividades_id`)
    REFERENCES `GSA_UTFPR`.`atividades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividades_has_pessoas_pessoas1`
    FOREIGN KEY (`pessoas_cpf`)
    REFERENCES `GSA_UTFPR`.`pessoas` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
