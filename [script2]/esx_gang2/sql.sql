CREATE TABLE IF NOT EXISTS `gang` (
	`id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `gang_grades` (
	`id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `gang_name` varchar(255) NOT NULL,
	`grade` int(11) NOT NULL,
    `name` varchar(255) NOT NULL,
	`label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `users`
	ADD COLUMN `gang` varchar(255) DEFAULT 'nogang' AFTER `job`,
    ADD COLUMN `gang_grade` int(11) DEFAULT 0 AFTER `job_grade`
;

INSERT INTO `gang` (name, label) VALUES ('nogang', '');
INSERT INTO `gang_grades` (gang_name, grade, name, label) VALUES ('nogang', 0, '', '');