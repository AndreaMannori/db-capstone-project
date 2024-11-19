-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`costumers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`costumers` (
  `idcostumers` INT NOT NULL AUTO_INCREMENT,
  `fullname` VARCHAR(255) NULL,
  PRIMARY KEY (`idcostumers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Bookings` (
  `idBookings` INT NOT NULL AUTO_INCREMENT,
  `reserv_date` DATETIME NULL,
  `idcostumers` INT NOT NULL,
  `costumers_idcostumers` INT NOT NULL,
  PRIMARY KEY (`idBookings`),
  UNIQUE INDEX `reserv_date_UNIQUE` (`reserv_date` ASC) VISIBLE,
  INDEX `fk_Bookings_costumers1_idx` (`costumers_idcostumers` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_costumers1`
    FOREIGN KEY (`costumers_idcostumers`)
    REFERENCES `LittleLemonDM`.`costumers` (`idcostumers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders` (
  `idOrders` INT NOT NULL AUTO_INCREMENT,
  `idmenu` INT NULL,
  `costumers_idcostumers` INT NOT NULL,
  PRIMARY KEY (`idOrders`),
  INDEX `fk_Orders_costumers1_idx` (`costumers_idcostumers` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_costumers1`
    FOREIGN KEY (`costumers_idcostumers`)
    REFERENCES `LittleLemonDM`.`costumers` (`idcostumers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`delivery` (
  `iddelivery` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NULL,
  `idcostumers` INT NULL,
  `country` VARCHAR(100) NULL,
  `contrycode` VARCHAR(5) NULL,
  `city` VARCHAR(100) NULL,
  `Orders_idOrders` INT NOT NULL,
  PRIMARY KEY (`iddelivery`),
  INDEX `fk_delivery_Orders1_idx` (`Orders_idOrders` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_Orders1`
    FOREIGN KEY (`Orders_idOrders`)
    REFERENCES `LittleLemonDM`.`Orders` (`idOrders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`menu` (
  `idmenu` INT NOT NULL AUTO_INCREMENT,
  `idmenuitems` INT NULL,
  `Orders_idOrders` INT NOT NULL,
  PRIMARY KEY (`idmenu`),
  INDEX `fk_menu_Orders1_idx` (`Orders_idOrders` ASC) VISIBLE,
  CONSTRAINT `fk_menu_Orders1`
    FOREIGN KEY (`Orders_idOrders`)
    REFERENCES `LittleLemonDM`.`Orders` (`idOrders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`menuitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`menuitem` (
  `idmenuitem` INT NOT NULL AUTO_INCREMENT,
  `cousine` VARCHAR(8) NULL,
  `course` VARCHAR(45) NULL,
  `starter` VARCHAR(45) NULL,
  `desert` VARCHAR(45) NULL,
  `drink` VARCHAR(45) NULL,
  `side` VARCHAR(45) NULL,
  `cost` DECIMAL(6,4) NOT NULL,
  `menu_idmenu` INT NOT NULL,
  PRIMARY KEY (`idmenuitem`),
  INDEX `fk_menuitem_menu1_idx` (`menu_idmenu` ASC) VISIBLE,
  CONSTRAINT `fk_menuitem_menu1`
    FOREIGN KEY (`menu_idmenu`)
    REFERENCES `LittleLemonDM`.`menu` (`idmenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Staff` (
  `idStaff` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idStaff`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
