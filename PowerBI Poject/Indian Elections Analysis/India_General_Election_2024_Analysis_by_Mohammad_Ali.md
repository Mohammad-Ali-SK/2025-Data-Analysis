# 🇮🇳 India General Election 2024 - Power BI Dashboard Report

![alt text](<Power BI Dashboard_page-0001.jpg>)

📁 **Dataset**: Indian General Election 2024
🛠 **Tools Used**: Power BI, Excel
📅 **Election Dates**: Voting: 19 Apr – 01 Jun 2024 | Counting: 04 Jun 2024
📊 **Scope**: 543 Constituencies | 34+ Parties | 3 Alliances (NDA, I.N.D.I.A., Others)

---

## 📌 Project Overview

This Power BI dashboard suite presents a **comprehensive electoral analysis** of the 2024 Indian General Elections. Built on raw CSV data, it delivers actionable insights into **national, state, and constituency-level voting patterns** through 5 powerful, interactive dashboards:

1. Overview Analysis
2. State Demographics
3. Political Landscape by State
4. Constituency Analysis
5. Full Details Grid

---

## 📈 Dashboard Breakdown

---

![alt text](<Power BI Dashboard_page-0002.jpg>)

### 🔷 1. **Overview Analysis**

**Objective**: Provide a national summary of election results by alliance and party.

#### 📊 Key KPIs:

* 🏆 **NDA**: 292 seats (53.8%)
* 🔵 **I.N.D.I.A.**: 234 seats (43.1%)
* ⚪ **Others**: 17 seats (3.1%)

#### 📌 Party-Wise Leaders:

* **BJP (NDA)**: 240 seats
* **INC (I.N.D.I.A.)**: 99 seats
* **SP (I.N.D.I.A.)**: 37 seats
* **AITC, DMK, SHS, RJD** also show strong presence

#### 🧠 Insight:

* BJP remains the dominant political force.
* I.N.D.I.A. has consolidated multiple regional parties but fell short nationally.
* Others and Independents play a minor role in total seats.

---
![alt text](<Power BI Dashboard_page-0003.jpg>)

### 🟣 2. **State Demographics**

**Objective**: Visualize state-wise alliance performance and seat distribution.

#### 🗺 Visual Features:

* **Interactive Map**: Color-coded by winning alliance
* **Tooltips**: Show total seats, NDA seats, I.N.D.I.A. seats, and majority alliance
* **Drillthrough**: Into all constituencies within a selected state

#### 🧠 Insight:

* NDA dominates in North and Central India: UP, Bihar, MP, Gujarat
* I.N.D.I.A. leads in the South & East: TN, Kerala, Bengal, Punjab
* Significant electoral variation exists across geography

---

![alt text](<Power BI Dashboard_page-0004.jpg>)

### 🟢 3. **Political Landscape by State**

**Objective**: Deep dive into individual states to analyze party-level performance.

#### 📍 Example: **Maharashtra**

* **I.N.D.I.A.**: 30 seats (INC, SHSUBT, NCPSP)
* **NDA**: 17 seats (BJP, SHS, NCP)
* **Other**: 1 seat (Independent)

#### Visuals:

* Donut charts for party-wise seat share
* Grid showing party → alliance → seat count
* Clickable map by constituency

#### 🧠 Insight:

* Maharashtra is politically fragmented
* Alliances often rely on **local parties** for regional dominance
* Enables state-level campaign planning for future elections

---

![alt text](<Power BI Dashboard_page-0005.jpg>)

### 🟠 4. **Constituency Analysis**

**Objective**: Examine granular details of voting in individual constituencies.

#### 📌 Example: **Murshidabad (West Bengal)**

* 🥇 Winner: Abu Taher Khan (AITC) – 44.27% vote share
* 🥈 Runner-up: Md. Salim (CPI-M) – 33.62%
* 🥉 2nd Runner-up: BJP – 18.94%
* 🧾 Total Votes: 1.54 million+

#### Metrics:

* Vote share (%) for top 3 candidates
* Total votes, EVM vs Postal votes
* Number of candidates contesting

#### 🧠 Insight:

* Multi-cornered fights common in key constituencies
* Helps identify **vote split**, **margins**, and **emerging threats**

---

![alt text](<Power BI Dashboard_page-0006.jpg>)

### 🟡 5. **Details Grid View**

**Objective**: Provide a structured, exportable data table of all constituency-level results.

#### 🔍 Columns:

* Constituency, Winning & Runner-Up Candidate
* Party, Alliance, Votes (EVM + Postal), Total Votes
* Margin of victory

#### 🔧 Features:

* Fully filterable by state, party, alliance, and candidate
* Drill-through from any dashboard
* Export to Excel for detailed offline analysis

#### 🧠 Insight:

* Useful for validation, audit, and micro-targeting
* Essential for data analysts and political researchers

---

## 🧩 Key Technical Features

* **DAX Calculations**:

  * `Party Alliance (Result)` using nested IFs and LOOKUPVALUE
  * `Runner-Up % Votes` using `MAXX(FILTER(...))`
  * `Votes Share KPI` with dynamic formatting
* **Interactivity**:

  * State and constituency drillthrough
  * Hover-based tooltips
  * Slicers, bookmarks, and drill filters
* **Data Modeling**:

  * Five related tables, including normalized party and state tables
  * Relationship based on `Party ID`, `Constituency ID`, and `State Name`

---

## ✅ Summary & Outcome

This project demonstrates full-cycle analytics capability — from **data cleaning to dashboard storytelling**. It allows stakeholders to:

* Understand national voting trends and alliance strength
* Analyze competitive regions and state-specific performance
* Drill into granular voter patterns at constituency level
* Export and explore underlying data with flexibility

---

## 💡 Final Recommendations

| Area          | Recommendation                                                    |
| ------------- | ----------------------------------------------------------------- |
| 🔄 Data Model | Normalize party & alliance tables for better DAX performance      |
| 📊 Voter Data | Add demographics (age, gender) for richer analysis                |
| 🗳 Turnout    | Add turnout % by state and constituency                           |
| 🚀 Prediction | Add historical data for forecasting 2029 elections                |
| 📤 Publishing | Embed dashboard in portfolio or share via Power BI Publish-to-Web |