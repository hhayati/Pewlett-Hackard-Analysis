# Pewlett-Hackard-Analysis
## Overview of the analysis
The purpose of the analysis for this challenge was to provide a summary list of prospective retiring employee at Pewlett Hackard company. This data will be used to prepare the company for the impending tsunami of retiring employees. The company will use this analysis to plan hiring new staff and develop mentorship programs within the company to help transfer of knowledge from the retiring generation to younger generation.

## Results
The purpose of first analysis was to determine the number of retiring employees by title. For this purpose various tables containing the name, birth date, the start and end dates of employment and job titles were merged to create a summary table of prospective retiring employees. The criteria selected for retiring employees was set to select employees who were born between January 1, 1952 and December 31, 1955. The following figure shows a snapshot of the created table. 

![image](https://user-images.githubusercontent.com/58461542/169677702-e4455cef-0134-4924-8789-5ebc44ec7cfd.png)

In next step, the list was filtered by excluding the employees who have already left the company and keeping only one record of the most recent job title for each employee. (in table shown above some employee have duplicate records due to promotion or other reasons). The outcome was a shorter list as shown below:

![image](https://user-images.githubusercontent.com/58461542/169677776-e705e594-33dc-408c-af21-ca130e705a96.png)

In next step, the list of retiring employees were classified based on job title. The result is shown below:

![image](https://user-images.githubusercontent.com/58461542/169677781-394c7647-600d-49b1-b50b-e6015d4f0344.png)

It is noted:

* The largest number of retiring staff hold job titles of senior engineer and senior staff. This makes sense as older people approaching retirement naturally taken more senior positions. 
* Suspiciously only 2 manager are listed to retire. For a company like HP that sounds a small number and should be checked if the job title for manager was properly assigned.

In last step, a list of employees who are eligible for mentorship program was generated. The criteria was set by selecting the current employees who were born between January 1, 1965 and December 31, 1965. This list is presented below.

![image](https://user-images.githubusercontent.com/58461542/169677664-48782505-ffd3-4298-89f1-7fe989594361.png)


## Summary

* A total number of 72,458 employees are expected to retire of which 58,052 are in senior, leader or manager positions. That includes a significant number and requires extensive planning to replenish staff in such high level positions
* There are only 1,549 staff eligible for mentorship program which seems low for mentoring prospective employees. The company needs to expand the criteria for mentorship eligibility to be bale to provide proper mentorship.

