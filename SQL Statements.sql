-- 1- Job title has minimum salary greater than 5000:
select job_title 
from hr.dbo.jobs
where min_salary > 5000

-- 2- Total salary for all employees that work in IT department:
select d.department_name, sum(e.salary)
from hr.dbo.departments d inner join hr.dbo.employees e on d.department_id = e.department_id
group by d.department_name
having d.department_name = 'IT';

-- 3- Total salary for each department in each country:
select sum(e.salary) total_salary, d.department_name, c.country_name country_name
from hr.dbo.departments d inner join hr.dbo.employees e on d.department_id = e.department_id inner join hr.dbo.locations l on l.location_id = d.location_id inner join hr.dbo.countries c on c.country_id = l.country_id
group by c.country_name, d.department_name

-- ************************************************************************************************************************************************************

-- 1- Number of employees in each department:
select count(e.employee_id) #Employees, d.department_name 
from hr.dbo.employees e inner join hr.dbo.departments d on e.department_id = d.department_id
group by d.department_name;

-- 2-  Number of employees that hired in each year:
select count(employee_id) #Employees, year(hire_date) hire_year
from hr.dbo.employees
group by year(hire_date);

-- 3- Name/s of Steven's children:
select d.first_name
from hr.dbo.dependents d inner join hr.dbo.employees e on d.employee_id = e.employee_id
where e.first_name = 'Steven';

-- 4-  Average of salary for employees that hired in 1980s: 
select avg(salary)
from hr.dbo.employees
where year(hire_date) between 1980 and 1989;

-- 5- Number of Employees in each region sorted descending: 
select count(e.employee_id) #Employees, r.region_name
from hr.dbo.departments d inner join  hr.dbo.employees e on d.department_id = e.department_id inner join  hr.dbo.locations l on l.location_id = d.location_id inner join  hr.dbo.countries c on c.country_id = l.country_id right join hr.dbo.regions r on c.region_id = r.region_id 
group by r.region_name
order by count(e.employee_id) desc;

-- 6- All employees whose manager Steven:
select e1.employee_id, e1.first_name employee_name
from hr.dbo.employees e1 inner join hr.dbo.employees e2 on e1.manager_id = e2.employee_id
where e2.first_name = 'Steven';

-- 7- Names of employees whose postal code = 98199:
select e.first_name 
from hr.dbo.departments d inner join hr.dbo.locations l on d.location_id = l.location_id inner join hr.dbo.employees e on d.department_id = e.department_id
where postal_code = '98199'; 

