CREATE TABLE india_job_market (
    job_id VARCHAR(20),
    job_title VARCHAR(100),
    company VARCHAR(100),
    company_type VARCHAR(50),
    industry VARCHAR(100),
    city VARCHAR(50),
    location_tier VARCHAR(20),
    experience_level VARCHAR(30),
    job_type VARCHAR(30),
    work_mode VARCHAR(30),
    salary_lpa NUMERIC(10,2),
    skills_required TEXT,
    education_required VARCHAR(100),
    openings INT,
    applicants INT,
    company_rating NUMERIC(3,1),
    date_posted DATE
);

select * from india_job_market

#TOTAL JOBS
select count(*) as total_jobs from india_job_market

#TOTAL APPLICANTS
select sum(applicants) as total_applicants from india_job_market 

#AVERAGE SALARY 
select round(avg(salary_lpa),1) as avg_salary from india_job_market;

#HIGHEST PAYING JOBS 
SELECT job_title,
       ROUND(AVG(salary_lpa),2) AS avg_salary
FROM india_job_market
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 10;

#TOP HIRING CITIES 
SELECT city,
       COUNT(*) AS total_jobs
FROM india_job_market
GROUP BY city
ORDER BY total_jobs DESC
LIMIT 10;

#TOP INDUSTRIES HIRING
SELECT industry,
       COUNT(*) AS jobs
FROM india_job_market
GROUP BY industry
ORDER BY jobs DESC
LIMIT 10;

#MOST COMPETITIVE JOBS
SELECT job_title,
       ROUND(AVG(applicants),0) AS avg_applicants
FROM india_job_market
GROUP BY job_title
ORDER BY avg_applicants DESC
LIMIT 10;

#COMPANIES_WITH_BEST RATING 
SELECT company,
       ROUND(AVG(company_rating),2) AS rating
FROM india_job_market
GROUP BY company
ORDER BY rating DESC
LIMIT 10;

#JOBS_BY_EDUCATION_REQUIRED
SELECT education_required,
       COUNT(*) AS jobs
FROM india_job_market
GROUP BY education_required
ORDER BY jobs DESC;

#EXPERIENCE_LEVEL_DEMAND
SELECT experience_level,
       COUNT(*) AS jobs
FROM india_job_market
GROUP BY experience_level
ORDER BY jobs DESC;



