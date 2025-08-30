CREATE SCHEMA IF NOT EXISTS `cashora` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `cashora`.`transaction` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `amount` DECIMAL(14,2) NOT NULL,
  `description` VARCHAR(255) NULL,
  `transaction_date` DATE NOT NULL,
  `category_id` INT NULL,
  PRIMARY KEY (`transaction_id`),
  CONSTRAINT `transaction_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `cashora`.`user` (`user_id`),
  CONSTRAINT `transaction_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `cashora`.`category` (`category_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `cashora`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `type` ENUM('income', 'expense') NOT NULL,
  PRIMARY KEY (`category_id`),
  CONSTRAINT `category_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `cashora`.`user` (`user_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `cashora`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;