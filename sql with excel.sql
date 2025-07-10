CREATE DATABASE salary_survey;

USE salary_survey;


Drop database salary_survey;

create database salary_survey;

show databases;

use salary_survey;
select * from excelproject;

select count(*) from excelproject;


#1.Average Salary by Industry and Gender

select
     industry,
     Gender,
     avg(Final_salary) as average_salary
from
     excelproject
group by
      industry,
     Gender;
	
select * from excelproject;
#2.Total Salary Compensation by Job Title

select 
    Job_title, sum(Annual_salary + Additional_Monetary_Compensation) as Total_Compensation
from
    excelproject
group by
	Job_title;
    

select * from excelproject;

#3. Salary Distribution by Education Level

select highest_level_of_education_completed as education_level,
     min(Final_salary)as min_Salary,
     max(Final_salary) as max_Salary,
     avg(Final_salary) as avg_Salary
from
     excelproject
group by
     Highest_level_of_education_completed;

     
#4.Number of Employees by Industry and Years of Experience

select * from excelproject;

select
    industry,Years_of_professional_experience_overall as experience, count(*) employee_count
from
    excelproject
group by
    industry, Years_of_professional_experience_overall;



#5.Median Salary by Age Range and Gender
SELECT Age_range, Gender, AVG(Final_salary) AS median_salary
FROM (
    SELECT Age_range,Gender,Final_salary,
        ROW_NUMBER() OVER (PARTITION BY Age_range, Gender ORDER BY Final_salary) AS row_num,
        COUNT(*) OVER (PARTITION BY Age_range, Gender) AS total_count
    FROM excelproject
) AS ranked
WHERE 
    row_num IN (FLOOR((total_count + 1) / 2),
        CEIL((total_count + 1) / 2))
GROUP BY Age_range, Gender;



#6.Job Titles with the Highest Salary in Each Country
select e.Country, e.Job_title, e.Final_salary
from 
    excelproject e
join (
    select Country,
    max(Final_salary) as max_salary
    from excelproject
    group by Country) m on e.Country = m.Country and e.Final_salary = m.max_salary;



#7. Average Salary by City and Industry
select * from  excelproject;

select City, industry , avg(Final_salary) as avg_salary
from 
    excelproject
group by 
    City, industry;
    
    

#8.Percentage of Employees with Additional Monetary Compensation by Gender
select * from excelproject;


select 
    Gender,
    round(sum(case when Additional_Monetary_Compensation > 0 then 1 else 0 end) * 100.0 / count(*), 2) as percentage_with_comp
from 
    excelproject
group by 
    Gender;


#9.Total Compensation by Job Title and Years of Experience    
select * from excelproject;

select 
    Job_title,
    Years_of_professional_experience_overall as experience,
    sum(Annual_salary + Additional_Monetary_Compensation) as total_compensation
from 
    excelproject
group by 
    Job_title, Years_of_professional_experience_overall;


#10. Average Salary by Industry, Gender, and Education Level
select * from excelproject;
select 
    industry,
    Gender,
    Highest_level_of_education_completed as education_level,
    avg(Final_salary) as avg_salary
from 
    excelproject
group by 
    industry, Gender, Highest_level_of_education_completed;


