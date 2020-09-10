insert into Roles(Roles_Id,Role_Description,Role_Name) values (1,'Research and anlysis','Researcher');
insert into Roles(Roles_Id,Role_Description,Role_Name) values (2,'Manages the project','Project Manager');

alter table Student alter column Contact varchar(10);

insert into Student(Student_id,Password,Section,Contact,Name,Class_Name,Role_Id,Team_No,Mentor_Student_Id) values ('BT18GCS040','nu#123','B2',7993002555,'Vivek','CS',1,'Team1','BT16GCS001');
insert into Student(Student_id,Password,Section,Contact,Name,Class_Name,Role_Id,Team_No,Mentor_Student_Id) values ('BT18GCS028','pass#123','B2',8885815155,'Srivatsav','CS',2,'Team1','BT16GCS001');
insert into Student(Student_id,Password,Section,Contact,Name,Class_Name,Role_Id,Team_No,Mentor_Student_Id) values ('BT18GCS064','uni#123','B2',9571025834,'Aneesh','CS',1,'Team2','BT18GCS002');
insert into Student(Student_id,Password,Section,Contact,Name,Class_Name,Role_Id,Team_No,Mentor_Student_Id) values ('BT18GBT063','hello#123','B6',713545044,'Jitender','BT',2,'Team2','BT18GCS002');

select *
from Student

drop table Student
drop table Roles