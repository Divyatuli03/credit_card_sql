--Q.1 Select all data from credit card dataset.
SELECT * FROM portfolioproject.credit_card;

--Q.2 Count the number of rows in credit card dataset.
SELECT Count(Ind_ID)
From portfolioproject.credit_card;

--Q.3 Select all data from credit card label dataset.
Select * From portfolioproject.credit_card_label;

--Q.4 Count the number of rows in credit card label dataset.
Select Count(Ind_ID)
From portfolioproject.credit_card_label;

--Q.5 How many clients are considered in this credit card dataset?
Select Count(Ind_ID)
From portfolioproject.credit_card;

--Q.6 Joining two tables with some columns.
Select a.Ind_ID, a.gender, a.car_owner, a.property_owner, a.children, a.annual_income, a.type_income, a.education, a.marital_status,
a.housing_type,a.birthday_count, a.employed_days, a.family_members,b.label
From portfolioproject.credit_card a
Inner Join portfolioproject.credit_card_label b
On a.Ind_ID = b.Ind_ID;

--Q.7 How many entries are there in joined table?
Select Count(*)
From (Select a.Ind_ID, a.gender, a.car_owner, a.property_owner, a.children, a.annual_income, a.type_income, a.education, a.marital_status,
a.housing_type,a.birthday_count, a.employed_days, a.family_members,b.label
From portfolioproject.credit_card a
Inner Join portfolioproject.credit_card_label b
On a.Ind_ID = b.Ind_ID) c;


-- Q.8 How many car-owners are male?
Select Count(Ind_ID)
From credit_card
Where car_owner = "Y" and gender = "M";

-- Q.9 How many car-owners are female?
Select Count(Ind_ID)
From credit_card
Where car_owner = "Y" and gender = "F";

-- Q.10 How many males do not own a car?
Select Count(Ind_ID)
From credit_card
Where gender = "M" and car_owner = "N";

-- Q.11 How many females do not own a car?
Select Count(Ind_ID)
From credit_card
Where gender = "F" and car_owner = "N";

-- Q.12 Calculate the average income of pensioner who are married?
Select avg(annual_income)
From credit_card
Where type_income = "Pensioner"
and marital_status = "Married"
Group by marital_status, type_income;

-- Q.13 Calculate the average income of commercial associate who are single/not-married?
Select avg(annual_income)
From credit_card
Where type_income = "Commercial associate"
and marital_status = "Single / not married"
Group by marital_status, type_income;

-- Q.14 How many married couple have House/apartment?
Select Count(*)
From credit_card
Where marital_status = "Married"
 and housing_type = "House/apartment";

-- Q.15 How many married couple live with parents?
Select Count(*)
From credit_card
Where marital_status = "Married"
 and housing_type = "with parents";
 
 -- Q.16 Calculate the average income of commercial associate who are married?
 Select avg(annual_income)
 From credit_card
 Where type_income = "commercial associate" and marital_status = "married"
 Group by marital_status, type_income;
 
 -- Q.17 Find out the average annual income of working people who are married?
 Select avg(annual_income)
 FRom credit_card
 Where type_income = "working" and marital_status = "married"
 Group by marital_status, type_income;
 
 -- Q.18 Find out the average annual income of state servant who are married?
 Select avg(annual_income)
 FRom credit_card
 Where type_income = "State servant" and marital_status = "Married"
 Group by marital_status, type_income;

-- Q.19 what is the maximum annual income earned by pensioner having more than 1 children?
Select max(annual_income)
From credit_card
Where type_income = "Pensioner" 
Group by type_income
Having count(children) > 1;

-- Q.20 What the maximum average annual income earned by the commercial associate having more than 1 children?
Select max(annual_income)
From credit_card
Where type_income = "Commercial associate"
Group by type_income
having Count(children) > 1;

-- Q.21 Divide the no. of people on the basis of rich, middle class or poor based on annual income?
 Select Ind_ID, gender, car_owner, annual_income, type_income,
       Case 
           When annual_income < 200000 then "Lower Middle Class"
           When annual_income between 200000 and 400000 then "Middle Class"
           When annual_income > 400000 then "Upper Middle Class"
           End as Status
	   From (Select a.Ind_ID, a.gender, a.car_owner, a.property_owner, a.children, a.annual_income, a.type_income, a.education, a.marital_status,
a.housing_type,a.birthday_count, a.employed_days, a.family_members,b.label
From portfolioproject.credit_card a
Inner Join portfolioproject.credit_card_label b
On a.Ind_ID = b.Ind_ID) d;

-- Q.22 Divide the no. of clients on the basis of marital status how many own the credit card.
Select marital_status, Count(label)
From (Select a.Ind_ID, a.gender, a.car_owner, a.property_owner, a.children, a.annual_income, a.type_income, 
a.education, a.marital_status, a.housing_type,a.birthday_count, a.employed_days, a.family_members,b.label
From portfolioproject.credit_card a
Inner Join portfolioproject.credit_card_label b
On a.Ind_ID = b.Ind_ID) d
Where label ='0'
Group by marital_status;

-- Q.23 Divide the no. of clients on the basis of marital status how many do not own the credit card.
Select marital_status, Count(label)
From (Select a.Ind_ID, a.gender, a.car_owner, a.property_owner, a.children, a.annual_income, a.type_income, 
a.education, a.marital_status, a.housing_type,a.birthday_count, a.employed_days, a.family_members,b.label
From portfolioproject.credit_card a
Inner Join portfolioproject.credit_card_label b
On a.Ind_ID = b.Ind_ID) d
Where label ='1'
Group by marital_status;

-- Q.24 Divide the no. of clients on the basis of education status how many do not own the credit card.
Select education, count(label)
From (Select a.Ind_ID, a.gender, a.car_owner, a.property_owner, a.children, a.annual_income, a.type_income, 
a.education, a.marital_status, a.housing_type,a.birthday_count, a.employed_days, a.family_members,b.label
From portfolioproject.credit_card a
Inner Join portfolioproject.credit_card_label b
On a.Ind_ID = b.Ind_ID) d
Where label = '1'
Group by education
Order by count(label) desc;


-- Q.25 Divide the no. of clients on the basis of education status how many own the credit card.
Select education, count(label)
From (Select a.Ind_ID, a.gender, a.car_owner, a.property_owner, a.children, a.annual_income, a.type_income, 
a.education, a.marital_status, a.housing_type,a.birthday_count, a.employed_days, a.family_members,b.label
From portfolioproject.credit_card a
Inner Join portfolioproject.credit_card_label b
On a.Ind_ID = b.Ind_ID) d
Where label = '0'
Group by education
Order by count(label) desc;


-- Q.26 Find out the average annual income of different type of income and different type of marital_status?
Select marital_status, type_income, avg(annual_income)
From credit_card
Group by marital_status, type_income;

-- Q.27 How many credit cards are owned by the males and how many by females?
Select gender, Count(label)
From (Select a.Ind_ID, a.gender, a.car_owner, a.property_owner, a.children, a.annual_income, a.type_income, 
a.education, a.marital_status, a.housing_type,a.birthday_count, a.employed_days, a.family_members,b.label
From portfolioproject.credit_card a
Inner Join portfolioproject.credit_card_label b
On a.Ind_ID = b.Ind_ID) d
Group by gender;

-- Q.28 How many credit card owners own the property and how many do not own the property?
Select property_owner, Count(label)
From (Select a.Ind_ID, a.gender, a.car_owner, a.property_owner, a.children, a.annual_income, a.type_income, 
a.education, a.marital_status, a.housing_type,a.birthday_count, a.employed_days, a.family_members,b.label
From portfolioproject.credit_card a
Inner Join portfolioproject.credit_card_label b
On a.Ind_ID = b.Ind_ID) d
Group by property_owner;

-- Q.29 
 

 -- 