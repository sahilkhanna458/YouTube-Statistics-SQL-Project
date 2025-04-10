# Youtube_Statistics
# Problem Statement:

In the dynamic landscape of digital content creation, understanding and analyzing the performance of YouTube channels is paramount for content creators, marketers, and platform enthusiasts. The dataset captures a plethora of information about various YouTube channels, ranging from subscriber counts to video views and geographical details. However, the dataset appears to be imperfect, containing null values, duplicates, and potentially inconsistent data. Therefore, the problem at hand is to preprocess and analyze this dataset effectively to derive meaningful insights and ensure its integrity for further exploration.

# Approach to the Solution:

The multifaceted challenge presented by the dataset necessitates a systematic and comprehensive approach to cleaning, analyzing, and augmenting the data. The code snippet outlines several SQL queries that collectively form a robust strategy for addressing the challenges in the dataset.

Data Cleaning:

Identify and quantify the occurrences of null values across various columns, offering a clear picture of the dataset's data integrity.
Drop unnecessary columns, reducing redundancy and focusing on essential features for analysis.
Standardize and clean categorical data, ensuring consistency and facilitating a more accurate representation of the dataset.

Geographical Mapping:
Introduce a new column, "continent," based on the mapping of countries to continents. This provides a broader geographical perspective for analysis.
Utilize a case statement to categorize countries into continents, enhancing the granularity of geographical insights.

Univariate Analysis:
Conduct univariate analysis on key features such as 'category' and 'Country,' offering a detailed breakdown of the distribution of content creators across these dimensions.
Explore and quantify the activity count within each category and country, aiding in identifying popular segments.

Statistical Measures:
Compute statistical measures like the mean and mode of yearly earnings, providing a comprehensive overview of the financial performance of the content creators.
Identify the Youtubers with the highest video views and subscribers growth in the last 30 days, offering a snapshot of recent channel success.

Temporal Analysis:
Assess the longevity of Youtubers by calculating the years of activity based on their creation date. This allows for the identification of seasoned content creators.

Category-based Analysis:
Determine the top categories with the most subscribers, enabling stakeholders to recognize and understand the prevalent content preferences on the platform.
