# Aurora Bank (Part 1)
This is a descriptive analysis of customer demographics, financial health, and behaviours to unlock new opportunities for engagement.

## Data Source:
[ZoomCharts](https://zoomcharts.com/en/microsoft-power-bi-custom-visuals/challenges/onyx-data-december-2024)
The dataset comprised 4 files: users_data, transactions_data, cards_data, and mcc_codes.

## Tools & Technologies Used: 
1. Jupyter Notebook, libraries: pandas, matplotlib.pyplot, seaborn 
2. PostgreSQL 
3. Tableau

## Methodology:  
- Data Gathering:  The datasets were already provided by ZoomCharts as .xlsx files.
- Data Loading: I used pd.read_excel() to load each dataset along with their dictionaries.
- Data Cleaning:  I had to change the data types of several columns, the majority of which were currency columns. I removed currency symbols and set invalid latitude coordinates to NULL, 
- Analysis:  I used PostgreSQL to answer customer profiling and segmentation questions.

## Analysis and Metrics:
<ins>Customer Demographics</ins>:  Analyse the age, gender, and geographical distribution of customers.

<ins>Credit Score Analysis</ins>:  Explore the distribution of credit scores and the factors influencing them (e.g., income, debt, age).

<ins>Financial Health</ins>: Calculate debt-to-income ratios and identify high-risk customers.

<ins>Card Ownership</ins>: Assess the number of credit/debit cards per customer and usage trends by demographic.
  
## Insights:
**Demographics**:
1. Age: User ages cluster around the 20-60 year old range.
2. Gender:  The difference between genders is negligible.
3. Location: All users are located in the USA, with only 2.25% addresses being invalid.
4. Income vs Debt: The average income is 47% lower than the average debt.
   
**Credit Score**:
1. Tiers: At least 45% of users have a Good credit rating.
2. Income Band: Middle-income earners have the lowest credit score.
   
**Financial Health**:
1. 79% of users are high risk.
2. 67.05% of users are considered critically high risk.
3. When the income increases, debt also increases.
   
**Card Ownership**:
1. There are 4 card brands with 3 types of cards on offer.
2. Debit cards are the most popular
3. Over 400 users own 3 cards each.
   
## Assumptions & Limitations:
1. I chose to replace invalid latitude coordinates with NULL because I didn’t want to introduce potential data corruption.
2. Online transactions don’t record state and zip codes; I left them as is.
   
## Dashboard
[Dashboard](https://public.tableau.com/views/auroradraft/cardownershipusage?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
