# anomaly-detection-fraud-analysis
End-to-end data analytics project for detecting fraudulent transactions using Excel, MySQL, and Power BI with an interactive dashboard and actionable insights.

## 🚀 Project Overview

This project focuses on identifying fraudulent or unusual transactions using data analysis techniques.
The goal is to detect high-risk behavior patterns and present them through an interactive dashboard for better decision-making.

---

## 🎯 Objective

* Detect potentially fraudulent transactions
* Analyze risk patterns across channels and transaction types
* Provide actionable insights to reduce fraud risk

---

## 🛠️ Tools & Technologies

* Excel (Data Cleaning & Feature Engineering)
* MySQL (Data Analysis using SQL)
* Power BI (Dashboard & Visualization)

---

## 📂 Dataset Description

The dataset contains transaction-level data with the following key fields:

* Transaction ID
* Account ID
* Transaction Amount
* Transaction Date
* Transaction Type (Credit/Debit)
* Location
* Channel (Online / ATM / Branch)
* Account Balance
* Amount Anomaly
* Login Attempt Anomaly
* Channel Risk
* High Debit Risk
* Anomaly Score
* Final Fraud Flag

---

## ⚙️ Process Workflow

### 1. Data Cleaning (Excel)

* Removed inconsistencies and formatted columns
* Handled missing values
* Created new features like:

  * Anomaly flags
  * High debit risk
  * Low balance + high amount indicator

---

### 2. Data Analysis (MySQL)

* Wrote SQL queries to analyze:

  * Fraud trends over time
  * High-risk accounts
  * Channel-wise fraud distribution
  * Transaction behavior patterns
* Used aggregation and filtering to extract insights

---

### 3. Dashboard Development (Power BI)

* Built an interactive dashboard with:

  * KPI Cards (Total Transactions, Fraud %, Avg Risk Score)
  * Fraud Trend (Line Chart)
  * Fraud by Channel (Bar Chart)
  * Fraud by Transaction Type (Donut Chart)
  * Anomaly Score Distribution (Column Chart)
  * Transaction Risk Scatter Plot
* Added slicers for dynamic filtering

---

## 📊 Key Insights

* Online transactions show the highest fraud risk compared to ATM and Branch
* Debit transactions account for the majority of fraud cases
* Only a small percentage of transactions are high-risk, but they contribute most to fraud
* Transactions with high amount and low account balance are more suspicious
* Fraud occurs in spikes rather than being consistent over time

---

## 🚀 Recommendations

* Focus fraud monitoring on online transactions
* Track high-value debit transactions more closely
* Prioritize high-risk transactions instead of reviewing all data
* Implement balance-based alerts for unusual activity
* Introduce real-time fraud detection mechanisms

---

## 📸 Dashboard Preview
<img width="1375" height="784" alt="Dashboard" src="https://github.com/user-attachments/assets/5a949dbe-8390-4cf0-b47b-541227011691" />

---

## 📁 Project Structure

```
Anomaly-Detection-Project/
│
├── data/
│   └── anomaly_detection_excel
│
├── sql/
│   └── anomaly_detection_sql_queries
│
├── dashboard/
│   └── anomaly_detection_powerbi
│
├── images/
│   └── dashboard_preview.png
│
└── README.md
```

---

## 🎤 Key Takeaway

This project demonstrates how data can be used to detect fraud patterns and improve decision-making.
By focusing on high-risk behaviors rather than all transactions, businesses can reduce fraud efficiently while saving time and resources.

---

## 📌 Future Improvements

* Implement machine learning models for better fraud prediction
* Add real-time data integration
* Enhance anomaly detection using advanced statistical techniques

---

## 🤝 Connect

If you found this project useful or have feedback, feel free to connect!
