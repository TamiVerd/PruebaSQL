
DROP SCHEMA IF EXISTS `minimarket` ;

CREATE SCHEMA IF NOT EXISTS `minimarket` ;
USE `minimarket` ;

#aqui empiezo a hacer las tablas
CREATE TABLE IF NOT EXISTS `minimarket`.`Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombreProveedor` VARCHAR(45) NOT NULL,
  `contactoProveedor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProveedor`));

CREATE TABLE IF NOT EXISTS `minimarket`.`tipoProducto` (
  `idtipoProducto` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipoProducto`));


CREATE TABLE IF NOT EXISTS `minimarket`.`producto` (
  `idproducto` INT NOT NULL AUTO_INCREMENT,
  `nombreProd` VARCHAR(45) NOT NULL,
  `precioProd` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `stock` INT NOT NULL,
  `idTipoProveedor` INT NOT NULL,
  `idTipoProducto` INT NOT NULL,
  PRIMARY KEY (`idproducto`));


CREATE TABLE IF NOT EXISTS `minimarket`.`cargo` (
  `idcargo` INT NOT NULL AUTO_INCREMENT,
  `nombreCargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcargo`));


CREATE TABLE IF NOT EXISTS `minimarket`.`trabajadores` (
  `idtrabajadores` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `contacto` VARCHAR(45) NOT NULL,
  `cargo_idcargo` INT NOT NULL,
  `idTipocargo` INT NOT NULL,
  PRIMARY KEY (`idtrabajadores`, `cargo_idcargo`));


CREATE TABLE IF NOT EXISTS `minimarket`.`compra` (
  `idcompra` INT NOT NULL AUTO_INCREMENT,
  `fechaCompra` DATETIME NOT NULL,
  `totalCompra` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `idTrabajadores` INT NOT NULL,
  PRIMARY KEY (`idcompra`));


CREATE TABLE IF NOT EXISTS `minimarket`.`sueldos` (
  `idsueldos` INT NOT NULL AUTO_INCREMENT,
  `monto` INT NOT NULL,
  `extras` VARCHAR(45) NOT NULL,
  `idTipotrabajadores` INT NOT NULL,
  `idTipocargo` INT NOT NULL,
  PRIMARY KEY (`idsueldos`));

#genero tipo de productos
INSERT INTO `minimarket`.`tipoProducto` (`idtipoProducto`, `tipo`) VALUES ('1', 'verduras');
INSERT INTO `minimarket`.`tipoProducto` (`idtipoProducto`, `tipo`) VALUES ('2', 'lacteos');
INSERT INTO `minimarket`.`tipoProducto` (`idtipoProducto`, `tipo`) VALUES ('3', 'frutas');
INSERT INTO `minimarket`.`tipoProducto` (`idtipoProducto`, `tipo`) VALUES ('4', 'bebestibles ');
INSERT INTO `minimarket`.`tipoProducto` (`idtipoProducto`, `tipo`) VALUES ('5', 'congelados');
INSERT INTO `minimarket`.`tipoProducto` (`idtipoProducto`, `tipo`) VALUES ('6', 'no perecibles');
INSERT INTO `minimarket`.`tipoProducto` (`idtipoProducto`, `tipo`) VALUES ('7', 'dulces');

#informacion de proveedores
INSERT INTO `minimarket`.`Proveedor` (`idProveedor`, `nombreProveedor`, `contactoProveedor`) VALUES ('1', 'DonVerduras', '+569246873');
INSERT INTO `minimarket`.`Proveedor` (`idProveedor`, `nombreProveedor`, `contactoProveedor`) VALUES ('2', 'abarrot', '+56987364596');
INSERT INTO `minimarket`.`Proveedor` (`idProveedor`, `nombreProveedor`, `contactoProveedor`) VALUES ('3', 'frufrutas', '+56912036478');

#productos con su id, id tipo y id proveedor
INSERT INTO `minimarket`.`producto` (`idproducto`, `nombreProd`, `precioProd`, `marca`, `stock`, `idTipoProveedor`, `idTipoProducto`) VALUES ('1', 'lechugas', '500', 'DonLechugas', '40', '1', '1');
INSERT INTO `minimarket`.`producto` (`idproducto`, `nombreProd`, `precioProd`, `marca`, `stock`, `idTipoProveedor`, `idTipoProducto`) VALUES ('2', 'nuggets', '1500', 'mcanuggett', '20', '2', '5');
INSERT INTO `minimarket`.`producto` (`idproducto`, `nombreProd`, `precioProd`, `marca`, `stock`, `idTipoProveedor`, `idTipoProducto`) VALUES ('3', 'manzana', '700', 'frufrutas', '50', '3', '3');
INSERT INTO `minimarket`.`producto` (`idproducto`, `nombreProd`, `precioProd`, `marca`, `stock`, `idTipoProveedor`, `idTipoProducto`) VALUES ('4', 'lecheCondensada', '1000', 'soprole', '20', '2', '6');
INSERT INTO `minimarket`.`producto` (`idproducto`, `nombreProd`, `precioProd`, `marca`, `stock`, `idTipoProveedor`, `idTipoProducto`) VALUES ('5', 'kiwi', '800', 'frufrutas', '70', '3', '3');


#otros 
INSERT INTO `minimarket`.`cargo` (`idcargo`, `nombreCargo`) VALUES ('1', 'vendedor/a');
INSERT INTO `minimarket`.`trabajadores` (`idtrabajadores`, `nombre`, `contacto`, `cargo_idcargo`, `idTipocargo`) VALUES ('1', 'Sofia', '+56988412306', '1', '1');

#compras con su id, id producto, trabajador y cargo del trabajador
INSERT INTO `minimarket`.`compra` (`fechaCompra`, `totalCompra`, `idTipoproducto`, `idtrabajadores`, `idTipocargo`) VALUES ('2022-11-11', '1000', '1', '1', '1');
INSERT INTO `minimarket`.`compra` (`fechaCompra`, `totalCompra`, `idTipoproducto`, `idtrabajadores`, `idTipocargo`) VALUES ('2022-11-12 09:12:00', '1500', '2', '1', '1');


#para sacar la suma de las ventas anuales
SELECT SUM(totalCompra)
FROM minimarket.compra
WHERE fechaCompra = date_format(YYYY) ;

#para consultar que productos estan en que tipo(categoria)
SELECT tipoProducto.tipo, producto.nombreProd
FROM minimarket.tipoproducto
INNER JOIN minimarket.tipoproducto.tipo on minimarket.producto.nombreProd = minimarket.tipo.nombreProd;




select * from producto 