# 📊 Brazilian E-Commerce Analytics & Business Intelligence Suite

<p align="center">
  <img src="https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" alt="Power BI" />
  <img src="https://img.shields.io/badge/DAX-Data_Analysis_Expressions-yellow?style=for-the-badge" alt="DAX" />
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL" />
  <img src="https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python" />
  <img src="https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white" alt="Pandas" />
  <img src="https://img.shields.io/badge/Jupyter-F37626?style=for-the-badge&logo=jupyter&logoColor=white" alt="Jupyter" />
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge" alt="Status" />
</p>

<p align="center">
  <b>An enterprise-grade, end-to-end Data Analytics and Business Intelligence solution analyzing ~100,000 commercial transactions from the Olist Brazilian E-Commerce marketplace (2016–2018).</b><br>
  <i>Encompassing automated Python ETL pipelines, normalized MySQL data warehousing, advanced SQL analytical modeling, and an interactive 7-page Power BI executive dashboard suite.</i>
</p>

---

## 📌 Executive Summary & Marketplace KPIs

Between **2016 and 2018**, Olist connected thousands of independent merchants to consumers across all **27 Brazilian federative units**. This project uncovers macroeconomic growth drivers, regional logistics bottlenecks, customer purchasing habits, payment methods, and category margins to provide actionable strategic recommendations.

<div align="center">

| Metric | Benchmark Value | MoM / Period Trend | Strategic Significance |
| :--- | :---: | :---: | :--- |
| 💵 **Total Revenue** | **R$ 16,008,872.12** | <span style="color:#2ecc71">▲ **+28.6%**</span> | Gross payment volume across 99.4K marketplace transactions |
| 📦 **Total Orders** | **99,441** | <span style="color:#2ecc71">▲ **+25.4%**</span> | Processed orders (96,478 delivered, **97.02%** fulfillment rate) |
| 👥 **Unique Customers** | **96,096** | <span style="color:#2ecc71">▲ **+24.7%**</span> | Distinct consumers across 4,119 Brazilian cities |
| 🏷️ **Average Order Value (AOV)** | **R$ 160.99** | <span style="color:#2ecc71">▲ **+2.8%**</span> | Mean customer transaction spend |
| 🚚 **Average Delivery Time** | **12.09 Days** | <span style="color:#2ecc71">▲ **+3.2%** (Speed)</span> | Doorstep delivery cycle (Median: 10.0 days; On-Time: **92.0%**) |
| ⭐ **Average Review Score** | **4.09 / 5.00** | <span style="color:#2ecc71">▲ **+0.15**</span> | Overall customer satisfaction index across 71 categories |
| 🏪 **Active Sellers** | **3,095** | <span style="color:#3498db">● Active</span> | Marketplace merchants distributing across 71 product categories |

</div>

---

## 📑 Table of Contents

- [🏗️ Project Architecture & Pipeline](#️-project-architecture--pipeline)
- [📈 Power BI Interactive Dashboard Suite](#-power-bi-interactive-dashboard-suite)
  - [1. Executive Dashboard](#1-executive-dashboard)
  - [2. Sales Performance Analysis](#2-sales-performance-analysis)
  - [3. Customer Demographics & Behavior](#3-customer-demographics--behavior)
  - [4. Seller & Delivery Operations](#4-seller--delivery-operations)
  - [5. Payment & Installment Analytics](#5-payment--installment-analytics)
  - [6. Product Category Analytics](#6-product-category-analytics)
  - [7. Geographical Market Analysis](#7-geographical-market-analysis)
- [🗄️ Relational Database Schema & Data Model](#️-relational-database-schema--data-model)
- [📐 DAX Measures & Analytical Logic](#-dax-measures--analytical-logic)
- [💡 Key Business Insights](#-key-business-insights)
- [🎯 Strategic Recommendations](#-strategic-recommendations)
- [📂 Repository Structure](#-repository-structure)
- [🚀 Quickstart & Setup Guide](#-quickstart--setup-guide)
- [🛠️ Tech Stack & Technologies](#️-tech-stack--technologies)
- [📚 Dataset & References](#-dataset--references)

---

## 🏗️ Project Architecture & Pipeline

```mermaid
flowchart TD
    subgraph S1["Phase 1: Ingestion & Exploration"]
        A[Raw Olist Data\n9 CSV Datasets\n~100K Records] --> B[01_data_understanding.ipynb\nSchema Inspection & Data Profiling]
    end

    subgraph S2["Phase 2: Python ETL Pipeline"]
        B --> C[data_cleaning.ipynb\nNull Handling, Type Casting, Deduplication]
        C --> D[Processed CSV Layer\nStandardized Relational Tables]
    end

    subgraph S3["Phase 3: Database & SQL Modeling"]
        D --> E[(MySQL Relational Warehouse\nPrimary & Foreign Key Constraints)]
        E --> F[SQL Analytics Suite\n8 Specialized KPI Scripts & 8 Modular Views]
    end

    subgraph S4["Phase 4: Business Intelligence"]
        E --> G[Power BI Desktop\nProject 2.pbix]
        G --> H[DAX Measure Engine\nTime Intelligence, KPIs, Dynamic Filtering]
        H --> I[7-Page Executive Dashboard Suite\nInteractive Visualizations & Geo Analytics]
    end
```

### End-to-End Workflow Breakdown

1. **Data Ingestion & Quality Assessment**: Profiling raw files covering orders, items, customers, sellers, payments, reviews, products, translations, and geolocations.
2. **Automated Python ETL Pipeline**: Imputation of missing timestamps, normalization of Portuguese-to-English product categories, coordinate clustering, and generation of clean datasets.
3. **Relational MySQL Data Warehousing**: Construction of structured schemas with enforced primary/foreign keys, indexed lookup tables, and modular analytical SQL views.
4. **Exploratory Data Analysis (EDA)**: Statistical hypothesis testing, correlation matrices, revenue concentration curves, and delivery latency regressions in Jupyter.
5. **Power BI Business Intelligence**: Data modeling using Star/Snowflake schemas, DAX measures (MoM growth, fulfillment rates, AOV, installment distribution), and interactive user interface design.

---

## 📈 Power BI Interactive Dashboard Suite

The Power BI BI Solution (`PowerBI/Project 2.pbix`) provides interactive decision-support across **7 dedicated analytical modules**:

```
PowerBI/Project 2.pbix
 ├── 1. Executive Dashboard          -> Macro KPIs, Revenue & Order Trends, Fulfillment Breakdown
 ├── 2. Sales Performance Analysis  -> Cash Flow by Tender Type, Monthly Freight Economics, Installments
 ├── 3. Customer Demographics       -> Geographic Distribution, City Heatmaps, Rating Distributions
 ├── 4. Seller & Delivery Operations-> Merchant Concentration, Fulfillment Latency, Bottleneck Tracking
 ├── 5. Payment & Installments      -> Transaction Bins, Multi-Sequence Split Tender, Credit Risk
 ├── 6. Product Category Analytics  -> Category Contribution, Price Elasticity Treemaps, Sales Velocity
 └── 7. Geographical Market Analysis-> State-level Revenue, Regional AOV Arbitrage, Territorial Demand
```

---

### 1. Executive Dashboard
> **Strategic Focus**: C-Suite operational pulse tracking macro-level marketplace health, financial performance, and fulfillment reliability.

<p align="center">
  <img src="Dash%20Board%20Images/1.Executive%20Dashboard.png" alt="Executive Dashboard" width="100%" />
</p>

- **Key Performance Indicators (Scorecards)**:
  - **Total Revenue**: `R$ 16.01M` (▲ **+28.6%** vs previous period)
  - **Total Orders**: `99K` (▲ **+25.4%** vs previous period)
  - **Total Customers**: `96K` (▲ **+24.7%** vs previous period)
  - **Average Review Score**: `4.09 / 5.00` (▲ **+0.15** customer satisfaction)
  - **On-Time Delivery Rate**: `92.0%` (▲ **+3.2%** logistics efficiency)
  - **Average Order Value (AOV)**: `R$ 160.99` (▲ **+2.8%** spend per transaction)
- **Visual Analytics**:
  - **Total Revenue by Month-Year**: Area/line trend chart capturing rapid scaling through 2017 with seasonal Black Friday peak (~R$ 1.3M in Nov 2017).
  - **Total Orders by Month-Year**: Monthly transaction velocity confirming consistent demand growth.
  - **Order by Status (Donut & Matrix)**: Comprehensive fulfillment status verification (**97.02% delivered** [96K], 1.11% shipped, 0.51% canceled, 0.29% unavailable, 0.17% invoiced, 0.08% processing).
- **Interactive Controls**: Global Date Range Slicer (`Nov 2016 – May 2018`) and monthly/quarterly granularity drill-downs.

---

### 2. Sales Performance Analysis
> **Strategic Focus**: Revenue engine diagnostics, tender cash-flow distribution, freight expense monitoring, and financing trends.

<p align="center">
  <img src="Dash%20Board%20Images/2.%20Sales%20Analysis.png" alt="Sales Performance Analysis" width="100%" />
</p>

- **Visual Analytics**:
  - **Total Revenue by Payment Type**: Donut chart demonstrating **Credit Card dominance at 78.34% (R$ 12.54M)**, followed by **Boleto Bancário at 17.92% (R$ 2.87M)**, **Voucher at 2.37% (R$ 0.38M)**, and Debit Card.
  - **Monthly Freight Cost**: Expense tracking curve tracking logistics costs scaling with order surges (~R$ 170K/month peak).
  - **Total Products Sold by Month-Year**: Volume progression scaling to >10,000 units sold per month.
  - **Order Volume by Payment Installments**: Distribution analysis showing **53K single-installment orders**, followed by 2 to 4 installments for mid-range purchases, and up to 20+ installments for high-ticket items.

---

### 3. Customer Demographics & Behavior
> **Strategic Focus**: Regional customer concentration, high-density metropolitan markets, and satisfaction sentiment distribution.

<p align="center">
  <img src="Dash%20Board%20Images/3.Customer%20Analysis.png" alt="Customer Demographics & Behavior" width="100%" />
</p>

- **Visual Analytics**:
  - **Customers by State**: Horizontal ranking showing the Southeast corridor leading national demand: **São Paulo (`SP`) with ~41.7K customers**, **Rio de Janeiro (`RJ`) with ~12.9K**, **Minas Gerais (`MG`) with ~11.6K**, followed by `RS`, `PR`, `SC`, and `BA`.
  - **Top 10 Customer Cities**: Granular metropolitan rankings led by **São Paulo (~15.5K)**, **Rio de Janeiro (~6.8K)**, **Belo Horizonte (~2.8K)**, **Brasília (~2.1K)**, and **Curitiba (~1.8K)**.
  - **Customer Review Score Distribution**: Satisfaction profile showing that **5-star ratings dominate (~57K reviews)**, 4-star ratings account for ~19K reviews, while 1-star friction points account for ~11K reviews (primarily logistics-driven).

---

### 4. Seller & Delivery Operations
> **Strategic Focus**: Merchant throughput concentration, seller geographic hubs, and fulfillment cycle optimization.

<p align="center">
  <img src="Dash%20Board%20Images/4.%20Seller%20%26%20Delivery%20Analysis.png" alt="Seller & Delivery Operations" width="100%" />
</p>

- **Visual Analytics**:
  - **Top 10 Sellers by Orders**: Identification of marketplace power merchants processing up to ~2,000 completed orders each.
  - **Seller Distribution by State**: Merchant geography confirming extreme seller density in **São Paulo (`SP` >1,800 active merchants)**, followed by **Paraná (`PR` ~350)**, **Minas Gerais (`MG` ~250)**, and Rio de Janeiro.
  - **Average Delivery Days by Month**: Longitudinal tracking demonstrating dramatic operational efficiency gains from early marketplace inception delays down to a stable **12–14 day national delivery cycle**.

---

### 5. Payment & Installment Analytics
> **Strategic Focus**: Granular transaction size distribution, multi-tender split behavior, and installment financing depth.

<p align="center">
  <img src="Dash%20Board%20Images/5.Payment%20Analysis.png" alt="Payment & Installment Analytics" width="100%" />
</p>

- **Visual Analytics**:
  - **Payment Value Distribution (Histogram)**: Binned distribution displaying massive transaction density concentrated under R$ 200, with a long-tail distribution reaching maximum ticket sizes of R$ 13,664.
  - **Orders by Payment Sequence**: Analysis of multi-tender transactions, highlighting customers splitting payments across vouchers and credit cards (up to 30 sequential payment methods per order).
  - **Payment Type and Installment Usage**: Multi-series breakdown comparing installment depth across payment types (credit card usage spanning 1 to 24 installments vs single-charge boletos).

---

### 6. Product Category Analytics
> **Strategic Focus**: Catalog revenue engines, unit sales velocity, and category price elasticity.

<p align="center">
  <img src="Dash%20Board%20Images/6.Product%20Analysis.png" alt="Product Category Analytics" width="100%" />
</p>

- **Visual Analytics**:
  - **Top 10 Product Categories by Revenue**:
    1. 💄 `health_beauty` (~**R$ 1.26M**)
    2. ⌚ `watches_gifts` (~**R$ 1.20M**)
    3. 🛏️ `bed_bath_table` (~**R$ 1.04M**)
    4. ⚽ `sports_leisure` (~**R$ 0.99M**)
    5. 💻 `computers_accessories` (~**R$ 0.91M**)
    6. 🛋️ `furniture_decor` (~**R$ 0.73M**)
    7. 📱 `cool_stuff` (~**R$ 0.63M**)
    8. 🍳 `housewares` (~**R$ 0.63M**)
    9. 🚗 `auto` (~**R$ 0.59M**)
    10. 🌿 `garden_tools` (~**R$ 0.49M**)
  - **Products Sold by Category**: Volume distribution identifying high-velocity everyday goods (`bed_bath_table` leading with >11K units sold).
  - **Average Product Price by Category (Treemap)**: Hierarchical pricing treemap categorizing premium categories (computers, watches, small appliances) versus high-volume consumer goods.

---

### 7. Geographical Market Analysis
> **Strategic Focus**: Spatial revenue mapping, state-level order density, and regional Average Order Value (AOV) arbitrage.

<p align="center">
  <img src="Dash%20Board%20Images/7.%20Geographical%20Analysis.png" alt="Geographical Market Analysis" width="100%" />
</p>

- **Visual Analytics**:
  - **Revenue by Customer State**: Regional revenue dominance led by **São Paulo (R$ 5.9M+)**, **Rio de Janeiro (R$ 2.1M)**, **Minas Gerais (R$ 1.8M)**, **Rio Grande do Sul (R$ 0.9M)**, and **Paraná (R$ 0.8M)**.
  - **Average Order Value (AOV) by State**: Key strategic discovery—customers in remote Northern and Northeastern states (**Paraíba `PB`, Acre `AC`, Rondônia `RO`, Amapá `AP`, Mato Grosso `MT`**) exhibit significantly higher AOVs (**R$ 220 – R$ 270+**) compared to SP/MG (~R$ 150), as customers consolidate orders to offset higher freight charges.
  - **Top 10 States by Orders**: Order volume distribution mirroring economic and population centers across Brazil.

---

## 🗄️ Relational Database Schema & Data Model

The enterprise data warehouse in MySQL standardizes the e-commerce data into **8 interconnected relational tables** enforcing strict foreign key constraints and indexing:

<p align="center">
  <img src="Schema.png" alt="Olist Relational Database Schema" width="900"/>
</p>

### Table Descriptions & Schema Mapping

| Table Name | Primary Key | Foreign Keys | Business Description |
| :--- | :--- | :--- | :--- |
| **`customers`** | `customer_id` | *None* | Order-level customer tokens, unique customer IDs (`customer_unique_id`), city, state, zip code |
| **`orders`** | `order_id` | `customer_id` | Order lifecycle timestamps (purchase, approved, carrier delivery, customer delivery, estimated date) |
| **`order_items`** | `(order_id, order_item_id)` | `order_id`, `product_id`, `seller_id` | Line item level pricing, shipping freight charges, seller assignment |
| **`products`** | `product_id` | `product_category_name` | Product dimensions (weight, length, height, width), photo counts, category name |
| **`product_category_translation`** | `product_category_name` | *None* | Portuguese-to-English translation mapping for 71 product categories |
| **`sellers`** | `seller_id` | *None* | Merchant identification, geographic origin (city, state, postal code) |
| **`order_payments`** | `(order_id, payment_sequential)` | `order_id` | Payment type (credit card, boleto, voucher, debit), installment counts, payment amount |
| **`order_reviews`** | `review_id` | `order_id` | Customer review score (1–5), survey timestamps, review comment logs |
| **`geolocation`** | *Indexed Composite* | *None* | Latitude/longitude coordinates mapped to Brazilian postal zip codes (`geolocation_zip_code_prefix`) |

---

### Reusable SQL Analytical Views (`SQL/Views.sql`)

```sql
-- 1. Consolidated Executive BI Reporting View
CREATE OR REPLACE VIEW vw_executive_dashboard AS
SELECT
    o.order_id,
    DATE(o.order_purchase_timestamp) AS purchase_date,
    c.customer_state,
    c.customer_city,
    p.product_category_name,
    oi.seller_id,
    op.payment_type,
    op.payment_installments,
    oi.price,
    oi.freight_value,
    r.review_score,
    DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) AS delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN order_payments op ON o.order_id = op.order_id
JOIN order_reviews r ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL;
```

<details>
<summary><b>Click to expand other SQL Views in the warehouse</b></summary>

- `vw_sales_summary`: Order-level aggregated sales with item counts and total order value.
- `vw_customer_summary`: Customer lifetime spend, total order frequency, and geographic location.
- `vw_product_performance`: Product-level revenue, units sold, and average selling price.
- `vw_seller_performance`: Merchant order volume, total sales revenue, and average product price.
- `vw_delivery_performance`: Delivery latency vs estimated delivery date with on-time status flags.
- `vw_review_summary`: Review scores mapped to product categories and seller IDs.
- `vw_payment_summary`: Transaction volume and revenue aggregated by payment method and installment count.
- `vw_monthly_sales`: Monthly revenue trajectory, order counts, and Average Order Value (AOV).
- `vw_state_performance`: State-level revenue, delivery days, order counts, and review scores.

</details>

---

## 📐 DAX Measures & Analytical Logic

The Power BI model leverages optimized DAX formulas for dynamic KPI calculation, time intelligence, and operational metrics:

```dax
// 1. Total Revenue Calculation
Total Revenue = SUM(order_payments[payment_value])

// 2. Total Order Volume
Total Orders = DISTINCTCOUNT(orders[order_id])

// 3. Average Order Value (AOV)
Average Order Value = DIVIDE([Total Revenue], [Total Orders], 0)

// 4. On-Time Delivery Percentage
On-Time Delivery % = 
VAR DeliveredOrders = 
    CALCULATE(
        COUNTROWS(orders),
        orders[order_delivered_customer_date] <= orders[order_estimated_delivery_date],
        NOT(ISBLANK(orders[order_delivered_customer_date]))
    )
VAR TotalDelivered = 
    CALCULATE(
        COUNTROWS(orders),
        NOT(ISBLANK(orders[order_delivered_customer_date]))
    )
RETURN
    DIVIDE(DeliveredOrders, TotalDelivered, 0)

// 5. Month-over-Month Revenue Growth %
Revenue MoM Growth % = 
VAR CurrentMonthRev = [Total Revenue]
VAR PrevMonthRev = CALCULATE([Total Revenue], DATEADD('Dim_Date'[Date], -1, MONTH))
RETURN
    DIVIDE(CurrentMonthRev - PrevMonthRev, PrevMonthRev, 0)

// 6. Average Delivery Duration (Days)
Avg Delivery Days = 
AVERAGEX(
    FILTER(orders, NOT(ISBLANK(orders[order_delivered_customer_date]))),
    DATEDIFF(orders[order_purchase_timestamp], orders[order_delivered_customer_date], DAY)
)
```

---

## 💡 Key Business Insights

### 💰 1. Revenue & Sales Dynamics
- **Continuous Scaling & Seasonal Peaks**: Marketplace revenue expanded from early 2017, achieving its highest single-month peak during **November 2017 (Black Friday)** with over R$ 1.3M in gross sales.
- **Pareto Category Concentration**: The top 5 categories (`health_beauty`, `watches_gifts`, `bed_bath_table`, `sports_leisure`, `computers_accessories`) generate over **35% of total marketplace revenue**.

### 💳 2. Payment Economics & Financing
- **Credit Card Dominance**: **78.34% (R$ 12.54M)** of payment volume is conducted via credit cards, followed by **Boleto Bancário (17.92% / R$ 2.87M)**.
- **Installment Behavior**: Over 53% of orders are paid in a single payment; however, orders above R$ 300 strongly utilize 4 to 10 installments, demonstrating the importance of installment financing in Brazilian e-commerce.

### 🚚 3. Logistics & Delivery Performance
- **High On-Time Fulfillment**: **92.0% of orders are delivered on or before the estimated delivery date**, with a national average delivery cycle of **12.09 days** (median: 10 days).
- **Regional Delivery Disparity**: Orders within São Paulo and the Southeast arrive within **7–9 days**, whereas deliveries to Northern and Northeastern states (e.g., Roraima, Amapá, Amazonas) average **20–28 days**.
- **Customer Rating Sensitivity**: Orders delivered on time average **4.2+ stars**, while delayed deliveries drop customer ratings precipitously to **<2.5 stars**.

### 🗺️ 4. Geographic Demand Arbitrage
- **Southeast Concentration**: São Paulo alone contributes **~42% of total customers and >37% of marketplace revenue**.
- **Higher AOV in Remote States**: Remote states (Paraíba, Acre, Rondônia) register higher Average Order Values (**R$ 220–270**) compared to SP (**R$ 150**), driven by bulk basket purchases to amortize higher shipping fees.

---

## 🎯 Strategic Recommendations

> [!TIP]
> ### 1. Regional Fulfillment Hubs (Northern & Northeastern Expansion)
> Establish localized fulfillment centers or carrier cross-docking partnerships in the Northeast (e.g., Bahia / Pernambuco) to cut transit times from 25 days down to <10 days and reduce high freight barriers.

> [!IMPORTANT]
> ### 2. Seller SLA & Carrier Handoff Benchmarks
> Enforce strict merchant SLAs for dispatch handoff times (<48 hours) to prevent early-stage fulfillment delays, which are the #1 driver of 1-star reviews.

> [!NOTE]
> ### 3. Payment Optimization & Alternative Payment Methods
> Introduce instant payment incentives (such as PIX or instant Boleto cashback) to capture cash-preferred buyers while reducing credit card processing fee overhead.

> [!TIP]
> ### 4. High-Margin Category Bundling
> Reallocate promotional ad spend toward high-margin, top-rated categories (`health_beauty`, `watches_gifts`, `computers_accessories`) and introduce bundle promotions to increase basket size.

---

## 📂 Repository Structure

```text
Brazilian-Ecommerce-Analytics/
│
├── Dash Board Images/                  # Exported Power BI dashboard screenshots
│   ├── 1.Executive Dashboard.png       # Executive overview & core KPI scorecards
│   ├── 2. Sales Analysis.png           # Sales trends, freight costs & payment types
│   ├── 3.Customer Analysis.png         # Customer distribution, top cities & reviews
│   ├── 4. Seller & Delivery Analysis.png # Merchant performance & delivery timelines
│   ├── 5.Payment Analysis.png          # Payment values, split sequences & installments
│   ├── 6.Product Analysis.png          # Product revenue, category volume & pricing treemap
│   └── 7. Geographical Analysis.png    # State revenue, regional AOV & order volumes
│
├── Data/
│   ├── Raw/                            # 9 Original Olist CSV datasets
│   │   ├── customers_dataset.csv
│   │   ├── geolocation_dataset.csv
│   │   ├── order_items_dataset.csv
│   │   ├── order_payments_dataset.csv
│   │   ├── order_reviews_dataset.csv
│   │   ├── orders_dataset.csv
│   │   ├── product_category_name_translation.csv
│   │   ├── products_dataset.csv
│   │   └── sellers_dataset.csv
│   ├── Cleaned/                        # Staged transformation data
│   └── Processed/                      # Cleaned CSVs ready for MySQL ingestion
│
├── NoteBooks/
│   ├── 01_data_understanding.ipynb     # Schema exploration, null profiling & summary statistics
│   ├── data_cleaning.ipynb             # Data type conversions, missing value imputation & ETL
│   └── exploratory_data_analysis.ipynb # Deep-dive statistical analysis & KPI visual exploration
│
├── PowerBI/
│   └── Project 2.pbix                  # Complete 7-page interactive Power BI report
│
├── SQL/
│   ├── Tables.sql                      # DDL schema creation & LOAD DATA INFILE scripts
│   ├── Views.sql                       # Reusable SQL analytical views
│   ├── Customer Analysis.sql           # Customer RFM and geographic SQL queries
│   ├── Delivery Analysis.sql           # Logistics and carrier delay queries
│   ├── Executive Business Insights.sql # High-level strategic business queries
│   ├── Payment Analysis.sql            # Payment method and installment metrics
│   ├── Product Analysis.sql            # Category revenue and pricing queries
│   ├── Review Analysis.sql             # Review score and satisfaction queries
│   ├── Sales Analysis.sql              # Monthly growth and revenue trajectory
│   └── Seller Analysis.sql             # Merchant throughput and revenue analysis
│
├── Schema.png                          # Relational database entity-relationship diagram
├── requirements.txt                    # Python library dependencies
└── README.md                           # Comprehensive project documentation
```

---

## 🚀 Quickstart & Setup Guide

### 1. Clone & Set Up the Python Environment

```bash
# Clone the repository
git clone https://github.com/aravindreddym-034/Brazilian-Ecommerce-Analytics.git
cd Brazilian-Ecommerce-Analytics

# Create and activate a virtual environment
# Windows (PowerShell):
python -m venv venv
.\venv\Scripts\Activate.ps1

# Linux / macOS:
python3 -m venv venv
source venv/bin/activate

# Install required Python packages
pip install -r requirements.txt
```

### 2. Execute Data Cleaning & Analytics Notebooks

```bash
jupyter lab
```

Execute notebooks sequentially:
1. `NoteBooks/01_data_understanding.ipynb`
2. `NoteBooks/data_cleaning.ipynb`
3. `NoteBooks/exploratory_data_analysis.ipynb`

### 3. Initialize & Query MySQL Warehouse

1. Launch **MySQL Workbench** or your preferred SQL terminal.
2. Run `SQL/Tables.sql` to construct the schema and bulk-import processed data from `Data/Processed/`.
3. Run `SQL/Views.sql` to build analytical views.
4. Run scripts in `SQL/` to extract business metrics.

### 4. Open Power BI Dashboard

1. Launch **Power BI Desktop**.
2. Open [`PowerBI/Project 2.pbix`](file:///PowerBI/Project%202.pbix).
3. Interact with slicers, cross-filtering, date ranges, and category drill-downs.

---

## 🛠️ Tech Stack & Technologies

| Layer | Technologies | Purpose |
| :--- | :--- | :--- |
| **Data Cleaning & ETL** | Python 3.10+, Pandas, NumPy | Automated data transformation, date parsing, missing data imputation |
| **Exploratory Analytics** | Jupyter Lab, Matplotlib, Seaborn | Exploratory data analysis, distribution analysis, correlation metrics |
| **Data Warehousing** | MySQL 8.0, SQL Views, Indexing | Relational modeling, schema integrity, analytical queries |
| **Business Intelligence** | Power BI Desktop, DAX, Power Query | Interactive 7-page executive dashboard suite, KPI cards, spatial maps |
| **Documentation** | GitHub Markdown, Mermaid.js | System architecture, ER diagrams, data dictionaries |

---

## 📚 Dataset & References

- **Source Dataset**: [Kaggle - Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Timeframe**: 2016 – 2018
- **Market Coverage**: Brazil (All 27 States, 4,119 Municipalities)

---

<p align="center">
  <sub>Developed by <b>Aravind Reddy</b> • Brazilian E-Commerce Analytics & Business Intelligence Project</sub><br>
  <sub>⭐ If you found this repository helpful, please star the repository!</sub>
</p>
