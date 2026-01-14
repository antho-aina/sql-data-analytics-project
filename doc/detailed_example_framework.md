# Data Analytics Framework
This document outlines the key components of Data Analytics, structured into two primary categories: Exploratory Data Analysis (EDA) and Advance Analytics. Each category encompasses specific analytical techniques that help uncover insights and support decision-making.

---

## 🔍 Exploratory Data Analysis (EDA)
EDA focuses on understanding the structure, patterns, and relationships within a dataset. It is typically the first step in any data analysis process.

### 01. Database Exploration  
**Purpose**: Investigating the structure, tables, and relationships within the database.

Questions to ask:
- What tables and schemas exist?
- Which columns are dimensions (categorical) and which are measures (numerical)?
- How are tables related (keys, joins, constraints)?

### 02. Dimensions Exploration  
**Purpose**: Explore the structure of dimension tables.

Questions to ask:
- What dimensions exist (e.g., region, product, customer)?
- Do hierarchies exist (e.g., Country → Region → City)?
- Are there surrogate keys or natural keys for dimensions?

### 03. Date Range Exploration  
**Purpose**: Understand the range of historical data.

Questions to ask:
- What is the time range of the dataset?
- Is data continuous or missing periods?

### 04. Measures Exploration (Big Picture)  
**Purpose**: Analyze high-level business metrics to get a quick overview of overall performance.

Questions to ask:
- What are the mean and total values of measures? (sales , orders , ...)
- Are there anomalies or extreme values?

### 05. Magnitude  
**Purpose**: See how performance differs by dimensions.

Questions to ask:
- How do measures vary across dimensions?
- Which values are unusually high or low?

### 06. Ranking (Top N – Bottom N)  
**Purpose**: Identifying highest and lowest performing entities.

Questions to ask:
- Which dimension (regions / country) members rank highest in measures?
- Which consistently underperform?

--- 

## 📈 Advance Analytics

### 07. Change-Over-Time (Trends)  
**Purpose**: Identify trends and patterns in performance over time.

Questions to ask:
- Are measures trending upward, downward, or cyclical?
- Are trends consistent across dimensions?

### 08. Cumulative Analysis  
**Purpose**: Track how values build up over time to understand overall progress.

Questions to ask:
- How do totals grow over time?
- Which dimensions contribute most to the total?
- When does growth speed up or slow down?

### 09. Performance Analysis  
**Purpose**: Identify the factors that drive performance differences.

Questions to ask:
- Are results better or worse than targets or expectations?
- Which products, customers, or regions perform best and worst?
- What factors explain these performance differences?

### 10. Part-to-Whole (Proportional)  
**Purpose**: Understanding how components contribute to a whole.

Questions to ask:
- What percentage does each dimension contribute? (ex : products)
- Are the top contributors staying the same over time?
- Which groups contribute the biggest share of the total?

### 11. Data Segmentation  
**Purpose**: Dividing data into meaningful groups for targeted analysis.

Questions to ask:
- How can dimensions be grouped meaningfully? (New vs returning customers, High-value vs low-value products ...)
- Do segments show distinct measure patterns?
- Which segments are most valuable, most at risk, or require attention?

### 12. Reporting
**Purpose**: Report consolidates key customer metrics and behaviors.

Questions to ask:
- What should stakeholders care about?
- What action should be taken?
