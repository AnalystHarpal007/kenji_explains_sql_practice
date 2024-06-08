#using join to join both the tables#
#----------------Inner Join----------#
#first we use inner join - it return the rows that have matching values in both the tables

SELECT * FROM billionaires
inner join geography
on billionaires.country = geography.country_name
;

#------------

SELECT personname, Country_Name, industries, city, continent FROM billionaires
inner join geography
on billionaires.country = geography.country_name
;

#-----------------left join------------------
#
select distinct(country), continent, language from billionaires
left join geography
on billionaires.country = geography.country_name;

#------------right join----------

SELECT distinct(country), Country_Name, continent, language FROM billionaires
right join geography
on billionaires.country = geography.country_name

