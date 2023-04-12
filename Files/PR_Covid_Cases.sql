-- This Query is to verify how the data is structured
SELECT age,
	   gender,
       city, 
       region,
       sample_date
From covid_case_db;

-- This Query get the total cases of Covid in Puerto Rico
SELECT COUNT(*) AS total_cases 
FROM covid_case_db;

-- This Query get the total cases by month by using a nested select to avoid using data that is not needed
SELECT DATE_FORMAT( convert(sample_date, DATE), '%b-%Y') AS mon_year, COUNT(sample_date) AS case_count
	FROM covid_case_db
		Where region IN (SELECT region FROM covid_case_db WHERE region != "FUERA_DE_PR")
			GROUP BY mon_year;
            