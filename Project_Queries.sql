/****** 1. List the employee number, last name, first name, sex, and salary of each employee.
2. List the first name, last name, and hire date for the employees who were hired in 1986.
3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
6. List each employee in the Sales department, including their employee number, last name, and first name.
7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)******/

use [Employees_Database ]
select e.emp_no,first_name,last_name,sex,salary
from employees e
join salaries s
on e.emp_no=s.emp_no

select first_name,last_name,hire_date
from employees
where hire_date ='1986'

select c.dept_no,dept_name,c.emp_no,last_name,first_name
from departments a
join dept_emp b
on a.dept_no=b.dept_no
join dept_manager c
on b.emp_no=c.emp_no
join employees d
on b.emp_no=d.emp_no

select b.dept_no,dept_name,b.emp_no,last_name,first_name
from departments a
join dept_emp b
on a.dept_no=b.dept_no
join employees c
on b.emp_no=c.emp_no

select first_name,last_name,sex
from employees
where first_name ='Hercules' and last_name like 'b%'

select b.emp_no,last_name,first_name
from departments a
join dept_emp b
on a.dept_no=b.dept_no
join employees c
on b.emp_no=c.emp_no
where dept_name = 'sales'

select b.emp_no,last_name,first_name,dept_name
from departments a
join dept_emp b
on a.dept_no=b.dept_no
join employees c
on b.emp_no=c.emp_no
where dept_name = 'sales' or dept_name ='development'

select last_name,count(last_name) frequency_count
from employees 
group by last_name
order by frequency_count desc