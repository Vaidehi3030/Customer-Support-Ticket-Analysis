create database customer_support_project;

use customer_support_project;

create table support_tickets (
	ticket_id VARCHAR(10),
	customer_id VARCHAR(10),
	region VARCHAR(20),
	issue_type VARCHAR(50),
	priority VARCHAR(10),
	status VARCHAR(10),
	created_date DATE,
	resolved_date DATE,
	resolution_time_hours FLOAT,
	agent VARCHAR(20),
	customer_satisfaction INT
);

show tables;

select * from support_tickets;

select count(*) from support_tickets;

#Check Ticket by Region
select region, count(*) as total_tickets
from support_tickets
group by region;
#Most problems come from North Region and rest are equal

#Most Common Issue Type
select issue_type, count(*) as issue_count
from support_tickets
group by issue_type
order by issue_count desc;
#Login is the Common issue for people of all regions

#Priority Distribution
select priority, count(*) as total_tickets
from support_tickets
group by priority;
#There are more crticial problems 

#Average Resolution Time
select avg(resolution_time_hours) as avg_resolution_time
from support_tickets;

#Resolution Time by Priority
select priority,
avg(resolution_time_hours) as avg_resolution
from support_tickets
group by priority;

#Customer Satisfaction Analysis
select agent,
avg(customer_satisfaction) as avg_rating
from support_tickets
group by agent
order by avg_rating desc;
#Rahul is given the highest avg rating

#Region with Highest Resolution Time
select region,
avg(resolution_time_hours) as avg_resolution
from support_tickets
group by region
order by avg_resolution desc;
#Slowest Service in west region

#High Priority Tickets Only
select * 
from support_tickets
where priority = "High";

#Tickets Resolved in Less Than 3 Hours
select *
from support_tickets
where resolution_time_hours < 3;

#Top Performing Agent
select agent,
avg(resolution_time_hours) as avg_time
from support_tickets
group by agent
order by avg_time
limit 1;
#rahul is the best performing agent among all whose avg is given as 30k

#Monthly Ticket Trend
select month(created_date) as MONTH,
count(customer_id) as total_tickets
from support_tickets
group by MONTH;

select * from support_tickets;