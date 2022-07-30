-- Query tạo database
CREATE DATABASE assingment1;

-- Query sử dụng database
USE assingment1;

-- Query tạo bảng tên là Deparment
CREATE TABLE Deparment (
	deparment_id		INT PRIMARY KEY AUTO_INCREMENT,
    deparment_name		VARCHAR(100)
);

-- Query tạo bảng tên là Position
CREATE TABLE Position (
	position_id			INT PRIMARY KEY AUTO_INCREMENT,
    position_name		VARCHAR(50)
);

-- Query tạo bảng tên là Account
CREATE TABLE `Account` (
	account_id			INT PRIMARY KEY AUTO_INCREMENT,
    email				VARCHAR(255),
    user_name			VARCHAR(100),
    full_name			VARCHAR(255),
    deparmen_id			INT,
    position_id			INT,
    create_date			DATE
);

-- Query tạo bảng tên là Groupp
CREATE TABLE `Group` (
	group_id		INT PRIMARY KEY AUTO_INCREMENT,
    group_name		VARCHAR(255),
    creator_id		INT,
    create_date		DATE
);

-- Query tạo bảng tên là GroupAccount
CREATE TABLE GroupAccount (
	group_id		INT PRIMARY KEY AUTO_INCREMENT,
    account_id		INT,
    join_date		DATE
);

-- Query tạo bảng tên là TypeQuestion
CREATE TABLE TypeQuestion (
	type_id			INT PRIMARY KEY AUTO_INCREMENT,
    type_name		VARCHAR(50)
);

-- Query tạo bảng tên là CategogyQuestion
CREATE TABLE CategogyQuestion (
	categogy_id		INT PRIMARY KEY AUTO_INCREMENT,
    catelogy_name	VARCHAR(50)
);

-- Query tạo bảng mang tên Question
CREATE TABLE Question (
	question_id		INT PRIMARY KEY AUTO_INCREMENT,
    content			VARCHAR(6555),
    categogy_id		INT,
    type_id			INT,
    creator_id		INT,
    creator_date	DATE
);

-- Query tạo bảng tên là Answer
CREATE TABLE Answer (
	answer_id		INT PRIMARY KEY AUTO_INCREMENT,
    content			VARCHAR(6555),
    question_id		INT,
    is_correct		VARCHAR(50)
);

-- Query tạo bảng tên là Exam
CREATE TABLE Exam (
	Exam_id			INT PRIMARY KEY AUTO_INCREMENT,
    `code`			VARCHAR(50),
    tile			VARCHAR(255),
    categogy_id		INT,
    duration		DATETIME,
    creator_id		INT,
    create_date		DATE
);

-- Query tạo bảng tên là ExamQuestion
CREATE TABLE ExamQuestion (
	exam_id			INT,
    question_id		INT
);