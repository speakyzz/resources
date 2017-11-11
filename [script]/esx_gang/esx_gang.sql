USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('caution', 'Caution', 0)
;

INSERT INTO `gang` (name, label) VALUES
  ('gang', 'NoGang'),
  ('cigarios', 'Cigarios')
;

ALTER TABLE jobs ADD whitelisted BOOLEAN NOT NULL DEFAULT FALSE;

INSERT INTO `gang_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('cigarios', 0, '0', '0', 0, '{}', '{}'),

;


