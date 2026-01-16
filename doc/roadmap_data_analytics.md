# 📊 Beginner-Friendly Data Analytics Framework

**Project scope notice**
The dataset used in this project has **already been cleaned, normalized, and quality-checked** in a separate repository.

* No deduplication required
* No normalization or standardization required
* Data types, keys, and all data makes sense.

This repository focuses **only on analysis, insight generation, and reporting**.

---

## 🎯 Purpose

This framework provides basic questions for data analysis. It removes redundancy, avoids advanced concepts too early, and guides users from raw understanding to **actionable insights**.

The framework is divided into **2 phases** and **9 steps**, each answering **one simple analytical question**.

---

## 🔍 Phase 1: Understand & Trust the Data (EDA)

**Goal**: Ensure the data makes sense before analyzing performance.

### 01. Understanding the Data Structure

**Purpose**: Understand what data exists and what one row represents.

**Questions to ask**:

* What tables and schemas exist?
* What is the data type of each column? (numeric, text, date, boolean)
* Which table contains the main business event (sales, orders, transactions)?
* What does one row represent? (one sale, one order, one customer?)
* Which columns are dimensions (categories)? (e.g: categoroy, product, birthday, ID, ...)
* Which columns are measures (numbers)? (e.g: sales, quantity, age, ...)

---

### 02. Dimensions Check (Categories)

**Purpose**: Ensure categories are usable for grouping and comparison.

**Questions to ask**:

* What are the main categories (product, customer, region)?
* How many unique values does each category have?
* Are there missing or unclear values?
* Are labels consistent and readable? (Dimension value e.g: [US , USA] <- Not consistent ; [United State] <- Readable)

---

### 03. Time Range Check

**Purpose**: Define the valid time range for analysis.

**Questions to ask**:

* What is the earliest date?
* What is the latest date?
* Are there missing days or months?
* What time level should be used (day, month, year)?

---

### 04. Measures Validation

**Purpose**: Validate that numeric values are logical.

**Questions to ask**:

* What are the core metrics (sales, orders, quantity)?
* Do totals look reasonable?
* Are there zero, negative, or missing values?
* Are there extreme values?

---

## 📊 Phase 2: Analyze Performance & Explain Results

**Goal**: Understand what is happening, why it is happening, and what to do next.

### 05. Compare & Rank (Magnitude + Ranking)

**Purpose**: Identify best and worst performers.

**Questions to ask**:

* Which categories contribute the most?
* Which contribute the least?
* What are the Top 5 and Bottom 5?

---

### 06. Trend Analysis (Change Over Time)

**Purpose**: Understand performance evolution.

**Questions to ask**:

* Is performance increasing or decreasing?
* Are there clear peaks or drops?
* Do trends differ across categories?

---

### 07. Composition & Segments

**Purpose**: Understand how parts contribute to the whole.

**Questions to ask**:

* What percentage does each category contribute?
* Are a few categories dominating results?
* Can data be grouped into simple segments (high vs low value)?

---

### 08. Report Table Construction (Single Source of Truth)

**Purpose**: Build **one consolidated table** used for all charts and dashboards.

**Questions to ask**:

* What dimensions are shared across all charts?
* What metrics are reused multiple times?
* Can every chart be rebuilt from this single table?
* Does each row have a clear grain (e.g., one product per month)?

Example:
- Time dimension (date / month)
- Main category (product / region / customer)
- Optional segment
- Core metrics (sales, orders, quantity)
- Derived metrics (growth %, share %, rank)

---

### 09. Insights & Reporting

**Purpose**: Turn analysis into decisions.

**Questions to ask**:

* What are the top 3 insights?
* Who should care about them?
* What action should be taken?
