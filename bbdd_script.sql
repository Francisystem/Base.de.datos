-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema francisco
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema francisco
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `francisco` DEFAULT CHARACTER SET utf8 ;
USE `francisco` ;

-- -----------------------------------------------------
-- Table `francisco`.`tipo_de_trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `francisco`.`tipo_de_trabajo` (
  `id` INT NOT NULL,
  `part_time` TINYINT NULL,
  `full_time` TINYINT NULL,
  `freelance` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `francisco`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `francisco`.`usuario` (
  `id` INT NOT NULL,
  `user_name` VARCHAR(45) NULL,
  `user_email` VARCHAR(45) NULL,
  `user_password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `francisco`.`propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `francisco`.`propietario` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `fecha_nacimiento` VARCHAR(45) NULL,
  `correo_electronico` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`, `usuario_id`),
  INDEX `fk_francisco_ludueña_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_francisco_ludueña_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `francisco`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `francisco`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `francisco`.`experiencia_laboral` (
  `id` INT NOT NULL,
  `nombre_empresa` VARCHAR(45) NULL,
  `fecha_inicio` VARCHAR(45) NULL,
  `fecha_fin` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `es_trabajo_actual` TINYINT NULL,
  `tipo_de_trabajo_id` INT NOT NULL,
  `propietario_id` INT NOT NULL,
  PRIMARY KEY (`id`, `tipo_de_trabajo_id`, `propietario_id`),
  INDEX `fk_experiencia_laboral_tipo_de_trabajo_idx` (`tipo_de_trabajo_id` ASC) VISIBLE,
  INDEX `fk_experiencia_laboral_francisco_ludueña1_idx` (`propietario_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_laboral_tipo_de_trabajo`
    FOREIGN KEY (`tipo_de_trabajo_id`)
    REFERENCES `francisco`.`tipo_de_trabajo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_laboral_francisco_ludueña1`
    FOREIGN KEY (`propietario_id`)
    REFERENCES `francisco`.`propietario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `francisco`.`tecnologias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `francisco`.`tecnologias` (
  `id` INT NOT NULL,
  `propietario_id` INT NOT NULL,
  `nombre_tecnologia` VARCHAR(45) NULL,
  `tipo_tecnologia` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `propietario_id`),
  INDEX `fk_tecnologias_francisco_ludueña1_idx` (`propietario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tecnologias_francisco_ludueña1`
    FOREIGN KEY (`propietario_id`)
    REFERENCES `francisco`.`propietario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `francisco`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `francisco`.`proyectos` (
  `id` INT NOT NULL,
  `descripcion_proyecto` VARCHAR(45) NULL,
  `propietario_id` INT NOT NULL,
  `propietario_id` INT NOT NULL,
  PRIMARY KEY (`id`, `propietario_id`, `propietario_id`),
  INDEX `fk_proyectos_francisco_ludueña1_idx` (`propietario_id` ASC, `propietario_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyectos_francisco_ludueña1`
    FOREIGN KEY (`propietario_id` , `propietario_id`)
    REFERENCES `francisco`.`propietario` (`id` , `usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `francisco`.`habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `francisco`.`habilidades` (
  `id` INT NOT NULL,
  `comunicacion` VARCHAR(45) NULL,
  `flexibilidad` VARCHAR(45) NULL,
  `propietario_id` INT NOT NULL,
  `propietario_usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`, `propietario_id`, `propietario_usuario_id`),
  INDEX `fk_habilidades_propietario1_idx` (`propietario_id` ASC, `propietario_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_habilidades_propietario1`
    FOREIGN KEY (`propietario_id` , `propietario_usuario_id`)
    REFERENCES `francisco`.`propietario` (`id` , `usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `francisco`.`tipo_tecnologia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `francisco`.`tipo_tecnologia` (
  `id` INT NOT NULL,
  `front_end` VARCHAR(45) NULL,
  `back_end` VARCHAR(45) NULL,
  `bbdd` VARCHAR(45) NULL,
  `tecnologias_id` INT NOT NULL,
  `tecnologias_propietario_id` INT NOT NULL,
  PRIMARY KEY (`id`, `tecnologias_id`, `tecnologias_propietario_id`),
  INDEX `fk_tipo_tecnologia_tecnologias1_idx` (`tecnologias_id` ASC, `tecnologias_propietario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tipo_tecnologia_tecnologias1`
    FOREIGN KEY (`tecnologias_id` , `tecnologias_propietario_id`)
    REFERENCES `francisco`.`tecnologias` (`id` , `propietario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
