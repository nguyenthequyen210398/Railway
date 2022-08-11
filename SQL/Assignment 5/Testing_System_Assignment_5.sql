USE Testing_System_Assignment_3;
-- Exercise 1: Tiếp tục với Database Testing System
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
DROP VIEW  IF EXISTS view_danh_sach_nhan_vien_sale;
CREATE VIEW view_danh_sach_nhan_vien_sale AS (
	SELECT		A.AccountID, A.Username, A.FullName, A.Email
    FROM		`Account` A
    JOIN		Department D ON A.DepartmentID = D.DepartmentID
    WHERE		D.DepartmentName = 'sale'
    ORDER BY	A.AccountID);
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS view_account_tham_gia_nhieu_group_nhat;
CREATE VIEW view_account_tham_gia_nhieu_group_nhat AS (
	SELECT		A.AccountID, A.Username, A.FullName, A.Email
    FROM		`Account` A
    JOIN		GroupAccount GA ON A.AccountID = GA.AccountID
    GROUP BY	GA.AccountID
    HAVING		COUNT(GA.AccountID) = (SELECT MAX(count_GA) FROM(
										SELECT COUNT(GA.AccountID) AS count_GA FROM GroupAccount GA
                                        GROUP BY GA.AccountID) AS count_table));
    
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
DROP VIEW IF EXISTS view_cau_hoi_content_dai;
CREATE VIEW view_cau_hoi_content_dai AS (
	SELECT		QuestionID, Content, CreateDate
    FROM		Question
    WHERE		LENGTH(Content)> '300'
    ORDER BY	QuestionID);
-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
DROP VIEW IF EXISTS view_ds_phong_ban_nhieu_nv_nhat ;
CREATE VIEW view_ds_phong_ban_nhieu_nv_nhat AS (
	SELECT		D.DepartmentID, D.DepartmentName
    FROM		Department D
    JOIN		`Account` A ON D.DepartmentID = A.DepartmentID
    GROUP BY	A.DepartmentID
    HAVING		COUNT(A.DepartmentID) = (SELECT MAX(count_DID) FROM (
											SELECT COUNT(A.DepartmentID) AS count_DID FROM `Account` A
                                            GROUP BY A.DepartmentID ) AS count_table)
	ORDER BY	A.DepartmentID);
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
DROP VIEW IF EXISTS view_ch ;
CREATE VIEW view_ch AS(
	SELECT		Q.QuestionID, Q.Content, A.FullName, Q.CreateDate
    FROM		Question Q
    JOIN		`Account` A ON Q.CreatorID = A.AccountID
    WHERE		FullName LIKE 'Nguyễn%');

