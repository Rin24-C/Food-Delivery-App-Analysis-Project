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
   
- Cities in the Philippines have the lowest recorded orders
  - Needs to be explored since both Manila and Cebu are metropolises in the country, with high concentrations of residents and non-residents alike.

- Actionable insights
  - Investigate Manila, Cebu, and Taipei marketing strategies.
  - More marketing programs or marketing incentives are needed in these cities.

### Total Orders by Month in 2024
<img width="1516" height="724" alt="Monthly Total Orders (1)" src="https://github.com/user-attachments/assets/9faea3b8-b2be-48a2-9fe1-486d22dcf821" />


- Feb. to May are considerably low.
    - Ramadan in Pakistan and Bangladesh could have played a factor from March to April.
    - Another factor is the rising temperature.
      - Summer heat might dissuade delivery riders from accepting more orders.

- Total orders peaked in August, which is part of the monsoon season.
   - Though rainy, cooler temperatures could influence delivery riders to accept more orders.
   - In addition, the rainy season would also incentivize customers to make orders instead of going out.

- Actionable insights
    - Increase incentives for delivery riders during summer months.
    - Lower marketing activities in the morning and afternoon during Ramadan in Pakistan and Bangladesh for religio-cultural reasons.
    - Increase them for nightly hours only.
    - Otherwise, maintain current marketing strategies in Pakistan and Bangladesh.
 
 ### Customer Types: total orders and revenue
<img width="1498" height="724" alt="Customer Type" src="https://github.com/user-attachments/assets/deeffdfe-fc79-4a01-82a1-da507d8a0fc8" />
<img width="1498" height="724" alt="Customer Type Finance" src="https://github.com/user-attachments/assets/5544dba8-9740-4a54-b8e5-abc0acccfe98" />

- Data shows that both returning and loyal customers contribute the majority of total orders and revenue.
  
- New users only consist of around 20% for both total orders and revenue.
 
- Actionable insights
  - Increase incentives (i.e. vouchers, promos) for registered new users.
 
### Purchase Frequency per country
<img width="262" height="284" alt="Purchase Frequency" src="https://github.com/user-attachments/assets/1fe2b6b1-2ab0-4126-b9bc-9f69c146657a" />

- Pakistan has the highest purchase frequency while Myanmar has the lowest, reflecting the total orders data above.

- The Philippines, Hong Kong, and Taiwan should be areas of concern given their general profiles as countries with high residential count.
  
- Actionable insights
  - Create customer retention programs in The Philippines, Hong Kong, Cambodia, and Taiwan.
  - Recommended that marketing activities focus on areas with high concentration of students and employees.
  - Cut marketing and operational costs in Myanmar until the political climate becomes more stable and clearer.
    - Increasing such costs might not necessarily result in higher revenues and order count.


### Country and City revenue, cost, and profit analysis
<img width="482" height="284" alt="Finance per Country" src="https://github.com/user-attachments/assets/31d800e4-3871-42a1-a894-3a8ccd8b4a25" />

<img width="482" height="424" alt="Finance per City" src="https://github.com/user-attachments/assets/acf0aa7d-2f5b-4256-9a24-e944f1cee5eb" />


- Overall, all countries produced profits, i.e. no net loss in 2024.
  
- However, the cash-flow metrics at the country- and city-levels do vary.
  
- Singapore turns out to have produced the highest revenue. While its total cost and cost-to-revenue ratio are the highest, its net profit margin is exceptionally the highest too.
  
- The cities lagging behind are Yangon in Myanmar, and Manila and Cebu in the Philippines.
  - Yangon’s low net profit margin is expected due to the reason stated above.
  - Cebu and Manila should have special attention because of their low net profit margins even though both cities are thriving megapolises and are not experiencing severe politico-economic or financial turmoil.
  
- Actionable insights
  - Maintain current strategy in Singapore but if the cost to revenue ratio should be lowered it is recommended to cut back on marketing costs if brand awareness among Singaporeans is already high.
  - Given their low total costs and revenues, Cebu and Manila might be suffering from lack of marketing and brand awareness.
    - Both cities are considered metropolises with high residential count so a high-impact marketing program should influence customers to avail company service.
    - Use paid social media ads given Manila’s reputation as a major social media hub. It is recommendable to apply this to Cebu too.









 








