DELIMITER $
DROP PROCEDURE IF EXISTS refresh_base$

CREATE  PROCEDURE refresh_base()


BEGIN
  -- Lever temporairement les contraintes d'intégrité
  SET FOREIGN_KEY_CHECKS=0;
  TRUNCATE personne;
  TRUNCATE session;
  TRUNCATE module;
  TRUNCATE formateur;
  TRUNCATE candidature;
  TRUNCATE formation;
  TRUNCATE module_formation;
  TRUNCATE module_theme;
  TRUNCATE note;
  TRUNCATE salle;
  TRUNCATE seance;
  TRUNCATE theme;
  TRUNCATE evaluation;
  TRUNCATE etat_candidature;
  
  
  -- etc. // A COMPLETER
  -- Retablir les contraintes d'intégrité
  SET FOREIGN_KEY_CHECKS=1;

  -- Remettre les compteurs à 1 (pour l'auto-incrément)
  
  
  ALTER TABLE session AUTO_INCREMENT=1;
  ALTER TABLE formateur AUTO_INCREMENT=1;
  ALTER TABLE module AUTO_INCREMENT=1;
  ALTER TABLE personne AUTO_INCREMENT=1;
  ALTER TABLE formation AUTO_INCREMENT=1;


  START TRANSACTION;
  INSERT INTO personne
  (id_personne,civilite,prenom, nom,adresse,code_postal,ville,telephone,telephone2,email,mot_passe,date_inscription,est_inscrite) VALUES
  (1, 'M.', 'Joel', 'BANKA', '3 Rue du Gros Chêne', '92370', 'CHAVILLE', '0614787928', null, 'bankajoel@yahoo.fr', 'banka', '2014-06-02 09:00:00', 0),
  (2, 'Mle', 'Stephanie', 'BRIERRE', '40 Rue EXELMANS', '78140', 'VELIZY', '0662931606', null, 'stephanibrierRe@gmail.com', 'telephone', '2014-06-02 09:00:00', 0),
  (3, 'Mle', 'Marion', 'DESCIEUX', '60 Rue du General leclerc', '91470', 'FORGES LES BAINS', '0673422520', null, 'mariondescieux@yahoo.fr', 'bouboul', '2014-06-02 09:00:00', 0),
  (4, 'M.',  'Michel', 'PLASSE', '43 Rue Saint louis a lile', '75100', 'PARIS', '0651080681', null, 'michelplace@free.fr','internet','2014-06-02 09:00:00', 0),
  (5, 'M.',  'Pascal', 'SORIN', '43 Rue Saint louis a lile', '75100', 'PARIS', '0651080681', null, 'pascalsorin@gmail.com','reseau','2014-06-02 09:00:00', 0);
  
  INSERT INTO formateur
  (id_personne) VALUES
  (4),
  (5);

  INSERT INTO module
  (id_module, nom, objectif, contenu, nb_heures, prerequis) VALUES
  (1, 'SI2', 'Enseigner aux élèves les bases sur le fonctionnement du réseau internet', 'Des TP et des cours', 30, 'Les prérequis sont le module SI1 et le binaire'),
  (2, 'Maths', 'Enseigner aux élèves les notions de mathématiques nécessaires en informatique', 'Des cours théoriques et du python', 50, 'Les prérequis sont le BAC'),
  (3, 'Anglais', 'Enseigner la compréhension orale et de texte', 'Des cours et beaucoup de pratique orale', 50, 'Les prérequis sont le BAC et un peu d''attention');
  
   INSERT INTO formation
  (id_formation, nom, description) VALUES
  (1, 'BTS SIO', 'Formation pour obtenie le BTS Services Informatiques aux Organisations options SISR ou SLAM'),
  (2, 'BTS CG', 'Formation pour obtenir le BTS Comptabilité et Gestion'),
  (3, 'BTS Audiovisuel', 'Formation pour obtenir le BTS Audiovisuel option Son, Image ou Montage');


  
  INSERT INTO session
  (id_session, nom, date_debut, date_fin, description, id_formation, date_debut_inscription, date_fin_inscription) VALUES
  (1, 'BTS SIO 2016', '2015-05-07', '2016-05-12', '4ème session pour le BTS SIO', 1, '2015-03-07 09:00:00', '2015-04-07 18:00:00'),
  (2, 'BTS CG 2016', '2015-09-25', '2016-09-15', '2ème session pour le BTS CG', 2, '2015-07-25 09:00:00', '2015-08-25 18:00:00'),
  (3, 'BTS Audio 2016', '2015-11-15', '2016-11-05', '1ère session pour le BTS Audiovisuel option son', 2, '2015-09-15 09:00:00', '2015-10-25 18:00:00');

  COMMIT;
END$
CALL refresh_base()$

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
