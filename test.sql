

CREATE TABLE Pastries(
name varchar(50),
quantity int
);

desc Pastries;

INSERT INTO Pastries (name, quantity) 
VALUES 
	('siri', 21), 
	('ravi', 22);

INSERT INTO Pastries (name, quantity) VALUES ('Lappa', 5);

select *
from Pastries;

commit;