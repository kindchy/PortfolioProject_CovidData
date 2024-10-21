--Select *
--From PortfolioProject..CovidDeaths
--Order By 3,4

--Select *
--From PortfolioProject..CovidVaccinations
--Order By 3,4

--Scenario 1 - Looking at total cases vs total death to demonstrate the likelihood of death if one contracts the disease
--Select Continent, location, date, total_cases, total_deaths, population, 
--	CASE WHEN total_cases = 0 THEN NULL
--	ELSE ROUND(total_deaths/total_cases *100,2)
--	END As DeathPercentage
--From PortfolioProject..CovidDeaths
--Where continent is not null
----Where location like '%Arica'
--Order By 1,2

--Scenario 2- Percentage deaths based on continents
--Select continent, SUM(total_cases) as Totalcases, SUM(total_deaths) as Totaldeaths, ROUND(SUM(total_deaths)/SUM(total_cases) *100,2) As PercentageDeaths
--From PortfolioProject..CovidDeaths
--Where continent is not null
----Where location like '%Arica'
--Group by continent
--Order By 1,2

--Select location, SUM(total_cases) as Totalcases, SUM(total_deaths) as Totaldeaths, ROUND(SUM(total_deaths)/SUM(total_cases) *100,2) As PercentageDeaths
--From PortfolioProject..CovidDeaths
--Where continent is not null
----Where location like '%Arica'
--Group by location
--Order By PercentageDeaths desc

--Select location, population, MAX(total_cases) as Totalcases, MAX(total_deaths) as Totaldeaths 
--From PortfolioProject..CovidDeaths
--Where continent is not null
----Where location like '%Arica'
--Group by location, population
--Order By Totalcases desc

---- Join CovidDeaths table and CovidVaccinations table
--Select *
--From PortfolioProject..CovidDeaths de
--join PortfolioProject..CovidVaccinations va
--On de.location = va.location and 
--de.date = va.date

--Consdering total population vs vaccinations
--Select de.location, de.date, de.population, de.total_cases, va.new_vaccinations
--From PortfolioProject..CovidDeaths de
--join PortfolioProject..CovidVaccinations va
--On de.location = va.location and 
--de.date = va.date
--Where de.continent is not null
--Order by de.total_cases desc

--CREATE VIEW PopulationVacinated as
--Select de.location, de.date, de.population, de.total_cases, va.people_vaccinated
--From PortfolioProject..CovidDeaths de
--join PortfolioProject..CovidVaccinations va
--On de.location = va.location and 
--de.date = va.date
--Where de.continent is not null
----Order by de.total_cases desc

Select * 
From PopulationVacinated
