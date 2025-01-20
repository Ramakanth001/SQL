CREATE TABLE students (
	id int auto_increment PRIMARY KEY,
    first_name varchar(30)
    );
    
CREATE TABLE papers(
	title varchar(500),
    grade int,
    student_id int,
    FOREIGN KEY(student_id) REFERENCES students(id)
    );

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);


-- Question 1: Retrieve the first name of students along with the titles and grades of the papers they wrote, ordered by grade in descending order.
SELECT first_name, title, grade
FROM students
JOIN papers
ON papers.student_id = students.id
ORDER BY grade DESC;

-- Question 2: Display all students along with their papers, even if they have not written any papers.
SELECT first_name, title, grade
FROM students
LEFT JOIN papers
ON students.id = papers.student_id;

-- Question 3: Display all students along with their paper titles and grades, replacing missing titles with 'MISSING' and grades with 0 for students who have not written papers.
SELECT first_name, IFNULL(title, 'MISSING') AS title, IFNULL(grade, 0) AS grade
FROM students
LEFT JOIN papers
ON papers.student_id = students.id;

-- Question 4: Calculate the average grade for each student, ensuring students who haven't written papers have an average grade of 0. Display each student's name along with their average grade.
SELECT first_name, IFNULL(AVG(grade), 0) AS average
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY first_name;

-- Question 5: Determine whether each student is passing or failing based on their average grade, with a passing grade defined as greater than 75. Display the student's name, their average grade, and their passing status, sorted by average grade in descending order.
SELECT first_name, IFNULL(AVG(grade), 0) AS average,
	CASE
		WHEN AVG(grade) > 75
			THEN 'PASSING'
		ELSE 'FAILING'
	END AS passing_status
FROM papers
RIGHT JOIN students
ON papers.student_id = students.id
GROUP BY first_name
ORDER BY average DESC;