-- MySQL Script generated by MySQL Workbench
-- Fri Jul 14 12:28:01 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `ManufacturingDB`;
CREATE DATABASE IF NOT EXISTS `ManufacturingDB`;
USE `ManufacturingDB`;
-- -----------------------------------------------------
-- Table `Supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Supplier` ;

CREATE TABLE IF NOT EXISTS `Supplier` (
  `supplier_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `certification` VARCHAR(45) NOT NULL DEFAULT 'not null',
  PRIMARY KEY (`supplier_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Contract` ;

CREATE TABLE IF NOT EXISTS `Contract` (
  `contract_id` TINYINT NOT NULL AUTO_INCREMENT,
  `start_date` TIMESTAMP NOT NULL,
  `end_date` TIMESTAMP NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`contract_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Manufacturer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Manufacturer` ;

CREATE TABLE IF NOT EXISTS `Manufacturer` (
  `manufacturer_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `production_capability` INT NOT NULL,
  PRIMARY KEY (`manufacturer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Product` ;

CREATE TABLE IF NOT EXISTS `Product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` MEDIUMTEXT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quality_standards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quality_standards` ;

CREATE TABLE IF NOT EXISTS `quality_standards` (
  `quality_standard_id` TINYINT NOT NULL AUTO_INCREMENT,
  `description` MEDIUMTEXT NULL,
  `criteria` INT NOT NULL,
  PRIMARY KEY (`quality_standard_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Raw_material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Raw_material` ;

CREATE TABLE IF NOT EXISTS `Raw_material` (
  `Raw_material_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `specification` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Raw_material_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pricing_rules`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pricing_rules` ;

CREATE TABLE IF NOT EXISTS `pricing_rules` (
  `Pricing_rule_id` TINYINT NOT NULL AUTO_INCREMENT,
  `pricing_tier` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`Pricing_rule_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Factory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Factory` ;

CREATE TABLE IF NOT EXISTS `Factory` (
  `factory_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`factory_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Production_standards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Production_standards` ;

CREATE TABLE IF NOT EXISTS `Production_standards` (
  `Production_standards_id` TINYINT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  `certification` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Production_standards_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Production_procedures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Production_procedures` ;

CREATE TABLE IF NOT EXISTS `Production_procedures` (
  `Production_procedures_id` TINYINT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  `instructions` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`Production_procedures_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warehouse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Warehouse` ;

CREATE TABLE IF NOT EXISTS `Warehouse` (
  `Warehouse_id` INT NOT NULL AUTO_INCREMENT,
  `location` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  PRIMARY KEY (`Warehouse_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Transportation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Transportation` ;

CREATE TABLE IF NOT EXISTS `Transportation` (
  `Transportation_id` TINYINT NOT NULL AUTO_INCREMENT,
  `carrier_info` VARCHAR(45) NOT NULL,
  `fee` TINYINT NOT NULL,
  PRIMARY KEY (`Transportation_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Shipment` ;

CREATE TABLE IF NOT EXISTS `Shipment` (
  `shipment_id` INT NOT NULL AUTO_INCREMENT,
  `tracking_number` INT NOT NULL,
  `delivery_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`shipment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer` ;

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `purchase_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchase_history` ;

CREATE TABLE IF NOT EXISTS `purchase_history` (
  `purchase_history_id` INT NOT NULL AUTO_INCREMENT,
  `purchase_date` TIMESTAMP NOT NULL,
  `order_detail` VARCHAR(45) NULL,
  PRIMARY KEY (`purchase_history_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payment` ;

CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` TINYINT NOT NULL AUTO_INCREMENT,
  `payment_date` TIMESTAMP NOT NULL,
  `payment_status` VARCHAR(45) NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`payment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Customer_Contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Customer_Contact` ;

CREATE TABLE IF NOT EXISTS `Customer_Contact` (
  `Customer_table_id` INT NOT NULL AUTO_INCREMENT,
  `customer` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `Customer_table_id_UNIQUE` (`Customer_table_id` ASC) VISIBLE,
  PRIMARY KEY (`Customer_table_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `FK_CUSTOMERCONTACT_CUSTOMER`
    FOREIGN KEY (`customer`)
    REFERENCES `customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Supplier_Contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Supplier_Contact` ;

CREATE TABLE IF NOT EXISTS `Supplier_Contact` (
  `Supplier_Contact_id` TINYINT NOT NULL AUTO_INCREMENT,
  `supplier` TINYINT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Supplier_Contact_id`),
  UNIQUE INDEX `Supplier_Contact_id_UNIQUE` (`Supplier_Contact_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `FK_SUPPLIERCONTACT_SUPPLIER`
    FOREIGN KEY (`supplier`)
    REFERENCES `Supplier` (`supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Agreement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Agreement` ;

CREATE TABLE IF NOT EXISTS `Agreement` (
  `Agreement_id` INT NOT NULL AUTO_INCREMENT,
  `Contract` TINYINT NOT NULL,
  `supplier` TINYINT NOT NULL,
  PRIMARY KEY (`Agreement_id`),
  INDEX `FK_AGREEMENT_SUPPLIER_idx` (`supplier` ASC) VISIBLE,
  INDEX `FK_AGREEMENT_CONTRACT_idx` (`Contract` ASC) VISIBLE,
  CONSTRAINT `FK_AGREEMENT_SUPPLIER`
    FOREIGN KEY (`supplier`)
    REFERENCES `Supplier` (`supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_AGREEMENT_CONTRACT`
    FOREIGN KEY (`Contract`)
    REFERENCES `Contract` (`contract_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supply`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `supply` ;

CREATE TABLE IF NOT EXISTS `supply` (
  `supply_id` INT NOT NULL AUTO_INCREMENT,
  `supplier` TINYINT NOT NULL,
  `raw_material` INT NOT NULL,
  PRIMARY KEY (`supply_id`),
  INDEX `FK_SUPPLY_SUPPLIER_idx` (`supplier` ASC) VISIBLE,
  INDEX `FK_SUPPLY_RAWMATERIAL_idx` (`raw_material` ASC) VISIBLE,
  CONSTRAINT `FK_SUPPLY_SUPPLIER`
    FOREIGN KEY (`supplier`)
    REFERENCES `Supplier` (`supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_SUPPLY_RAWMATERIAL`
    FOREIGN KEY (`raw_material`)
    REFERENCES `Raw_material` (`Raw_material_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Components`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Components` ;

CREATE TABLE IF NOT EXISTS `Components` (
  `Components_id` INT NOT NULL AUTO_INCREMENT,
  `raw_material` INT NOT NULL,
  `product` INT NOT NULL,
  PRIMARY KEY (`Components_id`),
  INDEX `FK_COMPONENT_RAWMATERIAL_idx` (`raw_material` ASC) VISIBLE,
  INDEX `FK_COMPONENT_PRODUCT_idx` (`product` ASC) VISIBLE,
  CONSTRAINT `FK_COMPONENT_RAWMATERIAL`
    FOREIGN KEY (`raw_material`)
    REFERENCES `Raw_material` (`Raw_material_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_COMPONENT_PRODUCT`
    FOREIGN KEY (`product`)
    REFERENCES `Product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Quality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Quality` ;

CREATE TABLE IF NOT EXISTS `Quality` (
  `Quality_id` INT NOT NULL AUTO_INCREMENT,
  `quality_standard` TINYINT NOT NULL,
  `product` INT NOT NULL,
  PRIMARY KEY (`Quality_id`),
  INDEX `FK_QUALITY_PRODUCT_idx` (`product` ASC) VISIBLE,
  INDEX `FK_QUALITY_QUALITYSTANDARDS_idx` (`quality_standard` ASC) VISIBLE,
  CONSTRAINT `FK_QUALITY_QUALITYSTANDARDS`
    FOREIGN KEY (`quality_standard`)
    REFERENCES `quality_standards` (`quality_standard_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_QUALITY_PRODUCT`
    FOREIGN KEY (`product`)
    REFERENCES `Product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Productions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Productions` ;

CREATE TABLE IF NOT EXISTS `Productions` (
  `Productions_id` INT NOT NULL AUTO_INCREMENT,
  `manufacturer` TINYINT NOT NULL,
  `product` INT NULL,
  PRIMARY KEY (`Productions_id`),
  INDEX `FK_PRODUCTIONS_PRODCUT_idx` (`product` ASC) VISIBLE,
  INDEX `FK_PRODUCTIONS_MANUFACTURER_idx` (`manufacturer` ASC) VISIBLE,
  CONSTRAINT `FK_PRODUCTIONS_PRODCUT`
    FOREIGN KEY (`product`)
    REFERENCES `Product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PRODUCTIONS_MANUFACTURER`
    FOREIGN KEY (`manufacturer`)
    REFERENCES `Manufacturer` (`manufacturer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pricings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pricings` ;

CREATE TABLE IF NOT EXISTS `pricings` (
  `pricings_id` INT NOT NULL AUTO_INCREMENT,
  `pricing_rule` TINYINT NOT NULL,
  `product` INT NOT NULL,
  PRIMARY KEY (`pricings_id`),
  INDEX `FK_PRICINGS_PRICINGRULES_idx` (`pricing_rule` ASC) VISIBLE,
  INDEX `FK_PRICINGS_PRODUCT_idx` (`product` ASC) VISIBLE,
  CONSTRAINT `FK_PRICINGS_PRICINGRULES`
    FOREIGN KEY (`pricing_rule`)
    REFERENCES `pricing_rules` (`Pricing_rule_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PRICINGS_PRODUCT`
    FOREIGN KEY (`product`)
    REFERENCES `Product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Returns`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Returns` ;

CREATE TABLE IF NOT EXISTS `Returns` (
  `Returns_id` INT NOT NULL AUTO_INCREMENT,
  `customer` INT NOT NULL,
  `purchase_history` INT NULL,
  PRIMARY KEY (`Returns_id`),
  INDEX `FK_RETURNS_CUSTOMER_idx` (`customer` ASC) VISIBLE,
  INDEX `FK_RETURNS_PURCHASEHISTORY_idx` (`purchase_history` ASC) VISIBLE,
  CONSTRAINT `FK_RETURNS_CUSTOMER`
    FOREIGN KEY (`customer`)
    REFERENCES `customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_RETURNS_PURCHASEHISTORY`
    FOREIGN KEY (`purchase_history`)
    REFERENCES `purchase_history` (`purchase_history_id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Orders` ;

CREATE TABLE IF NOT EXISTS `Orders` (
  `Order_id` INT NOT NULL AUTO_INCREMENT,
  `customer` INT NOT NULL,
  `order_status` VARCHAR(45) NOT NULL,
  `shipment` INT NOT NULL,
  PRIMARY KEY (`Order_id`),
  INDEX `FK_ORDER_customer_idx` (`customer` ASC) VISIBLE,
  INDEX `FK_ORDER_SHIPMENT_idx` (`shipment` ASC) VISIBLE,
  CONSTRAINT `FK_ORDER_CUSTOMER`
    FOREIGN KEY (`customer`)
    REFERENCES `customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_ORDER_SHIPMENT`
    FOREIGN KEY (`shipment`)
    REFERENCES `Shipment` (`shipment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ordered_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ordered_products` ;

CREATE TABLE IF NOT EXISTS `Ordered_products` (
  `Ordered_products_id` INT NOT NULL AUTO_INCREMENT,
  `orders` INT NULL,
  `product` INT NOT NULL,
  PRIMARY KEY (`Ordered_products_id`),
  INDEX `FK_ORDEREDPRODUCT_ORDER_idx` (`orders` ASC) VISIBLE,
  INDEX `FK_ORDEREDPRODUCT_PRODUCT_idx` (`product` ASC) VISIBLE,
  CONSTRAINT `FK_ORDEREDPRODUCT_PRODUCT`
    FOREIGN KEY (`product`)
    REFERENCES `Product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_ORDEREDPRODUCT_ORDER`
    FOREIGN KEY (`orders`)
    REFERENCES `Orders` (`Order_id`)
    ON DELETE CASCADE
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payment_method`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Payment_method` ;

CREATE TABLE IF NOT EXISTS `Payment_method` (
  `Payment_method_id` TINYINT NOT NULL AUTO_INCREMENT,
  `payment` TINYINT NOT NULL,
  `customer` INT NOT NULL,
  PRIMARY KEY (`Payment_method_id`),
  INDEX `FK_PAYMENTMETHOD_CUSTOMER_idx` (`customer` ASC) VISIBLE,
  INDEX `FK_PAYMENTMETHOD_PAYMENT_idx` (`payment` ASC) VISIBLE,
  CONSTRAINT `FK_PAYMENTMETHOD_CUSTOMER`
    FOREIGN KEY (`customer`)
    REFERENCES `customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PAYMENTMETHOD_PAYMENT`
    FOREIGN KEY (`payment`)
    REFERENCES `payment` (`payment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Product_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Product_category` ;

CREATE TABLE IF NOT EXISTS `Product_category` (
  `Product_category_id` TINYINT NOT NULL AUTO_INCREMENT,
  `factory` TINYINT NOT NULL,
  `product_standard` TINYINT NOT NULL,
  `product` INT NOT NULL,
  PRIMARY KEY (`Product_category_id`),
  INDEX `FK_PRODUCTCATEGORY_PRODUCT_idx` (`product` ASC) VISIBLE,
  INDEX `FK_PRODUCTCATEGORY_FACTORY_idx` (`factory` ASC) VISIBLE,
  INDEX `FK_PRODUCTCATEGORY_PRODUCTSTANDARD_idx` (`product_standard` ASC) VISIBLE,
  CONSTRAINT `FK_PRODUCTCATEGORY_PRODUCT`
    FOREIGN KEY (`product`)
    REFERENCES `Product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCTCATEGORY_FACTORY`
    FOREIGN KEY (`factory`)
    REFERENCES `Factory` (`factory_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCTCATEGORY_PRODUCTSTANDARD`
    FOREIGN KEY (`product_standard`)
    REFERENCES `Production_standards` (`Production_standards_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Product_Types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Product_Types` ;

CREATE TABLE IF NOT EXISTS `Product_Types` (
  `Product_Types_id` TINYINT NOT NULL AUTO_INCREMENT,
  `product_standards` TINYINT NOT NULL,
  `product_category` TINYINT NOT NULL,
  PRIMARY KEY (`Product_Types_id`),
  INDEX `FK_PRODUCTTYPES_PRODUCTSTANDARD_idx` (`product_standards` ASC) VISIBLE,
  INDEX `FK_PRODUCTTYPES_PRODUCTCATEGORY_idx` (`product_category` ASC) VISIBLE,
  CONSTRAINT `FK_PRODUCTTYPES_PRODUCTSTANDARD`
    FOREIGN KEY (`product_standards`)
    REFERENCES `Production_standards` (`Production_standards_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCTTYPES_PRODUCTCATEGORY`
    FOREIGN KEY (`product_category`)
    REFERENCES `Product_category` (`Product_category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Standard_Selection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Standard_Selection` ;

CREATE TABLE IF NOT EXISTS `Standard_Selection` (
  `Standard_Selection_id` TINYINT NOT NULL AUTO_INCREMENT,
  `product_procedures` TINYINT NOT NULL,
  `product_standard` TINYINT NOT NULL,
  PRIMARY KEY (`Standard_Selection_id`),
  INDEX `FK_STANDARDSELECTION_PRODUCTSTANDARD_idx` (`product_standard` ASC) VISIBLE,
  INDEX `FK_STANDARDSELECTION_PRODUCTPROCEDURE_idx` (`product_procedures` ASC) VISIBLE,
  CONSTRAINT `FK_STANDARDSELECTION_PRODUCTSTANDARD`
    FOREIGN KEY (`product_standard`)
    REFERENCES `Production_standards` (`Production_standards_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_STANDARDSELECTION_PRODUCTPROCEDURE`
    FOREIGN KEY (`product_procedures`)
    REFERENCES `Production_procedures` (`Production_procedures_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Inventory` ;

CREATE TABLE IF NOT EXISTS `Inventory` (
  `Inventory_id` INT NOT NULL AUTO_INCREMENT,
  `warehouse` INT NULL,
  `product` INT NOT NULL,
  PRIMARY KEY (`Inventory_id`),
  INDEX `FK_INVENTORY_WAREHOUSE_idx` (`warehouse` ASC) VISIBLE,
  INDEX `FK_INVENTORY_PRODUCT_idx` (`product` ASC) VISIBLE,
  CONSTRAINT `FK_INVENTORY_WAREHOUSE`
    FOREIGN KEY (`warehouse`)
    REFERENCES `Warehouse` (`Warehouse_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_INVENTORY_PRODUCT`
    FOREIGN KEY (`product`)
    REFERENCES `Product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Transportation_Modes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Transportation_Modes` ;

CREATE TABLE IF NOT EXISTS `Transportation_Modes` (
  `Transportation_Modes_id` TINYINT NOT NULL AUTO_INCREMENT,
  `shipment` INT NULL,
  `transportation` TINYINT NOT NULL,
  PRIMARY KEY (`Transportation_Modes_id`),
  INDEX `FK_TRANSPORTATIONMODES_TRANSPORTATION_idx` (`transportation` ASC) VISIBLE,
  INDEX `FK_TRANSPORTATIONMODES_TRANSPORTATION_idx1` (`shipment` ASC) VISIBLE,
  CONSTRAINT `FK_TRANSPORTATIONMODES_TRANSPORTATION`
    FOREIGN KEY (`transportation`)
    REFERENCES `Transportation` (`Transportation_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_TRANSPORTATIONMODES_SHIPMENT`
    FOREIGN KEY (`shipment`)
    REFERENCES `Shipment` (`shipment_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ground`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ground` ;

CREATE TABLE IF NOT EXISTS `Ground` (
  `Ground_id` INT NOT NULL AUTO_INCREMENT,
  `delivery_time` VARCHAR(45) NOT NULL,
  `Transportation` TINYINT NOT NULL,
  PRIMARY KEY (`Ground_id`),
  INDEX `FK_GROUND_TRANSPORTATION_idx` (`Transportation` ASC) VISIBLE,
  CONSTRAINT `FK_GROUND_TRANSPORTATION`
    FOREIGN KEY (`Transportation`)
    REFERENCES `Transportation` (`Transportation_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cargo` ;

CREATE TABLE IF NOT EXISTS `Cargo` (
  `Cargo_id` INT NOT NULL AUTO_INCREMENT,
  `delivery_time` VARCHAR(45) NOT NULL,
  `transportation` TINYINT NOT NULL,
  PRIMARY KEY (`Cargo_id`),
  INDEX `FK_CARGO_TRANSPORTATION_idx` (`transportation` ASC) VISIBLE,
  CONSTRAINT `FK_CARGO_TRANSPORTATION`
    FOREIGN KEY (`transportation`)
    REFERENCES `Transportation` (`Transportation_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Air`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Air` ;

CREATE TABLE IF NOT EXISTS `Air` (
  `Air_id` INT NOT NULL AUTO_INCREMENT,
  `delivery_time` VARCHAR(45) NOT NULL,
  `Transportation` TINYINT NOT NULL,
  PRIMARY KEY (`Air_id`),
  INDEX `FK_AIR_TRANSPORTATION_idx` (`Transportation` ASC) VISIBLE,
  CONSTRAINT `FK_AIR_TRANSPORTATION`
    FOREIGN KEY (`Transportation`)
    REFERENCES `Transportation` (`Transportation_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Crypto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Crypto` ;

CREATE TABLE IF NOT EXISTS `Crypto` (
  `Crypto_id` INT NOT NULL AUTO_INCREMENT,
  `payment` TINYINT NOT NULL,
  `amount` INT NULL,
  PRIMARY KEY (`Crypto_id`),
  INDEX `FK_CRYPTO_PAYMENT_idx` (`payment` ASC) VISIBLE,
  CONSTRAINT `FK_CRYPTO_PAYMENT`
    FOREIGN KEY (`payment`)
    REFERENCES `payment` (`payment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Credit_card`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Credit_card` ;

CREATE TABLE IF NOT EXISTS `Credit_card` (
  `Credit_card_id` INT NOT NULL AUTO_INCREMENT,
  `credit_card_number` INT NOT NULL,
  `payment` TINYINT NOT NULL,
  PRIMARY KEY (`Credit_card_id`),
  INDEX `FK_CREDITCARD_PAYMENT_idx` (`payment` ASC) VISIBLE,
  CONSTRAINT `FK_CREDITCARD_PAYMENT`
    FOREIGN KEY (`payment`)
    REFERENCES `payment` (`payment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Check_payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Check_payment` ;

CREATE TABLE IF NOT EXISTS `Check_payment` (
  `Check_id` INT NOT NULL AUTO_INCREMENT,
  `payment` TINYINT NOT NULL,
  `Issuing_bank` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Check_id`),
  INDEX `FK_CHECK_PAYMENT_idx` (`payment` ASC) VISIBLE,
  CONSTRAINT `FK_CHECK_PAYMENT`
    FOREIGN KEY (`payment`)
    REFERENCES `payment` (`payment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
