CREATE DATABASE Instagram;

USE instagram;

select database();


CREATE TABLE USERS(
	id int auto_increment primary key,
    username varchar(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
    );
    