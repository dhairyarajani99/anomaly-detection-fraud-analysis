CREATE TABLE transactions (
    transaction_id VARCHAR(20),
    account_id VARCHAR(20),
    transaction_amount DECIMAL(10,2),
    transaction_date DATE,
    transaction_type VARCHAR(10),
    location VARCHAR(50),
    channel VARCHAR(20),
    login_attempts INT,
    account_balance DECIMAL(10,2),
    amount_anomaly INT,
    login_attempt_anomaly INT,
    channel_risk INT,
    high_debit_risk INT,
    low_bal_high_amount INT,
    anomaly_score INT,
    final_flag INT
);

SHOW VARIABLES LIKE "secure_file_priv";

SET GLOBAL LOCAL_INFILE=ON;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/anomaly_detection_excel.csv' 
INTO TABLE transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select * from transactions;
select count(*) from transactions;

#TOP RISKY ACCOUNTS WITH RANK
select account_id,
count(*) as fraud_count,
rank() over (order by count(*) desc) as risk_rank
from transactions
where final_flag=1
group by account_id;

#ANOMALY RATE PER ACCOUNT
select account_id,
count(*) AS total_count,
sum(final_flag) AS fraud_count,
round(sum(final_flag)*100.0/count(*),2) as fraud_rate
from transactions
group by account_id
order by fraud_rate desc;

#RUNNING TRANSACTION TOTAL
select account_id,
transaction_date,
transaction_amount,
sum(transaction_amount) over (partition by account_id order by transaction_date) as running_total
from transactions;

#DETECT SUDDEN SPIKE (LAG)
select account_id, 
transaction_amount,
lag(transaction_amount) over (partition by account_id order by transaction_date) as prev_amount
from transactions;

#DAILY TRANSACTION FREQUENCY
select account_id,
date(transaction_date) AS txn_date,
count(*) as daily_txn
from transactions
group by account_id, txn_date;

#HIGH FREQUENCY ACCOUNTS
select * from (select account_id,
date(transaction_date) as txn_date,
count(*) as txn_count
from transactions
group by account_id, txn_date
) as temp_tab
where txn_count > 3;

#ANOMALY SCORE DISTRIBUTION
select anomaly_score,
count(*) as frequency
from transactions
group by anomaly_score
order by anomaly_score desc;

#LOCATION-WISE FRAUD %
select location,
count(*) as total,
sum(final_flag) as fraud,
round(sum(final_flag)*100.0/count(*),2) as fraud_rate
from transactions
group by location
order by fraud_rate desc;

#CHANNEL PERFORMANCE
select channel,
avg(transaction_amount) as avg_amount,
sum(final_flag) as fraud_cases,
round(sum(final_flag)*100.0/count(*),2) as fraud_rate
from transactions
group by channel;

#TOP SUSPICIOUS TRANSACTIONS
select *
from transactions
order by anomaly_score desc, transaction_amount desc
limit 15;

#BEHAVIOR SEGMENTATION
select 
    case 
        when anomaly_score >= 3 then 'High Risk'
        when anomaly_score = 2 then 'Medium Risk'
        else 'Low Risk'
    end as risk_level,
    count(*) as count
from transactions
group by risk_level;


