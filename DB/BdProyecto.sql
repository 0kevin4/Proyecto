-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema inventory
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema inventory
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inventory` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
USE `inventory` ;

-- -----------------------------------------------------
-- Table `inventory`.`aspnetroles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`aspnetroles` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`aspnetusers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`aspnetusers` (
  `Id` VARCHAR(45) NOT NULL,
  `NormalizedUserName` VARCHAR(225) NOT NULL,
  `UserName` VARCHAR(225) NOT NULL,
  `PhoneNumber` VARCHAR(100) NULL DEFAULT NULL,
  `Email` VARCHAR(225) NOT NULL,
  `EmailConfirmed` TINYINT NULL DEFAULT NULL,
  `PasswordHash` VARCHAR(225) NOT NULL,
  `ConcurrencyStamp` VARCHAR(225) NOT NULL,
  `SecurityStamp` VARCHAR(425) NULL DEFAULT NULL,
  `AccessFailedCount` INT NOT NULL,
  `LockoutEnabled` TINYINT NULL DEFAULT NULL,
  `LockoutEnd` VARCHAR(225) NULL DEFAULT NULL,
  `NormalizedEmail` VARCHAR(225) NULL DEFAULT NULL,
  `PhoneNumberConfirmed` TINYINT NULL DEFAULT NULL,
  `TwoFactorEnabled` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`aspnetuserclaims`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`aspnetuserclaims` (
  `Id` INT NOT NULL,
  `claimtype` VARCHAR(45) NOT NULL,
  `claimvalue` VARCHAR(45) NOT NULL,
  `aspnetuserId` INT NOT NULL,
  `UserId` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `s_idx` (`UserId` ) ,
  CONSTRAINT `Claims_User`
    FOREIGN KEY (`UserId`)
    REFERENCES `inventory`.`aspnetusers` (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`aspnetuserlogins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`aspnetuserlogins` (
  `Id` INT NOT NULL,
  `loginprovider` VARCHAR(45) NOT NULL,
  `providerkey` VARCHAR(45) NOT NULL,
  `UserId` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `aspnetuserlogin_aspnetuser_fk` (`UserId` ) ,
  CONSTRAINT `aspnetuserlogin_aspnetuser_fk`
    FOREIGN KEY (`UserId`)
    REFERENCES `inventory`.`aspnetusers` (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`aspnetuserroles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`aspnetuserroles` (
  `UserId` VARCHAR(45) NOT NULL,
  `RoleId` INT NOT NULL,
  `Id` INT NOT NULL,
  PRIMARY KEY (`UserId`, `RoleId`, `Id`),
  INDEX `aspnetuserroles_ibfk_2` (`RoleId` ) ,
  CONSTRAINT `aspnetuserroles_ibfk_1`
    FOREIGN KEY (`UserId`)
    REFERENCES `inventory`.`aspnetusers` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `aspnetuserroles_ibfk_2`
    FOREIGN KEY (`RoleId`)
    REFERENCES `inventory`.`aspnetroles` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`categoria` (
  `categoriaId` INT NOT NULL AUTO_INCREMENT,
  `estado` TINYINT(1) NOT NULL,
  `nombre` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`categoriaId`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`ciudad` (
  `ciudadId` INT NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ciudadId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`pedido` (
  `pedidoId` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `nombre` VARCHAR(64) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`pedidoId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`marca` (
  `marcaId` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`marcaId`))
ENGINE = InnoDB
AUTO_INCREMENT = 102
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`subcategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`subcategoria` (
  `subcategoriaId` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `categoria_categoriaid` INT NOT NULL,
  PRIMARY KEY (`subcategoriaId`, `categoria_categoriaid`),
  INDEX `subcategoria_categoria_fk` (`categoria_categoriaid` ) ,
  CONSTRAINT `subcategoria_categoria_fk`
    FOREIGN KEY (`categoria_categoriaid`)
    REFERENCES `inventory`.`categoria` (`categoriaId`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 57
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`producto` (
  `productoId` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(75) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `subcategoria_subcategoriaid` INT NOT NULL,
  `marca_marcaid` INT NOT NULL,
  PRIMARY KEY (`productoId`, `subcategoria_subcategoriaid`, `marca_marcaid`),
  INDEX `producto_marca_fk` (`marca_marcaid` ) ,
  INDEX `producto_subcategoria_fk` (`subcategoria_subcategoriaid` ) ,
  CONSTRAINT `producto_marca_fk`
    FOREIGN KEY (`marca_marcaid`)
    REFERENCES `inventory`.`marca` (`marcaId`)
    ON UPDATE CASCADE,
  CONSTRAINT `producto_subcategoria_fk`
    FOREIGN KEY (`subcategoria_subcategoriaid`)
    REFERENCES `inventory`.`subcategoria` (`subcategoriaId`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 83
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`detallepedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`detallepedido` (
  `detallepedidoId` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precioUnitario` DECIMAL(10,0) NOT NULL,
  `producto_productoid` INT NOT NULL,
  `pedido_pedidoid` INT NOT NULL,
  PRIMARY KEY (`detallepedidoId`, `producto_productoid`, `pedido_pedidoid`),
  INDEX `detallepedido_pedido_fk` (`pedido_pedidoid` ) ,
  INDEX `detallepedido_prducto_fk` (`producto_productoid` ) ,
  CONSTRAINT `detallepedido_pedido_fk`
    FOREIGN KEY (`pedido_pedidoid`)
    REFERENCES `inventory`.`pedido` (`pedidoId`),
  CONSTRAINT `detallepedido_prducto_fk`
    FOREIGN KEY (`producto_productoid`)
    REFERENCES `inventory`.`producto` (`productoId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`imagenproducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`imagenproducto` (
  `imagenproductoId` INT NOT NULL,
  `foto` VARCHAR(25) NULL DEFAULT NULL,
  `estado` TINYINT(1) NOT NULL,
  `producto_productoid` INT NOT NULL,
  PRIMARY KEY (`imagenproductoId`, `producto_productoid`),
  INDEX `IMAGENPRODUCTO_PRODUCTO_FK` (`producto_productoid` ) ,
  CONSTRAINT `IMAGENPRODUCTO_PRODUCTO_FK`
    FOREIGN KEY (`producto_productoid`)
    REFERENCES `inventory`.`producto` (`productoId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`lugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`lugar` (
  `lugarId` INT NOT NULL,
  `fechaingreso` DATE NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `ciudad_ciudadid` INT NOT NULL,
  PRIMARY KEY (`lugarId`, `ciudad_ciudadid`),
  INDEX `lugar_ciudad_fk` (`ciudad_ciudadid` ) ,
  CONSTRAINT `lugar_ciudad_fk`
    FOREIGN KEY (`ciudad_ciudadid`)
    REFERENCES `inventory`.`ciudad` (`ciudadId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`precio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`precio` (
  `precioId` INT NOT NULL AUTO_INCREMENT,
  `fechaIngreso` DATE NOT NULL,
  `precioCompra` DECIMAL(10,0) NOT NULL,
  `descuento` DECIMAL(10,0) NOT NULL,
  `precioVentaInicial` DECIMAL(10,0) NOT NULL,
  `precioVentaFinal` DECIMAL(10,0) NOT NULL,
  `producto_productoid` INT NOT NULL,
  PRIMARY KEY (`precioId`, `producto_productoid`))
ENGINE = InnoDB
AUTO_INCREMENT = 87
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`stock` (
  `stockId` INT NOT NULL,
  `fechaingresostock` DATE NOT NULL,
  `cantidadstockideal` INT NOT NULL,
  `cantidadstockalarma` INT NOT NULL,
  `cantidadstockreal` INT NOT NULL,
  `producto_productoid` INT NOT NULL,
  `lugar_lugarId` INT NOT NULL,
  PRIMARY KEY (`stockId`),
  INDEX `stock_lugar_fk` (`lugar_lugarId` ) ,
  INDEX `stock_producto_fk` (`producto_productoid` ) ,
  CONSTRAINT `stock_lugar_fk`
    FOREIGN KEY (`lugar_lugarId`)
    REFERENCES `inventory`.`lugar` (`lugarId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `stock_producto_fk`
    FOREIGN KEY (`producto_productoid`)
    REFERENCES `inventory`.`producto` (`productoId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`sueldo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`sueldo` (
  `sueldoId` INT NOT NULL,
  `fechacontrato` DATE NOT NULL,
  `fechafinalizacion` DATE NOT NULL,
  `sueldomensual` DECIMAL(10,0) NOT NULL,
  `objetocontrato` VARCHAR(45) NOT NULL,
  `salariototal` DECIMAL(10,0) NOT NULL,
  `estado` INT NOT NULL,
  `empleado_aspnetuser_aspnetuser_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sueldoId`),
  INDEX `sueldo_aspnetuser_fk` (`empleado_aspnetuser_aspnetuser_id` ) ,
  CONSTRAINT `sueldo_aspnetuser_fk`
    FOREIGN KEY (`empleado_aspnetuser_aspnetuser_id`)
    REFERENCES `inventory`.`aspnetusers` (`Id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`tiposdepago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`tiposdepago` (
  `tiposdepagoId` INT NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `pedido_pedidoid` INT NOT NULL,
  PRIMARY KEY (`tiposdepagoId`, `pedido_pedidoid`),
  INDEX `tiposdepago_pedido_fk` (`pedido_pedidoid` ) ,
  CONSTRAINT `tiposdepago_pedido_fk`
    FOREIGN KEY (`pedido_pedidoid`)
    REFERENCES `inventory`.`pedido` (`pedidoId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`tiposdetransaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`tiposdetransaccion` (
  `tipotransaccionId` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tipotransaccionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`transaccion` (
  `transaccionId` INT NOT NULL,
  `cantidadproducto` TINYINT(1) NOT NULL,
  `fechatransaccion` DATE NOT NULL,
  `otrosdetalles` VARCHAR(25) NULL DEFAULT NULL,
  `producto_productoid` INT NOT NULL,
  `tiposdetransaccion_tipotransaccionid` INT NOT NULL,
  PRIMARY KEY (`transaccionId`, `producto_productoid`, `tiposdetransaccion_tipotransaccionid`),
  INDEX `transaccion_producto_fk` (`producto_productoid` ) ,
  INDEX `transaccion_tiposdetransacción_fk` (`tiposdetransaccion_tipotransaccionid` ) ,
  CONSTRAINT `transaccion_producto_fk`
    FOREIGN KEY (`producto_productoid`)
    REFERENCES `inventory`.`producto` (`productoId`),
  CONSTRAINT `transaccion_tiposdetransacción_fk`
    FOREIGN KEY (`tiposdetransaccion_tipotransaccionid`)
    REFERENCES `inventory`.`tiposdetransaccion` (`tipotransaccionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`turno` (
  `turnoId` INT NOT NULL,
  `fechaturno` DATE NOT NULL,
  `horaingreso` DATE NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `aspnetuserid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`turnoId`),
  INDEX `turno_aspnetuser_fk` (`aspnetuserid` ) ,
  CONSTRAINT `turno_aspnetuser_fk`
    FOREIGN KEY (`aspnetuserid`)
    REFERENCES `inventory`.`aspnetusers` (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


-- -----------------------------------------------------
-- Table `inventory`.`unidadmedida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventory`.`unidadmedida` (
  `unidadmedidaId` INT NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `producto_productoid` INT NOT NULL,
  PRIMARY KEY (`unidadmedidaId`, `producto_productoid`),
  INDEX `unidadmedida_producto_fk` (`producto_productoid` ) ,
  CONSTRAINT `unidadmedida_producto_fk`
    FOREIGN KEY (`producto_productoid`)
    REFERENCES `inventory`.`producto` (`productoId`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
