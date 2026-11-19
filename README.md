# Retail Sales Analytics

An end-to-end analysis of retail sales and profitability using **SQL, Excel, Power BI and Python**, built on the Sample Superstore dataset.

**Headline result:** Orders discounted by more than 20% made up 14% of all orders but lost **$135K**. Every order discounted by more than 50% lost money. All other orders earned **$422K** in profit, against $286K overall.

<!-- Add your Power BI dashboard screenshot here, for example: -->
<!-- ![Dashboard overview](images/dashboard-overview.png) -->

---

## Business Problem

A retailer has healthy sales but wants to know where it is actually making and losing money. This project answers:

1. Which regions generate the most sales and profit?
2. Which product categories and sub-categories are most and least profitable?
3. Which products lose money?
4. How do discounts affect profitability?

## Dataset

| | |
|---|---|
| **Source** | Sample Superstore dataset (Kaggle) |
| **Rows** | 9,994 |
| **Columns** | 21 |
| **Total sales** | $2,297,201 |
| **Total profit** | $286,397 (12.5% margin) |

Fields include orders, customers, region, state and city, category and sub-category, sales, quantity, discount and profit.

## Tools Used

| Tool | Used for |
|---|---|
| **SQL** | Business queries and aggregations (see `sql query/` and `SQL query results/`) |
| **Excel** | PivotTables and summary analysis (`Excel Analysis.xlsx`) |
| **Power BI** | Interactive dashboard (`Data Visualization(Power bi).pbix`) |
| **Python / pandas** | Analysis and output tables (`analysis.py`) |
| **Git and GitHub** | Version control and publishing |

---

## Key Findings

### 1. Discounts above 20% are the main profit leak

| Discount level | Orders | Sales | Profit | Margin |
|---|---|---|---|---|
| None | 4,798 | $1,087,908 | $320,988 | 29.5% |
| Up to 10% | 94 | $54,369 | $9,029 | 16.6% |
| 10% to 20% | 3,709 | $792,153 | $91,756 | 11.6% |
| 20% to 30% | 227 | $103,227 | -$10,369 | -10.0% |
| 30% to 50% | 310 | $195,315 | -$48,448 | -24.8% |
| Over 50% | 856 | $64,229 | -$76,559 | -119.2% |

Discounts up to 20% stayed profitable. Above 20%, about 92% of orders lost money, and all orders above 50% did.

### 2. Regional performance

| Region | Sales | Profit | Margin | Average discount |
|---|---|---|---|---|
| West | $725,458 | $108,418 | 14.9% | 10.9% |
| East | $678,781 | $91,523 | 13.5% | 14.5% |
| South | $391,722 | $46,749 | 11.9% | 14.7% |
| Central | $501,240 | $39,706 | 7.9% | 24.0% |

- The **West** leads on both sales and profit, with the best margin.
- **Central** ranks third in sales but produces only 13.9% of total profit. It also discounts more heavily than any other region (24.0% on average), and its Furniture category lost money (-1.8% margin).

### 3. Category performance

| Category | Sales | Profit | Margin |
|---|---|---|---|
| Technology | $836,154 | $145,455 | 17.4% |
| Office Supplies | $719,047 | $122,491 | 17.0% |
| Furniture | $741,999 | $18,451 | 2.5% |

Technology and Office Supplies generate about 94% of total profit. **Furniture** brings in 32% of sales but only 6.4% of profit.

### 4. Sub-category performance

Three sub-categories lose money:

| Sub-category | Sales | Profit | Margin | Average discount |
|---|---|---|---|---|
| Tables | $206,966 | -$17,725 | -8.6% | 26.1% |
| Bookcases | $114,880 | -$3,473 | -3.0% | 21.1% |
| Supplies | $46,674 | -$1,189 | -2.5% | 7.7% |

- **Tables and Bookcases** explain Furniture's weak profit. About $11K of the Tables loss comes from the East region, where the average Tables discount is 37.4%.
- **Machines** sell $189K but earn only $3.4K (1.8% margin), with an average discount of 30.6%.
- **Copiers** are the most profitable sub-category: $55.6K profit (about 19% of the total) at a 37.2% margin, on only 6.5% of sales.
- Supplies lose money despite a low average discount, so discounting does not explain that one.

---

## Recommendations

1. **Cap discounts at 20%.** Orders above that level were almost always loss-making.
2. **Review discounting in the Central region and on Tables**, especially in the East, where Tables average a 37% discount.
3. **Reprice or review the costs of Machines and Supplies.** Machines earn a 1.8% margin and Supplies lose money.
4. **Focus growth on high-margin lines** such as Copiers, Paper and Accessories.

## Dashboard

<!-- Add 2 or 3 screenshots of your Power BI report below -->
<!-- ![Sales and profit overview](images/powerbi-overview.png) -->
<!-- ![Regional and category drill-down](images/powerbi-drilldown.png) -->

## Project Structure

```
Retail-Sales-Analytics/
├── README.md
├── superstore.csv                     # Raw dataset
├── analysis.py                        # Python analysis
├── region_analysis.csv                # Sales and profit by region
├── category_analysis.csv              # Sales and profit by category
├── subcategory_analysis.csv           # Sales and profit by sub-category
├── Excel Analysis.xlsx                # Excel PivotTables and summary
├── Data Visualization(Power bi).pbix  # Power BI dashboard
├── sql query/                         # SQL queries
└── SQL query results/                 # Query outputs
```

## Author

**Elvis Elosindu**
Data Analytics Portfolio Project

<!-- Add your LinkedIn and email here -->

---

*Dataset source: Sample Superstore dataset, available through Kaggle.*
