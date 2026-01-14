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
**Purpose**: Analyzing how metrics evolve over time.

Questions to ask:
- Are measures trending upward, downward, or cyclical?
- Are trends consistent across dimensions?

### 08. Cumulative Analysis  
**Purpose**: Aggregating data to understand total impact or progression.

Questions to ask:
- What is the cumulative growth of measures?
- How do totals compare across categories?
- Where does growth accelerate or slow?

### 09. Performance Analysis  
**Purpose**: Identify the factors that drive performance differences.

Questions to ask:
- How do measures compare against benchmarks?
- Which dimensions show strong vs. weak performance?
- What drivers explain differences?

### 10. Part-to-Whole (Proportional)  
**Purpose**: Understanding how components contribute to a whole.

Questions to ask:
- What percentage does each dimension contribute? (ex : products)
- Are the top contributors staying the same over time?
- Which groups contribute the biggest share of the total?

### 11. Data Segmentation  
**Purpose**: Dividing data into meaningful groups for targeted analysis.

Questions to ask:
- How can dimensions be grouped meaningfully?
- Do segments show distinct measure patterns?
- Which segments are most valuable or risky?

### 12. Reporting
**Purpose**: Communicating findings through dashboards, summaries, and visualizations.

Questions to ask:
- Which measures and dimensions matter most to stakeholders?
- What visualizations best highlight insights?
- How can results be communicated clearly and effectively?
