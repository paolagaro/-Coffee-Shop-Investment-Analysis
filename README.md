☕ Coffee Shop Investment Analysis.

🎯 Project Goal
The main objective of this project is to identify which coffee shop locations and product categories are most profitable, in order to recommend the best investment opportunities. Using historical sales data, we explore store-level performance, product trends, and time-based sales patterns.

📦 Dataset Overview
The dataset used includes transaction-level sales data from multiple coffee shop locations. Key fields include:

transaction_date and transaction_time
store_location
product_category and product_type
unit_price and transaction_qty
🔧 Data Cleaning & Preparation

To ensure accurate and reliable insights, the dataset was cleaned and transformed using the following steps:

Date Conversion: Parsed transaction_date to Date format and transaction_time to extract hour.
New Variables Created:
total_price = unit_price × transaction_qty
weekday (Monday–Sunday)
hour (Hour extracted from time)
Missing Values: Rows with missing values in key fields were removed.
Data Types: Ensured all numerical and categorical variables had the correct data type.
Consistency Checks: Verified store and product labels were consistent.

🔍 Exploratory Data Analysis (EDA)

🏪 Store Performance Analysis
Total Revenue: Identified which stores generate the most income.
Average Order Value (AOV): Assessed customer spending behavior across locations.
Transaction Volume: Evaluated traffic per store.
Insight: A few key stores stand out for both high revenue and customer volume — ideal targets for future investment.

📦 Product Category Trends
Top Categories by Revenue and Volume: Coffee drinks and baked goods perform the best.
Average Price by Category: Useful to assess value perception vs sales.
Visualization: Bar charts show the dominance of a few key categories.
Insight: Some product categories sell a lot but contribute little to revenue — opportunity for pricing adjustments or promotion strategy.

🕒 Temporal Sales Patterns
By Weekday: Weekends show higher revenue peaks.
By Hour: Morning hours (8–11 AM) have the highest sales activity.
Heatmap: Strong visual confirmation of peak hours and days.
Insight: Focus marketing efforts and staff scheduling on peak times to increase efficiency and profit margins.

🧁 Product Trends Within Stores
Revenue by Product Category per Store: Analyzed which categories perform best by location.
Top-Selling Products: Identified product types with the highest contribution to revenue by store.
Insight: Some products are consistently top-performers across multiple locations — ideal for bundling or expanding.

✅ Conclusions & Recommendations

📍 Top Store Locations should be prioritized for expansion or investment.
⏰ Peak Hours & Days reveal when to focus promotions and staffing.
💸 High-Volume, Low-Revenue Products should be reviewed to improve profit margins.
☕ Top Product Categories like coffee drinks and baked goods are safe bets for investment and promotion.
🧠 Data-Driven Decisions: This analysis supports strategic planning for franchise expansion, pricing, and marketing.
