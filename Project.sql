

use a123
CREATE TABLE Roles 
(
Roles_Id VARCHAR(10) CONSTRAINT rolesPK PRIMARY KEY,
Role_Description VARCHAR(100),
Role_Name VARCHAR(50)
);

CREATE TABLE Student  
(
Student_id VARCHAR (11) CONSTRAINT studentPK PRIMARY KEY,
Password VARCHAR (50),
Section VARCHAR(3),
Contact varchar(10) NOT NULL,
Name VARCHAR (50),
Class_Name VARCHAR(10),
Role_Id VARCHAR (10) FOREIGN KEY REFERENCES roles(roles_id)
);
CREATE TABLE Course 
(
Course_ID VARCHAR(6) CONSTRAINT coursePK PRIMARY KEY,
Course_Name VARCHAR(60),
Student_Id VARCHAR (11) FOREIGN KEY REFERENCES student(Student_Id)
);
CREATE TABLE Teacher
(
Teacher_Id VARCHAR(11) CONSTRAINT teacherPK PRIMARY KEY,
Email VARCHAR(60),
Name VARCHAR(60),
Password VARCHAR(60),
Course_Id VARCHAR (6) FOREIGN KEY REFERENCES course(Course_Id)

);

CREATE TABLE Assignment 
(
Assignment_Id VARCHAR(10) CONSTRAINT assignmentPK PRIMARY KEY,
Deadline DATE,
Question VARCHAR(250),
Course_Id VARCHAR (6) FOREIGN KEY REFERENCES course(Course_Id),
Teacher_Id VARCHAR (11) FOREIGN KEY REFERENCES teacher(Teacher_Id)
);

CREATE TABLE Team
(
Team_No VARCHAR(10) PRIMARY KEY,
Student_Leader_Name VARCHAR(50),
Team_Name VARCHAR(30),
Student_Id VARCHAR (11) FOREIGN KEY REFERENCES student(Student_Id),
Assignment_Id VARCHAR (10) FOREIGN KEY REFERENCES assignment(Assignment_Id),
Teacher_Id VARCHAR (11) FOREIGN KEY REFERENCES teacher(Teacher_Id)

);



CREATE TABLE BuddyMentor
(
Mentor_student_id VARCHAR(11) CONSTRAINT mentorPK PRIMARY KEY,
Name CHAR,
Contact INT,
Student_id VARCHAR (11) FOREIGN KEY REFERENCES student(Student_id)

);


CREATE TABLE Remarks 
(
Remarks VARCHAR(100) ,
Student_Id VARCHAR (11) FOREIGN KEY REFERENCES student(Student_Id),
Mentor_Student_Id VARCHAR (11) FOREIGN KEY REFERENCES buddymentor(Mentor_Student_Id),
Assignment_Id VARCHAR (10) FOREIGN KEY REFERENCES assignment(Assignment_Id),
CONSTRAINT PK_studid PRIMARY KEY (Student_Id)

);

CREATE TABLE Submission 
(
Answer VARCHAR(500) ,
Assignment_Id VARCHAR (10) FOREIGN KEY REFERENCES assignment(Assignment_Id),
Team_No VARCHAR (10) FOREIGN KEY REFERENCES team(Team_No),
Teacher_Id VARCHAR (11) FOREIGN KEY REFERENCES teacher(Teacher_Id),
Course_Id VARCHAR (6) FOREIGN KEY REFERENCES course(Course_Id),
               CONSTRAINT PK_AssignmentId PRIMARY KEY (Assignment_Id)
               
);
CREATE TABLE Grades 
(
Feedback VARCHAR(500),
Grades VARCHAR(2),
Student_Id VARCHAR (11) FOREIGN KEY REFERENCES student(Student_Id),
Assignment_Id VARCHAR (10) FOREIGN KEY REFERENCES assignment(Assignment_Id),
CONSTRAINT PK_Students1 PRIMARY KEY (Student_Id)

);
CREATE TABLE Allots
(
Teacher_Id VARCHAR (11) FOREIGN KEY REFERENCES teacher(Teacher_Id),
Team_No VARCHAR (10) FOREIGN KEY REFERENCES team(Team_No),

Assignment_Id VARCHAR (10) FOREIGN KEY REFERENCES assignment(Assignment_Id),
CONSTRAINT PK_Team PRIMARY KEY (Team_No)

);
CREATE TABLE Gives
(
Teacher_Id VARCHAR (11) FOREIGN KEY REFERENCES teacher(Teacher_Id),
Feedback VARCHAR (100) ,
Student_Id VARCHAR (11) FOREIGN KEY REFERENCES student(Student_Id),
CONSTRAINT PK_Students2 PRIMARY KEY (Student_Id,Teacher_id),


);

ALTER TABLE Student 
ADD Team_No VARCHAR (10) CONSTRAINT teamnoFK FOREIGN KEY(Team_no) REFERENCES team(Team_No);
ALTER TABLE Student 
ADD Mentor_Student_Id VARCHAR (11) CONSTRAINT mentorFK FOREIGN KEY REFERENCES buddymentor(Mentor_Student_Id);
/*ALTER TABLE Student 
ADD Role_Id VARCHAR (10) CONSTRAINT roleFK FOREIGN KEY (Role_Id) REFERENCES roles(Role_Id);*/


ALTER TABLE Assignment
ADD Team_No VARCHAR (10) CONSTRAINT assignTeamFK FOREIGN KEY (Team_No) REFERENCES team(Team_No)