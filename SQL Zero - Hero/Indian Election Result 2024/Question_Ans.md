# 🗳️ Indian Election Results Analysis (SQL Project)

This project analyzes Indian General Election results using SQL. It explores critical political insights such as total seats, state-wise and party-wise wins, performance of alliances like NDA, and vote share percentages. The analysis leverages a structured dataset and is driven purely by SQL queries.

---

## 📊 Key Findings

- 🇮🇳 A total of **543 parliamentary seats** were analyzed.
- 🗺️ **Uttar Pradesh** had the highest number of seats among all states.
- 🧑‍🤝‍🧑 The **NDA Alliance** secured a clear majority across the country.
- 🧠 **BJP** emerged as the dominant party with the highest seat count and vote share.
- 📉 **INC** (Indian National Congress) remained the second-largest party but lagged significantly behind BJP.
- 📈 Highest vote shares were observed in northern states like Gujarat, Rajasthan, and Uttar Pradesh.
- 🗳️ Regional parties like TMC and DMK performed strongly in their respective states.

---

## 📑 Reports & Insights

### **Q1. What is the total number of seats available for elections?**
```sql
SELECT COUNT("Constituency") AS total_seats FROM statewise_results;
````

✔️ **Answer:** 543 Seats

---

### **Q2. What is the number of seats available in each state?**

```sql
SELECT
    s."State" AS states,
    COUNT(DISTINCT cr."Parliament_Constituency") AS total_seats
FROM states AS s
JOIN statewise_results AS sr ON s."State_ID" = sr."State_ID"
JOIN constituencywise_results AS cr ON sr."Parliament_Constituency" = cr."Parliament_Constituency"
GROUP BY s."State"
ORDER BY total_seats DESC;
```

🗺️ **Insight:** Uttar Pradesh leads with the highest number of seats.

---

### **Q3. Total Seats WON by NDA Alliance**

```sql
SELECT SUM("Won") AS nda_total_seats
FROM partywise_results
WHERE "Party" IN (
    'Bharatiya Janata Party - BJP',
    'Janata Dal  (United) - JD(U)',
    'Telugu Desam - TDP',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Apna Dal (Soneylal) - ADAL',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Rashtriya Loktantrik Party - RLTP',
    'Sikkim Krantikari Morcha - SKM'
);
```

✅ **Answer:** NDA Alliance won **293 seats**

---

### **Q4. Seats won by NDA Alliance Parties**

```sql
SELECT "Party", SUM("Won") AS seat_won
FROM partywise_results
WHERE "Party" IN ( ... )
GROUP BY "Party"
ORDER BY seat_won DESC;
```

📌 **Insight:** BJP leads the NDA with the highest number of seats.

---

### **Q5. Top 10 parties based on total seats won**

```sql
SELECT "Party", SUM("Won") AS total_won
FROM partywise_results
GROUP BY "Party"
ORDER BY total_won DESC
LIMIT 10;
```

🏆 **Result:** BJP, INC, DMK, TMC, and others top the chart.

---

### **Q6. State-wise performance of BJP**

```sql
SELECT s."State", SUM(sr."Won") AS bjp_wins
FROM statewise_results sr
JOIN states s ON sr."State_ID" = s."State_ID"
WHERE sr."Party" = 'Bharatiya Janata Party - BJP'
GROUP BY s."State"
ORDER BY bjp_wins DESC;
```

📍 **Insight:** BJP was strongest in UP, Gujarat, and Maharashtra.

---

### **Q7. State-wise performance of INC**

```sql
SELECT s."State", SUM(sr."Won") AS inc_wins
FROM statewise_results sr
JOIN states s ON sr."State_ID" = s."State_ID"
WHERE sr."Party" = 'Indian National Congress - INC'
GROUP BY s."State"
ORDER BY inc_wins DESC;
```

📍 **Insight:** INC had better performance in Kerala, Punjab, and Tamil Nadu.

---

### **Q8. Top 10 states where BJP had the highest vote share**

```sql
SELECT s."State", ROUND(AVG(sr."Vote_Share"), 2) AS avg_vote_share
FROM statewise_results sr
JOIN states s ON sr."State_ID" = s."State_ID"
WHERE sr."Party" = 'Bharatiya Janata Party - BJP'
GROUP BY s."State"
ORDER BY avg_vote_share DESC
LIMIT 10;
```

📈 **Insight:** Gujarat and Rajasthan topped BJP’s vote share.

---

### **Q9. Vote share of each party across constituencies**

```sql
SELECT
    "Constituency",
    "Party",
    ROUND(("Votes" * 100.0) / SUM("Votes") OVER(PARTITION BY "Constituency"), 2) AS vote_share_percent
FROM constituencywise_results;
```

📊 **Insight:** This highlights party performance at micro (constituency) level.

---

## 🔚 Conclusion

Through SQL-based data analysis, this project delivers a comprehensive overview of:

* The structure and outcome of Indian general elections.
* The strength of political alliances like NDA.
* Regional voting patterns and party vote share insights.
* The overall dominance of BJP in both seats and vote share.

📌 These insights are valuable for political analysts, researchers, and anyone studying Indian electoral behavior using data.

---

## 🛠️ Technologies Used

* PostgreSQL / SQL
* DB Browser or PgAdmin
* Relational datasets (multiple joined tables)

---

## 📁 File Structure

```
📦 Election-Results-SQL-Analysis
├── 📄 SQL Query.sql
└── 📄 README.md
```

---

## ✍️ Author

** Mohammad Ali SK
