-- MySQL Workbench Synchronization
-- Generated: 2018-06-11 20:32
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: thais

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `gsa_utfpr`.`pessoas`
ADD INDEX `fk_pessoas_cursos1_idx` (`cursos_sigla` ASC),
DROP INDEX `fk_pessoas_cursos1_idx` ;

ALTER TABLE `gsa_utfpr`.`organizadores`
ADD INDEX `fk_organizadores_pessoas1_idx` (`pessoas_cpf` ASC),
DROP INDEX `fk_organizadores_pessoas1_idx` ;

ALTER TABLE `gsa_utfpr`.`ministrantes`
ADD INDEX `fk_ministrantes_pessoas1_idx` (`pessoas_cpf` ASC),
DROP INDEX `fk_ministrantes_pessoas1_idx` ;

ALTER TABLE `gsa_utfpr`.`eventos`
ADD INDEX `fk_eventos_cursos1_idx` (`cursos_sigla` ASC),
DROP INDEX `fk_eventos_cursos1_idx` ;

ALTER TABLE `gsa_utfpr`.`atividades_has_ministrantes`
ADD INDEX `fk_atividades_has_ministrantes_ministrantes1_idx` (`ministrantes_id` ASC),
ADD INDEX `fk_atividades_has_ministrantes_atividades1_idx` (`atividades_id` ASC),
ADD INDEX `fk_atividades_has_ministrantes_eventos1_idx` (`eventos_sigla` ASC),
DROP INDEX `fk_atividades_has_ministrantes_eventos1_idx` ,
DROP INDEX `fk_atividades_has_ministrantes_atividades1_idx` ,
DROP INDEX `fk_atividades_has_ministrantes_ministrantes1_idx` ;

ALTER TABLE `gsa_utfpr`.`palestras`
ADD INDEX `fk_palestras_atividades1_idx` (`atividades_id` ASC),
DROP INDEX `fk_palestras_atividades1_idx` ;

ALTER TABLE `gsa_utfpr`.`minicursos`
ADD INDEX `fk_minicursos_atividades1_idx` (`atividades_id` ASC),
DROP INDEX `fk_minicursos_atividades1_idx` ;

CREATE TABLE IF NOT EXISTS `gsa_utfpr`.`lista_presenca` (
  `atividades_id` INT(11) NOT NULL,
  `pessoas_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`atividades_id`, `pessoas_cpf`),
  INDEX `fk_atividades_has_pessoas_pessoas1_idx` (`pessoas_cpf` ASC),
  INDEX `fk_atividades_has_pessoas_atividades1_idx` (`atividades_id` ASC),
  CONSTRAINT `fk_atividades_has_pessoas_atividades1`
    FOREIGN KEY (`atividades_id`)
    REFERENCES `gsa_utfpr`.`atividades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividades_has_pessoas_pessoas1`
    FOREIGN KEY (`pessoas_cpf`)
    REFERENCES `gsa_utfpr`.`pessoas` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `gsa_utfpr`.`participante` (
  `id` INT(11) NOT NULL,
  `pessoas_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_participante_pessoas1_idx` (`pessoas_cpf` ASC),
  CONSTRAINT `fk_participante_pessoas1`
    FOREIGN KEY (`pessoas_cpf`)
    REFERENCES `gsa_utfpr`.`pessoas` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `gsa_utfpr`.`lista_presenca` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
