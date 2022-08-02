-- Querry tạo database
DROP DATABASE IF EXISTS fresher;
CREATE DATABASE Fresher;
-- Querry sử dụng database
USE fresher;
-- Querry tạo bảng Trainee
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee (
	TraineeID				INT ,
    Full_Name				VARCHAR(255) NOT NULL,
    Birth_Date				DATE,
    Gender					ENUM("male","female","unknown"),
    ET_IQ					INT(21) NOT NULL,
    ET_Gmath				INT(21) NOT NULL,
    ET_English				INT(51) NOT NULL,
    Training_Class			VARCHAR(50) NOT NULL,
    Evaluation_Notes		TEXT
);
ALTER TABLE Trainee
ADD	 VTI_Account				VARCHAR(50) NOT NULL;
ALTER TABLE Trainee
ADD PRIMARY KEY (TraineeID);
