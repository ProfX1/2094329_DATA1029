CREATE database if not exists library2;


use library2;
DROP TABLE IF EXISTS jobs;
CREATE TABLE jobs(
job_id tinyint NOT NULL AUTO_INCREMENT PRIMARY KEY, 
job_desc varchar(255) UNIQUE NOT NULL, 
min_lvl varchar(50) NULL, 
max_lvl varchar(50) NULL
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
  au_id TINYINT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  au_lname VARCHAR(255) NOT NULL,
  au_fname VARCHAR(255) NOT NULL,
  phone INT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  state VARCHAR(255) NULL,
  zip VARCHAR(10) NOT NULL,
  contract INT NULL
  -- PRIMARY KEY (`au_id`),
  -- UNIQUE INDEX `au_id_UNIQUE` (`au_id` ASC) VISIBLE);
);
