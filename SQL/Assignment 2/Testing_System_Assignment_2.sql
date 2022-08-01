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
    PositionName			ENUM ('Dev','Test','Scrum Master','PM')
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