# ChocoNutrition_AnalyticsHub
ChocoCrunch Analytics is a comprehensive data analytics project dedicated to analyzing the nutrition profile of global chocolate products. This project integrates advanced data engineering, SQL, Python-driven cleaning, and BI visualization to deliver actionable insights for public health and consumer awareness.
Architecture Description
The architecture of the ChocoCrunch Analytics project follows a robust ETL (Extract, Transform, Load) and analytics pipeline, integrating Python, SQL, and Power BI to deliver structured insights from raw chocolate nutrition data.

Step 1: Data Extraction (ETL)

Product-level data is fetched programmatically from the OpenFoodFacts API using Python scripts.

Over 12,000 chocolate product records are collected, including nutrition facts and categorical fields.

Step 2: Data Cleaning & Feature Engineering

The raw data is processed using pandas and numpy in Jupyter Notebooks.

Columns are cleaned, missing values imputed, and numerical fields standardized.

New features are engineered:

sugar_to_carb_ratio (sugars/carbohydrates)

calorie_category (Low, Moderate, High - based on kcal thresholds)

sugar_category (sugar content based thresholds)

is_ultra_processed (flag using NOVA group)

Step 3: SQL Database Design

Cleaned and engineered data is loaded into a MySQL database.

Three normalized tables are used: product_info, nutrient_info, and derived_metrics.

Foreign keys ensure data integrity and enable complex joins.

Prewritten SQL queries extract KPIs, trends, and groupwise summaries.

Step 4: Business Intelligence Dashboard

Final data (either as SQL query results or CSV exports) is consumed by Power BI Desktop.

Multiple visuals (bar charts, scatter plots, pies/donuts, heatmaps, KPI cards, boxplots) are created.

The dashboard enables interactive slicing/filtering by brand, categories, and product type, aiding stakeholders in data-driven decision making and insight discovery.

Architecture Wireframe Diagram (Text-based)
text
API (OpenFoodFacts)
   │
   ▼
[Python ETL (Jupyter)]
   │
   ├─ Data Cleaning & Imputation
   ├─ Feature Engineering
   ▼
[Processed DataFrames]
   │
   ▼
[MySQL Database]
   ├── product_info
   ├── nutrient_info
   ├── derived_metrics
   │
   ▼
[SQL Analytics Queries]
   │
   ▼
[Power BI Desktop]
   ├─ Interactive Dashboards
   ├─ Visualizations (Bar, Pie, Scatter, KPI, Boxplot etc.)
   ▼
[End-user Insights & Stories]
Summary:
The project flows from automated API data collection, through in-depth data preparation and feature engineering, to relational SQL storage and advanced Power BI dashboard reporting. Each stage is modular, fully documented, and reusable—enabling transparent, scalable, and impactful nutrition analytics for the chocolate product domain.
