#!/bin/bash

function createtable
{

db2 "CREATE TABLE Aquarium(aquarium_ID char(5) NOT NULL, aquarium_name char(15), primary key(aquarium_ID))"

db2 "CREATE TABLE Food(food_ID char(5) NOT NULL, food_name char(20), food_qtyGrams int, primary key(food_ID))"

db2 "CREATE TABLE Fish(fish_ID char(5) NOT NULL, fish_name char(50) , fish_qty int, food_ID char(5), primary key(fish_ID),foreign key FDFK(food_ID) references Food)"

db2 "CREATE TABLE Tank(tank_ID char(5) NOT NULL, tank_size int, tank_filter char(55), maintaince_dueDate varchar(8),fish_ID char(5), aquarium_ID char(5), primary key(tank_ID), foreign key FFK(fish_ID) references Fish, foreign key AFK(aquarium_ID) references Aquarium)"

db2 "CREATE TABLE Department(dept_ID char(5) NOT NULL, dept_name char(15), dept_size int, primary key(dept_ID))"

db2 "CREATE TABLE Employee(employee_ID char(5) NOT NULL, employee_name char(15), employee_tel varchar(15), employee_streetnmb int, employee_streetname char(50),employee_city char(15), employee_postal char(6), employee_role char(10), dept_ID char(5), primary key(employee_ID), foreign key DFK(dept_ID) references Department)"

db2 "CREATE TABLE Customer(customer_ID char(5) NOT NULL, customer_name char(15), customer_tel varchar(15), customer_streetnmb int, customer_streetname char(50),customer_city char(15), customer_postal char(6), primary key(customer_ID))"

db2 "CREATE TABLE Sales(sale_ID char(5) NOT NULL, employee_ID char(5), customer_ID char(5),tickets_sold int, total_sales decimal, primary key (sale_ID),foreign key EFK(employee_ID) references Employee, foreign key CFK(customer_ID) references Customer)"

}




function droptable
{
       db2 "DROP TABLE Aquarium"
       db2 "DROP TABLE Food"
       db2 "DROP TABLE Fish"
       db2 "DROP TABLE Tank"
       db2 "DROP TABLE Department"
       db2 "DROP TABLE Employee"
       db2 "DROP TABLE Customer"
       db2 "DROP TABLE Sales"
}


function datadictionary
{
       db2 "DESCRIBE TABLE Aquarium"
       db2 "DESCRIBE TABLE Food"
       db2 "DESCRIBE TABLE Fish"
       db2 "DESCRIBE TABLE Tank"
       db2 "DESCRIBE TABLE Department"
       db2 "DESCRIBE TABLE Employee"
       db2 "DESCRIBE TABLE Customer"
       db2 "DESCRIBE TABLE Sales"
}

function tablevalues
{

       db2 "SELECT aquarium_ID, aquarium_name FROM Aquarium"

       db2 "SELECT food_ID, food_name, food_qtyGrams FROM Food"

       db2 "SELECT fish_ID, fish_name, fish_qty, food_ID FROM Fish"

       db2 "SELECT tank_ID, tank_size, tank_filter, maintaince_dueDate , fish_ID, aquarium_ID FROM Tank"

       db2 "SELECT dept_ID, dept_name, dept_size FROM Department"

       db2 "SELECT employee_ID, employee_name, employee_tel, employee_streetnmb, employee_streetname ,employee_city , employee_postal , employee_role, dept_ID char FROM Employee"
       
       db2 "SELECT customer_ID, customer_name, customer_tel, customer_streetnmb, customer_streetname, customer_city, customer_postal FROM Customer"
      
      db2 "SELECT sale_ID, employee_ID, customer_ID, tickets_sold, total_sales FROM Sales"
}


function listtable
{

       db2 "LIST TABLES"
}


function pop
{

db2 "INSERT INTO Aquarium VALUES('A1', 'Nemos World')"


db2 "INSERT INTO Food VALUES('F1', 'Daphnia',                 200)"
db2 "INSERT INTO Food VALUES('F2', 'Tropical Flake',        100)"
db2 "INSERT INTO Food VALUES('F3', 'Invertebrates ',         100)"
db2 "INSERT INTO Food VALUES('F4', 'Vegetable Flake',     300)"
db2 "INSERT INTO Food VALUES('F5', 'Annelid Worms',      400)"
db2 "INSERT INTO Food VALUES('F6', 'Standard Flake',       200)"
db2 "INSERT INTO Food VALUES('F7', 'Shelled Shrimps',      200)"
db2 "INSERT INTO Food VALUES('F8', 'Maggots',                 100)"
db2 "INSERT INTO Food VALUES('F9', 'Algae Flakes',          150)"
db2 "INSERT INTO Food VALUES('F10','Sinking Pellet',        200)"
db2 "INSERT INTO Food VALUES('F11','Water Fleas',           250)"


db2 "INSERT INTO Fish VALUES('001', 'Black Tetra',                        14, 'F1')"
db2 "INSERT INTO Fish VALUES('002', 'Bloodfin Tetra',                   39, 'F2')"
db2 "INSERT INTO Fish VALUES('003', 'Bleeding Heart Tetra',         23, 'F3')"
db2 "INSERT INTO Fish VALUES('004', 'Bucktooth Tetra',                45, 'F2')"
db2 "INSERT INTO Fish VALUES('005', 'Glowing Tetra',                   16, 'F4')"
db2 "INSERT INTO Fish VALUES('006', 'Common Hatchetfish',        31, 'F5')"
db2 "INSERT INTO Fish VALUES('007', 'Silver Hatchetfish',             22, 'F6')"
db2 "INSERT INTO Fish VALUES('008', 'Marbled Headstander',       38, 'F4')"
db2 "INSERT INTO Fish VALUES('009', 'Silver Dollar',                     19, 'F2')"
db2 "INSERT INTO Fish VALUES('010', 'Red Bellied Pacu',              46, 'F1')"
db2 "INSERT INTO Fish VALUES('011', 'Spilo',                               21, 'F5')"
db2 "INSERT INTO Fish VALUES('012', 'Blue Dolphin Cichlid',      12, 'F3')"
db2 "INSERT INTO Fish VALUES('013', 'Afra Cichlid',                    18, 'F5')"
db2 "INSERT INTO Fish VALUES('014', 'Rusty Cichlid',                  19, 'F10')"
db2 "INSERT INTO Fish VALUES('015', 'Frontosa Cichlid',              34, 'F9')"
db2 "INSERT INTO Fish VALUES('016', 'African Butterfly Cichlid', 29, 'F3')"
db2 "INSERT INTO Fish VALUES('017', 'Bleeding Heart Tetra',       13, 'F4')"
db2 "INSERT INTO Fish VALUES('018', 'Bucktooth Tetra',              25, 'F4')"
db2 "INSERT INTO Fish VALUES('019', 'Glowing Tetra',                 16, 'F4')"


db2 "INSERT INTO Tank VALUES('1', 1000, 'Aqueon Quiet Flow 30 Aquarium Power Filters',    '01/01/13', '001', 'A1')"
db2 "INSERT INTO Tank VALUES('2', 10000,'Fluval External Canister Aquarium Filters',      '01/03/13', '002', 'A1')"
db2 "INSERT INTO Tank VALUES('3', 100,  'EHEIM Professional Wet/Dry Canister Filter',     '01/05/13', '003', 'A1')"
db2 "INSERT INTO Tank VALUES('4', 2000, 'Aqueon Quiet Flow 30 Aquarium Power Filters',    '01/09/13', '004', 'A1')"
db2 "INSERT INTO Tank VALUES('5', 20000,'Fluval External Canister Aquarium Filters',      '01/11/13', '005', 'A1')"
db2 "INSERT INTO Tank VALUES('6', 200,  'EHEIM Professional Wet/Dry Canister Filter',     '01/01/14', '006', 'A1')"
db2 "INSERT INTO Tank VALUES('7', 3000, 'Aqueon Quiet Flow 30 Aquarium Power Filters',    '01/03/14', '007', 'A1')"
db2 "INSERT INTO Tank VALUES('8', 30000,'Fluval External Canister Aquarium Filters',      '01/04/14', '008', 'A1')"
db2 "INSERT INTO Tank VALUES('9', 300,   'EHEIM Professional Wet/Dry Canister Filter',    '01/09/14', '009', 'A1')"


db2 "INSERT INTO Department VALUES('D1', 'Accounting', 2)"
db2 "INSERT INTO Department VALUES('D2', 'Advertising', 6)"
db2 "INSERT INTO Department VALUES('D3', 'Back-office', 9)"
db2 "INSERT INTO Department VALUES('D4', 'Front-office', 14)"
db2 "INSERT INTO Department VALUES('D5', 'Sales', 8)"



db2 "INSERT INTO Employee  VALUES('E1', 'Bob', '6470001111',  10, 'Mutual Street',    'Toronto',     'M5B2M2', 'Manager',  'D1')"
db2 "INSERT INTO Employee  VALUES('E2', 'Tom', '6470001112',  20, 'Gerrard Street',   'Mississauga', 'M5B1G3', 'Employee', 'D1')"
db2 "INSERT INTO Employee  VALUES('E3', 'Tim', '6470001113',  36, 'Elizabeth Street', 'Brampton',    'M5S1C6', 'Employee', 'D2')"
db2 "INSERT INTO Employee  VALUES('E4', 'Sam', '6470001114',  46, 'Edward Street',    'Markham',     'L4A7B9', 'Employee'  'D4')"
db2 "INSERT INTO Employee  VALUES('E5', 'Ali', '6470001115',  50, 'Bay Street',       'Toronto',     'M3A1N8', 'Employee', 'D2')"
db2 "INSERT INTO Employee  VALUES('E6', 'Jon', '6470001116',  02, 'McCaul Street',    'Toronto',     'L4A7B0', 'Employee', 'D2')"
db2 "INSERT INTO Employee  VALUES('E7', 'Liz', '6470001117',  17, 'Huron Street',     'Toronto',     'M5B1G4', 'Employee', 'D2')"
db2 "INSERT INTO Employee  VALUES('E8', 'Eli', '6470001118',  93, 'Spadina Street',   'Toronto',     'M5V2L7', 'Employee', 'D2')"
db2 "INSERT INTO Employee  VALUES('E9', 'Jack', '6470001119', 52, 'King Street',      'Toronto',     'M5C3N1', 'Manager',  'D2')"
db2 "INSERT INTO Employee  VALUES('E10', 'Don', '6470001110', 67, 'Mutual Street',    'Toronto',     'M5E8S2', 'Employee', 'D3')"
db2 "INSERT INTO Employee  VALUES('E11', 'Lee', '6470001121', 78, 'Queen Street',     'Toronto',     'M5A1A1', 'Employee', 'D3')"
db2 "INSERT INTO Employee  VALUES('E12', 'Ben', '6470001122', 89, 'King Street',      'Toronto',     'M5C2B0', 'Employee', 'D3')"
db2 "INSERT INTO Employee  VALUES('E13', 'Ron', '6470001123', 97, 'Gerrard Street',   'Mississauga', 'L1A1A1', 'Manager',  'D3')"
db2 "INSERT INTO Employee  VALUES('E14', 'Ian', '6470001124', 75, 'Huron Street',     'Toronto',     'M5H6D7', 'Employee', 'D3')"
db2 "INSERT INTO Employee  VALUES('E15', 'Joe', '6470001125', 53, 'Elizabeth Street', 'Brampton',    'M5P8Q8', 'Employee', 'D5')"
db2 "INSERT INTO Employee  VALUES('E16', 'Dan', '6470001126', 31, 'Huron Street',     'Toronto',     'M5S8T8', 'Employee', 'D3')"
db2 "INSERT INTO Employee  VALUES('E17', 'Gus', '6470001127', 25, 'Edward Street',    'Markham',     'L4A8B2', 'Employee', 'D3')"
db2 "INSERT INTO Employee  VALUES('E18','Tess', '6470001128', 58, 'Mutual Street',    'Toronto',     'M5W3M0', 'Employee', 'D3')"
db2 "INSERT INTO Employee  VALUES('E19', 'Ray', '6470001129', 81, 'Elizabeth Street', 'Brampton',    'M5Q0Y6', 'Employee', 'D3')"
db2 "INSERT INTO Employee  VALUES('E20', 'Amy', '6470001130', 14, 'Bay Street',       'Toronto',     'M5B2M3', 'Manager',  'D4')"
db2 "INSERT INTO Employee  VALUES('E21', 'Ann', '6470001131', 49, 'Bay Street',       'Markham',     'L4K6AC', 'Employee', 'D5')"
db2 "INSERT INTO Employee  VALUES('E22', 'Zoe', '6470001132', 33, 'Bay Street',       'Toronto',     'M7T8P1', 'Employee', 'D4')"
db2 "INSERT INTO Employee  VALUES('E23', 'Roy', '6470001133', 64, 'Mutual Street',    'Toronto',     'M6C7N9', 'Employee', 'D4')"
db2 "INSERT INTO Employee  VALUES('E24','Jane', '6470001134', 47, 'Elizabeth Street', 'Brampton',    'M0Z0P0', 'Employee', 'D4')"
db2 "INSERT INTO Employee  VALUES('E25','Will', '6470001135', 32, 'McCaul Street',    'Toronto',     'M1S5H9', 'Employee', 'D4')"
db2 "INSERT INTO Employee  VALUES('E26','Andy', '6470001136', 36, 'Edward Street',    'Markham',     'L4S3A3', 'Employee', 'D4')"
db2 "INSERT INTO Employee  VALUES('E27', 'Moe', '6470001137', 12, 'King Street',      'Toronto',     'M6F9G5', 'Employee', 'D4')"
db2 "INSERT INTO Employee  VALUES('E28', 'Luc', '6470001138', 07, 'Queen Street',     'Toronto',     'M8B0K5', 'Employee', 'D4')"
db2 "INSERT INTO Employee  VALUES('E29', 'Dee', '6470001139', 15, 'Gerrard Street',   'Mississauga', 'M5B7K3', 'Employee', 'D4')"
db2 "INSERT INTO Employee  VALUES('E30', 'Kai', '6470001140', 17, 'Mutual Street',    'Toronto',     'M2G7J9', 'Employee', 'D4')"
db2 "INSERT INTO Employee  VALUES('E31', 'May', '6470001141', 01, 'Queen Street',     'Toronto',     'M1S5F7', 'Employee', 'D4')"
db2 "INSERT INTO Employee  VALUES('E32', 'Sky', '6470001142', 40, 'McCaul Street',    'Toronto',     'M6G7H8', 'Manager',  'D5')"
db2 "INSERT INTO Employee  VALUES('E33','Zain', '6470001143', 33, 'Edward Street',    'Markham',     'L4C8B8', 'Employee', 'D4')"
db2 "INSERT INTO Employee  VALUES('E34','Ruby', '6470001144', 17, 'Gerrard Street',   'Mississauga', 'M5B8J9', 'Employee', 'D4')"
db2 "INSERT INTO Employee  VALUES('E35', 'Nasa', '6470001145', 10, 'Mutual Street',   'Toronto',     'M5V1L7', 'Employee', 'D5')"
db2 "INSERT INTO Employee  VALUES('E35', 'Kris', '6470001146', 48, 'King Street',     'Toronto',     'M5V3L7', 'Employee', 'D5')"
db2 "INSERT INTO Employee  VALUES('E35', 'Adam', '6470001147', 45, 'Queen Street',    'Toronto',     'M5V4L7', 'Employee', 'D5')"
db2 "INSERT INTO Employee  VALUES('E35', 'Nasa', '6470001148', 98, 'Elizabeth Street','Toronto',     'M5V5L7', 'Employee', 'D5')"
db2 "INSERT INTO Employee  VALUES('E35', 'Bobby', '6470001149', 71, 'Edward Street',  'Toronto',     'M5V6L7', 'Employee', 'D5')"


db2 "INSERT INTO Customer VALUES('C1', 'Ruby',     '647000000', 60, 'Gerrard Street',    'Toronto',     'M5Y6G7')"
db2 "INSERT INTO Customer VALUES('C2', 'Rashed',   '647000010', 70, 'John Street',       'Mississauga', 'M8Z2F1')"
db2 "INSERT INTO Customer VALUES('C3', 'Nasa',     '647000020', 12, 'Yonge Street',      'Brampton',    'M5M6G7')"
db2 "INSERT INTO Customer VALUES('C4', 'Raj',      '647000030', 28, 'Dundas Street',     'Toronto',     'M5B6G7')"
db2 "INSERT INTO Customer VALUES('C5', 'Thujan',   '647000040', 10, 'Church Street',     'Toronto',     'M5F6G7')"
db2 "INSERT INTO Customer VALUES('C6', 'Zain',     '647000050', 81, 'Richmond Street',   'Etobicoke',   'M5B3G7')"
db2 "INSERT INTO Customer VALUES('C7', 'Nizar',    '647000060', 72, 'York Style Street', 'Missisauga',  'G5B6G7')"
db2 "INSERT INTO Customer VALUES('C8', 'Barney',   '647000070', 51, 'Wellesley Street',  'Hamilton',    'K46G7')"
db2 "INSERT INTO Customer VALUES('C9', 'Fowler',   '647000080', 19, 'Wall Street',       'Hamilton',    'K3G6F7')"
db2 "INSERT INTO Customer VALUES('C10','Big Bird', '647000090', 16, 'Sesame Street',     'Toronto',     'M5C6G7')"


db2 "INSERT INTO Sales VALUES('S1',  'E22', 'C1', 20, 220.98)"
db2 "INSERT INTO Sales VALUES('S2',  'E33', 'C2', 40, 441.86)"
db2 "INSERT INTO Sales VALUES('S3',  'E31', 'C3', 3,  45.76)"
db2 "INSERT INTO Sales VALUES('S4',  'E30', 'C4', 7,  82.93)"
db2 "INSERT INTO Sales VALUES('S5',  'E28', 'C5', 9,  110.21)"
db2 "INSERT INTO Sales VALUES('S6',  'E23', 'C6', 22, 225.98)"
db2 "INSERT INTO Sales VALUES('S7',  'E24', 'C7', 12, 120.98)"
db2 "INSERT INTO Sales VALUES('S8',  'E29', 'C8', 12, 120.98)"
db2 "INSERT INTO Sales VALUES('S9',  'E27', 'C9', 30, 320.98)"
db2 "INSERT INTO Sales VALUES('S10', 'E26', 'C10',10, 120.98)"
db2 "INSERT INTO Sales VALUES('S11', 'E25', 'C1', 9,  120.98)"
db2 "INSERT INTO Sales VALUES('S12', 'E24', 'C2', 5,  70.98)"
db2 "INSERT INTO Sales VALUES('S13', 'E34', 'C3', 6,  80.98)"


}
function ownerQueries
{
	
	select="-1"

	while [ "$select" != "0" ]; do
	
		echo "    Welcome to DB2 Dr. Mastoras     "
        	echo "  What would you like to do today?     "
		echo " "
		echo "1) Toronto Employee Sales Report"
		echo "2) Tank sizes that are between 100 to 1000 gallons"
		echo "3) Tickets Sales Report"
		echo "4) Display department with only 2 employees"
		echo "5) Display list of fish Food that needs to be reordered"
      		echo "6) Display the average sum of each ticket price per transaction"
      		echo "7) Display the employee with greatest sales"
		echo "8) Display a list of employees with zero sales"
	        echo "9) Display a list of customers who come from Toronto and Brampton"
		echo "10) Display average of total sales"
	        echo "11) Output list of sales in which price of tickets sold include 13% GST"
		echo "0) Back "
	read select
   
    	case $select in

           	1) clear
		db2 "SELECT employee_ID FROM Employee WHERE employee_city= 'Toronto' UNION SELECT sale_ID FROM Sales WHERE sale_ID = 'S1'";
		;;
		2) db2 "SELECT tank_size FROM Tank WHERE (tank_size BETWEEN 100 AND 1000)";
	        ;;
		3) db2 "SELECT sale_ID, customer_ID, tickets_sold, total_sales FROM Sales WHERE NOT EXISTS (Select customer_ID FROM Customer WHERE tickets_sold > 10)";
         	;;
		4) db2 "SELECT dept_name FROM Department WHERE dept_size = 2";
       		;;
		5) db2 "SELECT food_ID, food_qtyGrams FROM Food WHERE NOT food_qtyGrams IS NULL GROUP BY food_ID, food_qtyGrams HAVING food_qtyGrams < 200";
       		;;
		6) db2 "SELECT total_sales, tickets_sold, SUM(total_sales/tickets_sold) AS Average from Sales GROUP BY total_sales, tickets_sold";
        	;;
		7) db2 "SELECT employee_ID, total_sales FROM Sales WHERE total_sales >= ALL (SELECT total_sales FROM Sales)";
        	;;
		8) db2 "SELECT sale_ID, employee_ID, customer_ID, total_sales FROM Sales WHERE total_sales is NULL";
        	;;
	        9) db2 "SELECT customer_ID, customer_name, customer_city from Customer WHERE customer_city = 'Toronto' OR customer_city = 'Brampton'";
        	;;
       		10) db2 "SELECT AVG(total_sales) AS SumOfSales FROM Sales";
       		;;
       		11) db2 "SELECT sale_ID, total_sales*1.13 AS ticketprice FROM Sales ORDER BY 2, sale_ID";
        	;;
	        0) clear
          	queries;
        	;;
       
	esac
	done

}







function managerQueries
{
	select="-1"

	while [ "$select" != "0" ]; do

		echo "    Welcome to DB2 Manager"
        	echo "  What would you like to do today?"
		echo " "
		echo "1) Employee Sales Report"
		echo "2) Unique Customer Location Report"
		echo "3) Find employees with postal code L4C8B8 but who don't live in Toronto or Brampton"
		echo "4) Department size Report"
		echo "5) Display a list of employees who have sold tickets"
		echo "6) Display employee whose name starts with R and the third letter is J"
		echo "7) Find lowest spectrum range of total sales"
		echo "8) Display list of tanks greater than 1000 gallons"
       		echo "9) Find all sale_ID whose total sales are greater than 250"
		echo "10) Display the name of all employees in Sales department"
		echo "11) Find the number of customers in Toronto"
       		echo "12) Display a list of employees in ascending order who live in Toronto and who have sales figures that are greater than 10"
		echo "13) Find all employees who have sold tickets"
		echo "14) List of employees whose name starts with Z and whose total sales are more than 1"
       		echo "0) Back"

	read select

   	case $select in

		1) db2 "SELECT employee_name, Employee.employee_ID, sale_ID, tickets_sold FROM Employee, Sales WHERE Employee.employee_ID=Sales.employee_ID";
        	;;
		2) db2 "SELECT x.customer_ID, y.customer_ID FROM Customer x, Customer y WHERE (x.customer_postal < y.customer_postal)";
        	;;
		3) db2 "SELECT employee_city FROM Employee WHERE employee_postal IN ('M5B2M2', 'L4C8B8', 'L4A7B9') AND employee_city NOT IN ('Toronto', 'Brampton')";
        	;;
		4) db2 "SELECT dept_name FROM Department WHERE dept_size = 2";
        	;;
		5) db2 "SELECT employee_ID, employee_name FROM Employee WHERE EXISTS (SELECT employee_ID, tickets_sold FROM Sales WHERE Sales.employee_ID = Employee.employee_ID)";
        	;;
	        6) db2 "SELECT customer_name FROM Customer WHERE (customer_name LIKE 'R_j%')";
        	;;
		7) db2 "SELECT sale_ID, employee_ID, total_sales FROM Sales WHERE total_sales NOT BETWEEN 300 AND 1000";
        	;;
		8) db2 "SELECT tank_ID, tank_size, maintaince_dueDate FROM Tank WHERE Tank.tank_size > 1000";
        	;;
		9) db2 "SELECT sale_ID FROM Sales x WHERE employee_ID > ANY (select employee_ID FROM Sales y WHERE y.total_sales > 250)";
        	;;
       		10) db2 "SELECT employee_name AS NameofEmployees FROM Employee WHERE dept_ID = 'D5'";
        	;;
		11) db2 "SELECT DISTINCT COUNT(customer_city) AS CustomersInCity FROM Customer WHERE customer_city= 'Toronto'";
       		;;
		12) db2 "SELECT employee_ID, tickets_sold from Sales WHERE EXISTS (SELECT employee_city FROM Employee WHERE employee_city = 'Toronto' AND Sales.employee_ID = Employee.employee_ID) AND tickets_sold > 10 ORDER BY tickets_sold";
        	;;
       		13) db2 "SELECT employee_ID FROM Employee INTERSECT SELECT employee_ID FROM Sales";
		;;
       		14) db2 "SELECT employee_name, employee_id from Employee WHERE EXISTS (select employee_id FROM Sales where total_sales > 1 AND Employee.employee_ID = Sales.employee_ID) AND (employee_name LIKE 'Z%')";
        	;;
       		0) clear
           	queries;
        	;;
       
	esac
	done

}






function employeeQueries
{

    select="-1"

    while [ "$select" != "0" ]; do

		echo "    Welcome to DB2 Employee     "
		echo "  What would you like to do today?     "
		echo " "
		echo "1) View Customer Location Report"
		echo "2) Find tanks with same filters but are two times in size"
		echo "3) Enter a discount to customer with a gift card "
		echo "4) Find biggest fish tank in Aquarium"
       		echo "5) Display fish who eat Tropical Flake and their quantity is less than and equal 39"
		echo "6) Display list of fish food that needs to be ordered"
       		echo "7) Display customers concatenated address"
		echo "0) Back "
          read select
   
    case $select in
		1) db2 "SELECT DISTINCT customer_city FROM Customer ORDER BY customer_city";
		;;
		2) db2 "SELECT x.tank_ID from Tank x, Tank y WHERE (x.tank_filter = y.tank_filter) AND (x.tank_size = y.tank_size * 2 )";
		;;
		3) db2 "SELECT customer_ID, tickets_sold, total_sales*1.13 AS BeforeDiscount, total_sales*1.13-50 AS AfterDiscount FROM Sales WHERE customer_ID = 'C2'";
        	;;
   		4) db2 "SELECT MAX(tank_size) AS Large_Tank FROM Tank";
        	;;
       		5) db2 "SELECT fish_name FROM Fish WHERE food_ID = 'F2' AND fish_qty >= 39";
        	;;
		6) db2 "SELECT food_ID, CASE WHEN food_qtyGrams > 0 THEN 'Do Not Order' WHEN food_qtyGrams < 0 THEN 'Place Order' END FROM Food";
        	;;
		7) db2 "SELECT customer_streetName CONCAT ', ' CONCAT Customer_city CONCAT ', ' CONCAT customer_postal AS Full_Address FROM Customer";
        	;;
        	0) clear
           	queries;
        	;;
       
	esac
done
}







function queries
{
    select="-1"
    while [ "$select" != "0" ]; do
		echo " "
		echo "    Welcome to DB2 Queries Sub-Menu     "
		echo "            Who are you?        "
		echo " "
		echo "1) Owner"
		echo "2) Manager"
		echo "3) Employee"
		echo "0) Back"
		echo "---------------------------"
		echo " "
		echo " Quick Links"
		echo "4) Assertions"
		echo "5) Trigger 1"
		echo "6) Trigger 2"
		echo "0) Back"
		echo " "
	
	read select
   
	case $select in
	
		1) ownerQueries;
  	      	;;
		2) managerQueries;
        	;;
		3) employeeQueries;
        	;;
		4) db2 "";
		;;
		5) db2 "CREATE TRIGGER minTankSize AFTER UPDATE OF tank_Size ON Tank FOR EACH ROW UPDATE Tank SET tank_size = 2000 WHERE tank_size <= 0";
		;;
		6) db2 "CREATE TRIGGER empPhoneNumber AFTER INSERT ON Employee FOR EACH ROW UPDATE Employee SET employee_tel = '7000' WHERE employee_tel <= '0'";
		;;
		0) clear
		db2menu;
        	;;
       
    	esac
	done
}

function droptrigger1
{
	db2 drop trigger minTankSize
	db2 drop trigger empPhoneNumber 

}  



function db2menu
{

            select="-1"

    while [ "$select" != "0" ]; do

		echo "    Welcome to DB2 Aquarium Menu     "
		echo "       Please Select An Option        "
		echo " "
		echo "1) Create Tables"
		echo "2) Drop Tables"
		echo "3) List All Tables"
		echo "4) Show Tables Content"
		echo "5) Display Data Dictionary"
		echo "6) Populate Table With Data"
		echo "7) Go to Queries Sub-Menu"
		echo "8) Drop triggers"
		echo "0) Exit "

          read select

  case $select in

		1) createtable;
		;;
		2) droptable;
		;;
		3) listtable;
		;;
		4) tablevalues;
		;;
		5) datadictionary
		;;
                6) pop;
		;;
		7) queries;
		;;
		8) droptrigger1;
		;;
		0) clear;
		;;
      esac

done
}

db2menu
