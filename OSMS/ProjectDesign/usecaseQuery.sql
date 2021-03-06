drop database justQuery;
create database justQuery;
use justQuery;

/*
2.1 Users Management Use Cases
Actors: Administrator
*/

#Create new user
insert into user(userName, password, firstName, lastName, gender, speciality, departmentID) values
('AliceWonderland', '1234567', 'Alice', 'Wonderland', 'male', 'database', select departmentID from department where deName = 'marketing');

#Search certain users
select *
from user
where userName = 'AliceWonderland';

#Change user's profile
update user
set  speciality = 'programming'
where userName = 'AliceWonderland';

#Delete user
delete from user
where userName = 'AliceWonderland';

/*
2.2 Supplies Management Use Cases
Actors: Employee, Manager
*/

#Search items
select *
from item
where itemName like '%printer%';

#Apply for the items
insert into application(appName, proposedate, resultdate, status, quantity, description, itemID，managerID, employeeID) values
('meeting room purchase', curdate(), null,'submited', '10', 'The new meeting room need new equipments', select itemID from item where itemName = 'pen','1', '1');

#Manager lists all applications
select *
from manager m, application a, employee e
where m.managerID = a.managerID and a.employeeID = e.employeeID;

#Approve or reject application
update application
set status = 'approved'
where appName = 'meeting room purchase';


#Check the application status
select status
from application 
where appName = 'meeting room purchase' and employeeID = '1';


