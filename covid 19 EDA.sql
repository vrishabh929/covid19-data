-- Exploratory Data Analysis

select
	*
from 
	covid

-- Continent wise new_cases


select 
	continent,sum(new_cases) as count_of_cases
from
	covid
where
	continent is not null
group by
	continent
order by
	1 


-- date and continent wise cases

Select Location, date, total_cases, new_cases, total_deaths, population
From covid
Where continent is not null 
order by 1,2


-- Calculating the count of cases and death 
select 
	continent,sum(new_cases)as total_cases,sum(cast(new_deaths as int)) as count_of_deaths
from
	covid
where
	continent is not null
group by
	continent
order by
	1 

-- Country wise total cases and deaths

select 
	location,sum(new_cases)as total_cases,sum(cast(new_deaths as int)) as count_of_deaths
from
	covid
where
	continent is not null
group by
	location
order by
	1 


-- Death percentage for each continent
select
	continent,round(SUM(cast(new_deaths as int))/SUM(New_Cases)*100,2) as death_percent
from
	covid
where
	continent is not null
group by
	continent
order by
	2 desc

-- Death percentage of country

select
	location,round(SUM(cast(new_deaths as int))/SUM(New_Cases)*100,2) as death_percent
from
	covid
where
	continent is not null
group by
	location
order by
	2 desc


-- Vaccination

select
	location,SUM(cast(new_vaccinations as int)) as vaccinations
from
	covid
where
	continent is not null
group by
	location
order by
	2 desc


-- header


select 
	sum(cast(new_tests as int)) as [Total tests],
	sum(new_cases) as [Total positive cases],
	sum(cast(new_deaths as int)) as [Total Deaths],
	round(sum(new_cases)/sum(cast(new_tests as int))*100,2) as [positive rate],
	round(sum(cast(new_deaths as int))/sum(new_cases)*100,2) as [death percentage]
from
	covid
