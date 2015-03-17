-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db524752934
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db524752934` ;

-- -----------------------------------------------------
-- Schema db524752934
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db524752934` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db524752934` ;

-- -----------------------------------------------------
-- Table `db524752934`.`personne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`personne` (
  `id_personne` INT NOT NULL AUTO_INCREMENT,
  `civilite` VARCHAR(3) NOT NULL,
  `prenom` VARCHAR(20) NOT NULL,
  `nom` VARCHAR(30) NOT NULL,
  `adresse` VARCHAR(45) NULL,
  `code_postal` VARCHAR(5) NULL,
  `ville` VARCHAR(30) NULL,
  `telephone` VARCHAR(15) NULL,
  `telephone2` VARCHAR(15) NULL,
  `email` VARCHAR(30) NOT NULL,
  `mot_passe` VARCHAR(45) NOT NULL,
  `date_inscription` DATETIME NOT NULL COMMENT 'Date où la personne s\'est inscrite (avant la validation)',
  `est_inscrite` TINYINT(1) NOT NULL DEFAULT FALSE COMMENT 'Vrai quand l\'inscription est valdée',
  PRIMARY KEY (`id_personne`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`module` (
  `id_module` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(128) NOT NULL,
  `objectif` VARCHAR(512) NULL,
  `contenu` VARCHAR(45) NULL,
  `nb_heures` INT NULL,
  `prerequis` VARCHAR(512) NULL,
  PRIMARY KEY (`id_module`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`formation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`formation` (
  `id_formation` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id_formation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`session` (
  `id_session` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `date_debut` DATE NOT NULL,
  `date_fin` DATE NOT NULL,
  `description` TEXT NULL,
  `id_formation` INT NOT NULL,
  `date_debut_inscription` DATETIME NULL,
  `date_fin_inscription` DATETIME NULL,
  PRIMARY KEY (`id_session`),
  INDEX `fk_session_formation_idx` (`id_formation` ASC),
  CONSTRAINT `fk_session_formation`
    FOREIGN KEY (`id_formation`)
    REFERENCES `db524752934`.`formation` (`id_formation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`formateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`formateur` (
  `id_personne` INT NOT NULL,
  PRIMARY KEY (`id_personne`),
  CONSTRAINT `fk_formateur_personne1`
    FOREIGN KEY (`id_personne`)
    REFERENCES `db524752934`.`personne` (`id_personne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`evaluation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`evaluation` (
  `id_evaluation` INT NOT NULL AUTO_INCREMENT,
  `id_module` INT NOT NULL,
  `id_session` INT NOT NULL,
  `id_formateur` INT NOT NULL,
  PRIMARY KEY (`id_evaluation`),
  INDEX `fk_evaluation_module1_idx` (`id_module` ASC),
  INDEX `fk_evaluation_session1_idx` (`id_session` ASC),
  INDEX `fk_evaluation_formateur1_idx` (`id_formateur` ASC),
  CONSTRAINT `fk_evaluation_module1`
    FOREIGN KEY (`id_module`)
    REFERENCES `db524752934`.`module` (`id_module`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluation_session1`
    FOREIGN KEY (`id_session`)
    REFERENCES `db524752934`.`session` (`id_session`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluation_formateur1`
    FOREIGN KEY (`id_formateur`)
    REFERENCES `db524752934`.`formateur` (`id_personne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`module_formation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`module_formation` (
  `id_module` INT NOT NULL,
  `id_formation` INT NOT NULL,
  PRIMARY KEY (`id_module`, `id_formation`),
  INDEX `fk_module_has_formation_formation1_idx` (`id_formation` ASC),
  INDEX `fk_module_has_formation_module1_idx` (`id_module` ASC),
  CONSTRAINT `fk_module_has_formation_module1`
    FOREIGN KEY (`id_module`)
    REFERENCES `db524752934`.`module` (`id_module`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_module_has_formation_formation1`
    FOREIGN KEY (`id_formation`)
    REFERENCES `db524752934`.`formation` (`id_formation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`etat_candidature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`etat_candidature` (
  `id_etat_candidature` CHAR(1) NOT NULL,
  `libelle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_etat_candidature`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`candidature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`candidature` (
  `id_session` INT NOT NULL,
  `id_personne` INT NOT NULL,
  `id_etat_candidature` CHAR(1) NOT NULL,
  `date_effet` DATETIME NOT NULL,
  `motivation` TEXT NULL,
  PRIMARY KEY (`id_session`, `id_personne`),
  INDEX `fk_session_has_personne_personne1_idx` (`id_personne` ASC),
  INDEX `fk_session_has_personne_session1_idx` (`id_session` ASC),
  INDEX `fk_candidature_etat_candidature1_idx` (`id_etat_candidature` ASC),
  CONSTRAINT `fk_session_has_personne_session1`
    FOREIGN KEY (`id_session`)
    REFERENCES `db524752934`.`session` (`id_session`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_session_has_personne_personne1`
    FOREIGN KEY (`id_personne`)
    REFERENCES `db524752934`.`personne` (`id_personne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidature_etat_candidature1`
    FOREIGN KEY (`id_etat_candidature`)
    REFERENCES `db524752934`.`etat_candidature` (`id_etat_candidature`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`salle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`salle` (
  `id_salle` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_salle`),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`seance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`seance` (
  `id_module` INT NOT NULL,
  `id_session` INT NOT NULL,
  `id_formateur` INT NOT NULL,
  `debut` DATETIME NOT NULL,
  `fin` DATETIME NOT NULL,
  `id_salle` INT NOT NULL,
  `contenu` TEXT NULL,
  PRIMARY KEY (`id_module`, `id_session`, `id_formateur`, `debut`, `fin`, `id_salle`),
  INDEX `fk_seance_session1_idx` (`id_session` ASC),
  INDEX `fk_seance_formateur1_idx` (`id_formateur` ASC),
  INDEX `fk_seance_salle1_idx` (`id_salle` ASC),
  CONSTRAINT `fk_seance_module1`
    FOREIGN KEY (`id_module`)
    REFERENCES `db524752934`.`module` (`id_module`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seance_session1`
    FOREIGN KEY (`id_session`)
    REFERENCES `db524752934`.`session` (`id_session`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seance_formateur1`
    FOREIGN KEY (`id_formateur`)
    REFERENCES `db524752934`.`formateur` (`id_personne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seance_salle1`
    FOREIGN KEY (`id_salle`)
    REFERENCES `db524752934`.`salle` (`id_salle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`note` (
  `id_evaluation` INT NOT NULL,
  `id_personne` INT NOT NULL,
  `note` DECIMAL(3,1) NOT NULL,
  PRIMARY KEY (`id_evaluation`, `id_personne`),
  INDEX `fk_note_personne1_idx` (`id_personne` ASC),
  CONSTRAINT `fk_note_evaluation1`
    FOREIGN KEY (`id_evaluation`)
    REFERENCES `db524752934`.`evaluation` (`id_evaluation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_note_personne1`
    FOREIGN KEY (`id_personne`)
    REFERENCES `db524752934`.`personne` (`id_personne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`theme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`theme` (
  `id_theme` INT NOT NULL AUTO_INCREMENT,
  `libelle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_theme`),
  UNIQUE INDEX `libelle_UNIQUE` (`libelle` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db524752934`.`module_theme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db524752934`.`module_theme` (
  `id_module` INT NOT NULL,
  `id_theme` INT NOT NULL,
  PRIMARY KEY (`id_module`, `id_theme`),
  INDEX `fk_module_has_theme_theme1_idx` (`id_theme` ASC),
  INDEX `fk_module_has_theme_module1_idx` (`id_module` ASC),
  CONSTRAINT `fk_module_has_theme_module1`
    FOREIGN KEY (`id_module`)
    REFERENCES `db524752934`.`module` (`id_module`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_module_has_theme_theme1`
    FOREIGN KEY (`id_theme`)
    REFERENCES `db524752934`.`theme` (`id_theme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `db524752934` ;

-- -----------------------------------------------------
-- function hello
-- -----------------------------------------------------

DELIMITER $$
USE `db524752934`$$
CREATE DEFINER=`dbo524752934`@`localhost` FUNCTION `hello`(p_id integer) RETURNS varchar(60) CHARSET utf8
    READS SQL DATA
begin
	declare v_nom varchar(50);
    select nom into v_nom 
    from salle 
    where id_salle = p_id;
	return concat ('La salle de ID ', p_id, ' s''appelle ', v_nom);
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure salle_reset
-- -----------------------------------------------------

DELIMITER $$
USE `db524752934`$$
CREATE DEFINER=`dbo524752934`@`localhost` PROCEDURE `salle_reset`()
begin
	start transaction;
	delete from salle;
    insert into salle (id_salle, nom) values (1, 'F101');
    insert into salle (id_salle, nom) values (2, 'F301');
    commit;
end$$

DELIMITER ;
USE `db524752934`;

DELIMITER $$
USE `db524752934`$$
CREATE
DEFINER=`dbo524752934`@`localhost`
TRIGGER `db524752934`.`salle_before_update_trigger`
BEFORE UPDATE ON `db524752934`.`salle`
FOR EACH ROW
begin
	set new.nom = trim(upper(new.nom));
	if new.nom regexp '^s*$' then
		signal sqlstate '45000'
        set message_text = 'Nom vide', mysql_errno = 3000;
	end if;
end$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


DELIMITER $$

DROP TRIGGER IF EXISTS personne_before_update_trigger$$

CREATE TRIGGER personne_before_update_trigger
BEFORE UPDATE ON personne
FOR EACH ROW
BEGIN
	SET NEW.prenom = trim(initcap(NEW.prenom));
	IF NEW.prenom REGEXP '^ *$' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Prénom vide', MYSQL_ERRNO=3000;
	END if;
    
    SET NEW.nom = trim(UPPER(NEW.nom));
    IF NEW.nom REGEXP '^ *$' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Nom vide', MYSQL_ERRNO=3000;
	END if;
    
    SET NEW.adresse = trim(initcapAdresse(NEW.adresse));
    IF NEW.adresse REGEXP '^ *$' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Adresse vide', MYSQL_ERRNO=3000;
	END if;
    
    Set NEW.ville = trim(initcap(NEW.ville));
	IF NEW.ville REGEXP '^ *$' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Ville vide', MYSQL_ERRNO=3000;
	END if;
    
    SET NEW.telephone =  replace(replace(NEW.telephone, '.', ''), ' ', '');
    
END$$

DELIMITER $$

DROP TRIGGER IF EXISTS personne_before_insert_trigger$$

CREATE TRIGGER personne_before_insert_trigger
BEFORE INSERT ON personne
FOR EACH ROW
BEGIN
	SET NEW.prenom = trim(initcap(NEW.prenom));
	IF NEW.prenom REGEXP '^ *$' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Prénom vide', MYSQL_ERRNO=3000;
	END if;
    
    SET NEW.nom = trim(UPPER(NEW.nom));
    IF NEW.nom REGEXP '^ *$' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Nom vide', MYSQL_ERRNO=3000;
	END if;
    
    SET NEW.adresse = trim(initcapAdresse(NEW.adresse));
    IF NEW.adresse REGEXP '^ *$' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Adresse vide', MYSQL_ERRNO=3000;
	END if;
    
    Set NEW.ville = trim(initcap(NEW.ville));
	IF NEW.ville REGEXP '^ *$' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Ville vide', MYSQL_ERRNO=3000;
	END if;
    
    SET NEW.telephone =  replace(replace(NEW.telephone, '.', ''), ' ', '');
    
END$$
