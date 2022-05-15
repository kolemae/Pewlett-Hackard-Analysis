# Pewlett Hackard Analysis
Project using SQL to analyze data, create tables, export CSVs, and clean employee data for Pewlett Hackard.

## Table of contents
* [Overview of Project](#overview-of-project)
* [Resources](#resources)
* [Results](#results)
* [Summary](#summary)

## Overview of Project
Using the 6 CSVs provided to me I ran an employee database analysis for Pewlett Hackard. The purpose was to provide detailed information on future retirees from all departments at the company to begin preparations for a mentorship program and to grasp number of new hires needed.  

### Resources
- Data source: employees.csv, departments.csv, dept_emp.csv, dept_manager.csv, salries.csv, titles.csv
- Software: pgAdmin 4 6.8, PostGreSQL 11.15

## Results
Pewlett Hackard is looking at a large chunk of their workforce preparing for retirement.
- Retirement data was cleaned to include only current employees and their latest title
- There are a total of 72,458 employees about to retire

![retiring_titles](/Images/retiring_titles.png)

- Most of those retiring hold senior positions
- 1,549 employees are [eligible](/Data/mentorship_eligibility.csv) for the planned mentorship program

## Summary
There will be 72,458 employees retiring from Pewlett Hackard. The bulk of these are Senior Engineers and Senior Staff. I created a new table to hold non-retiring employees to check for potential [promotions](/Data/dept_promotions.csv) within departments to fill these senior positions. This would help to relieve some of the pressure of filling the emptying positions and the mentor-to-mentee ratio.
- An issue seen in this data is that many of these employees are also nearing retirment age
- Pewlett Hackard should work on a more age-diverse workforce to avoid a similar issue in the future
- Try promoting within the company first
- Fill entry and mid-level positions of those promoted

1,549 eligible mentors and 72,458 retirees means an average of 47 mentees for each mentor (not accounting for department and title). There will not be enough qualified mentors. I created a new table to check eligible mentors within each department for each title and by title only.

![dept_mentors](/Images/dept_mentors.png)

![dept_mentors_title](/Images/dept_mentors_title.png)

- Senior Engineers would need to mentor about 102 employees, this is not possible
- There are no Managers eligible for mentoring, but 2 retiring
- Expanding the mentorship program may help
