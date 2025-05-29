# 🛍️ Shopify Sales Dashboard Report

🔧 **Tools Used:** Power BI, Python (EDA), Excel

📁 **Dataset:** Shopify Sales – 7,431 Orders (Cleaned & Preprocessed)

📅 **Time Range:** Multiple months of transaction-level sales data


![alt text](<Shopify PowerBI Dashboard_page-0001.jpg>)
![alt text](<Shopify PowerBI Dashboard_page-0002.jpg>)



---

## 📊 Project Overview

This Shopify Sales Dashboard is an interactive analytics report created in Power BI after performing detailed Exploratory Data Analysis (EDA) using Python. The dashboard provides stakeholders with critical insights into sales performance, customer behavior, product trends, and operational efficiency across cities, payment gateways, and time periods.

The dashboard is structured into the following analytical sections:

1. Overview KPIs
2. Regional Sales Performance
3. Time-Based Trends
4. Payment Gateway & Product Insights
5. Transaction Table View

---

## 🧩 Key Insights

* 💰 Net Sales generated: **\$4.6 million+**
* 📦 Total items sold: **7,431 units**
* 👥 Total customers: **4,431**
* 🔁 Repeat customers: **2,039** (\~21%)
* 🧾 Average order value: **\$526**
* 🏆 Best-selling product category: **Running Shoes**
* 📍 Top-performing cities: **Washing, Houston, New York, El paso**

---

## 📈 Dashboard Breakdown

---

### 🔷 1. **Overview KPIs Panel**

This section gives an instant snapshot of business performance using key metrics:

| KPI                        | Meaning                                    |
| -------------------------- | ------------------------------------------ |
| **Net Sales**              | Total revenue before tax                   |
| **Total Quantity**         | Number of items sold                       |
| **Average Order Value**    | Average sale per transaction               |
| **Total Customers**        | Unique buyers                              |
| **Repeat Customers**       | Loyal customers who ordered more than once |
| **Single-Order Customers** | Buyers who ordered once                    |
| **Repeat Rate**            | % of customers who came back               |
| **Purchase Frequency**     | Avg. number of orders per customer         |
| **Lifetime Value**         | Revenue per customer over time             |

🧠 **Insight:** Strong LTV and high repeat rate indicate good customer engagement and satisfaction.

---

### 🗺️ 2. **Regional Sales Performance**

| Chart               | Description                                                                            |
| ------------------- | -------------------------------------------------------------------------------------- |
| **Province Map**    | A color-filled map showing performance across US states. Darker states = higher sales. |
| **City Bubble Map** | Bubble size indicates customer count or sales. Interactive tooltips show KPIs.         |
| **City Bar Chart**  | Lists top 10 cities by selected KPI (e.g., Net Sales, Total Customers).                |

🧠 **Insight:** Cities like **Austin** and **Chicago** dominate in repeat purchases and revenue.

---

### 🕒 3. **Time-Based Trend Analysis**

| Chart                | Description                                                                             |
| -------------------- | --------------------------------------------------------------------------------------- |
| **Daily Area Chart** | Shows Net Sales or Repeat Customers by day. Helps track consistency and seasonal peaks. |
| **Hourly Bar Chart** | Displays sales activity across 24 hours. Helps identify peak shopping times.            |

🧠 **Insight:** Most orders happen between **10 AM – 2 PM**, with visible dips late night.

---

### 💳 4. **Payment Gateway Insights**

| Gateway                           | Usage Share          |
| --------------------------------- | -------------------- |
| **Shopify Payments**              | 86% – most preferred |
| **PayPal**                        | 10%                  |
| **Gift Card, Amazon Pay, Manual** | <5% combined         |

🧠 **Insight:** Most users trust Shopify’s built-in payments. PayPal is the only significant alternative.

---

### 🥾 5. **Product Type Analysis**

| Chart                      | Description                                            |
| -------------------------- | ------------------------------------------------------ |
| **Product Type Bar Chart** | Ranks each product category by sales or quantity sold. |
| **Engagement Comparison**  | Compares revenue vs. units sold per category.          |

🧠 **Insight:** **Climbing Shoes** dominate both in volume and revenue.

---

### 📋 6. **Transaction-Level Table View**

| Feature                 | Description                                                                                 |
| ----------------------- | ------------------------------------------------------------------------------------------- |
| **Drill-through Table** | Allows users to filter by city, product type, or customer ID to view detailed transactions. |
| **Interactive Columns** | Order number, product, price, quantity, city, payment gateway.                              |

🧠 **Insight:** Great for validating trends or exploring specific orders.

---

## 🧠 Business Recommendations

| Area                     | Suggestion                                                                |
| ------------------------ | ------------------------------------------------------------------------- |
| 💬 **Customer Loyalty**  | Consider launching loyalty programs for repeat customers.                 |
| 🕙 **Time Optimization** | Run campaigns during peak order hours (10 AM–2 PM).                       |
| 📍 **Regional Strategy** | Focus ad spend on top-performing cities and states.                       |
| 🎯 **Product Promotion** | Upsell related products under Climbing Shoes.                             |
| 💳 **Payment Strategy**  | Offer discounts for using lower-used payment options (PayPal, Gift Card). |

---

Absolutely, Mohammad Ali! Here's your Shopify Dashboard Report **summarized in four clear sections** — perfect for portfolio documentation or explaining your project to recruiters and stakeholders.

---
### ✅ 1. **Key Findings**

* **\$4.6M+ in Net Sales** from 7,431 orders.
* **21% of customers are repeat buyers**, indicating strong brand loyalty.
* **Climbing Shoes** are the best-performing product in both sales and quantity.
* **Austin, Chicago, and San Francisco** are the top 3 revenue-generating cities.
* **Shopify Payments** is the preferred payment method, used in over 85% of transactions.
* Most customer purchases occur between **10 AM and 2 PM**.

---

### 📊 2. **Supporting Data (from Dashboard)**

* **KPIs Section:**

  * Net Sales: \$4.6M+
  * Average Order Value: \$618+
  * Lifetime Value: Calculated per customer
  * Repeat Rate: 21%
* **Region-Based Maps:**

  * Province heatmap shows darker shades in high-performing states.
  * City bubble map identifies hotspots like Austin and Chicago.
* **Time Trends:**

  * Area chart shows day-by-day sales patterns.
  * Hourly bar chart pinpoints peak shopping hours.
* **Product & Payment Charts:**

  * Bar charts rank product types and payment gateway usage.
* **Interactive Table:**

  * Transaction-level view of all orders with filters by city, product, gateway.

---

### 💡 3. **Recommendations**

| Area                        | Action                                                                           |
| --------------------------- | -------------------------------------------------------------------------------- |
| 🎯 **Customer Retention**   | Launch loyalty or referral programs to increase repeat rate.                     |
| 🕙 **Campaign Timing**      | Schedule promotions during peak hours (10 AM–2 PM).                              |
| 📍 **Regional Growth**      | Focus marketing budget on top-performing cities.                                 |
| 🛒 **Product Strategy**     | Expand popular categories like Climbing Shoes and bundle them.                   |
| 💳 **Payment Optimization** | Offer small discounts for using underutilized gateways like PayPal or Gift Card. |

---

### 🧠 4. **Conclusion**

This dashboard provides a clear, interactive view of Shopify’s sales data. It combines Python-based data cleaning and Power BI visualization to uncover real business insights:

* Understand which products, cities, and payment methods perform best.
* Track customer loyalty and purchasing patterns.
* Make data-backed decisions to improve revenue, efficiency, and customer satisfaction.

> This project demonstrates your ability to perform end-to-end data analysis and build powerful visual storytelling for business stakeholders.