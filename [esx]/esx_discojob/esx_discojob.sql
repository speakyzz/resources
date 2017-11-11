INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_disco','Disco',1)
;

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES 
	(NULL, 'society_disco', '0', NULL)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_disco','Disco',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('disco','Disco')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('disco',0,'barman','Barman',20,'{}','{}'),
  ('disco',1,'videur','Videur',30,'{}','{}'),
  ('disco',2,'dj','DJ',40,'{}','{}'),
  ('disco',3,'gerant','Gerant',50,'{}','{}'),
  ('disco',4,'boss','Patron',0,'{}','{}'),
  ('disco',5,'strip','Strip-Teaseuse',0,'{}','{}'),
  ('disco',6,'striip','Strip-Teaseur',0,'{}','{}')
;

INSERT INTO `items` (name, label) VALUES
	('menthe', 'Menthe'),
	('pommedeterre', 'Pomme de terre'),
	('raisin', 'Raisin'),
	('steackhache', 'Steack haché'),
	('feuilledecoca', 'Feuille de Coca'),
	('thefroid', 'Thé froid'),
	('orange', 'Orange'),
	('cerealesmaltees', 'Céréales Maltées'),
	('sirop', 'Sirop'),
	('cacao', 'Cacao'),
	('eaugazifie', 'Eau Gazifiée'),
	('agrume', 'Agrume'),
	('cafeine', 'Caféine'),
	('mojito', 'Mojito'),
	('vodka', 'Vodka'),
	('champagne', 'Champagne'),
	('hamburger', 'Hamburger'),
	('coca', 'Coca'),
	('icetea', 'Ice-Tea'),
	('orangina', 'Orangina'),
	('wisky', 'Wisky'),
	('diabolo', 'Diabolo'),
	('chocolatchaud', 'Chocolat Chaud'),
	('perrier', 'Perrier'),
	('schweppes', 'Schweppes'),
	('cafe', 'Café')
;