CREATE DATABASE web_app;

use web_app;

CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);

select *
from users;

INSERT INTO users (email) VALUES('Katie34@yahoo.com'), ('Tunde@gmail.com');