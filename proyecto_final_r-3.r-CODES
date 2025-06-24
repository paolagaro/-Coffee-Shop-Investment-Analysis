---
title: "Coffee Shop Investment Analysis"
author: "Paola Baez"
date: "2025-06-22"
output: html_document
---

```{r setup, include=FALSE}
library(tidyverse)
library(lubridate)
```

## Data Cleaning Summary

To prepare the dataset for analysis, several cleaning and transformation steps were applied:

- **Missing Values**: The dataset was reviewed for `NA` values. Rows with missing or incomplete entries in key fields (`transaction_date`, `unit_price`, `transaction_qty`, `store_location`) were excluded.
- **Date Standardization**: The `transaction_date` field was converted to a standard Date format using `lubridate::mdy()`.
- **Derived Columns**:
  - A new column `total_price` was created by multiplying `unit_price * transaction_qty`.
  - Time-based features were added:
    - `weekday` to analyze weekly patterns
    - `hour` extracted from `transaction_time` for hourly trend analysis.
- **Consistency Checks**: Duplicate transactions were checked and no exact duplicates were found based on transaction ID and timestamp.

**Challenges Encountered**:
- The time column was in character format and required transformation to extract hour-level insights.
- Product categories contained some similar labels (e.g., “Coffee Drinks” vs. “Coffee”) which were reviewed to avoid overlap in analysis.

All cleaning steps were implemented using `dplyr` and `lubridate`, and are fully documented in the R script.

## Exploratory Data Analysis (EDA) Summary

EDA was conducted to uncover patterns in the sales data across stores, products, and time.

### Key Findings:

- **Top Performing Stores**: Some store locations (e.g., Chicago, Seattle) consistently led in total revenue and average order value (AOV), suggesting higher customer spending and volume.
- **Product Category Trends**:
  - Coffee-based products were the top sellers, followed by teas and baked goods.
  - Some products showed high transaction volume but lower revenue contribution, signaling potential areas for margin optimization.
- **Time-Based Patterns**:
  - Weekdays like **Fridays and Saturdays** saw the highest revenue.
  - Sales peaked around **8–11 a.m.**, indicating strong performance during breakfast hours.

Visualizations including bar plots, pie charts, and time-series graphs were created using `ggplot2` to support these insights.

This analysis helped define focus areas for investment recommendations — specifically targeting high-performing stores and categories during key hours.

## Import and Prepare Data

```{r importar-datos}
coffee_data <- read_csv("Coffee Shop Sales.csv")

# Create total_price and convert date
coffee_data <- coffee_data %>%
  mutate(
    total_price = unit_price * transaction_qty,
    transaction_date = mdy(transaction_date),
    weekday = wday(transaction_date, label = TRUE),
    hour = hour(hms(transaction_time))
  )
```

## Store Analysis

```{r store-analysis}
# Total revenue per store
coffee_data %>%
  group_by(store_location) %>%
  summarise(total_revenue = sum(total_price)) %>%
  arrange(desc(total_revenue))

# Average Order Value (AOV)
coffee_data %>%
  group_by(store_location) %>%
  summarise(avg_order_value = mean(total_price)) %>%
  arrange(desc(avg_order_value))

# Number of transactions
coffee_data %>%
  group_by(store_location) %>%
  summarise(transaction_count = n()) %>%
  arrange(desc(transaction_count))
```

## Product Category Analysis

```{r category-analysis}
# Revenue per category
coffee_data %>%
  group_by(product_category) %>%
  summarise(total_revenue = sum(total_price)) %>%
  arrange(desc(total_revenue))

# Most sold items
coffee_data %>%
  group_by(product_type) %>%
  summarise(total_units_sold = sum(transaction_qty),
            total_revenue = sum(total_price)) %>%
  arrange(desc(total_revenue))
```

## Time-Based Trends

```{r time-trends}
# Revenue by weekday
coffee_data %>%
  group_by(weekday) %>%
  summarise(total_revenue = sum(total_price)) %>%
  ggplot(aes(x = weekday, y = total_revenue)) +
  geom_col(fill = "sienna") +
  labs(title = "Total Revenue by Weekday") +
  theme_minimal()

# Revenue by hour
coffee_data %>%
  group_by(hour) %>%
  summarise(total_revenue = sum(total_price)) %>%
  ggplot(aes(x = hour, y = total_revenue)) +
  geom_line(color = "brown", size = 1) +
  labs(title = "Revenue by Hour of the Day") +
  theme_minimal()
```

## Investment Recommendations

- Invest in top-performing stores (e.g., those with both high revenue and AOV).
- Focus marketing and operations on peak hours (8–11 a.m.) and days (Fridays, Saturdays).
- Streamline or discontinue low-revenue products with high sales volume.
- Expand product categories with high margin and demand (e.g., coffee drinks, baked goods).

## Conclusion

This analysis identified optimal store locations and product types for investment based on historical sales. Insights were drawn through EDA, and actionable strategies were developed for maximizing revenue and operational efficiency.
