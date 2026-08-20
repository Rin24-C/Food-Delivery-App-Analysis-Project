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
    - Ramadan in Pakistan, Bangladesh, and Malaysia could have played a factor in decreased orders from March to April.
    - Lent in The Philippines, especially during Holy Week, could also have done something similar in February. 
    - Another factor is the rising temperature.
      - Summer heat might dissuade delivery riders from accepting more orders.

- Total orders peaked in August, which is part of the monsoon season.
   - Though rainy, cooler temperatures could influence delivery riders to accept more orders.
   - In addition, the rainy season would also incentivize customers to make orders instead of going out.

- Actionable insights
    - Increase incentives for delivery riders during summer months.
    - Lower marketing activities in the morning and afternoon during Ramadan in Pakistan, Bangladesh, and Malaysia for religio-cultural reasons.
      - Increase them for nightly hours only.
    - Lowering similar activities in The Philippines during Holy Week could also be applied.
      - Another strategy is to market/advertise Lent-friendly (e.g. fish, vegetables, fruits) products for customers. 
   
 
 ### Customer Types: total orders and revenue
<img width="1498" height="724" alt="Customer Type" src="https://github.com/user-attachments/assets/deeffdfe-fc79-4a01-82a1-da507d8a0fc8" />
<img width="1498" height="724" alt="Customer Type Finance" src="https://github.com/user-attachments/assets/5544dba8-9740-4a54-b8e5-abc0acccfe98" />

- Data shows that both returning and loyal customers contribute the majority of total orders and revenue.
  
- New users only consist of around 20% for both total orders and revenue.
 
- Actionable insights
  - Increase incentives (i.e. vouchers, promos) for registered new users.
 
### Purchase Frequency per country
<img width="262" height="284" alt="Purchase Frequency" src="https://github.com/user-attachments/assets/1fe2b6b1-2ab0-4126-b9bc-9f69c146657a" />

- Pakistan has the highest purchase frequency (1.59) while Myanmar has the lowest (1.07), reflecting the total orders data above.

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
  
- Pakistan and Singapore turn out to have produced the highest revenues. While their total cost and cost-to-revenue ratios are the highest, their net profit margins are exceptionally the highest too.
  
- The cities lagging behind are Yangon in Myanmar, and Manila and Cebu in the Philippines.
  - Yangon’s low net profit margin is expected due to the reason stated above.
  - Cebu and Manila should have special attention because of their low net profit margins even though both cities are thriving megapolises and are not experiencing severe politico-economic or financial turmoil.
  
- Actionable insights
  - Maintain current strategy in Pakistan and Singapore but if the cost to revenue ratio should be lowered it is recommended to cut back on marketing costs if brand awareness among Singaporeans and Pakistani is already high.
  - Given their low total costs and revenues, Cebu and Manila might be suffering from lack of marketing and brand awareness.
    - Both cities are considered metropolises with high residential count so a high-impact marketing program should influence customers to avail company service.
    - Use paid social media ads given Manila’s reputation as a major social media hub. It is recommendable to apply this to Cebu too.

### Cash-flow performance by month in 2024
<img width="1498" height="724" alt="Finance Monthly Totals Stacked" src="https://github.com/user-attachments/assets/99ca568c-7e70-4673-9599-cb82ab6cd55b" />

<img width="1502" height="724" alt="Finance Moving Avg" src="https://github.com/user-attachments/assets/1a06add3-d600-4f79-832c-b785a3a0c437" />

- Financial performance in general is stable.
  - Stability can be seen with each metric’s moving average for 2024.

- Revenues are comparably higher than costs throughout 2024, indicating that costs are under control and company activities are profitable.

- Actionable insights
  - Financial, operational, and marketing programs should be on a country by country or city by city basis.
  - In order for company expenses to generate more revenue, it is recommended to focus on intensifying marketing programs for countries or cities with low outputs. 

### Restaurant Profile
<img width="1330" height="921" alt="Restaurants - General" src="https://github.com/user-attachments/assets/1dabecf1-edcc-416c-8818-d203c3ca1f3e" />

- The majority of restaurant brands fall under the casual dining or fast food categories.
  - As a result, most metrics are highest under these categories.

- In comparison, there are not many cafes and fine dining restaurants registered at the food company.
  - However, key performance metrics for these certain brands are equivalent if not higher than those from casual dining and fast food categories (emphasis on Tim Horton’s and Dragon Palace).
 
- Actionable insights
  - The operations team should look into integrating more cafes and fine dining establishments in the delivery system. 

## Key Recommendations

- Marketing programs in The Philippines, Cambodia, Taiwan, and Hong Kong should intensify to increase customer retention.
  - Provide small discounts for employees and students in order to retain their demand.
  - Ensure that marketing programs are active in areas with high concentrations of businesses, colleges and universities. 
  - Also adjust these programs within local norms and cultural practices.
    - Note religious holidays like Ramadan (in Bangladesh, Pakistan, and Malaysia) and Lent (in The Philippines).

- Local teams said countries should also venture on expanding market reach in order for the company to cater to more customers and therefore increase revenue.
  - They should explore other cities and areas with concentrated business or educational establishments because these areas will be the busiest, i.e. potential customers from these are likely to make orders since they have been spending their time mostly working or studying. 

- Integrate more cafes and fine dining establishments in the system.
  - Cafes should be the priority given their increasing popularity in recent years. 
  - Local teams should also observe coffee and tea trends (e.g. matcha trend) in order to adjust their operations and marketing strategies for more cafe establishments.
  - Special logistics may be needed for fine dining establishments and their products.
      - While key performance metrics for these establishments may be high, costs could also increase too.
      - Check current fine dining restaurants in the system and determine which of their products are appropriate for delivery services.













 








