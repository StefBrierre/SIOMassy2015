DELIMITER $
DROP PROCEDURE IF EXISTS refresh_base$

CREATE DEFINER=root@localhost PROCEDURE refresh_base()
BEGIN
  -- Lever temporairement les contraintes d'intégrité
  SET FOREIGN_KEY_CHECKS=0;
  TRUNCATE personne;
  TRUNCATE session;
  TRUNCATE module;
  TRUNCATE formateur;
  -- etc. // A COMPLETER
  -- Retablir les contraintes d'intégrité
  SET FOREIGN_KEY_CHECKS=1;

  -- Remettre les compteurs à 1 (pour l'auto-incrément)
  ALTER TABLE evaluation AUTO_INCREMENT=1;
  ALTER TABLE salle AUTO_INCREMENT=1;
  ALTER TABLE session AUTO_INCREMENT=1;
  ALTER TABLE formation AUTO_INCREMENT=1;
  ALTER TABLE theme AUTO_INCREMENT=1;
  ALTER TABLE module AUTO_INCREMENT=1;
  ALTER TABLE personne AUTO_INCREMENT=1;

  START TRANSACTION;
  INSERT INTO personne
  (id_personne,civilite,prenom, nom,adresse,code_postal,ville,telephone,telephone2,email,mot_passe,date_inscription,est_inscrite) VALUES
  (1, 'M.', 'Jérome', 'LE BARON', '33 Chemin du fossé de laumone', '92600', 'Asnières', '0951466417', null, 'lebaronjerome@free.fr', 'dopler', '2015-01-19 11:29:18', 0),
  (2, 'Mle', 'Emilie', 'WAILLE', '25 Avenue de la gare', '92000', 'NANTERRE', '0956789101', null, 'waille@hotmail.fr', 'walle', '2014-12-17 11:29:18', 0),
  (3, 'M.', 'Saad', 'Hassaini', '123 Rue de la mairie', '95230', 'POISSY', '0532198734', null, 'saadh@gmail.com', 'loljeu', '2015-01-20 11:29:18', 0),
  (4, 'Mme', 'Brigitte', 'GROLEAS', '12 Rue du temple', '95000', 'ARGENTEUIL', '0125897456', null, 'brigitte@groleas.fr', 'java8', '2015-01-21 11:29:18', 0),
  (5, 'M.', 'Michel', 'PLASSE', '5 Rue des martyrs', '78560', 'MELUN', '0244896531', null, 'm.plasse@voila.fr', 'tintin', '2015-01-22 11:29:18', 0),
  (6, 'Mme', 'Sylvie', 'JOUANNE', '52 Avenue de la république', '75012', 'PARIS', '0137548652', null, 'jsylvie.@orange.fr', 'proust', '2015-01-23 11:29:18', 0);

  INSERT INTO formateur
  (id_personne, date_entree) VALUES
  (4, '2008-01-09'),
  (5, '2009-09-15');

  INSERT INTO module
  (id_module, nom, objectif, contenu, nb_heures, prerequis) VALUES
  (1, 'SI2', 'Enseigner aux élèves les bases sur le fonctionnement du réseau internet', 'Des TP et des cours', 30, 'Les prérequis sont le module SI1 et le binaire'),
  (2, 'Maths', 'Enseigner aux élèves les notions de mathématiques nécessaires en informatique', 'Des cours théoriques et du python', 50, 'Les prérequis sont le BAC'),
  (3, 'Anglais', 'Enseigner la compréhension orale et de texte', 'Des cours et beaucoup de pratique orale', 50, 'Les prérequis sont le BAC et un peu d''attention');

  INSERT INTO theme
  (id_theme, libelle) VALUES
  (1, 'informatique'),
  (2, 'culture'),
  (3, 'langue');

  INSERT INTO module_theme
  (id_module, id_theme) VALUES
  (1, 1),
  (2, 2),
  (3, 3);

  INSERT INTO formation
  (id_formation, nom, description) VALUES
  (1, 'BTS SIO', 'Formation pour obtenie le BTS Services Informatiques aux Organisations options SISR ou SLAM'),
  (2, 'BTS CG', 'Formation pour obtenir le BTS Comptabilité et Gestion'),
  (3, 'BTS Audiovisuel', 'Formation pour obtenir le BTS Audiovisuel option Son, Image ou Montage');

  INSERT INTO module_formation
  (id_module, id_formation) VALUES
  (1, 1),
  (2, 2),
  (3, 3);

  INSERT INTO session
  (id_session, nom, date_debut, date_fin, description, id_formation, date_debut_inscription, date_fin_inscription) VALUES
  (1, 'BTS SIO 2016', '2015-05-07', '2016-05-12', '4ème session pour le BTS SIO', 1, '2015-03-07 09:00:00', '2015-04-07 18:00:00'),
  (2, 'BTS CG 2016', '2015-09-25', '2016-09-15', '2ème session pour le BTS CG', 2, '2015-07-25 09:00:00', '2015-08-25 18:00:00'),
  (3, 'BTS Audio 2016', '2015-11-15', '2016-11-05', '1ère session pour le BTS Audiovisuel option son', 2, '2015-09-15 09:00:00', '2015-10-25 18:00:00');

  INSERT INTO salle
  (id_salle, nom) VALUES
  (1, 'Salle 306'),
  (2, 'Salle 201'),
  (3, 'Salle 114');

  INSERT INTO etat_candidature
  (id_etat_candidature, libelle) VALUES
  ('A', 'Admis'),
  ('V', 'Validée'),
  ('R', 'Refusée');

  INSERT INTO candidature
  (id_session, id_personne, id_etat_candidature, date_effet, motivation) VALUES
  (3, 2, 'V', '2015-03-15 10:00:00', 'Je suis extrement motivé pour accéder à cette formation d''informatique, un domaine qui me passionne.'),
  (1, 3, 'A', '2015-08-10 14:00:00', 'Je suis extrement motivé pour accéder à cette formation.'),
  (2, 1, 'R', '2015-08-10 14:00:00', 'Je suis très motivé et passioné et souhaite donc accéder à cette formation.');

  INSERT INTO evaluation
  (id_evaluation, id_module, id_session, id_formateur) VALUES
  (1, 1, 1, 4),
  (2, 2, 2, 5),
  (3, 3, 3, 6);

  INSERT INTO note
  (id_evaluation, id_personne, note) VALUES
  (1, 1, 12),
  (2, 2, 14),
  (3, 3, 9);

  INSERT INTO seance
  (id_module, id_session, id_personne, debut, fin, id_salle, contenu) VALUES
  (1, 1, 4, '2015-06-02 09:00:00', '2015-06-02 13:00:00', 1, 'Première séance de SI2 avec découverte du fonctionnement d''internet'),
  (2, 2, 5, '2015-07-02 13:00:00', '2015-07-02 16:00:00', 1, 'Suite du cours sur les matrices'),
  (3, 3, 6, '2015-09-12 13:00:00', '2015-09-12 17:00:00', 1, 'Révision des propositions relatives');

  COMMIT;
END$
CALL refresh_base()$

