<h1 align="center">Brazilian E-Commerce Analytics</h1>

<p align="center">
  <b>An end-to-end data analytics and business intelligence project examining customer behavior, logistics, sales, and seller performance using the Olist dataset.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python" />
  <img src="https://img.shields.io/badge/Jupyter-F37626?style=for-the-badge&logo=jupyter&logoColor=white" alt="Jupyter" />
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL" />
  <img src="https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white" alt="Pandas" />
  <img src="https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" alt="Power BI" />
</p>

---

## Overview

This repository contains a structured data pipeline and analytic deliverables for the Olist Brazilian E‑Commerce dataset (2016–2018). The project demonstrates data engineering, exploratory analysis, and business intelligence work across sales, customers, logistics, sellers, and product categories.

<p align="center">
  <img src="https://img.shields.io/badge/Database-Relational_Schema-blue?style=flat-square&logo=database" alt="Database" />
  <img src="https://img.shields.io/badge/Analytics-Business_Intelligence-green?style=flat-square&logo=chartdotjs" alt="Analytics" />
  <img src="https://img.shields.io/badge/Data_Cleaning-Pandas-orange?style=flat-square&logo=pandas" alt="Data Cleaning" />
</p>

### Primary Analytical Domains

* **Sales Performance**: Historical revenue, transaction volumes, average order value (AOV), and monthly trends.
* **Customer Segmentation**: Regional customer density, ordering frequency, and state-level purchasing trends.
* **Logistics & Delivery Efficiency**: Delivery timeframe analysis, carrier delays versus estimated timelines, and geographic delivery bottlenecks.
* **Seller Operations**: Revenue per seller, regional distribution, and fulfillment throughput.
* **Product Category Analytics**: High-performing categories, price distributions, and sales volume by category.
* **Financial & Payment Methods**: Payment type distributions (credit, boleto, vouchers) and installment behavior.
* **Customer Satisfaction**: Review score analysis, response latency, and category-level satisfaction metrics.

---

## Repository Language Composition

According to repository metadata, the primary language composition is:

* Jupyter Notebook: 100%

This repository focuses on notebook-based analyses and ETL steps implemented in Jupyter notebooks.

---

## Repository Structure

```text
Brazilian-Ecommerce-Analytics/
│
├── Data/
│   ├── Raw/                       # Original Olist dataset CSV files
│   ├── Cleaned/                   # Staging directory for intermediate cleaned data
│   └── Processed/                 # Processed CSV files prepared for MySQL database import
│
├── NoteBooks/
│   ├── 01_data_understanding.ipynb # Initial data structure examination and schema discovery
│   ├── data_cleaning.ipynb        # Null handling, date parsing, and type standardizations
│   └── exploratory_data_analysis.ipynb # Visualizing distributions, correlations, and business KPIs
│
├── SQL/
│   ├── Tables.sql                 # DDL scripts for table definitions and dataset bulk loading
│   ├── Views.sql                  # Reusable SQL views (e.g., vw_executive_dashboard, vw_sales_summary)
│   ├── Customer Analysis.sql      # Customer demographics and purchasing behavior queries
│   ├── Delivery Analysis.sql      # Delivery timeliness and logistics performance queries
│   ├── Executive Business Insights.sql # Strategic executive-level metrics and financial summaries
│   ├── Payment Analysis.sql       # Payment method distributions and installment metrics
│   ├── Product Analysis.sql       # Product category sales volume and pricing analysis
│   ├── Review Analysis.sql        # Customer review score distribution and correlation queries
│   ├── Sales Analysis.sql         # Monthly revenue trends and temporal growth metrics
│   └── Seller Analysis.sql        # Seller performance and order fulfillment throughput
│
├── Dash Board Images/             # Static screenshots and exported dashboard assets
├── Models/                        # Machine learning / predictive modeling artifacts
├── PowerBI/                       # PowerBI report files (.pbix)
├── Reports/                       # Exported analytical summaries and documentation
├── .gitignore                     # Git exclusions configuration
├── requirements.txt               # Required Python package dependencies
└── README.md                      # Project documentation
```

---

## Relational Database Architecture

The data architecture standardizes the dataset into eight relational tables within the `project2` database schema:

```
+------------------+       +-------------------+       +-----------------+
|    customers     |<----->|      orders       |<----->|  order_reviews  |
+------------------+       +-------------------+       +-----------------+
                                     |
                                     v
                           +-------------------+
                           |    order_items    |
                           +-------------------+
                           /         |         \
                          v          v          v
          +-----------------+  +----------+  +-------------------+
          | order_payments  |  | products |  |      sellers      |
          +-----------------+  +----------+  +-------------------+
```

1. **`customers`**: Customer unique keys, city, and state attributes.
2. **`orders`**: Order lifecycle timestamps (purchase, approval, carrier delivery, final delivery, estimated delivery).
3. **`order_items`**: Line-item details linking orders, products, sellers, prices, and freight values.
4. **`products`**: Product dimensions, weight metrics, and category names.
5. **`product_category_translation`**: Mappings from Portuguese category names to English.
6. **`sellers`**: Seller unique keys, zip codes, cities, and states.
7. **`order_payments`**: Payment method types, sequential payment numbers, installments, and amounts.
8. **`order_reviews`**: Review ratings, comment titles, messages, and response dates.

---

## Technical Setup & Execution

### 1. Environment Configuration

Clone the repository and initialize a Python environment:

```bash
git clone https://github.com/aravindreddym-034/Brazilian-Ecommerce-Analytics.git
cd Brazilian-Ecommerce-Analytics

# Create virtual environment
python -m venv venv

# Activate environment (Windows PowerShell)
.\venv\Scripts\Activate.ps1

# Install required dependencies
pip install -r requirements.txt
```

> Note: Notebooks are the primary artifacts; ensure Jupyter is installed in the environment.

### 2. Notebook Execution Pipeline

Run the Jupyter notebooks located in `NoteBooks/` in the following sequence:

1. `01_data_understanding.ipynb`: Perform dataset verification and initial structural inspections.
2. `data_cleaning.ipynb`: Clean raw records, handle missing values, format dates, and output processed files into `Data/Processed/`.
3. `exploratory_data_analysis.ipynb`: Execute exploratory analysis and statistical visualizations.

### 3. Database Ingestion & SQL Query Execution

1. Open your database management tool (MySQL Workbench, DBeaver, or MySQL CLI).
2. Run `SQL/Tables.sql` to construct the database schema and bulk-load data from `Data/Processed/`.
3. Run `SQL/Views.sql` to instantiate standardized analytical views (`vw_executive_dashboard`, `vw_monthly_sales`, `vw_state_performance`).
4. Execute domain-specific SQL files within `SQL/` to extract business insights.

---

## Data Source & References

* **Dataset Source**: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
* **Dataset Scope**: Commercial records of ~100k orders across Brazilian marketplaces (2016–2018).
