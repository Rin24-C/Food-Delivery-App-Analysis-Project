# Food-Delivery-App-Analysis-Project

## Background
This is a data analytical project studying a food delivery company’s customer orders and operating-flows performances for 2024 in Asia. To be specific, the Asian countries that are included in this data are:

- Bangladesh
- Cambodia
- Hong Kong
- Malaysia
- Myanmar
- Pakistan
- Philippines
- Singapore
- Taiwan
- Thailand

This project looks at the data from the country- and city-levels. It will also use specific key metrics to measure the company’s performance for the said year. 

#### _Key Metrics_
- Total Orders or Count of Orders
- Operating/Cash-flow metrics
  * Revenue
  * Cost
  * Profit
 
## Data Structure Overview
The data used is available on Kaggle (https://www.kaggle.com/datasets/faheem113141/foodpanda-pakistan-customer-orders-and-churn-dataset). Note that the creator/author of the dataset stated that all data were generated synthetically. 

The dataset has been split into four spreadsheet tables. Each table has a specific focus: customer orders, financial data, delivery data, and restaurant data. 
The data was analyzed with the use of PostgreSQL and Google Sheets. Data visualization was done via Tableau Public. 

## Executive Summary
Overall, company performance is stable and profitable. While costs are relatively high per month, these are counterbalanced by high monthly revenue. Performance for specific countries though are in need of improvement, especially The Philippines, Cambodia, Myanmar, Taiwan, and Hong Kong. Based on actionable insights, individual marketing programs for all countries (except Myanmar) should enhance customer retention as well as expanding market reach. Myanmar is an exception due to the socio-political climate it is currently experiencing. 

## Insights Discussion

### Total Orders at the Country- and City-levels
<img width="667" height="724" alt="Total Orders per Country (1)" src="https://github.com/user-attachments/assets/088da580-8670-4d82-a8a3-7d2932abd58a" />

<img width="1517" height="461" alt="Total Orders per City" src="https://github.com/user-attachments/assets/40aa808e-3081-4e46-b358-feb6865f95b9" />


- Pakistan has the top orders and Myanmar has the lowest.
* Myanmar is currently experiencing a civil war, which can explain why its total orders in 2024 were so low.

- Given its status as a city-state, all orders in Singapore at the country level are the same at the city level.

  * Islamabad should be considered as the actual city-level area that has the highest order count.

  * Special consideration should be given to Manila, Cebu, and Taipei.
 
    + All of them are cities with high population density, two of which (Manila and Taipei) are capital cities.




