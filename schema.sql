
-- 1. Create and select database
CREATE DATABASE IF NOT EXISTS gqldemo;
USE gqldemo;


-- 2. Create Authors table
CREATE TABLE IF NOT EXISTS authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);


-- 3. Create Books table
CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    year INT,
    author_id INT NOT NULL,

    CONSTRAINT fk_books_author
        FOREIGN KEY (author_id)
        REFERENCES authors(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


-- 4. Insert sample authors if they do not exist
INSERT INTO authors (name, country)
SELECT 'Asha Patel', 'India'
WHERE NOT EXISTS (
    SELECT 1 FROM authors WHERE name = 'Asha Patel'
);

INSERT INTO authors (name, country)
SELECT 'Ravi Kumar', 'India'
WHERE NOT EXISTS (
    SELECT 1 FROM authors WHERE name = 'Ravi Kumar'
);


-- 5. Insert sample books if they do not exist

INSERT INTO books (title, year, author_id)
SELECT 'Databases 101', 2020, a.id
FROM authors AS a
WHERE a.name = 'Asha Patel'
AND NOT EXISTS (
    SELECT 1 FROM books WHERE title = 'Databases 101'
);

INSERT INTO books (title, year, author_id)
SELECT 'SQL in Practice', 2022, a.id
FROM authors AS a
WHERE a.name = 'Asha Patel'
AND NOT EXISTS (
    SELECT 1 FROM books WHERE title = 'SQL in Practice'
);

INSERT INTO books (title, year, author_id)
SELECT 'Web Services Basics', 2023, a.id
FROM authors AS a
WHERE a.name = 'Ravi Kumar'
AND NOT EXISTS (
    SELECT 1 FROM books WHERE title = 'Web Services Basics'
);


-- 6. Verify the data
SELECT * FROM authors;

SELECT
    b.id,
    b.title,
    b.year,
    a.name AS author_name,
    a.country
FROM books AS b
JOIN authors AS a
    ON b.author_id = a.id
ORDER BY b.id;
```