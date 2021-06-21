create table company (
company_name varchar(40)  primary key default 'SELECT COMPANY NAME',
company_city varchar(40) not null default 'ENTER COMPANY CITY'
);

insert into company value ('jio','mumbai');
insert into company value ('bsnl','satara');
insert into company value ('airtel','chennai');
insert into company value ('VI','pune');
insert into company value ('mtnl','delhi');
select * from company;

CREATE TABLE  CUSTOMER(
customer_id int primary key,
first_name varchar(40) default 'ENTER FIRST NAME',
middle_name varchar(40) default 'ENTER MIDDLE NAME',
last_name varchar(40) default 'ENTER LAST NAME',
index customer_name(first_name,middle_name,last_name),
customer_mobile varchar(40) default 'ENTER MOBILE NUMBER',
customer_email varchar(40) default 'ENTER VALID EMAIL ADDRESS',
customer_username varchar(40) unique default 'ENTER USERNAME',
customer_password varchar(40) not null default 'ENTER PASSWORD',
plot_no int,
postal_code int,
street varchar(40) default 'ENTER STREET',
index customer_address(plot_no,street, postal_code)
);

insert into customer values(1,'sachin','premchand','Bagoriya','9082142936','sachin22@gmail.com','golu','spi123',90,400051,'G R Dayma marg');
insert into customer values(2,'shweta','Rajendra','chavan','9325222081','shweta22@gmail.com','peeku','123jspm',45,415100,'mahadevi marg');
insert into customer values(3,'Aartee','Ramdas','chimate','9137824417','Artee22@gmail.com','Sonu','pist453',72,400052,'sainik marg');
insert into customer values(4,'joy','edward','jha','7769854645','jha22@gmail.com','molu','jha123',32,400086,'Ramkishan jha marg');
insert into customer values(5,'roy','prem','samariya','9083322936','roy22@gmail.com','bholu','123#@pict',11,400090,' St. Dayna marg');
insert into customer values(6,'Amar','Akbar','Anthony','9122742936','123422@gmail.com','lulu','jwala23',39,400001,'St. joseph marg');
insert into customer values(7,'rhea','santos','chakorboty','9086742936','sush2@gmail.com','fra#@','Smu007',81,4000111,' Baijan marg');
insert into customer values(8,'Hardik','naresh','srivastav','902188736','ha22@gmail.com','holu','12@Sgj',20,400091,'G R Lane');
insert into customer values(9,'Arya','prem','Banka','9082142776','bankan22@gmail.com','chinu','Ar123',8,400031,'G Lane');
insert into customer values(10,'omkar','Rajesh','Bandager','9082199936','omgar@gmail.com','dholu','crio.1',49,400051,'G R bandager Lane');
select * from customer;

create table Employee (
employ_id int primary key,
department_name varchar(40) ,
employee_experience int,
start_year int not null,
mobile_number varchar(40) ,
employ_name varchar(40) not null ,
company_name varchar(20) references company(company_name)
);

insert into Employee value (3,'technical',5,2015,'9673890777,7769854645','ramesh','jio');
insert into Employee value (7,'sales',10,2010,'9673890081,7786864645','rajesh','jio');
insert into Employee value (8,'technical',8,2012,'9673890121,7745868641','venkatesh','airtel');
insert into Employee value (5,'sales',15,2005,'8763890777,9011920739','anna','airtel');
insert into Employee value (6,'advertisement',3,2017,'9673000777,7740854645','suresh','bsnl');
insert into Employee value (1,'technical',2,2018,'9231548073,9365482107','rani','bsnl');
insert into Employee value (2,'sales',1,2019,'85014561239,7756123940','ayer','mtnl');
insert into Employee value (4,'technical',9,2011,'8373890777,7769850000','priya','mtnl');
insert into Employee value (9,'advertisement',7,2013,'9673789777,9702726976','ron','VI');
insert into Employee value (10,'sales',19,2001,'9137824417,9169854645','divesh','VI');
select * from Employee;

create table cust_service (cust_serv_id int references CUSTOMER(customer_id),
employ_serv_id int references Employee(employ_id),
type varchar(20) default 'NONE'
);

insert into cust_service values(1,3,'technical');
insert into cust_service values(2,8,'technical');
insert into cust_service values(3,1,'technical');
insert into cust_service values(4,9,'technical');
insert into cust_service values(5,4,'technical');
insert into cust_service values(6,7,'sales');
insert into cust_service values(7,5,'sales');
insert into cust_service values(8,2,'sales');
insert into cust_service values(9,6,'advertisement');
insert into cust_service values(10,9,'advertisement');
select * from cust_service;


create table bill (
	bill_id int primary key,
    bill_cust_id int references CUSTOMER(customer_id)
);

insert into bill values (2,3);
insert into bill values (4,6);
insert into bill values (8,2);
insert into bill values (5,1);
insert into bill values (3,9);
insert into bill values (10,4);
insert into bill values (7,5);
insert into bill values (1,7);
insert into bill values (9,10);
insert into bill values (6,8);
select * from bill;

create table payment (
	payment_id int primary key,
    payment_cust_id int references CUSTOMER(customer_id),
    payment_amt int,
    payment_date date,
    payment_number int,
    check (payment_amt>=10)
);

insert into payment values (2,3,150,'4-05-2020',562);
insert into payment values (4,6,650,'3-09-2020',624);
insert into payment values (8,2,199,'1-11-2020',951);
insert into payment values (5,1,450,'7-02-2020',753);
insert into payment values (3,9,550,'26-1-2020',963);
insert into payment values (10,4,50,'15-12-2020',852);
insert into payment values (7,5,399,'19-10-2020',741);
insert into payment values (1,7,1000,'20-07-2020',123);
insert into payment values (9,10,99,'14-03-2020',456);
insert into payment values (6,8,129,'8-04-2020',789);
select * from payment;

create table network_connection (
	connection_id int primary key,
    connection_cust_id int references CUSTOMER(customer_id),
    connection_company_name varchar(20) references company(company_name) ,
    network_type varchar(40) default 'SELECT NETWORK TYPE'
);

insert into network_connection values (2,3,'jio','3G');

insert into network_connection values (8,2,'airtel','4G');

insert into network_connection values (3,9,'bsnl','2G');

insert into network_connection values (7,5,'VI','3G');

insert into network_connection values (9,10,'mtnl','4G');

select * from network_connection;

create table post_paid_account(
	account_id int primary key,
	company_name varchar(20) references company(company_name),
    plan_type varchar(20) default 'SELECT PLAN-TYPE',
    plan_expire_date date,
    data_consumed int,
    check (data_consumed>=0)
);
insert into post_paid_account values (2,'jio','1 month',30/01/2020,20);
insert into post_paid_account values (4,'VI','2 month',29/02/2020,45);
insert into post_paid_account values (8,'airtel','3 month',01/04/2020,70);
insert into post_paid_account values (5,'bsnl','6 month',30/06/2020,200);
insert into post_paid_account values (3,'mtnl','1 year',29/12/2020,350);

select * from post_paid_account;

create table prepaid_account(
account_id int primary key,
company_name varchar(20) references company(company_name),
plan_exp_date date,
plan_type varchar(40) default 'SELECT PLAN-TYPE',
paid_date date
);

insert into prepaid_account values(1,'jio',05/12/2020,'3-month',05/09/2020);
insert into prepaid_account values(3,'mtnl',05/12/2020,'6-month',05/04/2020);
insert into prepaid_account values(5,'bsnl',05/12/2020,'1-month',05/11/2020);
insert into prepaid_account values(7,'VI',05/10/2020,'6-month',05/04/2020);
insert into prepaid_account values(9,'airtel',05/08/2020,'1-month',05/07/2020);

select * from prepaid_account;

create table hardware_connection(
connection_id int  primary key,
connection_cust_id int references customer(customer_id),
connection_company_name varchar(20) references company(company_name),
hardware_type varchar(20) default 'SELECT HARDWARE-TYPE',
installation varchar(20) default 'SELECT INSTALLATION',
check (hardware_type='broad_band' or hardware_type='Giga_fiber') 
);



insert  into hardware_connection values(4,6,'airtel','Giga_fiber','Large_scale');

insert  into hardware_connection values(5,1,'bsnl','broad_band','Domestic');

insert  into hardware_connection values(10,4,'jio','Giga_fiber','small_scale');

insert  into hardware_connection values(1,7,'bsnl','Giga_fiber','small_scale');

insert  into hardware_connection values(6,8,'airtel','Giga_fiber','Domestic');
Select * from hardware_connection

Q.1 Find the account details of customer whose username is fra#@  

select account_id,company_name,plan_type,plan_exp_date,paid_date
from prepaid_account,customer
where account_id = customer_id and customer_username ='fra#@';

Q.2 Display the details of customer whose customer id=9

select * from customer 
where customer_id=9;

Q.3 Create a view of customer that have airtel connection and display there hardware connection details

create view airtel_user AS
select first_name,middle_name,last_name,customer_username,connection_company_name,hardware_type,installation
from customer,hardware_connection
where customer_id=connection_cust_id and  connection_company_name='airtel';

select * from airtel_user;

Q.4 Display the details of Employee that has the highest experience.

select employ_id,employ_name,company_name,department_name,start_year,mobile_number
from Employee
where employee_experience= (select max(employee_experience) from Employee)

Q.5 Display payment details of customer whose mobile number is  902188736

select payment_cust_id,payment_amt,payment_date,payment_number 
from payment,customer
where payment_cust_id=customer_id and customer_mobile='902188736';

Q.6 before deleting any record form company table.
 
Create or replace trigger remove_name
Before delete On company
For each row
Begin 
	DBMS_OUTPUT.PUT_LINE('Are u want to remove the name from company ');
End;
Delete from company
where company_name='VI'


Q.7 after update on payment table

Create or replace trigger pay_check
after update
On payment
For each row
When(new.payment_amt=1000)
Begin
DBMS_OUTPUT.PUT_LINE('sucessfull');
End;

Update payment 
set payment_amt=1000 
where payment_cust_id=2;


Q.8 After insert on bill table.

Create or replace trigger insert_succesfully
After insert
On bill
For each row
Begin
DBMS_OUTPUT.PUT_LINE( 'bill_id added successfully to bill');
end;

Insert into bill 
values (11,8);

Q.9 Display all the customer who consume more than 100 GB data in postpaid account.

select * from customer where customer_id in (select account_id from post_paid_account where data_consumed>100);

Q.10 Display the customer details seeking customer-service from Employee who works in technical department.

select * from customer where customer_id in (select cust_serv_id from cust_service where type='technical');

Q.11 Write a query to display all the employee  for the company who belong to the city='mumbai'?

select * from employee where company_name in (select company_name from company where company_city='mumbai')

Q.12 Create a customer view table and perform insert, delete and update operations.

create view customer_view_table as
select customer_id,first_name,middle_name,last_name,customer_mobile,customer_email,customer_username,customer_password,plot_no,postal_code,street
from customer;

select * from customer_view_table;

insert into customer_view_table(customer_id,first_name,middle_name,last_name,customer_mobile,customer_email,customer_username,customer_password,plot_no,postal_code,street)
values (11,'avinash','ramdas','chimate',8779012345,'avichimate@gmail.com','avi123','dadu',51,400004,'m.j marg');

delete from customer_view_table where customer_id=5;

update customer_view_table set customer_username='babu' where street='G R Lane';

