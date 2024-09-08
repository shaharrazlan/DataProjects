SELECT *
FROM PortfoilioProjects..CovidDeaths$
ORDER by 3,4

--SELECT *
--FROM PortfoilioProjects..CovidVaccinations$
--ORDER by 3,4

Select Location, Date, total_cases, new_cases, total_deaths, population
From PortfoilioProjects..CovidDeaths$
ORDER by 1,2


-- Looking at Total Cases vs Total Deaths

Select Location, Date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfoilioProjects..CovidDeaths$
Where location like '%ISRAEL%'
ORDER by 1,2

-- Looking at Total Cases vs Population
-- Shows what precentege of population got Covid

Select Location, Date, population, total_cases, (total_cases/population)*100 as PercentagePopulationInfected
From PortfoilioProjects..CovidDeaths$
Where location like '%ISRAEL%'
ORDER by 1,2

--Looking at Countries with Highest infection Rate compared to Population

Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentagePopulationInfected
From PortfoilioProjects..CovidDeaths$
--Where location like '%ISRAEL%'
Group by Location, Population
ORDER by PercentagePopulationInfected desc


-- Showing the Countries with Highest Death Count per Population
Select Location, MAX(cast(total_Deaths as int)) as TotalDeathCount
From PortfoilioProjects..CovidDeaths$
--Where location like '%ISRAEL%'
where continent is not null
Group by Location
ORDER by TotalDeathCount desc


Select location, MAX(cast(total_Deaths as int)) as TotalDeathCount
From PortfoilioProjects..CovidDeaths$
--Where location like '%ISRAEL%'
where continent is null
Group by location
ORDER by TotalDeathCount desc

-- showing the continents with the Highest 
Select continent, MAX(cast(total_Deaths as int)) as TotalDeathCount
From PortfoilioProjects..CovidDeaths$
--Where location like '%ISRAEL%'
where continent is not null
Group by continent
ORDER by TotalDeathCount desc

-- GLOBAL NUMBERS 

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPrecentage
From PortfoilioProjects..CovidDeaths$ 
Where continent is not null
ORDER by 1,2

with PopvsVac (Continent, Location, Date, Population, new_vaccinations, RollingPeopleVaccinated)
as
(
-- Looking at Total Population vs Vaccinations
select dea.continent, dea.location, dea.date, dea. population, vac.new_vaccinations
, SUM(convert(int, vac.new_vaccinations)) OVER (Partition by dea.Location order by dea.Location, dea.Date) as RollingPeopleVaccinated
From PortfoilioProjects..CovidDeaths$ dea
join PortfoilioProjects..CovidVaccinations$ vac
    on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3

)
select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac


-- TEMP TABLE
Drop Table if exists #PercentPopulationVccinated
Create Table #PercentPopulationVccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
new_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.Location order by dea.location, dea.Date) as RollingPeopleVaccinated
From PortfoilioProjects..CovidDeaths$ dea
join PortfoilioProjects..CovidVaccinations$ vac
    on dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null
--order by 2,3

select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVccinated

DROP VIEW PercentPopulationVccinated

-- Creating View to store data for later visualization
USE PortfoilioProjects
GO
Create view PercentPopulationVccinated AS
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location, dea.Date) as RollingPeopleVaccinated
From PortfoilioProjects..CovidDeaths$ dea
join PortfoilioProjects..CovidVaccinations$ vac
    on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3


select *
From PercentPopulationVccinated