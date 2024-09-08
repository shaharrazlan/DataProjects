Here’s a draft for your GitHub README that explains your SQL and Tableau project on COVID-19:

---

# COVID-19 Data Analysis Project

### Overview

This project analyzes COVID-19 data using SQL for data exploration and Tableau for data visualization. The analysis focuses on understanding key metrics such as total cases, deaths, infection rates, and vaccination progress across different countries and continents. Below is a breakdown of the SQL queries used in the project along with the interactive Tableau dashboard.

### Data Sources
- **COVID-19 Deaths and Cases Dataset**: Sourced from the [COVID-19 Data Repository](https://public.tableau.com/app/profile/shahar.razlan/viz/CovidDashboard_16953950013250/Dashboard1?publish=yes), this dataset contains comprehensive information on cases, deaths, and population data across various countries.
- **COVID-19 Vaccinations Dataset**: Contains information on vaccination progress globally, detailing the number of new vaccinations by date.

### SQL Queries Breakdown

1. **Exploring Global Trends**
   - Selected global cases, deaths, and infection rates.
   - Compared the percentage of the population infected across different countries.
   ```sql
   SELECT Location, Date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
   FROM PortfolioProjects..CovidDeaths$
   WHERE location LIKE '%ISRAEL%'
   ORDER BY 1,2;
   ```

2. **Highest Infection Rates**
   - Identified countries with the highest infection rates relative to their populations.
   ```sql
   SELECT Location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS PercentagePopulationInfected
   FROM PortfolioProjects..CovidDeaths$
   GROUP BY Location, Population
   ORDER BY PercentagePopulationInfected DESC;
   ```

3. **Global Mortality Comparison**
   - Analyzed total death counts across continents and countries, highlighting the most impacted regions.
   ```sql
   SELECT continent, MAX(CAST(total_Deaths AS int)) AS TotalDeathCount
   FROM PortfolioProjects..CovidDeaths$
   WHERE continent IS NOT NULL
   GROUP BY continent
   ORDER BY TotalDeathCount DESC;
   ```

4. **Vaccination Progress**
   - Created a rolling count of vaccinated individuals by country to monitor the pace of vaccination.
   ```sql
   WITH PopvsVac AS (
       SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
           SUM(CAST(vac.new_vaccinations AS int)) OVER (PARTITION BY dea.Location ORDER BY dea.Location, dea.Date) AS RollingPeopleVaccinated
       FROM PortfolioProjects..CovidDeaths$ dea
       JOIN PortfolioProjects..CovidVaccinations$ vac
           ON dea.location = vac.location AND dea.date = vac.date
       WHERE dea.continent IS NOT NULL
   )
   SELECT *, (RollingPeopleVaccinated/Population)*100 AS PercentageVaccinated
   FROM PopvsVac;
   ```

5. **Global Statistics**
   - Summed up total global cases, deaths, and calculated the death percentage for an overall understanding of the pandemic's impact.
   ```sql
   SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS int)) AS total_deaths, 
       SUM(CAST(new_deaths AS int))/SUM(new_cases)*100 AS DeathPercentage
   FROM PortfolioProjects..CovidDeaths$
   WHERE continent IS NOT NULL;
   ```

### Tableau Dashboard

The Tableau dashboard visualizes key insights derived from the data. It includes:
- **Global COVID-19 Cases & Deaths**: A world map highlighting the total cases and deaths across different regions.
- **Continental Death Count Comparison**: A bar chart comparing the total death counts across continents.
- **Percent Population Infected**: A line chart showing the percentage of the population infected in select countries over time.
- **Vaccination Progress**: Visualization of vaccination progress globally, tracking the percentage of vaccinated individuals by country.

You can explore the interactive dashboard [here](https://public.tableau.com/app/profile/shahar.razlan/viz/CovidDashboard_16953950013250/Dashboard1?publish=yes).

### Skills Demonstrated
- SQL data manipulation (joins, aggregations, window functions)
- Data cleaning and standardization
- Tableau visualization (maps, bar charts, time series analysis)

### Conclusion

This project demonstrates the ability to work with complex datasets, clean and standardize data using SQL, and provide insightful visualizations using Tableau. The analysis of COVID-19 cases and deaths provides a detailed understanding of the pandemic's impact on a global and regional scale.

