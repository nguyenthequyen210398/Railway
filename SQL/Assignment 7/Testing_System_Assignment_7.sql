-- Exercise 1: Tiếp tục với Database Testing System
USE testing_system_assignment_3;
-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước
DROP TRIGGER IF EXISTS trigger_q1;
DELIMITER $$
CREATE TRIGGER trigger_q1
BEFORE INSERT ON `Group`
FOR EACH ROW
	BEGIN
		DECLARE vCreateDate DATETIME;
        SET	vCreateDate = DATE_SUB(NOW(), INTERVAL 1 YEAR);
        IF (NEW.CreateDate <= vCreateDate) THEN
			SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = ' Không thể thêm bản ghi vì ngày tạo của dữ liệu không được quá 1 năm';
         END IF;   
	END $$
 DELIMITER ;   
 SELECT DATE_SUB(NOW(), INTERVAL 1 YEAR);
 INSERT INTO `Group` (`GroupName`, `CreatorID`, `CreateDate`)
 VALUE		('4','1','2021-08-23 21:09:58');

-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào department "Sale" nữa, khi thêm thì hiện ra thông báo "Department "Sale" cannot add more user"
DROP TRIGGER IF EXISTS trigger_q2;
DELIMITER $$
CREATE TRIGGER trigger_q2
BEFORE INSERT ON  `Account`
FOR EACH ROW
	BEGIN
		DECLARE v_DepartmentID TINYINT;
        SELECT	 D.DepartmentID INTO v_DepartmentID
        FROM	 Department D
        JOIN	 `Account` A ON D.DepartmentID = A.DepartmentID
        WHERE	 DepartmentName = 'Sale';
		IF (NEW.DepartmentID = v_DepartmentID) THEN
			SIGNAL SQLSTATE '13545'
            SET MESSAGE_TEXT = 'Department "Sale" cannot add more user';
		END IF;
    END $$
DELIMITER ;
INSERT INTO `Account` (Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUES		('Nam@gmaNil.com','namNnv','Nguyễn Văn Nam','2','1','2022-08-04 10:12:30');
-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS trigger_q3;
DELIMITER $$
CREATE TRIGGER trigger_q3
BEFORE INSERT ON GroupAccount
FOR EACH ROW
	BEGIN
		DECLARE	V_count_GroupID TINYINT;
		SELECT COUNT(GA.GroupID) INTO V_count_GroupID
		FROM		 GroupAccount GA
		WHERE		GA.GroupID = NEW.GroupID;
       
		IF (V_count_GroupID > 5) THEN
			SIGNAL SQLSTATE '12243'
			SET MESSAGE_TEXT = 'Không thể thêm dữ liệu vì group có nhiều là 5 user';
		END IF;  
    END $$
DELIMITER ;
SELECT * FROM  `GroupAccount`;
INSERT INTO  `GroupAccount` (`GroupID`,`AccountID`)
VALUE		('1','6');
-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS trigger_4;
DELIMITER $$
CREATE TRIGGER trigger_4
BEFORE INSERT ON `ExamQuestion`
FOR EACH ROW
	BEGIN
		DECLARE v_ExamID TINYINT;
        SELECT COUNT(EQ.ExamID) INTO v_ExamID 
        FROM	ExamQuestion EQ
        WHERE	EQ.ExamID = NEW.ExamID;
        IF (v_ExamID > 10) THEN
			SIGNAL SQLSTATE '11223'
			SET MESSAGE_TEXT = 'Không thể thêm câu hỏi vì đề thi tối đa 10 câu';
        END IF ;
    END $$
    DELIMITER ;
    INSERT INTO `examquestion`(`ExamID`, `QuestionID`) VALUES (6, 2);
	INSERT INTO `examquestion`(`ExamID`, `QuestionID`) VALUES (6,1);
    INSERT INTO `examquestion`(`ExamID`, `QuestionID`) VALUES (6, 3);
    INSERT INTO `examquestion`(`ExamID`, `QuestionID`) VALUES (6, 4);
	INSERT INTO `examquestion`(`ExamID`, `QuestionID`) VALUES (6, 5); 
    INSERT INTO `examquestion`(`ExamID`, `QuestionID`) VALUES (6, 6);    
    INSERT INTO `examquestion`(`ExamID`, `QuestionID`) VALUES (6,7);    
    INSERT INTO `examquestion`(`ExamID`, `QuestionID`) VALUES (6,9); 
   INSERT INTO  Question (Content, CategoryID,TypeID,CreatorID,CreateDate)
   VALUES          ('TestSss?','2','1','1','2022-12-02');
INSERT INTO `examquestion`(`ExamID`, `QuestionID`) VALUES (6,14); 
       
-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
-- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
-- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông
-- tin liên quan tới user đó
DROP TRIGGER IF EXISTS trigger_q5;
DELIMITER $$
CREATE TRIGGER trigger_q5
BEFORE DELETE ON `Account`
FOR EACH ROW
	BEGIN
		DECLARE V_Email VARCHAR(50);
        SET V_Email = 'admin@gmail.com';
		IF( OLD.EMAIL) = V_Email THEN
			SIGNAL SQLSTATE '12321'
			SET MESSAGE_TEXT = 'đây là tài khoản admin, không cho phép  xóa'; 
		END IF;
    END$$
DELIMITER ;
-- TEST 
INSERT INTO `Account` (Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUES		('Nam@gmail.com','namnv','Nguyễn Văn Nam','2','1','2022-08-04 10:12:30');
 DELETE FROM`Account` A WHERE A.Email = 'Nam@gmail.com';
 
DELETE FROM`Account` A WHERE A.Email = 'admin@gmail.com';
-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
-- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
DROP TRIGGER IF EXISTS trigger_q6;
DELIMITER $$
CREATE TRIGGER trigger_q6
BEFORE INSERT ON `Account`
FOR EACH ROW
	BEGIN
		DECLARE V_department VARCHAR(50);
        SELECT D.departmentID INTO V_department
        FROM	Department D
        WHERE	D.DepartmentName = 'waiting Department';
        IF ( NEW.departmentID IS NULL) THEN
			SET NEW.departmentID = V_department;
         END IF;   
    END$$
    --  Test
 INSERT INTO `Account` (`Email`, `Username`, `FullName`, `PositionID`,`CreateDate`)
 VALUES ('1','1', '1', '1', '2019-07-15 00:00:00');
Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi
question, trong đó có tối đa 2 đáp án đúng.
-- Question 8: Viết trigger sửa lại dữ liệu cho đúng:
-- Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
-- Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database
Alter TABLE	`Account`	ADD		Gender VARCHAR(50);
DROP TRIGGER IF EXISTS trigger_q8;
DELIMITER $$
CREATE TRIGGER trigger_q8
BEFORE INSERT ON `Account`
FOR EACH ROW
	BEGIN
		IF	(NEW.Gender = 'nam') THEN
        SET NEW.Gender = 'M';
        ELSEIF NEW.Gender = 'nữ' THEN
        SET NEW.Gender = 'N';
        ELSEIF NEW.Gender = 'chưa xác định' THEN
        SET NEW.Gender = 'U';
        END IF;
    END$$
DELIMITER ; 
--  test 
INSERT INTO `Account`(Email , Username, FullName , DepartmentID , PositionID, CreateDate,Gender)
VALUES 	('Email1@gmail.com' ,'Username' ,'Fullname1' , 5 , 1,'2020-03-05','nam');    
-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DROP TRIGGER IF EXISTS trigger_q9;
DELIMITER $$
CREATE TRIGGER  trigger_q9
BEFORE DELETE ON Exam
FOR EACH ROW
	BEGIN
		DECLARE V_CreateDate DATETIME;
        SET V_CreateDate = DATE_SUB(NOW(), INTERVAL 2 DAY);
        IF OLD.CreateDate > V_CreateDate THEN
			SIGNAL SQLSTATE '13543'
            SET MESSAGE_TEXT = ' không thể xóa bài thi ';
          END IF;
     END$$
DELIMITER ; 
-- TEST    
SELECT  DATE_SUB(NOW(), INTERVAL 2 DAY);
UPDATE `testing_system_assignment_3`.`exam` SET `CreateDate` = '2022-08-25';
DELETE FROM exam E WHERE E.ExamID =1;
-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
-- question khi question đó chưa nằm trong exam nào
-- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"
SELECT		*
FROM		Exam
CASE
	WHEN Duration <= 30 THEN 'Short time'

WHEN Duration <= 60 THEN 'Medium time'
ELSE 'Longtime'
END AS Duration, e.CreateDate, e.Duration

FROM exam e;

Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
là the_number_user_amount và mang giá trị được quy định như sau:
Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher
Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào
không có user thì sẽ thay đổi giá trị 0 thành "Không có User"

