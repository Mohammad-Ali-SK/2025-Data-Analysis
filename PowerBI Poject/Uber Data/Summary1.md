# 🚗 Uber Trip Analysis Report

![alt text](Uber_Trip_page-0001.jpg)

## 📊 Project Overview

This Uber Trip Analysis is a deep-dive dashboard project using Power BI to analyze **103,000+ Uber rides** across various metrics: time, location, vehicle type, and payment method. The data was cleaned, structured, and visualized using interactive dashboards categorized into three main sections:

1. Overview
2. Time Analysis
3. Detailed Trip Data

This project helps uncover **key trends**, **passenger behavior**, and **operational insights** for optimization.

---

## 🔍 Summary

### 🧩 Key Findings

* **103K+ total trips** recorded.
* **Total revenue**: \~\$1.54 million.
* **UberX** is the most used vehicle (38K+ bookings).
* **Peak usage time**: 2 PM – 6 PM, especially on weekends.
* **Top Pickup**: *Penn Station / Madison Square West*.
* **Top Drop-off**: *Upper East Side North*.
* **Farthest trip**: 144 miles (Lower East Side → Crown Heights North).

### 📈 Supporting Data

* **Average Trip Distance**: 3 miles
* **Average Trip Duration**: 16 minutes
* **Average Booking Amount**: \$14.9
* **Payment Types**:

  * Uber Pay – 67%
  * Cash – 32%
  * Amazon & Google Pay – 1% combined
* **Trip Type**:

  * Day Trips – 65%
  * Night Trips – 35%

### ✅ Recommendations, Report & Insights

* **Peak Optimization**: Add incentives for users during peak afternoon hours.
* **Fleet Management**: Increase UberX vehicles during weekends and in dense pickup zones.
* **Digital Payment Promotion**: Push digital wallets by offering micro-discounts.
* **Route Focus**: Add more vehicles on popular routes like *Penn Station → Upper East Side*.

---

## 📈 Dashboard Breakdown

![alt text](Uber_Trip_page-0001.jpg)


### 1. 📋 Overview Analysis

This page provides a high-level business summary.

#### 🟢 KPIs:

* **Total Bookings**: 103,044
* **Total Trip Distance**: 345,000 miles
* **Total Revenue**: \$1.54 million
* **Avg Booking Value**: \$14.9
* **Avg Trip Time**: 16 minutes

#### 🟢 Bookings by Payment Type:

* Uber Pay – 67.06%
* Cash – 32.21%
* Amazon Pay – 0.55%
* Google Pay – negligible

🧠 **Insight**: Digital payments dominate. Consider removing less-used options.

#### 🟢 Bookings by Trip Type:

* **Day** – 65.31%
* **Night** – 34.69%

🧠 **Insight**: Daytime has higher usage; evening discounts can increase night bookings.

#### 🟢 Bookings by Vehicle Type:

| Vehicle      | Bookings | Trip Distance | Avg Value | Avg Time |
| ------------ | -------- | ------------- | --------- | -------- |
| UberX        | 38,483   | 129,862 mi    | \$15.0    | 16 min   |
| Uber Comfort | 16,967   | 56,092 mi     | \$14.8    | 16 min   |
| Uber Green   | 14,406   | 48,293 mi     | \$14.9    | 15 min   |
| Uber Black   | 16,595   | 55,443 mi     | \$14.9    | 16 min   |

🧠 **Insight**: UberX is the most preferred, while Uber Green has the shortest trip time.

#### 🟢 Popular Pickup & Drop-off Points:

* **Pickup**: Penn Station / Madison Square West
* **Drop-off**: Upper East Side North

#### 🟢 Farthest Trip:

* Pickup: Lower East Side
* Drop-off: Crown Heights North
* Distance: 144 miles

---

### 2. ⏱️ Time Analysis

![alt text](Uber_Trip_page-0002.jpg)

This page breaks down trip data by time and day.

#### 🟠 Bookings by Hour:

Visualizes how bookings change over 24 hours.
**Peak Hours**: 14:00 to 18:00 (2 PM – 6 PM)

🧠 **Insight**: Afternoon hours are most active. High demand between 3 PM – 6 PM.

#### 🟠 Bookings by Day of Week:

* **Tuesday & Sunday** show highest ride activity.
* Mid-week (Wednesday) sees a dip in traffic.

| Day       | Bookings |
| --------- | -------- |
| Sunday    | 18.6K    |
| Tuesday   | 19.1K    |
| Wednesday | 9.2K     |

🧠 **Insight**: Weekend strategies should target Sunday and Tuesday evening users.

#### 🟠 Bookings by Day & Hour Matrix:

Shows heatmap style of trip density across each hour and day.
Example:

* **Friday 3 PM** – High
* **Saturday 6 PM** – Very High
* **Monday 4 AM** – Very Low

🧠 **Insight**: Helps allocate drivers by hour/day combo.

---

### 3. 📄 Detailed Trip Data

![alt text](Uber_Trip_page-0003.jpg)

This table provides raw data per trip with filters.

#### 🔹 Key Columns:

* Trip ID
* Pickup Date & Time
* Vehicle Type
* Payment Type
* Pickup & Drop Location
* Trip Distance
* Booking Amount

🧠 **Use Cases**:

* Analyze specific outlier trips.
* Audit data anomalies.
* Filter by vehicle or date for micro-analysis.

**Example Entries**:

| Trip ID | Date       | Vehicle | Pickup Location | Drop Location    | Distance | Amount  |
| ------- | ---------- | ------- | --------------- | ---------------- | -------- | ------- |
| 6       | 01-06-2024 | UberX   | Central Harlem  | Lincoln Sq. West | 3.29 mi  | \$14.00 |
| 30      | 01-06-2024 | UberXL  | Lenox Hill East | East Chelsea     | 3.68 mi  | \$19.00 |

---

## 🏁 Conclusion

This Uber Trip Analysis gives a comprehensive look into booking trends, customer behaviors, payment preferences, and optimal scheduling. With strong visualization and insights, this dashboard can support both **operational** and **marketing decisions** for ride-hailing platforms.

---

## 📂 Files Included

* `Uber_Trip.pdf` – PDF export of Power BI dashboard
* `Uber Trip.pbix` – Fully interactive Power BI file

---

## 💡 How to Use

1. Open `Uber Trip.pbix` in Power BI Desktop.
2. Use slicers to filter by vehicle type, pickup city, or date.
3. Navigate between:

   * **Overview** tab for KPIs
   * **Time Analysis** for hourly trends
   * **Details** for trip-level data

---


## ✅ What Is a “Decision Template”?

A **decision template** turns your dashboard into a tool that helps business users:

* Understand what’s happening (KPIs, trends)
* Know what actions to take (decisions)
* Track performance over time (improvement)

---

## 🎯 Let’s Build Decision Templates for Uber Dashboard

I convert each page into a **decision-oriented format** below:

---

### 🟦 1. **Overview Analysis – Decision Template**

| Insight Area      | Key Metric        | Business Interpretation                     | Suggested Action                                |
| ----------------- | ----------------- | ------------------------------------------- | ----------------------------------------------- |
| Bookings          | 103K+ total trips | High trip volume – healthy rider engagement | Continue current marketing efforts              |
| Avg Booking Value | \$14.90           | Moderate spend per trip                     | Explore premium service upselling               |
| Total Revenue     | \$1.54M           | Strong performance                          | Set monthly target (e.g. \$2M)                  |
| Most Used Payment | Uber Pay (67%)    | Riders prefer digital payments              | Promote app-based payments with loyalty offers  |
| Vehicle Demand    | UberX dominates   | UberX is preferred for affordability        | Optimize UberX driver availability              |
| Farthest Trip     | 144 miles         | Long-haul trip opportunity                  | Consider fixed rates or packages for long rides |

---

### 🟧 2. **Time Analysis – Decision Template**

| Insight Area       | Trend/Metric                 | Business Interpretation        | Suggested Action                                        |
| ------------------ | ---------------------------- | ------------------------------ | ------------------------------------------------------- |
| Busiest Hours      | 5 PM – 6 PM                  | Evening surge is real          | Incentivize drivers to stay active during peak hours    |
| Top Days           | Friday & Saturday            | Weekend demand is high         | Schedule more drivers; surge pricing opportunities      |
| Low Activity Hours | Early morning (12 AM – 5 AM) | Less demand; cost inefficiency | Minimize supply or use smaller fleet during these hours |

---

### 🟩 3. **Trip Details – Decision Template**

| Insight Area         | Observed Pattern              | Business Interpretation       | Suggested Action                                      |
| -------------------- | ----------------------------- | ----------------------------- | ----------------------------------------------------- |
| Trip Range           | Avg 3 miles, 16 min           | Most trips are short-distance | Bundle short rides with discounts or quick pickups    |
| Pickup/Drop Hotspots | Manhattan, Penn Station       | Consistent zone demand        | Place more drivers in those zones strategically       |
| Booking Value        | Higher on weekends & evenings | Pricing elasticity visible    | Apply dynamic pricing model during high-value periods |

---



## ✍️ Author

**Name**: Mohammad Ali
**Tools Used**: Power BI, Excel
**Goal**: Provide actionable insights from Uber data to drive decisions in ride-hailing businesses.



