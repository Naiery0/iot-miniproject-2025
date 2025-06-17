-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema miniproject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema miniproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `miniproject` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `miniproject` ;

-- -----------------------------------------------------
-- Table `miniproject`.`settings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniproject`.`settings` (
  `basicCode` CHAR(8) NOT NULL,
  `codeName` VARCHAR(100) NOT NULL,
  `codeDesc` LONGTEXT NULL,
  `regDt` DATETIME NULL,
  `modDt` DATETIME NULL,
  PRIMARY KEY (`basicCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniproject`.`schedules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniproject`.`schedules` (
  `schIdx` INT NOT NULL AUTO_INCREMENT COMMENT '공정계획 순번(자동증가)',
  `plantCode` CHAR(8) NOT NULL COMMENT '공장코드\n',
  `schDate` DATE NOT NULL COMMENT '공정계획일',
  `loadTime` INT NOT NULL COMMENT '로드타임(초)',
  `schStartTime` TIME NULL COMMENT '공정 시작시간\n',
  `schEndTime` TIME NULL,
  `schFacilityId` CHAR(8) NULL,
  `schAmount` INT NOT NULL,
  `regDt` DATETIME NULL,
  `modDt` DATETIME NULL,
  PRIMARY KEY (`schIdx`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniproject`.`processes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniproject`.`processes` (
  `prcIdx` INT NOT NULL AUTO_INCREMENT,
  `schIdx` INT NOT NULL,
  `prcCd` CHAR(14) NOT NULL,
  `prcDate` DATE NOT NULL,
  `preLoadTime` INT NOT NULL,
  `prcStartTime` TIME NULL,
  `prcEndTime` TIME NULL,
  `prcFacilityId` CHAR(8) NULL,
  `prcResult` TINYINT NULL,
  `regDt` DATETIME NULL,
  `modDt` DATETIME NULL,
  PRIMARY KEY (`prcIdx`),
  UNIQUE INDEX `prcCd_UNIQUE` (`prcCd` ASC) VISIBLE,
  INDEX `fk_processes_schedules_idx` (`schIdx` ASC) VISIBLE,
  CONSTRAINT `fk_processes_schedules`
    FOREIGN KEY (`schIdx`)
    REFERENCES `miniproject`.`schedules` (`schIdx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
