USE testing_system_assignment_3;
-- Exercise 1: Tiếp tục với Database Testing System
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó

DROP PROCEDURE IF EXISTS ten_phong_ban;
DELIMITER $$
CREATE PROCEDURE ten_phong_ban (IN IN_DepartmentName VARCHAR(30))
	BEGIN
		SELECT	A.AccountID, A.Username, A.FullName, A.Email
        FROM	`Account` A 
        JOIN	Department D ON A.DepartmentID = D.DepartmentID
		WHERE 	D.DepartmentName = IN_DepartmentName;
	END $$
DELIMITER ;
CALL ten_phong_ban ('SALE');
-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS sl_account;
DELIMITER $$
CREATE PROCEDURE sl_account()
BEGIN
	SELECT		G.GroupID, G.GroupName, COUNT(GA.GroupID) AS SL_account
	FROM		`Group` G
	JOIN		GroupAccount GA ON G.GroupID = GA.GroupID
	GROUP BY	GA.GroupID
	ORDER BY	GA.GroupID;
 END $$
DELIMITER ;
-- using
CALL sl_account();
-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
SELECT		TQ.TypeID, TQ.TypeName, COUNT(Q.TypeID) AS sl_question
FROM		TypeQuestion TQ
JOIN		Question Q ON TQ.TypeID = Q.TypeID
GROUP BY	TQ.TypeID
ORDER BY	TQ.TypeID;
-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS id_type_question;
DELIMITER $$
CREATE PROCEDURE id_type_question ( OUT out_id_type_question TINYINT UNSIGNED)
	BEGIN
		SElECT		TypeID INTO out_id_type_question
		FROM		Question
		GROUP BY	TypeID
		HAVING		COUNT(TypeID) =(SELECT MAX(count_TypeID) FROM(
										SELECT COUNT(TypeID) AS count_TypeID FROM Question
										GROUP BY TypeID) AS count_table);
  END$$
  DELIMITER ;
  SET @V_out_id_type_question = '0';
  CALL id_type_question (@V_out_id_type_question);
  SELECT @V_out_id_type_question;
-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
SELECT		TypeName
FROM		TypeQuestion
WHERE		TypeID = @V_out_id_type_question;
-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS nhap_ten_group;
DELIMITER $$
CREATE PROCEDURE nhap_ten_group ( IN in_GroupName VARCHAR(50), IN in_Username VARCHAR(50))
	BEGIN
		SELECT			GA.GroupID, G.GroupName, GA.AccountID, A.Username
        FROM		GroupAccount GA
		JOIN		`Account` A ON GA.AccountID = A.AccountID
        JOIN		`Group` G ON GA.GroupID = GA.GroupID
		WHERE		G.GroupName = in_GroupName OR A.Username = in_Username
        GROUP BY	GA.GroupID
        ORDER BY	GA.GroupID;
    END $$
DELIMITER ;
-- USING
CALL nhap_ten_group ('Development','');
CALL nhap_ten_group ('','Username7');
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
DROP PROCEDURE IF EXISTS nhap_TypeQuestion;
DELIMITER $$
CREATE PROCEDURE nhap_TypeQuestion ( IN in_nhap_TypeQuestion ENUM('Essay','Multiple-Choice'))
	BEGIN
		SELECT		Q.Content
        FROM		Question Q
        JOIN		TypeQuestion TQ ON Q.TypeID = TQ.TypeID
        WHERE		(LENGTH(Q.Content) = (SELECT MAX(LENGTH(Q.Content)) FROM Question Q))
		AND (TQ.TypeName = in_nhap_TypeQuestion) ;
    END $$
DELIMITER ;    
-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa) Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng ban default là phòng ban chờ việc
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
	
    

