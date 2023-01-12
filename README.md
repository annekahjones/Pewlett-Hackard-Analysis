# Pewlett-Hackard-Analysis

## Overview

This project had us create different tables on employee data from a company, Pewlett Hackard. Since there are many employeees that have the potential to retire in the next couple of years, I broke apart all of the company employee data into more digestible parts to look at all of the employees in retiring age. The company wants to be able to know how many people they are looking at the possibility of retiring so that they know how many positions they will need to fill in the near future. 

## Results
- There are 72458 unique employees at PH that are of retirement age.
- About 51,000 senior positions and 2 manager positions that will become vacant once those employees retire.
- There are 1549 employees that are eligible for the mentorship program.
- There are over 133,000 employees with titles that fit the age description, but only a little over 72,000 of those are unique names, meaning a lot of these employees have help more than one title over the duration of their time working at PH.

## Summary
The number of roles that need ot be filled as the "silver tsunami" begins to take an impact is 72,458.
Since the number of qualified, retirement-ready employees is only 1,549, there are definitely not enough of them to mentor the next generation, assuming they only take on a reasonable number of mentees. 

Finding the largest salary of an employee that could retire.
SELECT ut.emp_no,
       ut.first_name,
       ut.last_name,
       ut.title,
       s.salary
INTO unique_salaries
FROM unique_titles AS ut
INNER JOIN salaries AS s
ON ut.emp_no = s.emp_no
ORDER BY s.salary DESC;

The largest salary from those eligible to retire is $126,703.


Finding how many female employees are eligible for retirement
SELECT e.gender,
       ut.emp_no,
       ut.first_name,
       ut.last_name,
       ut.title
INTO unique_female
FROM employees AS e
INNER JOIN unique_titles AS ut
ON e.emp_no = ut.emp_no
WHERE gender = 'F';

The total number of female employees eligible for retirement is 29,030, which is nearly half of all eligible employees.

### Pictures of these tables and data can be found in the Data and Queries folders.
