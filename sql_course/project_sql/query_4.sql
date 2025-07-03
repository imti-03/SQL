/*
What are the top skills based on salary? This is to find out how different skills impact salary levels for Data Analysts and to help identify the most financially rewarding skills to acquire or improve on
*/;

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary 
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
✅ AI, Machine Learning & Deep Learning tools drive top salaries
Skills like DataRobot, PyTorch, Hugging Face, TensorFlow, and others command high pay as businesses race to build, deploy, and operationalize AI products. Expertise in these areas is scarce, especially in production-level AI systems.

✅ Cloud Infrastructure, DevOps & Data Engineering are critical and lucrative
High-paying skills such as Terraform, Kafka, Airflow, VMware, Ansible, and Cassandra reflect the need for robust, scalable, real-time data pipelines and cloud environments that support modern AI, analytics, and software systems.

✅ Niche, specialized, or emerging tech offers a scarcity premium
Technologies like Solidity (blockchain), Golang (cloud-native apps), and Couchbase (NoSQL) are in demand but with fewer experts available, leading to premium pay. Even older legacy skills like Perl or SVN can command high salaries for rare maintenance roles.
*/