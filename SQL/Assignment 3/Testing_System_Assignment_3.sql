DROP DATABASE IF EXISTS Testing_System_Assignment_3;
CREATE DATABASE Testing_System_Assignment_3;

USE Testing_System_Assignment_3;

DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department`(
	DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	DepartmentName NVARCHAR(30) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS Position;
CREATE TABLE `Position`(
	PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	PositionName ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Email VARCHAR(50) NOT NULL UNIQUE KEY,
	Username VARCHAR(50) NOT NULL UNIQUE KEY,
	FullName NVARCHAR(50) NOT NULL,
	DepartmentID TINYINT UNSIGNED NOT NULL,
	PositionID TINYINT UNSIGNED NOT NULL,
	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
	FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	GroupName NVARCHAR(50) NOT NULL UNIQUE KEY,
	CreatorID TINYINT UNSIGNED,
	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID TINYINT UNSIGNED NOT NULL,
	AccountID TINYINT UNSIGNED NOT NULL,
	JoinDate DATETIME DEFAULT NOW(),
	PRIMARY KEY (GroupID,AccountID),
	FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
	FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
	TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TypeName ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
	CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content NVARCHAR(100) NOT NULL,
	CategoryID TINYINT UNSIGNED NOT NULL,
	TypeID TINYINT UNSIGNED NOT NULL,
	CreatorID TINYINT UNSIGNED NOT NULL,
	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
	FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
	FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content NVARCHAR(100) NOT NULL,
	QuestionID TINYINT UNSIGNED NOT NULL,
	isCorrect BIT DEFAULT 1,
	FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
	ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`Code` CHAR(10) NOT NULL,
	Title NVARCHAR(50) NOT NULL,
	CategoryID TINYINT UNSIGNED NOT NULL,
	Duration TINYINT UNSIGNED NOT NULL,
	CreatorID TINYINT UNSIGNED NOT NULL,
	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
	FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
	ExamID TINYINT UNSIGNED NOT NULL,
	QuestionID TINYINT UNSIGNED NOT NULL,
	FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
	FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
	PRIMARY KEY (ExamID,QuestionID)
);

-- Thêm dữ liệu vào các bảng
INSERT INTO Department(DepartmentName)
VALUES	('Marketing'),
		('Sale'),
		('Bảo vệ'),
		('Nhân sự'),
		('Kỹ thuật'),
		('Tài chính'),
		('Phó giám đốc'),
		('Giám đốc'),
		('Thư kí'),
		('No person'),
		('Bán hàng');

INSERT INTO `Position`(PositionName)
VALUES 	('Dev'),
		('Test'),
		('Scrum Master'),
		('PM');

INSERT INTO `Account`(Email , Username, FullName , DepartmentID , PositionID, CreateDate)
VALUES 	('Email1@gmail.com' ,'Username1' ,'Fullname1' , 5 , 1,'2020-03-05'),
		('Email2@gmail.com' ,'Username2' ,'Fullname2' , 1 , 2,'2020-03-05'),
		('Email3@gmail.com' , 'Username3' ,'Fullname3', 2 , 2 ,'2020-03-07'),
        ('Email4@gmail.com' , 'Username4' ,'Fullname4', 3 , 4 ,'2020-03-08'),
        ('Email5@gmail.com' , 'Username5' ,'Fullname5', 4 , 4 ,'2020-03-10'),
        ('Email6@gmail.com' , 'Username6' ,'Fullname6', 6 , 3 ,'2020-04-05'),
        ('Email7@gmail.com' , 'Username7' ,'Fullname7', 2 , 2 , NULL ),
        ('Email8@gmail.com' , 'Username8' ,'Fullname8', 8 , 1 ,'2020-04-07'),
        ('Email9@gmail.com' , 'Username9' ,'Fullname9', 2 , 2 ,'2020-04-07'),
        ('Email10@gmail.com' , 'Username10' ,'Fullname10', 10 , 1 ,'2020-04-09'),
        ('Email11@gmail.com' , 'Username11' ,'Fullname11', 10 , 1 , DEFAULT),
        ('Email12@gmail.com' , 'Username12','Fullname12' , 10 , 1 , DEFAULT);

INSERT INTO `Group`(GroupName , CreatorID , CreateDate)
VALUES 	('Testing System' , 5,'2019-03-05'),
		('Development' , 1,'2020-03-07'),
		('VTI Sale 01' , 2 ,'2020-03-09'),
		('VTI Sale 02' , 3 ,'2020-03-10'),
		('VTI Sale 03' , 4 ,'2020-03-28'),
		('VTI Creator' , 6 ,'2020-04-06'),
		('VTI Marketing 01' , 7 ,'2020-04-07'),
		('Management' , 8 ,'2020-04-08'),
		('Chat with love' , 9 ,'2020-04-09'),
		('Vi Ti Ai' , 10 ,'2020-04-10');
        
INSERT INTO `GroupAccount`(GroupID , AccountID , JoinDate)
VALUES 	(1 , 1,'2019-03-05'),
		(1 , 2,'2020-03-07'),
		(3 , 3,'2020-03-09'),
		(3 , 4,'2020-03-10'),
		(5 , 5,'2020-03-28'),
		(1 , 3,'2020-04-06'),
		(1 , 7,'2020-04-07'),
		(8 , 3,'2020-04-08'),
		(1 , 9,'2020-04-09'),
		(10 , 10,'2020-04-10');

INSERT INTO TypeQuestion(TypeName)
VALUES 	('Essay'),
		('Multiple-Choice');

INSERT INTO CategoryQuestion(CategoryName )
VALUES 	('Java'),
		('ASP.NET'),
		('ADO.NET'),
		('SQL'),
		('Postman'),
		('Ruby'),
		('Python'),
		('C++'),
		('C Sharp'),
		('PHP');

INSERT INTO Question(Content , CategoryID, TypeID , CreatorID, CreateDate)
VALUES 	('Câu hỏi về Java' , 1 ,'1' , '2' ,'2020-04-05'),
		('Câu Hỏi về PHP' , 10 ,'2' , '2' ,'2020-04-05'),
		('Hỏi về C#' , 9 ,'2' , '3' ,'2020-04-06'),
		('Hỏi về Ruby' , 6 ,'1' , '4' ,'2020-04-06'),
		('Hỏi về Postman' , 5 ,'1' , '5' ,'2020-04-06'),
		('Hỏi về ADO.NET' , 3 ,'2' , '6' ,'2020-04-06'),
		('Hỏi về ASP.NET' , 2 ,'1' , '7' ,'2020-04-06'),
		('Hỏi về C++' , 8 ,'1' , '8' ,'2020-04-07'),
		('Hỏi về SQL' , 4 ,'2' , '9' ,'2020-04-07'),
		('Hỏi về Python' , 7 ,'1' , '10' ,'2020-04-07');

INSERT INTO Answer(Content , QuestionID , isCorrect)
VALUES 	('Trả lời 01' , 1 , 0),
		('Trả lời 02' , 1 , 1),
		('Trả lời 03', 1 , 0 ),
		('Trả lời 04', 1 , 1 ),
		('Trả lời 05', 2 , 1 ),
		('Trả lời 06', 3 , 1 ),
		('Trả lời 07', 4 , 0 ),
		('Trả lời 08', 8 , 0 ),
		('Trả lời 09', 9 , 1 ),
		('Trả lời 10', 10 , 1 );

INSERT INTO Exam (`Code` , Title , CategoryID, Duration , CreatorID , CreateDate )
VALUES 	('VTIQ001' , 'Đề thi C#' ,1 , 60 , '5' ,'2019-04-05'),
		('VTIQ002' , 'Đề thi PHP' ,10 , 60 , '2' ,'2019-04-05'),
		('VTIQ003' , 'Đề thi C++' , 9 ,120 , '2' ,'2019-04-07'),
		('VTIQ004' , 'Đề thi Java' , 6 , 60, '3' ,'2020-04-08'),
		('VTIQ005' , 'Đề thi Ruby' , 5 , 120, '4' ,'2020-04-10'),
		('VTIQ006' , 'Đề thi Postman' , 3 ,60 , '6' ,'2020-04-05'),
		('VTIQ007' , 'Đề thi SQL' , 2 ,60 , '7' ,'2020-04-05'),
		('VTIQ008' , 'Đề thi Python' , 8 ,60 , '8' ,'2020-04-07'),
		('VTIQ009' , 'Đề thi ADO.NET' , 4 ,90 , '9' ,'2020-04-07'),
		('VTIQ010' , 'Đề thi ASP.NET' , 7 ,90 , '10' ,'2020-04-08');

INSERT INTO ExamQuestion(ExamID , QuestionID )
VALUES 	(1 , 5),
		(2 , 10),
		(3 , 4),
		(4 , 3),
		(5 , 7),
		(6 , 10),
		(7 , 2),
		(8 , 10),
		(9 , 9);
USE Testing_System_Assignment_3;
-- Question 2: lấy ra tất cả các phòng ban
SELECT 		* 
FROM 		`Department`;
-- Question 3: lấy ra id của phòng ban "Sale" 
SELECT		DepartmentID 
FROM		`Department` 
WHERE 		DepartmentName = 'SALE';
-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT 		* 
FROM		 `Account` 
WHERE 		LENGTH(FullName)=(SELECT MAX(LENGTH(FullName)) FROM `Account`);
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT		* 
FROM 		`Account` 
WHERE 		LENGTH(FullName)=(SELECT MAX(LENGTH(FullName)) FROM `Account`) AND DepartmentID ='3';
-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT		GroupName
FROM		`Group`
WHERE		CreateDate <'2019-12-20';
-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT		QuestionID
FROM		Answer
WHERE		
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20-12-2019
SELECT		'Code'
FROM		Exam
WHERE		Duration >= '60' AND CreateDate < '2019-12-20';
-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT		GroupName
FROM		`Group`
ORDER BY  	CreateDate DESC
LIMIT 5 ;
-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT		COUNT(AccountID)
FROM		`Account`
WHERE		DepartmentID = '2';	
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT		*
FROM		`Account`
WHERE		FullName LIKE 'D%'AND'%o';
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE		
FROM		Exam
WHERE		CreateDate < '2019-12-20';
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE
FROM		Question 
WHERE		Content LIKE 'câu hỏi%';
-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
-- email thành loc.nguyenba@vti.com.vn
UPDATE		`Account`
SET			FullName = 'Nguyễn Bá Lộc',
			Email = 'loc.nguyenba@vti.com.vn'
WHERE 		AccountID = '5';          
-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE		GroupAccount
SET			GroupID = '4'
WHERE		AccountID = '5';



