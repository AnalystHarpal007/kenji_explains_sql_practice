# I practiced this sql from youtube channed kenji explains sql series

# Relational database management system-
#It is a software that allow us to store, manage,query and retrieve data stored in a relational database

select* from billionaires;

#1) ---------First task show their name and net worth-------

select personName, finalWorth 

from billionaires;

#2) second select countries

select distinct country from billionaires;

#3) Manager want to knows calculate the number of countries

select count(distinct country) from billionaires;

#4) Manager want to knows calculate the number of people

select count(distinct personName) from billionaires;

#5) Manager want to knows the average final worth

select avg (finalWorth) from billionaires;

#6) Manager want to knows the richest people in france

select  personName, country, gender, city from billionaires
where country="France" ;

#7) Manager want to knows the richest people in france but not from paris

select  personName, country, gender, city from billionaires
where country="France"  and city <> "paris";

#8) Manager want to knows the richest people in france and spain

select * from billionaires
where country = "france" or country= "Spain";

#9) Manager want to knows the richest people in france , Italy and spain (now we have to select multiple countries so we will use in function)

select * from billionaires

where country in ("France", "Italy", "Spain");

#10 Manager want to knows how many are self made

select count(personName) from billionaires

where selfMade="True";

#11) Manager want to knows the number of billionares by industry(group by) and highest billionare in which industry

select industries, count(personName) as billionare_count from billionaires
group by industries
order by count(personName) desc
;

#12) Manager want to knows the number of top 10 billionare by industry

select industries, count(personName) as billionare_count from billionaires
group by industries
order by count(personName) desc
limit 10;

#13 Manager want to knows the number of billionare by birth month

select birthMonth, count(personName) as Person_name from billionaires
group by birthMonth
order by count(personName) asc
;

#----------- REGEX-----------------
#14) List those countries that start with the letter F 

 select * from billionaires
 where country regexp '^f' 
 ;

#15) List those country that end with the letter F or any other

select * from billionaires
where country regexp 'f$'; #not found

select * from billionaires
where country regexp 'a$';

#16) suppose manager asking for List those country that start either with an f or c 

select * from billionaires

where country regexp '^f|^c'; #we used this piping|

#17) suppose manager asking for List those country that start with c but have an h/o after that

select * from billionaires
where country regexp '^c[ho]' #use double bracket
;

#------------- if & case-statement--------

#18) Manager want to categorize the billionires by high or low

select personName, finalWorth,
if(finalWorth < 10000, 'low','high') as category
from billionaires;

#19) Manager want to categorize the billionires by low, medium ,high (for this we use case statemnt)

select personName, finalWorth,
case 
    when finalWorth <10000 then 'low'
    when finalWorth between 10000 and 30000 then 'medium'
    else 'High' 
end as 'case'
from billionaires
;


#-------------Subqueries---------
# A query inside another query

#20) now manager want to compare the average net worth vs each person
 
select personName, finalWorth,
(select avg(finalWorth) as avg_networth from billionaires ) as avg_networth
from billionaires;

#-------------------------------------------#





