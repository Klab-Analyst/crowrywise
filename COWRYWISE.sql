show databases;
create database cowrywise;
use adashi_staging;
select* from plans_plan;
select* from savings_savingsaccount;
select* from users_customuser;
select* from withdrawals_withdrawal;

-- QUESTION 1--
select users_customuser.id,
concat(first_name,' ',last_name)as 
full_name,
count(distinct plans_plan.is_fixed_investment) as Investment_count,
count(distinct plans_plan.is_regular_savings) as Savings_count, sum(plans_plan.amount) as Total_deposits
from users_customuser
inner join plans_plan on users_customuser.id=plans_plan.owner_id
GROUP BY users_customuser.id
order by total_deposits DESC;

