-- Query tạo database
CREATE DATABASE assignment;
-- Query sử dung database
USE assignment;
-- Query tạo bảng tên là Trainee
CREATE TABLE Trainee (
	trainee_id			INT,
    full_name			VARCHAR(255),
    birth_date			DATE,
    gender				VARCHAR(50),
    et_iq				INT,
    et_gmath			INT,
    training_class		VARCHAR(50),
    Evaluation_notes	TEXT
);

