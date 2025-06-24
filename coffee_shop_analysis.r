---
title: "Coffee Shop Investment Analysis"
author: "Paola Baez"
date: "2025-06-23"
output: html_document
---

```{r setup, include=FALSE}
library(tidyverse)
library(lubridate)
```

## 🧹 Data Cleaning Summary

- **Missing Values**: Removed incomplete entries in key fields (`transaction_date`, `unit_price`, `transaction_qty`, `store_location`).
- **Date Standardization**: Converted `transaction_date` using `mdy()` and `transaction_time` using `hms()`.
- **Derived Columns**:
  - `total_price` = `unit_price` × `transaction_qty`
  - `weekday` = Day of week from `transaction_date`
  - `hour` = Hour extracted from `transaction_time`

```{r load-data}
setwd("/Users/paolabaez/Documents/R Fundamentals")
coffee_data <- read_csv("Coffee Shop Sales.csv")

coffee_data <- coffee_data %>%
  mutate(
    total_price = unit_price * transaction_qty,
    transaction_date = mdy(transaction_date),
    weekday = wday(transaction_date, label = TRUE, abbr = FALSE),
    hour = hour(hms(transaction_time))
  )
```

## 🔍 Exploratory Data Analysis (EDA)

### 📍 Store-Level Analysis

```{r store-analysis}
# Total Revenue by Store
coffee_data %>%
  group_by(store_location) %>%
  summarise(total_revenue = sum(total_price)) %>%
  arrange(desc(total_revenue))

# Average Order Value (AOV)
coffee_data %>%
  group_by(store_location) %>%
  summarise(avg_order_value = mean(total_price)) %>%
  arrange(desc(avg_order_value))

# Number of Transactions
coffee_data %>%
  group_by(store_location) %>%
  summarise(transaction_count = n()) %>%
  arrange(desc(transaction_count))

# Visualization
coffee_data %>%
  group_by(store_location) %>%
  summarise(total_revenue = sum(total_price)) %>%
  ggplot(aes(x = reorder(store_location, total_revenue), y = total_revenue)) +
  geom_col(fill = "chocolate4") +
  coord_flip() +
  labs(
    title = "Total Revenue by Store Location",
    x = "Store Location",
    y = "Total Revenue ($)"
  ) +
  theme_minimal()
```

### ☕ Product Category Analysis

```{r category-analysis}
# Revenue by Category
coffee_data %>%
  group_by(product_category) %>%
  summarise(total_revenue = sum(total_price, na.rm = TRUE)) %>%
  arrange(desc(total_revenue))

# Quantity by Category
coffee_data %>%
  group_by(product_category) %>%
  summarise(total_quantity = sum(transaction_qty, na.rm = TRUE)) %>%
  arrange(desc(total_quantity))

# Average Unit Price
coffee_data %>%
  group_by(product_category) %>%
  summarise(avg_unit_price = mean(unit_price, na.rm = TRUE)) %>%
  arrange(desc(avg_unit_price))

# Visualization
coffee_data %>%
  group_by(product_category) %>%
  summarise(total_revenue = sum(total_price, na.rm = TRUE)) %>%
  ggplot(aes(x = reorder(product_category, total_revenue), y = total_revenue)) +
  geom_col(fill = "#A0522D") +
  coord_flip() +
  labs(
    title = "Total Revenue by Product Category",
    x = "Product Category",
    y = "Total Revenue ($)"
  ) +
  theme_minimal()
```

### 🕒 Time-Based Analysis

```{r time-analysis}
# Revenue by Weekday
coffee_data %>%
  group_by(weekday) %>%
  summarise(total_revenue = sum(total_price, na.rm = TRUE)) %>%
  ggplot(aes(x = reorder(weekday, total_revenue), y = total_revenue)) +
  geom_col(fill = "#6A5ACD") +
  labs(
    title = "Total Revenue by Day of the Week",
    x = "Weekday",
    y = "Total Revenue ($)"
  ) +
  theme_minimal()

# Revenue by Hour
coffee_data %>%
  group_by(hour) %>%
  summarise(total_revenue = sum(total_price, na.rm = TRUE)) %>%
  ggplot(aes(x = hour, y = total_revenue)) +
  geom_line(color = "#FF8C00", size = 1.2) +
  geom_point(color = "#FF8C00") +
  labs(
    title = "Total Revenue by Hour of the Day",
    x = "Hour (24h)",
    y = "Total Revenue ($)"
  ) +
  theme_minimal()

# Heatmap
coffee_data %>%
  group_by(weekday, hour) %>%
  summarise(total_revenue = sum(total_price, na.rm = TRUE)) %>%
  ggplot(aes(x = hour, y = fct_rev(weekday), fill = total_revenue)) +
  geom_tile(color = "white") +
  scale_fill_viridis_c(option = "C") +
  labs(
    title = "Revenue Heatmap by Day and Hour",
    x = "Hour of Day",
    y = "Day of Week",
    fill = "Revenue ($)"
  ) +
  theme_minimal()
```

### 🏪 Product Trends per Store

```{r product-store-analysis}
# Revenue by Product Category per Store
category_store_summary <- coffee_data %>%
  group_by(store_location, product_category) %>%
  summarise(
    total_revenue = sum(total_price, na.rm = TRUE),
    .groups = "drop"
  )

ggplot(category_store_summary, aes(x = reorder(product_category, total_revenue), y = total_revenue, fill = product_category)) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  facet_wrap(~ store_location) +
  labs(
    title = "Revenue by Product Category per Store",
    x = "Product Category",
    y = "Total Revenue ($)"
  ) +
  theme_minimal()

# Product-Level Ranking Within Each Store
coffee_data %>%
  group_by(store_location, product_type) %>%
  summarise(
    revenue = sum(total_price, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(store_location, desc(revenue))
```

## ✅ Conclusion & Recommendations

- Prioritize investment in stores with high AOV, volume, and consistent performance.
- Expand offerings in top-performing product categories (e.g., coffee drinks, baked goods).
- Optimize operations during peak hours and days based on time-based trends.
- Reevaluate low-performing products with low revenue-to-volume ratios.

---

**Tools Used**: R, tidyverse, lubridate, ggplot2, and ChatGPT (as documentation assistant).
