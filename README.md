# 🏦 Bank Loan Analytics Dashboard

![Bank Loan Dashboard Summary](BANK%20LOAN%20SUMMARY.png)

---

### 📝 **Project Overview**
This project is an end-to-end business intelligence solution designed to monitor and assess the lending activities of a financial institution. The dashboard provides a high-level executive summary of loan performance, distinguishing between 'Good' and 'Bad' loans to facilitate data-driven risk management.

The system tracks **$435.8M** in funded loans, analyzing repayment trends, interest rates, and borrower debt-to-income (DTI) ratios to maximize profitability and minimize default risks.

---

### 🛠️ **Tech Stack**

* **Microsoft Excel:** Initial data exploration and quality check.
* **SQL:** Data extraction, cleaning, and writing queries to validate KPI numbers.
* **Power BI:**
    * **Power Query:** ETL (Extract, Transform, Load) processes.
    * **DAX:** Complex calculations for Time Intelligence (MoM, MTD) and Loan Classification.
    * **Visualization:** Interactive dashboard design.

**Data Source:**
* **Kaggle:** Financial loan dataset (Historical loan applications, funded amounts, status, and demographics).

---

### 🔍 **Key Features & Highlights**

The dashboard is divided into critical analytical sections visible in the report above:

#### **1. Executive KPIs (Headline Metrics)**
Real-time tracking of vital performance indicators with Month-over-Month (MoM) growth:
* **Total Loan Applications:** **38.6K** (Monitoring volume).
* **Total Funded Amount:** **$435.8M** (Tracking liquidity).
* **Total Amount Received:** **$473.1M** (Tracking revenue/repayment).
* **Average Interest Rate:** **12.0%** (Portfolio yield).
* **Average DTI:** **13.3%** (Borrower risk profile).

#### **2. Risk Assessment (Good vs. Bad Loans)**
A clear segmentation to evaluate portfolio health:
* **Good Loans (86.2%):** Loans that are 'Fully Paid' or 'Current'.
    * *Applications:* 33K
    * *Funded Amount:* $370.2M
* **Bad Loans (13.8%):** Loans classified as 'Charged Off'.
    * *Applications:* 5K
    * *Funded Amount:* $65.5M (Loss provisions).

#### **3. Detailed Loan Status Grid**
A granular table view providing specific metrics for:
* **Fully Paid** vs. **Charged Off** vs. **Current** status.
* Tracks specific MTD (Month-to-Date) Funded Amounts and Received Amounts to spot immediate cash flow trends.

---
*Created by [Shaurya Pratap Yadav]*
