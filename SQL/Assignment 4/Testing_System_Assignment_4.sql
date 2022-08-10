USE Testing_System_Assignment_3;
-- Exercise 1: Join
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT		A.AccountID, A.Email, A.Username, A.FullName, D.DepartmentName
FROM		`Account` A
INNER JOIN	Department D ON A.DepartmentID = D.DepartmentID
ORDER BY	A.AccountID;
-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT		*
FROM		`Account`
WHERE		CreateDate > '2010-12-20';
-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT		A.AccountID, A.Email, A.Username, A.FullName, A.DepartmentID, A.CreateDate, P.PositionName
FROM		`Account` A
JOIN		Position P ON A.PositionID = P.PositionID
WHERE		P.PositionName = 'Dev'
ORDER BY	A.AccountID;
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT		D.DepartmentName
FROM		Department  D
JOIN		`Account`  A ON D.DepartmentID = A.DepartmentID
HAVING		COUNT(A.DepartmentID) > 3;
-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT		Q.QuestionID, Q.Content, COUNT(EQ.QuestionID) AS slsd
FROM		Question Q
JOIN		ExamQuestion EQ ON Q.QuestionID = EQ.QuestionID
GROUP BY	EQ.QuestionID
HAVING		COUNT(EQ.QuestionID) = (SELECT MAX(count_EQ) FROM (
									SELECT COUNT(EQ.QuestionID) AS count_EQ FROM ExamQuestion EQ
                                    GROUP BY EQ.QuestionID) AS count_table );

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT		CQ.CategoryID, CQ.CategoryName, COUNT(Q.CategoryID) AS slsd
FROM		CategoryQuestion CQ
JOIN		Question Q ON CQ.CategoryID = Q.CategoryID
GROUP BY	Q.CategoryID
ORDER BY	Q.CategoryID;
-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT		Q.QuestionID, Q.Content, COUNT(A.QuestionID) AS slsd
FROM		Question Q
JOIN		Answer A ON Q.QuestionID = A.QuestionID
GROUP BY	A.QuestionID
ORDER BY	A.QuestionID;
-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT		Q.QuestionID, Q.Content, COUNT(A.QuestionID) AS slsd
FROM		Question Q
JOIN		Answer A ON Q.QuestionID = A.QuestionID
GROUP BY	A.QuestionID
HAVING		COUNT(A.QuestionID) = (SELECT MAX(count_A) FROM(
									SELECT COUNT(A.QuestionID) AS count_A FROM Answer A
                                    GROUP BY A.QuestionID) AS count_table);
                                
-- Question 9: Thống kê số lượng account trong mỗi group
SELECT		G.GroupID, G.GroupName, COUNT(GA.GroupID) AS slaccount
FROM		`Group` G
JOIN		GroupAccount GA ON G.GroupID = GA.GroupID
GROUP BY	GA.GroupID
ORDER BY	GA.GroupID;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT		P.PositionID, P.PositionName, COUNT(A.PositionID) AS people
FROM		Position P
JOIN		`Account` A ON P.PositionID = A.PositionID
GROUP BY	A.PositionID
HAVING		COUNT(A.PositionID) = (SELECT MIN(count_A) FROM(
									SELECT COUNT(A.PositionID) AS count_A FROM `Account`
                                    GROUP BY A.PositionID) AS count_table);
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT		Q.Content, Q.CreateDate, CQ.CategoryName, TQ.TypeName, A.Content, A.isCorrect
FROM		Question Q
JOIN		CategoryQuestion CQ ON Q.CategoryID = CQ.CategoryID
JOIN		TypeQuestion TQ ON Q.TypeID = TQ.TypeID
JOIN        Answer A ON Q.QuestionID = A.QuestionID;
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT		TQ.TypeID, TQ.TypeName, COUNT(Q.TypeID) AS slch
FROM		TypeQuestion TQ
JOIN		Question Q ON TQ.TypeID = Q.TypeID
GROUP BY	Q.TypeID;

-- Question 14:Lấy ra group không có account nào
SELECT		G.GroupName
FROM		`Group` G
LEFT JOIN	GroupAccount GA ON G.GroupID = GA.GroupID
WHERE		GA.GroupID IS NULL;
-- Question 15: Lấy ra group không có account nào
SELECT		G.GroupName
FROM		`Group` G
LEFT JOIN	GroupAccount GA ON G.GroupID = GA.GroupID
WHERE		GA.GroupID IS NULL;
-- Question 16: Lấy ra question không có answer nào
SELECT		Q.Content
FROM		Question Q
LEFT JOIN	Answer A ON Q.QuestionID = A.QuestionID
WHERE		A.QuestionID IS NULL;

