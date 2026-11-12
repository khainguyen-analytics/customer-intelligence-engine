# Customer Intelligence Engine

### E-Commerce Customer Analytics | Python | RFM Segmentation | Predictive Analytics

## Project Overview

This project analyses the UCI Online Retail II dataset to understand customer purchasing behaviour, identify valuable customer segments and explore opportunities to improve customer engagement.

The goal is to turn historical transaction data into actionable business insights using Python, data visualisation and customer analytics.

The project is being developed in stages, from exploratory analysis and customer segmentation to predictive modelling and business intelligence reporting.

## Business Objectives

1. Understand historical sales performance and purchasing trends.
2. Identify the products contributing the most sales value.
3. Explore international market performance.
4. Segment customers using Recency, Frequency and Monetary (RFM) analysis.
5. Identify customer groups that may benefit from targeted engagement strategies.
6. Develop predictive models to estimate future purchasing behaviour.

## Dataset

**Source:** [UCI Machine Learning Repository — Online Retail II](https://archive.ics.uci.edu/dataset/502/online+retail+ii)

The dataset contains approximately 1.07 million transaction records from a UK-based online retailer between December 2009 and December 2011.

Key variables include invoice number, product code, product description, quantity, invoice date, unit price, customer ID and country.

The original dataset is not included in this repository. It can be downloaded from the source above.

## Tools and Technologies

- **Python:** Data analysis and processing
- **Pandas and NumPy:** Data cleaning and manipulation
- **Matplotlib:** Data visualisation
- **Jupyter Notebook:** Exploratory and reproducible analysis
- **Git and GitHub:** Version control

## Analysis Completed

### 1. Data Understanding

Explored the original dataset, examined missing values and duplicates, and identified data-quality issues such as cancelled invoices, negative quantities and missing customer IDs.

### 2. Data Cleaning

Prepared transaction-level and customer-level datasets for analysis, separating cancelled transactions and excluding invalid sales records according to the cleaning rules.

### 3. Exploratory Data Analysis

Analysed monthly sales trends, top-performing products, international market performance and customer spending concentration.

A key finding was that the highest-spending 10% of identifiable customers accounted for approximately 63.9% of customer-linked positive sales value.

### 4. RFM Customer Segmentation

Used Recency, Frequency and Monetary analysis to classify 5,878 identifiable customers into six behavioural segments.

| Customer Segment | Customers | Share of Sales |
|---|---:|---:|
| Champions | 1,266 | 67.79% |
| Needs Attention | 1,176 | 13.10% |
| At Risk | 481 | 8.66% |
| Inactive Low-Engagement | 1,870 | 4.26% |
| Loyal Customers | 582 | 3.76% |
| Recent Occasional | 503 | 2.43% |

**Key finding:** Champions represented approximately 21.5% of identifiable customers but contributed 67.8% of their historical positive sales value.

This highlights the concentration of sales among high-value customers and supports further investigation into customer retention strategies.

These segments describe historical purchasing behaviour and do not independently establish future customer value.

## Business Recommendations

- Prioritise customer relationship management for Champions.
- Investigate opportunities to re-engage historically valuable At Risk customers.
- Encourage repeat purchases among Recent Occasional customers.
- Monitor Needs Attention customers for further changes in purchasing behaviour.
- Consider cost-effective engagement strategies for Inactive Low-Engagement customers.

These recommendations are exploratory and would require further evaluation before implementation.

## Project Structure

```text
customer-intelligence-engine/
├── data/
│   ├── raw/
│   └── processed/
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_exploratory_analysis.ipynb
│   └── 04_customer_segmentation.ipynb
├── dashboard/
├── reports/
├── sql/
├── requirements.txt
└── README.md
```

Raw and processed datasets are excluded from version control.

## Next Steps

- Build a model to predict repeat purchasing within a defined future period.
- Evaluate model performance using time-based validation.
- Explore customer retention and purchase-propensity insights.
- Develop an interactive business intelligence dashboard.

## Limitations

- The dataset covers historical transactions from 2009–2011.
- Customer-level analysis excludes transactions without identifiable customer IDs.
- RFM segments use rule-based thresholds rather than machine-learning clustering.
- Sales contribution is based on positive transaction values and does not represent net profit.
- Predictive modelling and dashboard development are planned but not yet completed.

## Data Source

UCI Machine Learning Repository: Online Retail II, dataset ID 502.