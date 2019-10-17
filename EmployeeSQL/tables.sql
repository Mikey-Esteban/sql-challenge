CREATE TABLE Departments (
	dept_no varchar primary key,
	dept_name varchar NOT NULL
);

CREATE TABLE Dept_Emp (
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	dept_no varchar NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	from_date varchar NOT NULL,
	to_date varchar NOT NULL
);

CREATE TABLE Dept_Manager (
	dept_no varchar NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	from_date varchar NOT NULL,
	to_date varchar NOT NULL
);

CREATE TABLE Employees (
	emp_no int PRIMARY KEY,
	birth_date varchar NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	gender varchar NOT NULL,
	hire_date varchar NOT NULL
);

CREATE TABLE Salaries (
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	salary int NOT NULL,
	from_date varchar NOT NULL,
	to_date varchar NOT NULL
);

CREATE TABLE Titles (
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	title varchar NOT NULL,
	from_date varchar NOT NULL,
	to_date varchar NOT NULL
);
