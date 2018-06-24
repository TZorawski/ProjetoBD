-- MySQL Workbench Synchronization
-- Generated: 2018-06-23 18:07
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
  `registro` VARCHAR(10) NULL DEFAULT NULL,
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
  `pessoas_cpf` VARCHAR(11) NOT NULL,
  `eventos_sigla` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`eventos_sigla`, `pessoas_cpf`),
  INDEX `fk_organizadores_pessoas1_idx` (`pessoas_cpf` ASC),
  INDEX `fk_organizadores_eventos1_idx` (`eventos_sigla` ASC),
  CONSTRAINT `fk_organizadores_pessoas1`
    FOREIGN KEY (`pessoas_cpf`)
    REFERENCES `GSA_UTFPR`.`pessoas` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organizadores_eventos1`
    FOREIGN KEY (`eventos_sigla`)
    REFERENCES `GSA_UTFPR`.`eventos` (`sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`ministrantes` (
  `pessoas_cpf` VARCHAR(11) NOT NULL,
  `atividades_sigla` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`pessoas_cpf`, `atividades_sigla`),
  INDEX `fk_ministrantes_pessoas1_idx` (`pessoas_cpf` ASC),
  UNIQUE INDEX `pessoas_cpf_UNIQUE` (`pessoas_cpf` ASC),
  INDEX `fk_ministrantes_atividades1_idx` (`atividades_sigla` ASC),
  CONSTRAINT `fk_ministrantes_pessoas1`
    FOREIGN KEY (`pessoas_cpf`)
    REFERENCES `GSA_UTFPR`.`pessoas` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ministrantes_atividades1`
    FOREIGN KEY (`atividades_sigla`)
    REFERENCES `GSA_UTFPR`.`atividades` (`sigla`)
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
  `sigla` VARCHAR(5) NOT NULL,
  `horas` FLOAT(11) NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `categoria_sigla` VARCHAR(5) NOT NULL,
  `eventos_sigla` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`sigla`),
  UNIQUE INDEX `id_UNIQUE` (`sigla` ASC),
  INDEX `fk_atividades_categoria1_idx` (`categoria_sigla` ASC),
  INDEX `fk_atividades_eventos1_idx` (`eventos_sigla` ASC),
  CONSTRAINT `fk_atividades_categoria1`
    FOREIGN KEY (`categoria_sigla`)
    REFERENCES `GSA_UTFPR`.`categoria` (`sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividades_eventos1`
    FOREIGN KEY (`eventos_sigla`)
    REFERENCES `GSA_UTFPR`.`eventos` (`sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`participante` (
  `pessoas_cpf` VARCHAR(11) NOT NULL,
  `eventos_sigla` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`pessoas_cpf`, `eventos_sigla`),
  INDEX `fk_participante_pessoas1_idx` (`pessoas_cpf` ASC),
  INDEX `fk_participante_eventos1_idx` (`eventos_sigla` ASC),
  CONSTRAINT `fk_participante_pessoas1`
    FOREIGN KEY (`pessoas_cpf`)
    REFERENCES `GSA_UTFPR`.`pessoas` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_participante_eventos1`
    FOREIGN KEY (`eventos_sigla`)
    REFERENCES `GSA_UTFPR`.`eventos` (`sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`funcoes` (
  `sigla` VARCHAR(5) NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(800) NULL DEFAULT NULL,
  PRIMARY KEY (`sigla`),
  UNIQUE INDEX `id_UNIQUE` (`sigla` ASC),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`organizadores_has_funcoes` (
  `organizadores_eventos_sigla` VARCHAR(20) NOT NULL,
  `organizadores_pessoas_cpf` VARCHAR(11) NOT NULL,
  `funcoes_sigla` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`organizadores_eventos_sigla`, `organizadores_pessoas_cpf`, `funcoes_sigla`),
  INDEX `fk_organizadores_has_funcoes_organizadores1_idx` (`organizadores_eventos_sigla` ASC, `organizadores_pessoas_cpf` ASC),
  INDEX `fk_organizadores_has_funcoes_funcoes1_idx` (`funcoes_sigla` ASC),
  CONSTRAINT `fk_organizadores_has_funcoes_organizadores1`
    FOREIGN KEY (`organizadores_eventos_sigla` , `organizadores_pessoas_cpf`)
    REFERENCES `GSA_UTFPR`.`organizadores` (`eventos_sigla` , `pessoas_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organizadores_has_funcoes_funcoes1`
    FOREIGN KEY (`funcoes_sigla`)
    REFERENCES `GSA_UTFPR`.`funcoes` (`sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`inscrito_atividade` (
  `participante_pessoas_cpf` VARCHAR(11) NOT NULL,
  `participante_eventos_sigla` VARCHAR(20) NOT NULL,
  `atividades_sigla` VARCHAR(5) NOT NULL,
  `presenca` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`participante_pessoas_cpf`, `participante_eventos_sigla`, `atividades_sigla`),
  INDEX `fk_atividades_has_participante_participante1_idx` (`participante_pessoas_cpf` ASC, `participante_eventos_sigla` ASC),
  INDEX `fk_inscrito_atividade_atividades1_idx` (`atividades_sigla` ASC),
  CONSTRAINT `fk_atividades_has_participante_participante1`
    FOREIGN KEY (`participante_pessoas_cpf` , `participante_eventos_sigla`)
    REFERENCES `GSA_UTFPR`.`participante` (`pessoas_cpf` , `eventos_sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscrito_atividade_atividades1`
    FOREIGN KEY (`atividades_sigla`)
    REFERENCES `GSA_UTFPR`.`atividades` (`sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`categoria` (
  `sigla` VARCHAR(5) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`sigla`),
  UNIQUE INDEX `id_UNIQUE` (`sigla` ASC),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GSA_UTFPR`.`horario` (
  `horario_inicio` TIME NOT NULL,
  `horario_fim` TIME NOT NULL,
  `atividades_sigla` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`horario_inicio`, `horario_fim`, `atividades_sigla`),
  INDEX `fk_horario_atividades1_idx` (`atividades_sigla` ASC),
  CONSTRAINT `fk_horario_atividades1`
    FOREIGN KEY (`atividades_sigla`)
    REFERENCES `GSA_UTFPR`.`atividades` (`sigla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
