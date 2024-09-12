use telecom;
select * from customer;
select count(distinct Customer_ID) from customer;

/* find missing values*/
WITH MissingValueCounts AS (
SELECT 'Customer_ID' AS ColumnName, COUNT(*) - COUNT(Customer_ID) AS MissingCount
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Gender', COUNT(*) - COUNT(Gender)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Age', COUNT(*) - COUNT(Age)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Married', COUNT(*) - COUNT(Married)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Number_of_Dependents', COUNT(*) - COUNT(Number_of_Dependents)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'City', COUNT(*) - COUNT(City)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Number_of_Referrals', COUNT(*) - COUNT(Number_of_Referrals)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Tenure_in_Months', COUNT(*) - COUNT(Tenure_in_Months)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Offer', COUNT(*) - COUNT(Offer)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Phone_Service', COUNT(*) - COUNT(Phone_Service)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Phone_Service', COUNT(*) - COUNT(Phone_Service)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Avg_Monthly_Long_Distance_Charges', COUNT(*) - COUNT(Avg_Monthly_Long_Distance_Charges)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Multiple_Lines', COUNT(*) - COUNT(Multiple_Lines)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Internet_Service', COUNT(*) - COUNT(Internet_Service)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Internet_Type', COUNT(*) - COUNT(Internet_Type)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Avg_Monthly_GB_Download', COUNT(*) - COUNT(Avg_Monthly_GB_Download)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Online_Security', COUNT(*) - COUNT(Online_Security)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Online_Backup', COUNT(*) - COUNT(Online_Backup)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Device_Protection_Plan', COUNT(*) - COUNT(Device_Protection_Plan)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Premium_Tech_Support', COUNT(*) - COUNT(Premium_Tech_Support)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Streaming_TV', COUNT(*) - COUNT(Streaming_TV)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Streaming_Movies', COUNT(*) - COUNT(Streaming_Movies)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Streaming_Music', COUNT(*) - COUNT(Streaming_Music)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Unlimited_Data', COUNT(*) - COUNT(Unlimited_Data)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Contract', COUNT(*) - COUNT(Contract)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Paperless_Billing', COUNT(*) - COUNT(Paperless_Billing)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Payment_Method', COUNT(*) - COUNT(Payment_Method)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Monthly_Charge', COUNT(*) - COUNT(Monthly_Charge)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Total_Charges', COUNT(*) - COUNT(Total_Charges)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Total_Refunds', COUNT(*) - COUNT(Total_Refunds)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Total_Extra_Data_Charges', COUNT(*) - COUNT(Total_Extra_Data_Charges)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Total_Long_Distance_Charges', COUNT(*) - COUNT(Total_Long_Distance_Charges)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Total_Revenue', COUNT(*) - COUNT(Total_Revenue)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Churn_Category', COUNT(*) - COUNT(Churn_Category)
FROM customer
WHERE Customer_Status = 'Churned'
UNION ALL
SELECT 'Churn_Reason', COUNT(*) - COUNT(Churn_Reason)
FROM customer
WHERE Customer_Status = 'Churned')

SELECT ColumnName, MissingCount
FROM MissingValueCounts
WHERE MissingCount > 0
ORDER BY MissingCount DESC;

-- Analyzing missing values in categorical and numerical features
SELECT
    'Internet_Type' AS Column_Name,
    GROUP_CONCAT(DISTINCT Internet_Type ORDER BY Internet_Type SEPARATOR ', ') AS Data_Values
FROM
    telecom.customer
UNION ALL
SELECT
    'Streaming_TV' AS Column_Name,
    GROUP_CONCAT(DISTINCT CAST(Streaming_TV AS CHAR) ORDER BY Streaming_TV SEPARATOR ', ') AS Data_Values
FROM
    telecom.customer
UNION ALL
SELECT
    'Multiple_Lines' AS Column_Name,
    GROUP_CONCAT(DISTINCT CAST(Multiple_Lines AS CHAR) ORDER BY Multiple_Lines SEPARATOR ', ') AS Data_Values
FROM
    telecom.customer
UNION ALL
SELECT
    'Streaming_Music' AS Column_Name,
    GROUP_CONCAT(DISTINCT CAST(Streaming_Music AS CHAR) ORDER BY Streaming_Music SEPARATOR ', ') AS Data_Values
FROM
    telecom.customer
UNION ALL
SELECT
    'Device_Protection_Plan' AS Column_Name,
    GROUP_CONCAT(DISTINCT CAST(Device_Protection_Plan AS CHAR) ORDER BY Device_Protection_Plan SEPARATOR ', ') AS Data_Values
FROM
    telecom.customer
UNION ALL
SELECT
    'Premium_Tech_Support' AS Column_Name,
    GROUP_CONCAT(DISTINCT CAST(Premium_Tech_Support AS CHAR) ORDER BY Premium_Tech_Support SEPARATOR ', ') AS Data_Values
FROM
    telecom.customer
UNION ALL
SELECT
    'Streaming_Movies' AS Column_Name,
    GROUP_CONCAT(DISTINCT CAST(Streaming_Movies AS CHAR) ORDER BY Streaming_Movies SEPARATOR ', ') AS Data_Values
FROM
    telecom.customer
UNION ALL
SELECT
    'Online_Security' AS Column_Name,
    GROUP_CONCAT(DISTINCT CAST(Online_Security AS CHAR) ORDER BY Online_Security SEPARATOR ', ') AS Data_Values
FROM
    telecom.customer
UNION ALL
SELECT
    'Online_Backup' AS Column_Name,
    GROUP_CONCAT(DISTINCT CAST(Online_Backup AS CHAR) ORDER BY Online_Backup SEPARATOR ', ') AS Data_Values
FROM
    telecom.customer
UNION ALL
SELECT
    'Unlimited_Data' AS Column_Name,
    GROUP_CONCAT(DISTINCT CAST(Unlimited_Data AS CHAR) ORDER BY Unlimited_Data SEPARATOR ', ') AS Data_Values
FROM
    telecom.customer
UNION ALL
SELECT
    'Avg_Monthly_GB_Download' AS Column_Name,
    CAST(ROUND(AVG(Avg_Monthly_GB_Download), 2) AS CHAR) AS Data_Values
FROM
    telecom.customer
UNION ALL
SELECT
    'Avg_Monthly_Long_Distance_Charges' AS Column_Name,
    CAST(ROUND(AVG(Avg_Monthly_Long_Distance_Charges), 2) AS CHAR) AS Data_Values
FROM
    telecom.customer;

/* find the number and proportion of customers who have churned */
select
COUNT(CASE WHEN Customer_Status = 'Churned' THEN 1 END) AS Total_Churned,
ROUND(COUNT(CASE WHEN Customer_Status = 'Churned' THEN 1 END)/COUNT(*)*100,2) AS Proportion_Churned
FROM customer;

/*Find the avg customer that joined, stayed and churned */
Select
ROUND(AVG(CASE WHEN Customer_Status = 'Joined' THEN Age END),2) AS Avg_age_joined,
ROUND(AVG(CASE WHEN Customer_Status = 'Stayed' THEN Age END),2) AS Avg_age_stayed,
ROUND(AVG(CASE WHEN Customer_Status = 'Churned' THEN Age END),2) AS Avg_age_churned
FROM customer;
select * from customer;
/*What is the gender’s proportion churned*/
SELECT
    Gender,
    COUNT(Gender) AS Total,
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM customer WHERE Customer_Status = 'Churned')) * 100, 2) AS Churned
FROM customer
WHERE Customer_Status = 'Churned'
GROUP BY Gender;

/*The state civil of customers has correlation with churned?*/
SELECT
    Married,
    COUNT(Married) AS Total,
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM customer WHERE Customer_Status = 'Churned')) * 100, 2) AS Proportion_Churned
FROM customer
WHERE Customer_Status = 'Churned'
GROUP BY Married;

/*Does the fact that the customer has a child correlate with “Churned”?*/
UPDATE `customer`
SET Number_of_Dependents = 1
WHERE Number_of_Dependents >= 1;

SELECT
    main.Customer_Status,
    main.Number_of_Dependents AS Dependents,
    COUNT(*) AS Total,
    ROUND(COUNT(*) / Total_Status.Total_Per_Status * 100, 2) AS Taxa
FROM customer main
JOIN (
    SELECT
        Customer_Status,
        COUNT(*) AS Total_Per_Status
    FROM customer
    GROUP BY Customer_Status
) AS Total_Status
ON main.Customer_Status = Total_Status.Customer_Status
GROUP BY main.Customer_Status, main.Number_of_Dependents, Total_Status.Total_Per_Status
ORDER BY main.Customer_Status ASC, Dependents;

 /*The average of referrals has correlation with customers’s status?*/

SELECT
Customer_Status,
ROUND(AVG(Number_of_Referrals),2) as Avg_Referrals
FROM customer
GROUP BY Customer_Status
ORDER BY Avg_Referrals DESC;

/*What is the better offer for each customer’s status?*/

SELECT
Customer_Status,
Offer,
COUNT(Offer) as Total
FROM customer
GROUP BY Customer_Status, Offer
ORDER BY Customer_Status, Total DESC;

/*What is the average of tenure in months for each customer’s status?*/

SELECT
Customer_Status,
ROUND(AVG(Tenure_in_Months),2) as Avg_Tenure
FROM customer
GROUP BY Customer_Status
ORDER BY Avg_Tenure DESC;

/*What is the average monthly long distance charge for each customer’s status?*/

SELECT
Customer_Status,
ROUND(AVG(Avg_Monthly_Long_Distance_Charges),2) as Avg_Monthly_Long_Distance_Charges
FROM customer
GROUP BY Customer_Status;

/*Total of multiple lines for each customer’s status*/

SELECT
Customer_Status,
Internet_Service,
COUNT(Internet_Service) as Total
FROM customer
WHERE Internet_Service IS NOT NULL
GROUP BY Customer_Status, Internet_Service
ORDER BY Customer_Status DESC;

/*Total of internet service for each customer’s status*/

WITH CountData AS (
  SELECT
    Customer_Status,
    Internet_Service,
    COUNT(*) AS Total
  FROM customer
  WHERE Internet_Service IS NOT NULL
  GROUP BY Customer_Status, Internet_Service
),
TotalPerStatus AS (
  SELECT
    Customer_Status,
    SUM(Total) AS StatusTotal
  FROM CountData
  GROUP BY Customer_Status
)
SELECT
  CountData.Customer_Status,
  CountData.Internet_Service,
  CountData.Total,
  ROUND((CountData.Total / TotalPerStatus.StatusTotal) * 100, 2) AS Percentage
FROM CountData
JOIN TotalPerStatus ON CountData.Customer_Status = TotalPerStatus.Customer_Status
ORDER BY CountData.Customer_Status DESC, CountData.Internet_Service;

/*Main internet type for each customer’s status*/

SELECT
Customer_Status,
Internet_Type,
COUNT(Internet_Type) as Total
FROM customer
WHERE Internet_Type IS NOT NULL
GROUP BY Customer_Status, Internet_Type
ORDER BY Customer_Status DESC;

/*Average monthly of gb download for each customer’s status*/

SELECT
Customer_Status,
ROUND(AVG(Avg_Monthly_GB_Download),2) as Average_Download
FROM customer
WHERE Avg_Monthly_GB_Download IS NOT NULL
GROUP BY Customer_Status
ORDER BY Average_Download DESC;

/*Proportion of user that has online security for each customer’s status*/

WITH TotalStatus AS (
  SELECT
    Customer_Status,
    COUNT(*) as TotalPerStatus
  FROM customer
  WHERE Online_Security IS NOT NULL
  GROUP BY Customer_Status
)

SELECT
  a.Customer_Status,
  a.Online_Security,
  COUNT(a.Online_Security) as Total,
  ROUND(COUNT(a.Online_Security) * 100.0 / b.TotalPerStatus,2) as Percentage
FROM customer a
JOIN TotalStatus b ON a.Customer_Status = b.Customer_Status
WHERE a.Online_Security IS NOT NULL
GROUP BY a.Customer_Status, a.Online_Security, b.TotalPerStatus
ORDER BY a.Customer_Status DESC, a.Online_Security;

/*Proportion of user that has online backup for each customer’s status*/

WITH TotalStatus AS (
  SELECT
    Customer_Status,
    COUNT(*) as TotalPerStatus
  FROM customer
  WHERE Online_Backup IS NOT NULL
  GROUP BY Customer_Status
)

SELECT
  a.Customer_Status,
  a.Online_Backup,
  COUNT(a.Online_Backup) as Total,
  ROUND(COUNT(a.Online_Backup) * 100.0 / b.TotalPerStatus, 2) as Percentage
FROM customer a
JOIN TotalStatus b ON a.Customer_Status = b.Customer_Status
WHERE a.Online_Backup IS NOT NULL
GROUP BY a.Customer_Status, a.Online_Backup, b.TotalPerStatus
ORDER BY a.Customer_Status, Total DESC;

/*Proportion of user that has device protection plan for each customer’s status*/

WITH TotalStatus AS (
  SELECT
    Customer_Status,
    COUNT(*) as TotalPerStatus
  FROM customer
  WHERE Device_Protection_Plan IS NOT NULL
  GROUP BY Customer_Status
)

SELECT
  a.Customer_Status,
  a.Device_Protection_Plan,
  COUNT(a.Device_Protection_Plan) as Total,
  ROUND(COUNT(a.Device_Protection_Plan) * 100.0 / b.TotalPerStatus, 2) as Percentage
FROM customer a
JOIN TotalStatus b ON a.Customer_Status = b.Customer_Status
WHERE a.Device_Protection_Plan IS NOT NULL
GROUP BY a.Customer_Status, a.Device_Protection_Plan, b.TotalPerStatus
ORDER BY a.Customer_Status, Total DESC;

/*Proportion of user that has premium tech support plan for each customer’s status*/

WITH TotalStatus AS (
  SELECT
    Customer_Status,
    COUNT(*) as TotalPerStatus
  FROM customer
  WHERE Premium_Tech_Support IS NOT NULL
  GROUP BY Customer_Status
)

SELECT
  a.Customer_Status,
  a.Premium_Tech_Support,
  COUNT(a.Premium_Tech_Support) as Total,
  ROUND(COUNT(a.Premium_Tech_Support) * 100.0 / b.TotalPerStatus, 2) as Percentage
FROM customer a
JOIN TotalStatus b ON a.Customer_Status = b.Customer_Status
WHERE a.Premium_Tech_Support IS NOT NULL
GROUP BY a.Customer_Status, a.Premium_Tech_Support, b.TotalPerStatus
ORDER BY a.Customer_Status, Total DESC;

/*Proportion of user that has streaming TV plan for each customer’s status*/

WITH TotalStatus AS (
  SELECT
    Customer_Status,
    COUNT(*) as TotalPerStatus
  FROM customer
  WHERE Streaming_TV IS NOT NULL
  GROUP BY Customer_Status
)

SELECT
  a.Customer_Status,
  a.Streaming_TV,
  COUNT(a.Streaming_TV) as Total,
  ROUND(COUNT(a.Streaming_TV) * 100.0 / b.TotalPerStatus, 2) as Percentage
FROM customer a
JOIN TotalStatus b ON a.Customer_Status = b.Customer_Status
WHERE a.Streaming_TV IS NOT NULL
GROUP BY a.Customer_Status, a.Streaming_TV, b.TotalPerStatus
ORDER BY a.Customer_Status, Total DESC;

/*Proportion of user that has streaming movies plan for each customer’s status*/

WITH TotalStatus AS (
  SELECT
    Customer_Status,
    COUNT(*) as TotalPerStatus
  FROM customer
  WHERE Streaming_Movies IS NOT NULL
  GROUP BY Customer_Status
)

SELECT
  a.Customer_Status,
  a.Streaming_Movies,
  COUNT(a.Streaming_Movies) as Total,
  ROUND(COUNT(a.Streaming_Movies) * 100.0 / b.TotalPerStatus, 2) as Percentage
FROM customer a
JOIN TotalStatus b ON a.Customer_Status = b.Customer_Status
WHERE a.Streaming_Movies IS NOT NULL
GROUP BY a.Customer_Status, a.Streaming_Movies, b.TotalPerStatus
ORDER BY a.Customer_Status, Total DESC;

/*Proportion of user that has streaming music plan for each customer’s status*/

WITH TotalStatus AS (
  SELECT
    Customer_Status,
    COUNT(*) as TotalPerStatus
  FROM customer
  WHERE Streaming_Music IS NOT NULL
  GROUP BY Customer_Status
)

SELECT
  a.Customer_Status,
  a.Streaming_Music,
  COUNT(a.Streaming_Music) as Total,
  ROUND(COUNT(a.Streaming_Music) * 100.0 / b.TotalPerStatus, 2) as Percentage
FROM customer a
JOIN TotalStatus b ON a.Customer_Status = b.Customer_Status
WHERE a.Streaming_Music IS NOT NULL
GROUP BY a.Customer_Status, a.Streaming_Music, b.TotalPerStatus
ORDER BY a.Customer_Status, Total DESC;

/*Proportion of user that has unlimited data plan for each customer’s status*/

WITH TotalStatus AS (
  SELECT
    Customer_Status,
    COUNT(*) as TotalPerStatus
  FROM customer
  WHERE Unlimited_Data IS NOT NULL
  GROUP BY Customer_Status
)

SELECT
  a.Customer_Status,
  a.Unlimited_Data,
  COUNT(a.Unlimited_Data) as Total,
  ROUND(COUNT(a.Unlimited_Data) * 100.0 / b.TotalPerStatus, 2) as Percentage
FROM customer a
JOIN TotalStatus b ON a.Customer_Status = b.Customer_Status
WHERE a.Unlimited_Data IS NOT NULL
GROUP BY a.Customer_Status, a.Unlimited_Data, b.TotalPerStatus
ORDER BY a.Customer_Status, Total DESC;

/*More used type of contract by each customer’s status*/

WITH TotalStatus AS (
  SELECT
    Customer_Status,
    COUNT(*) as TotalPerStatus
  FROM customer
  WHERE Contract IS NOT NULL
  GROUP BY Customer_Status
)

SELECT
  a.Customer_Status,
  a.Contract,
  COUNT(a.Contract) as Total,
  ROUND(COUNT(a.Contract) * 100.0 / b.TotalPerStatus, 2) as Percentage
FROM customer a
JOIN TotalStatus b ON a.Customer_Status = b.Customer_Status
WHERE a.Contract IS NOT NULL
GROUP BY a.Customer_Status, a.Contract, b.TotalPerStatus
ORDER BY a.Customer_Status, Total DESC;

/*Average of monthly charge for each customer’s status*/

SELECT
Customer_Status,
ROUND(AVG(Monthly_Charge),2) as Average_Monthly_Charge
FROM customer
WHERE Monthly_Charge IS NOT NULL
GROUP BY Customer_Status
ORDER BY Customer_Status DESC;

/*Average of total charge for each customer’s status*/


SELECT
Customer_Status,
ROUND(AVG(Total_Charges),2) as Avg_Total_Charges
FROM customer
WHERE Total_Charges IS NOT NULL
GROUP BY Customer_Status
ORDER BY Avg_Total_Charges DESC;

/* Average of total refunds for each customer’s status*/

SELECT
Customer_Status,
ROUND(AVG(Total_Refunds),2) as Avg_Total_Refunds
FROM customer
WHERE Total_Refunds IS NOT NULL
GROUP BY Customer_Status
ORDER BY Avg_Total_Refunds DESC;

/*Average of total long distance charges for each customer’s status*/

SELECT
Customer_Status,
ROUND(AVG(Total_Long_Distance_Charges),2) as Avg_Total_Long_Distance_Charges
FROM customer
WHERE Total_Long_Distance_Charges IS NOT NULL
GROUP BY Customer_Status
ORDER BY Avg_Total_Long_Distance_Charges DESC;

/*Average of total revenue for each customer’s status*/

SELECT
Customer_Status,
ROUND(AVG(Total_Revenue),2) as Avg_Revenue
FROM customer
WHERE Total_Revenue IS NOT NULL
GROUP BY Customer_Status
ORDER BY Avg_Revenue DESC;