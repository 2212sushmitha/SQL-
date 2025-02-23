---2.create table
CREATE TABLE  employees(
      id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(50),
      age INT ,
      salary DECIMAL(10,2)
  );
---- 3.insert data 
---inserts sample data into the 'employees'table
INSERT INTO employees (name,age,salary)VALUES
('Alice',30,50000.00),
('Bob',28,45000.00),
('Charlie',35,55000.00);
select*from employees

--4. basic select statements
--select all records from the 'employees table'
SELECT*FROM employees;
--selects unique age values from the 'employees table'
SELECT DISTINCT age FROM employees;

---selects records where the age is greater than 29.
SELECT*FROM employees WHERE age>29;
--5. order by 
--orders records by age in descending order.
SELECT*FROM employees ORDER BY age DESC; # ASC FOR SMALL TO LARGE
--6. Basic table alias
--uses an alias 'e' for the employees table,displaying 
SELECT e.name AS EmployeeName,e.salary AS EmployeeSalary
FROM employees AS e;
select*from employees;
---end of the day 1
--day 2:filtering ,grouping,and joining data
--1 add additional data for testing
--insterts additional sample data to the 'employees table'
INSERT INTO employees(name,age,salary)values
('David',40,60000.00),
('Eve',32,52000.00),
('Frank',28,4700.00);
select*from employees;
--2. logical operators: AND,ORAND not
--select employees with age over 30 and salary over 50000
SELECT*FROM employees WHERE age >30 AND salary>50000;
--select employees with age under30 or salary under 50000
SELECT*FROM employees WHERE age <30 OR salary <50000
--select employees whose age is not 28
SELECT*FROM employees WHERE NOT age=28;
--3. group by ,order by and aggregates 
--group employees by age and counts the number of employees
SELECT age,COUNT(*)AS EmployeeCount
FROM employees
GROUP BY age ;

---groups employees by age and calculates the average EmployeeSalary
SELECT age,AVG(salary)AS AVgSalary
FROM Employees 
GROUP BY age 
HAVING AvgSalary>50000;
---orders the results by age in descending order
SELECT *FROM employees ORDER BY age DESC;
--4. join (self-join example)
--create a 'department' table with columns for department 
CREATE TABLE IF NOT EXISTS department (
     id INT PRIMARY KEY AUTO_INCREMENT,
     department_name VARCHAR(50),
     employee_id INT,
     FOREIGN KEY(employee_id)REFERENCES employees(id)
);
--adds department data and assigns employees to department 
INSERT INTO department (department_name,employee_id) VALUES
('HR',1),
('Finance',2),
('Engineering',3),
('Sales',4),
('Marketing',5);
 select *from department;

--joins 'employees' and 'department' to display employees
select*from department;
SELECT e.name AS EmployeeName,d.department_name AS Department 
FROM employees AS e 
JOIN department AS d ON e.id=d.employee_id;

---adds a constraint to ensure salary is always above 30000
ALTER TABLE employees 
ADD CONSTRANINT salary_check CHECK(salary>30000);
select *from employees;
SELECT e.name ,d.department_name
FROM employees e 
INNER JOIN department d on e.id =d.employee_id;

---left join select all employees and their department,
SELECT e.name,d.department_name
FROM employees e 
LEFT JOIN department d ON e.id = d.employee_id;
 --right join select all departments their employees
 SELECT e.name,d.department_name
 FROM employees e 
 RIGHT JOIN departments d ON e.id=d.employee_id;



