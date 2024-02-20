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
  phone varchar(20) not null UNIQUE CHECK (phone LIKE '+%' AND length(phone) BETWEEN 10 AND 15),
  address VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NULL,
  zip VARCHAR(6) CHECK (zip regexp '^[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]$') not NULL,
  contract text null, 
  email varchar(50) NOT NULL unique CHECK(email LIKE '%@%')
  -- PRIMARY KEY (`au_id`),
  -- UNIQUE INDEX `au_id_UNIQUE` (`au_id` ASC) VISIBLE);
);

DROP TABLE IF EXISTS titles;
create table titles(
	tiles_id TINYINT AUTO_INCREMENT PRIMARY KEY,
	titles VARCHAR(100),
	`type` enum('Roman', 'Politique', 'Science', 'Histoire'),
	pub_id SMALLINT REFERENCES publishers (pub_id),
	price FLOAT,
	advance FLOAT,
	notes VARCHAR(255),
	pub_date DATE
	
);

drop table IF exists redactions;
CREATE TABLE redactions(
	au_id tinyint not null REFERENCES `authors` (`au_id`),
    title_id tinyint not null REFERENCES `titles` (`title_id`),
    au_ord tinyint not null,
    royalty float
       
);

DROP TABLE IF EXISTS stores;
create table stores (
    stor_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    stor_name VARCHAR(50),
    stor_address VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);


DROP TABLE IF EXISTS sales; 
create table sales (
    store_id TINYINT REFERENCES `stores` (`stor_id`),
    ord_num TINYINT,
    title_id SMALLINT REFERENCES `titles` (`title_id`),
    ord_date datetime,
    qty INT,
    PRIMARY KEY (store_id, ord_num, title_id)
);


DROP TABLE IF EXISTS employees;
create table employees(
	emp_id tinyint auto_increment primary key NOT NULL,
    emp_name varchar(50) not NULL,
    salary smallint not null,
    fname varchar(50) not null,
    lname varchar(50) not null,
    job_id smallint not null  REFERENCES `jobs` (`job_id`),
    pub_id smallint not null REFERENCES `publishers` (`pub_id`),
    pub_date date not null,
    email varchar(50) NOT NULL unique CHECK(email LIKE '%@%')
);