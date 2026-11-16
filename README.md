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

- **Python:** Data analysis, processing and predictive modelling
- **Pandas and NumPy:** Data cleaning and manipulation
- **Scikit-learn:** Machine learning and model evaluation
- **Matplotlib:** Data visualisation
- **SQL (DuckDB):** Sales analysis, customer segmentation,
  purchase frequency and prediction-based customer targeting
- **Jupyter Notebook:** Exploratory and reproducible analysis
- **Git and GitHub:** Version control and project documentation

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

### 5. Predictive Modelling — Repeat Purchase Prediction

Developed a customer-level machine learning model to predict
whether customers would make a repeat purchase during a
future prediction period.

The analysis used historical purchasing behaviour, including
recency, frequency, monetary value and average order value.

Logistic Regression was selected as the final model because
it provides interpretable predictions that can support
business decision-making.

**Final Model Performance (November 2011 Test Set)**

| Metric | Result |
|---|---:|
| Accuracy | 70.0% |
| Precision | 45.1% |
| Recall | 70.1% |
| F1 Score | 0.549 |
| ROC-AUC | 0.773 |
| Classification Threshold | 0.20 |

**Key Findings**

- The model achieved 70.1% recall, identifying approximately
  seven out of ten actual repeat purchasers in the test set.
- A classification threshold of 0.20 was selected based on
  validation performance.
- Customer-level purchase probabilities can support targeted
  marketing and customer engagement strategies.
- The model prioritises identifying potential repeat purchasers,
  accepting additional false positives as a trade-off.

**Business Application**

The model can help businesses identify customers with
different levels of purchase likelihood and prioritise
customer engagement campaigns.

These predictions are estimates based on historical behaviour,
not guarantees of future purchases.

### 6. SQL Business Analysis

Used SQL with DuckDB to analyse sales performance, customer purchasing behaviour, RFM segmentation and predictive modelling outputs.

Eight SQL queries were developed to answer practical business questions.

| SQL Analysis | Business Question | Key Finding |
|---|---|---|
| [01 — Sales Overview](sql/01_sales_overview.sql) | How is the business performing? | £20.47M in recorded gross sales |
| [02 — Customer Revenue](sql/02_customer_revenue.sql) | Who are the highest-spending customers? | Identified customer revenue concentration and transaction anomalies |
| [03 — Net Sales](sql/03_net_sales.sql) | How do cancellations affect revenue? | £19.00M provisional net sales after recorded negative cancellations |
| [04 — Purchase Frequency](sql/04_customer_purchase_frequency.sql) | How often do customers return? | 72.4% of identified customers made multiple recorded purchases |
| [05 — Monthly Sales Trends](sql/05_monthly_sales_trends.sql) | Are there seasonal sales patterns? | November was the highest-revenue month in both 2010 and 2011 |
| [06 — Segment Performance](sql/06_customer_segment_performance.sql) | Which segments contribute the most value? | Champions contributed 67.79% of RFM monetary value |
| [07 — Prediction Analysis](sql/07_customer_prediction_analysis.sql) | Which customers are likely to purchase again? | 2,288 customers classified as likely to repeat using the 20% threshold |
| [08 — High-Value Customers at Risk](sql/08_high_value_customers_at_risk.sql) | Which valuable customers have low purchase likelihood? | 237 high-value customers identified with predicted probability below 20% |

**Business Insights**

- Historical customer value is concentrated among a relatively small group of customers.
- Sales exhibit seasonal patterns, with particularly strong performance in November.
- Customer segmentation provides a foundation for differentiated engagement strategies.
- Combining historical customer value with predicted purchase probability can help prioritise re-engagement opportunities.

**Methodological Notes**

- Gross sales represent positive recorded transactions, excluding invoice adjustments containing letters.
- Provisional net sales subtract recorded negative cancellation values but do not systematically match cancellations to original purchases.
- Customer segmentation revenue is based on the RFM `Monetary` measure, not cancellation-adjusted net revenue.
- Purchase probabilities are model estimates and should not be interpreted as guaranteed outcomes.
- High-value customers are defined using the 75th percentile of historical monetary value in the prediction dataset.

The SQL queries are available in the [`sql/`](sql/) directory and use processed datasets generated by the Python notebooks.

## Business Recommendations

Based on the exploratory analysis, customer segmentation, predictive modelling and SQL findings, the following recommendations are proposed.

**1. Retain high-value customers**

Champions represent approximately 21.5% of identifiable customers but contribute 67.79% of historical RFM monetary value. The business should prioritise maintaining relationships with these customers through personalised loyalty initiatives and customer service.

**2. Investigate high-value customers with low purchase likelihood**

The predictive analysis identified 237 historically high-value customers with an estimated repeat-purchase probability below 20%. These customers could be prioritised for further investigation and targeted re-engagement campaigns, subject to validating their transaction histories.

**3. Improve engagement through customer segmentation**

Use RFM segments to develop differentiated customer engagement strategies. For example, Recent Occasional customers could receive relevant follow-up communications, while Needs Attention and At Risk customers could be evaluated for reactivation opportunities.

**4. Prepare for seasonal demand**

Monthly sales analysis showed strong revenue performance during September–November, with November being the highest-revenue month in both 2010 and 2011. The business could use this pattern to inform inventory planning, staffing and seasonal marketing activities.

**5. Use predictive analytics to support marketing decisions**

The logistic regression model achieved 70.1% recall and a ROC-AUC of 0.773 on the November 2011 test set. Predicted purchase probabilities could support customer targeting, but campaigns should be tested to determine whether they produce measurable business improvements.

These recommendations are exploratory and require further validation before implementation.

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
│   ├── 04_customer_segmentation.ipynb
│   └── 05_predictive_modelling.ipynb
├── sql/
│   ├── 01_sales_overview.sql
│   ├── 02_customer_revenue.sql
│   ├── 03_net_sales.sql
│   ├── 04_customer_purchase_frequency.sql
│   ├── 05_monthly_sales_trends.sql
│   ├── 06_customer_segment_performance.sql
│   ├── 07_customer_prediction_analysis.sql
│   └── 08_high_value_customers_at_risk.sql
├── reports/
├── dashboard/
├── requirements.txt
└── README.md
```


## Running the SQL Analysis

The project includes eight SQL queries using DuckDB to analyse sales performance, customer behaviour, RFM segments, and repeat-purchase predictions.

### Setup

Install the project dependencies:

```bash
python3 -m pip install -r requirements.txt
```

Run the Jupyter notebooks first to generate the processed CSV files required by the SQL queries.

### Execute SQL Queries

From the project root directory, run:

```bash
python3 -c "import duckdb; print(duckdb.sql(open('sql/01_sales_overview.sql').read()).df().to_string(index=False))"
```

To run the high-value customers at risk analysis:

```bash
python3 -c "import duckdb; print(duckdb.sql(open('sql/08_high_value_customers_at_risk.sql').read()).df().to_string(index=False))"
```

Replace the SQL filename to execute any of the other queries.

**Note:** Raw and processed datasets are excluded from version control. Download the original dataset and execute the notebooks to reproduce the analyses.

## Next Steps

- Develop an interactive Power BI dashboard to present
  sales performance, customer segmentation and
  repeat-purchase predictions.
- Create a consolidated SQL analysis report documenting
  key findings, business implications and limitations.
- Improve project reproducibility with clear setup
  instructions and dependency requirements.
- Explore opportunities to evaluate customer engagement
  strategies using historical and predictive insights.

## Limitations

- The dataset contains historical transactions from
  December 2009 to December 2011, so findings may not
  reflect current e-commerce behaviour.
- Customer-level analysis excludes transactions without
  identifiable customer IDs.
- RFM segmentation uses rule-based scoring rather than
  machine-learning clustering.
- Gross sales and RFM monetary values do not represent
  cancellation-adjusted net revenue or profit.
- Recorded cancellations have not been systematically
  matched to their original purchases.
- The repeat-purchase model was evaluated using a
  time-based test period, but performance may change
  when applied to other periods or businesses.
- Predicted purchase probabilities do not establish
  whether marketing interventions will increase sales.
- The Power BI dashboard has not yet been developed.

## Data Source

UCI Machine Learning Repository: Online Retail II, dataset ID 502.