# -Coffee-Shop-Investment-Analysis
This project analyzes historical sales data from multiple coffee shop locations to identify investment opportunities.
📌 Project Overview

This project analyzes historical sales data from multiple coffee shop locations to identify investment opportunities. The goal is to determine which stores and products are most profitable and when sales peak, in order to guide strategic business decisions.

 #Objectives

Identify which store locations generate the most revenue and have the highest customer value.
Discover which product categories and types contribute most to revenue.
Uncover time-based sales trends by weekday and hour.
Provide actionable recommendations for improving profitability.

#Data Cleaning

Removed missing or incomplete entries in key fields like dates, quantity, and price.
Converted transaction_date into proper date format.
Created derived features:
total_price = unit_price × transaction_qty
weekday and hour extracted from transaction data
Resolved label inconsistencies in product categories.

#Exploratory Analysis (EDA)

*Store Performance
Stores like Chicago and Seattle lead in both revenue and average order value.
Store volume and order value vary significantly across locations.

*Product Analysis
Coffee drinks are top-selling across all stores.
Some products have high volume but low revenue, which may reduce margins.

* Time-Based Insights
Sales peak during 8–11 a.m. and on Fridays/Saturdays, suggesting breakfast is key.
Sunday shows lower engagement across stores.

 #Key Recommendations

Invest in high-performing stores with both strong revenue and order value.
Focus marketing during peak hours and weekends.
Review low-performing items with high volume but low revenue contribution.
Promote categories like coffee and baked goods which show high margin potential.

*Files Included

Proyecto_Final_R.Rmd: The full R Markdown analysis script.
Coffee Shop Sales.csv: The dataset used in this project.
HTML output (rendered report) [optional: hosted version or PDF].

#Final Thoughts

This project showcases the use of R for practical business analysis. It applies data wrangling, visualization, and statistical thinking to real-world retail data, supporting better investment decisions in the coffee shop industry.


Author: Paola Baez
Date: June 22, 2025
Tools: R, Tidyverse, ggplot2, lubridate.
