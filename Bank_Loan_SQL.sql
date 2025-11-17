SELECT *
FROM loan_data ;

SELECT COUNT(id) as 'Total Application'
FROM loan_data ;

-- Converting date value of issue date
UPDATE loan_data
SET issue_date = STR_TO_DATE(issue_date, '%d-%m-%Y');

ALTER TABLE loan_data
MODIFY issue_date DATE;
-- converting  last credit pull date

UPDATE loan_data
SET last_credit_pull_date = STR_TO_DATE(last_credit_pull_date, '%d-%m-%Y');
ALTER TABLE loan_data
MODIFY last_credit_pull_date DATE;

-- for last payment credit

UPDATE loan_data
SET last_payment_date = STR_TO_DATE(last_payment_date, '%d-%m-%Y');
ALTER TABLE loan_data
MODIFY last_payment_date DATE;

-- next payment credit

UPDATE loan_data
SET next_payment_date = STR_TO_DATE(next_payment_date, '%d-%m-%Y');
ALTER TABLE loan_data
MODIFY last_payment_date DATE;

-- MTD Loan Applications
SELECT COUNT(id) AS Total_Applications FROM loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021; -- 4314

-- PMTD Loan Applications
SELECT COUNT(id) AS Total_Applications FROM loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021; -- 4035

-- TOTAL FUNDED AMOUNT
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM loan_data; -- 435757075

-- MTD Total Funded Amount
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021; -- 53981425

-- PMTD Total Funded Amount
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021; -- 47754825

-- Total Amount Recived
SELECT SUM(total_payment) AS total_amount_received
FROM loan_data; -- 473070933

-- Total Amount Recevied Month To Date( MTD)
SELECT SUM(total_payment) AS MTD_amount_received
FROM loan_data 
WHERE MONTH(issue_date) = 12 AND YEAR (issue_date) = 2021 ; -- 58074380

-- PMTD Total Amount Received
SELECT SUM(total_payment) AS PMTD_Amount_received FROM loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021 ; -- 50132030

-- AVG INTEREST RATE
SELECT AVG(int_rate)*100 AS Avg_int_rate 
FROM loan_data; -- 12.04

-- MTD Average Interest
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021; -- 12.35

 -- PMTD Average Interest
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021; -- 11.94

-- Avg DTI
SELECT AVG(dti)*100 AS Avg_DTI FROM loan_data; -- 13.32

-- MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021; -- 13.66

-- PMTD Avg DTI
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM loan_data 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021; -- 13.30

-- GOOD LOAN ISSUED --
-- Good Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
    FROM loan_data; -- 86.17
    
-- Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'; -- 33243

-- Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'; -- 370224850

-- Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'; -- 435786170

-- BAD LOAN ISSUED --
-- Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM loan_data; -- 13.82

-- Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM loan_data
WHERE loan_status = 'Charged Off'; -- 5333

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM loan_data
WHERE loan_status = 'Charged Off'; -- 65532225

-- Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM loan_data
WHERE loan_status = 'Charged Off'; -- 37284763

-- LOAN STATUS
SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
FROM loan_data
GROUP BY loan_status;


SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status ; 

-- BANK LOAN REPORT | OVERVIEW--
-- MONTH
SELECT 
    MONTH(issue_date) AS Month_Number, 
    MONTHNAME(issue_date) AS Month_Name, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY 
    MONTH(issue_date), 
    MONTHNAME(issue_date)
ORDER BY 
    MONTH(issue_date);
    
-- STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY address_state
ORDER BY address_state ;

-- TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY term
ORDER BY term;

-- EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY emp_length
ORDER BY emp_length;

-- PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY purpose
ORDER BY purpose ;


-- HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY home_ownership
ORDER BY home_ownership;

-- PURPOSE 
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose; 


