/*---------------*/
/* CREATE TABLE */
/*--------------*/

CREATE TABLE MEMBER (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
ADDRESS VARCHAR(50) NOT NULL,
EMAIL VARCHAR(50),
PHONE VARCHAR(13) NOT NULL,
MEMBERSHIP_TYPE VARCHAR(30) NOT NULL,
MEMBERSHIP_START DATE,
MEMBERSHIP_END DATE
);

CREATE TABLE BOOK (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
TITLE VARCHAR(50) NOT NULL,
AUTHOR VARCHAR(50) NOT NULL,
ISBN VARCHAR(30) NOT NULL,
GENRE VARCHAR(30),
PUBLICATION_YEAR DATE,
NUMBER_PAGE INT,
AVAILABILITY BOOLEAN
);

CREATE TABLE GENRE (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(30)
);

CREATE TABLE AUTHOR (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
BIRTH_DATE DATE,
NATIONALITY VARCHAR(30),
BIOGRAPHY VARCHAR(100)
);

CREATE TABLE PUBLISHER (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
ADDRESS VARCHAR(50),
CONTACT_PERSON VARCHAR(50) NOT NULL,
EMAIL VARCHAR(50) NOT NULL,
PHONE VARCHAR(13) NOT NULL
);

CREATE TABLE REVIEW (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RATING VARCHAR(10),
REVIEW_TEXT VARCHAR(200),
REVIEW_DATE DATE,
ID_BOOK INT,
ID_MEMBER INT
);

CREATE TABLE LOAN (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
LOAN_DATE DATE,
RETURN_DATE DATE,
LATE_FEE DECIMAL(10,2),
ID_BOOK INT,
ID_MEMBER INT
);

CREATE TABLE RESERVATION (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RESERVATION_DATE DATE,
PICKUP_DATE DATE,
STATUS VARCHAR(20),
ID_BOOK INT,
ID_MEMBER INT
);

/*---------------*/
/*  ALTER TABLE  */
/*--------------*/

ALTER TABLE REVIEW
ADD FOREIGN KEY (ID_BOOK) REFERENCES BOOK (ID),
ADD FOREIGN KEY (ID_MEMBER) REFERENCES MEMBER (ID);

ALTER TABLE LOAN
ADD FOREIGN KEY (ID_BOOK) REFERENCES BOOK (ID),
ADD FOREIGN KEY (ID_MEMBER) REFERENCES MEMBER (ID);

ALTER TABLE RESERVATION
ADD FOREIGN KEY (ID_BOOK) REFERENCES BOOK (ID),
ADD FOREIGN KEY (ID_MEMBER) REFERENCES MEMBER (ID);

/*---------------*/
/*    INSERTS   */
/*--------------*/

INSERT INTO MEMBER (NAME, ADDRESS, EMAIL, PHONE, MEMBERSHIP_TYPE, MEMBERSHIP_START, MEMBERSHIP_END) VALUES
('John Doe', '123 Main Street', 'john@example.com', '123456789', 'Gold', '2023-01-01', '2024-01-01'),
('Jane Smith', '456 Elm Street', 'jane@example.com', '987654321', 'Silver', '2023-02-01', '2024-02-01'),
('Alice Johnson', '789 Oak Street', 'alice@example.com', '456789123', 'Bronze', '2023-03-01', '2024-03-01'),
('Bob Brown', '321 Pine Street', 'bob@example.com', '321987654', 'Gold', '2023-04-01', '2024-04-01');

INSERT INTO BOOK (TITLE, AUTHOR, ISBN, GENRE, PUBLICATION_YEAR, NUMBER_PAGE, AVAILABILITY) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 'Fiction', '1925-04-10', 218, TRUE),
('To Kill a Mockingbird', 'Harper Lee', '9780061120084', 'Fiction', '1960-07-11', 324, TRUE),
('1984', 'George Orwell', '9780451524935', 'Science Fiction', '1949-06-08', 328, TRUE),
('The Catcher in the Rye', 'J.D. Salinger', '9780316769488', 'Fiction', '1951-07-16', 234, TRUE);

INSERT INTO GENRE (NAME) VALUES
('Fiction'),
('Science Fiction'),
('Thriller'),
('Mystery');

INSERT INTO AUTHOR (NAME, BIRTH_DATE, NATIONALITY, BIOGRAPHY) VALUES
('F. Scott Fitzgerald', '1896-09-24', 'American', 'Francis Scott Key Fitzgerald was an American novelist, essayist, and short-story writer, widely regarded as one of the greatest American writers of the 20th century.'),
('Harper Lee', '1926-04-28', 'American', 'Nelle Harper Lee was an American novelist best known for her 1960 novel To Kill a Mockingbird.'),
('George Orwell', '1903-06-25', 'British', 'George Orwell was an English novelist, essayist, journalist, and critic, whose work is marked by lucid prose, awareness of social injustice, opposition to totalitarianism, and outspoken support of democratic socialism.'),
('J.D. Salinger', '1919-01-01', 'American', 'Jerome David Salinger was an American writer best known for his 1951 novel The Catcher in the Rye.');

INSERT INTO PUBLISHER (NAME, ADDRESS, CONTACT_PERSON, EMAIL, PHONE) VALUES
('Penguin Random House', '123 Publishing Street', 'John Publisher', 'info@penguinrandomhouse.com', '123456789'),
('HarperCollins', '456 Publishing Street', 'Jane Publisher', 'info@harpercollins.com', '987654321'),
('Simon & Schuster', '789 Publishing Street', 'Alice Publisher', 'info@simonandschuster.com', '456789123'),
('Hachette Book Group', '321 Publishing Street', 'Bob Publisher', 'info@hachettebookgroup.com', '321987654');

INSERT INTO REVIEW (RATING, REVIEW_TEXT, REVIEW_DATE, ID_BOOK, ID_MEMBER) VALUES
('5/5', 'Fantastic book, couldn''t put it down!', '2024-04-01', 1, 1),
('4/5', 'Enjoyed it overall, but some parts dragged.', '2024-04-02', 2, 2),
('5/5', 'Classic dystopian novel, highly recommend!', '2024-04-03', 3, 3),
('3/5', 'Interesting read, but not my favorite.', '2024-04-04', 4, 4);

INSERT INTO LOAN (LOAN_DATE, RETURN_DATE, LATE_FEE, ID_BOOK, ID_MEMBER) VALUES
('2024-04-01', '2024-05-01', 5.00, 1, 1),
('2024-04-02', '2024-05-02', 3.00, 2, 2),
('2024-04-03', '2024-05-03', 4.50, 3, 3),
('2024-04-04', '2024-05-04', 2.50, 4, 4);

INSERT INTO RESERVATION (RESERVATION_DATE, PICKUP_DATE, STATUS, ID_BOOK, ID_MEMBER) VALUES
('2024-04-01', '2024-04-05', 'Pending', 1, 1),
('2024-04-02', '2024-04-06', 'Pending', 2, 2),
('2024-04-03', '2024-04-07', 'Pending', 3, 3),
('2024-04-04', '2024-04-08', 'Pending', 4, 4);



