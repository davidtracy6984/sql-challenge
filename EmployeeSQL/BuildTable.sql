-- Database: MyTest

-- DROP DATABASE "MyTest";

CREATE DATABASE "MyTest"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


DROP TABLE IF EXISTS departments;
CREATE TABLE "departments" (
    "dept_no" varchar(20) PRIMARY KEY,
    "dept_name" varchar(20)   NOT NULL
);

DROP TABLE IF EXISTS titles;
CREATE TABLE "titles" (
    "title_id" varchar(5) PRIMARY KEY,
    "title" varchar(30)   NOT NULL
    
);

DROP TABLE IF EXISTS employees;
CREATE TABLE "employees" (
    "emp_no" serial  PRIMARY KEY,
    "emp_title_id" varchar(20) REFERENCES titles (title_id),
    "birth_date" date   NOT NULL,
    "first_name" varchar(20)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" char   NOT NULL,
    "hire_date" date   NOT NULL
    
);

DROP TABLE IF EXISTS dept_emp;
CREATE TABLE "dept_emp" (
    "emp_no" integer REFERENCES employees (emp_no),
    "dept_no" varchar(20) REFERENCES departments (dept_no)
   
);
DROP TABLE IF EXISTS salaries;
CREATE TABLE "salaries" (
    "emp_no" integer REFERENCES employees(emp_no),
    "salary" integer   
    
);
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE "dept_manager" (
    "dept_no" varchar(20) REFERENCES departments(dept_no),
    "emp_no" integer  REFERENCES employees(emp_no)
    
);

