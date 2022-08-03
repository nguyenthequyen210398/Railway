-- Query tạo database
DROP DATABASE IF EXISTS assingment1;
CREATE DATABASE assingment1;
-- Query sử dụng database
USE assingment1;
-- Query tạo bảng 1 tên là Deparment
DROP TABLE IF EXISTS Department;
CREATE TABLE  Department (
	DepartmentID			INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName			VARCHAR(100) NOT NULL
);
-- Query tạo bảng 2 tên là Position
DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
	PositionID				INT PRIMARY KEY AUTO_INCREMENT,
    PositionName			ENUM ('Dev','Test','Scrum Master','PM') NOT NULL
);
-- Query tạo bảng 3 tên là Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
	AccountID				INT PRIMARY KEY AUTO_INCREMENT,
    Email					VARCHAR(255),
    Username				VARCHAR(100), 
    FullName				VARCHAR(255) NOT NULL,
    DepartmentID			INT,
    PositionID				INT,
    CreateDate				DATETIME,
    CONSTRAINT fk_Department FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
    CONSTRAINT fk_Position   FOREIGN KEY (PositionID)	REFERENCES Position (PositionID)
);
-- Query tạo bảng 4 tên  là Groupp
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
	GroupID					INT PRIMARY KEY AUTO_INCREMENT,
    GroupName				VARCHAR(255) NOT NULL,
    CreatorID				INT,
    CreateDate				DATE
);
-- Query tạo bảng 5 tên  là GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
	GroupID					INT,
    AccountID				INT,
    JoinDate				DATE,
    CONSTRAINT fk_Account FOREIGN KEY (AccountID) 	REFERENCES `Account` (AccountID),
    CONSTRAINT fk_GroupID FOREIGN KEY (GroupID)		REFERENCES `Group` (GroupID)
);
-- Query tạo bảng 6 tên  là TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
	TypeID					INT PRIMARY KEY AUTO_INCREMENT,
    TypeName				ENUM('Essay','Multiple-Choice')
);
-- Query tạo bảng 7 tên là CategogyQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
	CategoryID				INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName			VARCHAR(50) NOT NULL
);
-- Query tạo bảng 8 mang tên Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
	QuestionID				INT PRIMARY KEY AUTO_INCREMENT,
    Content					VARCHAR(655) NOT NULL,
    CategoryID				INT,
    TypeID					INT,
    CreatorID				INT,
    CreateDate				DATE,
	CONSTRAINT fk_TypeQuestion FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID)
);
-- Query tạo bảng 9 tên là Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
	AnswerID				INT PRIMARY KEY AUTO_INCREMENT,
    Content					VARCHAR(6555) NOT NULL,
    QuestionID				INT,
    isCorrect				ENUM('ĐÚNG','SAI'),
    CONSTRAINT fk_Question FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);
-- Query tạo bảng 10 tên là Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
	ExamID					INT PRIMARY KEY AUTO_INCREMENT,
    Code					VARCHAR(50) NOT NULL,
    Title					VARCHAR(255) NOT NULL,
    CategoryID				INT,
    Duration				DATETIME,
    CreatorID				INT,
    CreateDate				DATE,
 CONSTRAINT fk_CategoryQuestion FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID)

);
-- Query tạo bảng 11 tên là ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
	ExamID					INT,
    QuestionID				INT,
    CONSTRAINT fk_Exam FOREIGN KEY (ExamID) REFERENCES Exam (ExamID),
    CONSTRAINT fk_Questions FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);
-- Thêm dữ liệu cho bảng  Department
INSERT INTO Department (DepartmentName)
 VALUES		('Marketting'),
			('Sale'),
            ('Bảo vệ'),
            ('Nhân sự'),
            ('Kỹ thuật');
-- Thêm dữ liệu bảng Position
 INSERT INTO Position (PositionName)
 VALUES		('Dev'),
			('Test'),
            ('Scrum Master'),
            ('PM');
-- Thêm dữ liệu bảng Account
INSERT INTO `Account` (Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUES		('Nam@gmail.com','namnv','Nguyễn Văn Nam','2','1','2022-08-04 10:12:30'),
			('Quy@gmail.com', 'quynv','Ngô Văn Qúy','1','3','2022-03-13 11:10:10'),
            ('an@gmail.com','antv','Trần Văn An','3','2','2022-03-23 12:10:10'),
            ('vy@gmail.com','vytt','Trần Thị Vy','4','4','2022-11-22 10:15:20'),
            ('tan@gmail.com','tanvv','Vũ Văn Tân','5','2','2022-05-02 12:12:26');
 -- Thêm dữ liệu bảng Group
 INSERT INTO `Group` (GroupName,CreatorID,CreateDate)
 VALUES		('coca cola','1','2022-01-02 11:12:26'),
			('pepsi','2','2022-01-02 11:12:26');
 -- Thêm dữ liệu bảng  GroupAccount
 INSERT INTO GroupAccount (GroupID,AccountID,JoinDate)
 VALUES		('2','1','2022-12-02 10:13:26'),
			('1','4','2022-12-02 11:12:25'),
            ('2','2','2022-12-02 12:16:26'),
            ('1','3','2022-12-02 11:56:36'),
            ('2','5','2022-12-02 10:35:06');
-- Thêm dữ liệu bảng TypeQuestion
 INSERT INTO TypeQuestion (TypeName)
 VALUES  	('Essay'),
			('Multiple-Choice');	
-- Thêm dữ liệu bảng  CategoryQuestion
INSERT INTO CategoryQuestion (CategoryName)
VALUES		('Java'),
			('NET'),
            ('SQL'),
            ('Postman');
-- Thêm dữ liệu bảng Question
INSERT INTO  Question (Content, CategoryID,TypeID,CreatorID,CreateDate)
VALUES          
 ('What is MySQL?','2','1','1','2022-12-02'),
 ('What are the technical features of MySQL?','3','2','2','2022-12-02'),
 ('Why MySQL is used?','1','1','3','2022-12-02'),
 ('What are Heap tables?','4','1','4','2022-12-02');
-- Thêm dữ liệu bảng Answer
INSERT INTO	Answer (Content,QuestionID,isCorrect)
VALUES
('MySQL là một DBMS mã nguồn mở được xây dựng','1','ĐÚNG'),
('MySQL là di động','2','SAI'),
('Máy chủ cơ sở dữ liệu MySQL đáng tin cậy','3','ĐÚNG'),
('Quản trị được hỗ trợ bằng Trình duyệt truy vấn MySQ','4','SAI');
-- Thêm dữ liệu bảng Exam
INSERT INTO Exam (Code,Title,CategoryID,Duration,CreatorID,CreateDate)
VALUES
('A1','Văn','1','2022-12-02 10:00','1','2022-12-02'),
('B1','Toán','2','2022-12-03 10:00','2','2022-12-02'),
('c1','Anh','3','2022-12-04 10:00','3','2022-12-02'),
('D1','Hóa','4','2022-12-04 10:00','4','2022-12-02');
-- Thêm dữ liệu bảng ExamQuestion
INSERT INTO ExamQuestion (ExamID,QuestionID)
VALUES		('1','3'),
			('2','1'),
            ('3','2'),
            ('4','4');

 