CREATE database if not exists library2;


use library2;
DROP TABLE IF EXISTS jobs;
CREATE TABLE jobs(
job_id tinyint NOT NULL AUTO_INCREMENT PRIMARY KEY, 
job_desc varchar(50) UNIQUE NOT NULL, 
min_lvl enum('STAGIAIRE','JUNIOR','INTERMEDIAIRE','SENIOR') NULL, 
max_lvl enum('STAGIAIRE','JUNIOR','INTERMEDIAIRE','SENIOR') NULL
-- CONSTRAINT pk_jobs PRIMARY KEY(job_id)
-- CONSTRAINT uniq_job_desc UNIQUE(job_desc)
);

DROP TABLE IF EXISTS publishers;
CREATE TABLE publishers(
pub_id tinyint NOT NULL auto_increment primary key, 
pub_name varchar(255) not null, 
city varchar(255) not null, 
state varchar(255) null,
country varchar(255) not null
);

DROP TABLE IF EXISTS authors;
CREATE TABLE authors(
  au_id TINYINt NOT NULL AUTO_INCREMENT PRIMARY KEY,
  au_lname VARCHAR(50) NOT NULL,
  au_fname VARCHAR(50) NOT NULL,
  phone varchar(20) NULL,
  address VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NULL,
  zip VARCHAR(6) NOT NULL,
  contract text, 
  email varchar(50) NOT NULL unique,
  -- PRIMARY KEY (`au_id`),
  -- UNIQUE INDEX `au_id_UNIQUE` (`au_id` ASC) VISIBLE);
);

drop table IF exists Redactions;
CREATE TABLE Redactions(
	au_id tinyint not null,
    title_id tinyint not null,
    au_ord tinyint not null,
    royalty float,
    CONSTRAINT `fk_au_id` FOREIGN KEY (`au_id`) REFERENCES `authors` (`au_id`),
	CONSTRAINT `fk_title_id` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`)
    
);

