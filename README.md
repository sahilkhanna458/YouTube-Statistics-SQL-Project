# YouTube Statistics SQL Project

## Problem Statement

In today's digital content landscape, analyzing YouTube channel performance is essential for creators, marketers, and platform analysts. This project involves working with a real-world YouTube dataset containing subscriber counts, video views, and geographic information. However, the raw data included null values, duplicates, and inconsistencies, requiring thorough preprocessing and analysis to derive actionable insights.

## Approach and Solution

I independently designed and executed a comprehensive data cleaning, mapping, and analysis pipeline using SQL Server to address the dataset challenges:

### Data Cleaning
- Identified and quantified null values across multiple fields to assess data integrity.
- Dropped redundant columns to streamline analysis and improve dataset efficiency.
- Standardized and cleaned categorical data to ensure consistency across records.

### Geographical Mapping
- Created a new "continent" column by mapping countries to their respective continents using SQL CASE statements, adding valuable geographic segmentation for further analysis.

### Univariate Analysis
- Performed univariate exploration on key features such as `category` and `country`, identifying top content genres and country-wise YouTube creator distributions.
- Analyzed creator activity counts within each category and country.

### Statistical Analysis
- Calculated statistical measures including mean and mode of yearly earnings for creators.
- Identified creators with the highest video views and subscriber growth over the past 30 days.

### Temporal Analysis
- Assessed creator longevity by calculating years of activity based on channel creation dates.

### Category-Based Analysis
- Highlighted top content categories with the highest subscriber bases, revealing trends in audience preferences and platform engagement.

## Skills Demonstrated
- SQL Data Cleaning and Transformation
- Data Aggregation and Grouping
- Geographical Data Mapping
- Data Quality Analysis
- Insight Generation and Reporting

## Technologies Used
- SQL Server Management Studio (SSMS)
- Microsoft Excel (for input data preparation)
- Data Analysis and Reporting Techniques

## Outcome
This project provided deep insights into YouTube channel growth patterns, audience engagement strategies, and content optimization opportunities based on statistical and geographic factors.


