SELECT TOP 5 * FROM [Youtube].[dbo].[GS];

SELECT TOP 5 * FROM [Youtube].[dbo].[GS] ORDER BY rank DESC;

 
SELECT COUNT(*) FROM [Youtube].[dbo].[GS] AS Rows;

ALTER TABLE [Youtube].[dbo].[GS]
--ALTER COLUMN highest_yearly_earnings FLOAT;
ALTER COLUMN subscribers BIGINT;

subscribers

SELECT Youtuber, rank, category, Title, uploads, Country, channel_type
FROM [Youtube].[dbo].[GS]
WHERE Youtuber IN (
    SELECT Youtuber
    FROM [Youtube].[dbo].[GS]
    GROUP BY Youtuber
    HAVING COUNT(*) > 1
);


-- Data Cleaning

SELECT COUNT(*) FROM [Youtube].[dbo].[GS] WHERE Youtuber IN (SELECT Youtuber FROM [Youtube].[dbo].[GS] GROUP BY Youtuber HAVING COUNT(*) > 1);

SELECT
    SUM(CASE WHEN Youtuber IS NULL THEN 1 ELSE 0 END) AS youtuber_null_count,
    SUM(CASE WHEN subscribers IS NULL THEN 1 ELSE 0 END) AS subscribers_null_count,
    SUM(CASE WHEN rank IS NULL THEN 1 ELSE 0 END) AS rank_null_count,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS category_null_count,
    SUM(CASE WHEN Title IS NULL THEN 1 ELSE 0 END) AS title_null_count,
    SUM(CASE WHEN uploads IS NULL THEN 1 ELSE 0 END) AS uploads_null_count,
    SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS country_null_count,
    SUM(CASE WHEN Abbreviation IS NULL THEN 1 ELSE 0 END) AS abbreviation_null_count,
    SUM(CASE WHEN channel_type IS NULL THEN 1 ELSE 0 END) AS channel_type_null_count,
    SUM(CASE WHEN video_views_rank IS NULL THEN 1 ELSE 0 END) AS video_views_rank_null_count,
    SUM(CASE WHEN country_rank IS NULL THEN 1 ELSE 0 END) AS country_rank_null_count,
    SUM(CASE WHEN channel_type_rank IS NULL THEN 1 ELSE 0 END) AS channel_type_rank_null_count,
    SUM(CASE WHEN video_views_for_the_last_30_days IS NULL THEN 1 ELSE 0 END) AS video_views_last_30_days_null_count,
    SUM(CASE WHEN lowest_monthly_earnings IS NULL THEN 1 ELSE 0 END) AS lowest_monthly_earnings_null_count,
    SUM(CASE WHEN highest_monthly_earnings IS NULL THEN 1 ELSE 0 END) AS highest_monthly_earnings_null_count,
    SUM(CASE WHEN lowest_yearly_earnings IS NULL THEN 1 ELSE 0 END) AS lowest_yearly_earnings_null_count,
    SUM(CASE WHEN highest_yearly_earnings IS NULL THEN 1 ELSE 0 END) AS highest_yearly_earnings_null_count,
    SUM(CASE WHEN subscribers_for_last_30_days IS NULL THEN 1 ELSE 0 END) AS subscribers_last_30_days_null_count,
    SUM(CASE WHEN created_year IS NULL THEN 1 ELSE 0 END) AS created_year_null_count,
    SUM(CASE WHEN created_month IS NULL THEN 1 ELSE 0 END) AS created_month_null_count,
    SUM(CASE WHEN created_date IS NULL THEN 1 ELSE 0 END) AS created_date_null_count,
    SUM(CASE WHEN [Gross tertiary education enrollment (%)] IS NULL THEN 1 ELSE 0 END) AS gross_enrollment_null_count,
    SUM(CASE WHEN Population IS NULL THEN 1 ELSE 0 END) AS population_null_count,
    SUM(CASE WHEN [Unemployment rate] IS NULL THEN 1 ELSE 0 END) AS unemployment_rate_null_count,
    SUM(CASE WHEN [Urban_population] IS NULL THEN 1 ELSE 0 END) AS urban_population_null_count,
    SUM(CASE WHEN Latitude IS NULL THEN 1 ELSE 0 END) AS latitude_null_count,
    SUM(CASE WHEN Longitude IS NULL THEN 1 ELSE 0 END) AS longitude_null_count
FROM [Youtube].[dbo].[GS];



ALTER TABLE [Youtube].[dbo].[GS]
DROP COLUMN [Gross tertiary education enrollment (%)],
DROP COLUMN [Population],
DROP COLUMN [Unemployment rate],
DROP COLUMN [Urban_population],
DROP COLUMN [Latitude],
DROP COLUMN [Longitude],
DROP COLUMN [subscribers_for_last_30_days];


UPDATE [Youtube].[dbo].[GS]
SET [category] = COALESCE([category], 'Not Available'),
    [Abbreviation] = COALESCE([Abbreviation], 'Not Available'),
    [channel_type] = COALESCE([channel_type], 'Not Available'),
    [Country] = COALESCE([Country], 'Not Available');


UPDATE [Youtube].[dbo].[GS]
SET [video_views_for_the_last_30_days] = COALESCE([video_views_for_the_last_30_days], (SELECT TOP 1 [video_views_for_the_last_30_days] FROM [Youtube].[dbo].[GS] WHERE [video_views_for_the_last_30_days] IS NOT NULL ORDER BY [video_views_for_the_last_30_days] DESC));


UPDATE [Youtube].[dbo].[GS]
SET [country_rank] = COALESCE([country_rank], (SELECT TOP 1 [country_rank] FROM [Youtube].[dbo].[GS] WHERE [country_rank] IS NOT NULL ORDER BY [country_rank] DESC)),
    [channel_type_rank] = COALESCE([channel_type_rank], (SELECT TOP 1 [channel_type_rank] FROM [Youtube].[dbo].[GS] WHERE [channel_type_rank] IS NOT NULL ORDER BY [channel_type_rank] DESC));


DELETE FROM [Youtube].[dbo].[GS]
WHERE [rank] IS NULL OR [Youtuber] IS NULL OR [subscribers] IS NULL OR [video views] IS NULL OR [category] IS NULL OR [Title] IS NULL OR [uploads] IS NULL OR [Country] IS NULL OR [Abbreviation] IS NULL OR [channel_type] IS NULL OR [video_views_rank] IS NULL OR [country_rank] IS NULL OR [channel_type_rank] IS NULL OR [video_views_for_the_last_30_days] IS NULL OR [lowest_monthly_earnings] IS NULL OR [highest_monthly_earnings] IS NULL OR [lowest_yearly_earnings] IS NULL OR [highest_yearly_earnings] IS NULL OR [created_year] IS NULL OR [created_month] IS NULL OR [created_date] IS NULL;


ALTER TABLE Youtube.dbo.GS
ADD continent VARCHAR(255);


UPDATE Youtube.dbo.GS
SET continent = 
    CASE
        WHEN Country IN ('Algeria','Angola','Benin','Botswana','Burkina Faso','Burundi','Cabo Verde','Cameroon','Central African Republic',
                         'Chad','Comoros','Congo, Dem. Rep', 'Congo, Rep.','Cote d''Ivoire','Djibouti','Egypt','Equatorial Guinea','Eritrea',
                         'Eswatini (formerly Swaziland)','Ethiopia','Gabon','Gambia','Ghana','Guinea','Guinea-Bissau','Kenya', 'Lesotho',
                         'Liberia','Libya','Madagascar','Malawi','Mali','Mauritania','Mauritius','Morocco','Mozambique','Namibia',
                         'Niger','Nigeria','Rwanda','Sao Tome and Principe','Senegal','Seychelles','Sierra Leone','Somalia','South Africa',
                         'South Sudan','Sudan','Tanzania','Togo','Tunisia','Uganda','Zambia','Zimbabwe')
        THEN 'Africa'
        WHEN Country IN ('Albania','Andorra', 'Armenia','Austria','Azerbaijan','Belarus','Belgium','Bosnia and Herzegovina',
                         'Bulgaria','Croatia','Cyprus','Czechia','Denmark','Estonia','Finland','France','Georgia','Germany',
                         'Greece','Hungary','Iceland','Ireland','Italy','Kazakhstan','Kosovo','Latvia','Liechtenstein','Lithuania',
                         'Luxembourg','Malta','Moldova','Monaco','Montenegro','Netherlands','Macedonia, FYR','Norway','Poland','Portugal',
                         'Romania','Russia','San Marino','Serbia','Slovakia','Slovenia','Spain','Sweden','Switzerland','Turkey',
                         'Ukraine','United Kingdom','Vatican City')
        THEN 'Europe'
        WHEN Country IN ('Afghanistan','Armenia','Azerbaijan','Bahrain','Bangladesh', 'Bhutan','Brunei','Cambodia','China','Cyprus',
                         'Georgia','India','Indonesia','Iran','Iraq','Israel','Japan','Jordan','Kazakhstan','Kuwait','Kyrgyzstan','Laos',
                         'Lebanon','Malaysia','Maldives','Mongolia','Myanmar','Nepal','North Korea','Oman','Pakistan','Palestine','Philippines',
                         'Qatar','Russia','Saudi Arabia','Singapore','South Korea','Sri Lanka','Syria','Taiwan','Tajikistan','Thailand',
                         'Timor-Leste','Turkey','Turkmenistan','United Arab Emirates','Uzbekistan','Vietnam','Yemen')
        THEN 'Asia'
        WHEN Country IN ('Antigua and Barbuda','Bahamas','Barbados','Belize','Canada','Costa Rica','Cuba','Dominica',
                         'Dominican Republic','El Salvador','Grenada','Guatemala','Haiti','Honduras','Jamaica','Mexico',
                         'Nicaragua','Panama','Saint Vincent and the Grenadines','United States')
        THEN 'North_America'
        WHEN Country IN ('Argentina','Bolivia','Brazil','Chile','Colombia','Ecuador','Guyana','Paraguay','Peru','Suriname',
                         'Uruguay','Venezuela')
        THEN 'South_America'
        WHEN Country IN ('Australia','Fiji','Kiribati','Marshall Islands','Micronesia','Nauru','New Zealand','Palau',
                         'Papua New Guinea','Samoa','Solomon Islands','Tonga','Tuvalu','Vanuatu')
        THEN 'Australia_and_Oceania'
    END;


SELECT * FROM Youtube.dbo.GS;



-- Univariate Analysis

SELECT category, COUNT(*) AS activity_count
FROM [Youtube].[dbo].[GS]
GROUP BY category
ORDER BY activity_count DESC;

SELECT
    Country,
    COUNT(*) AS ActivityCount
FROM
    [Youtube].[dbo].[GS]
GROUP BY
    Country
ORDER BY
    ActivityCount DESC;



SELECT
    continent,
    COUNT(*) AS ActivityCount
FROM
    [Youtube].[dbo].[GS]
GROUP BY continent
    
ORDER BY
    ActivityCount DESC;





-- Mean Yearly Earnings
SELECT AVG(CAST(highest_yearly_earnings AS FLOAT)) AS mean_y
FROM [Youtube].[dbo].[GS];


-- Mode Yearly Earnings
WITH EarningsCounts AS (
    SELECT CAST(highest_yearly_earnings AS FLOAT) AS highest_yearly_earnings, COUNT(*) AS count_y
    FROM [Youtube].[dbo].[GS]
    GROUP BY CAST(highest_yearly_earnings AS FLOAT)
)
SELECT TOP 1 highest_yearly_earnings AS mode_y
FROM EarningsCounts
ORDER BY count_y DESC;


-- Youtubers with the Highest Video Views in the Last 30 Days:

SELECT TOP 5 Youtuber, video_views_for_the_last_30_days
FROM [Youtube].[dbo].[GS]
ORDER BY video_views_for_the_last_30_days;


-- Top 5 Youtubers with the Highest Subscribers Growth in the Last 30 Days:
SELECT TOP 5 Youtuber, subscribers_for_last_30_days
FROM [Youtube].[dbo].[GS]
ORDER BY subscribers_for_last_30_days DESC;


-- Youtubers with the Longest Existence (Oldest):
SELECT TOP 5
    Youtuber,
    DATEDIFF(YEAR, 
        CONVERT(DATE, 
            CONVERT(VARCHAR(4), created_year) + '-' + 
            CASE WHEN created_month = 'Jan' THEN '01'
                 WHEN created_month = 'Feb' THEN '02'
                 WHEN created_month = 'Mar' THEN '03'
                 WHEN created_month = 'Apr' THEN '04'
                 WHEN created_month = 'May' THEN '05'
                 WHEN created_month = 'Jun' THEN '06'
                 WHEN created_month = 'Jul' THEN '07'
                 WHEN created_month = 'Aug' THEN '08'
                 WHEN created_month = 'Sep' THEN '09'
                 WHEN created_month = 'Oct' THEN '10'
                 WHEN created_month = 'Nov' THEN '11'
                 WHEN created_month = 'Dec' THEN '12'
            END + '-' + 
            CONVERT(VARCHAR(2), created_date)), GETDATE()) AS years_active
FROM [Youtube].[dbo].[GS]
ORDER BY years_active DESC;




-- Top 5 Categories with the Most Subscribers:
SELECT TOP 5 category, SUM(subscribers) AS total_subscribers
FROM [Youtube].[dbo].[GS]
GROUP BY category
ORDER BY total_subscribers DESC;


































