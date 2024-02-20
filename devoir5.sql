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
  contract text, 
  email varchar(50) NOT NULL unique,
  -- PRIMARY KEY (`au_id`),
  -- UNIQUE INDEX `au_id_UNIQUE` (`au_id` ASC) VISIBLE);
);

drop table IF exists redactions;
CREATE TABLE redactions(
	au_id tinyint not null,
    title_id tinyint not null,
    au_ord tinyint not null,
    royalty float,
    CONSTRAINT `fk_au_id` FOREIGN KEY (`au_id`) REFERENCES `authors` (`au_id`),
	CONSTRAINT `fk_title_id` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`)
    
);

DROP TABLE IF EXISTS sales; 
create table sales (
    store_id TINYINT ,
    ord_num TINYINT,
    title_id SMALLINT REFERENCES Titles(title_id),
    ord_date datetime,
    qty INT,
    PRIMARY KEY (store_id, ord_num, title_id),
    CONSTRAINT `fk_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`stor_id`),
    CONSTRAINT `fk_title_id` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`)
);