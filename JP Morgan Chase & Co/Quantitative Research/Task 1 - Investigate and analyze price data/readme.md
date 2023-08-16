### Task 1 - Investigate and analyze price data
Investigate and analyze price data

### Here is the background information on your task
You are a quantitative researcher working with a commodity trading desk. Alex, a VP on the desk, wants to start trading natural gas storage contracts. However, the 
available market data must be of higher quality to enable the instrument to be priced accurately. They have sent you an email asking you to help extrapolate the 
data available from external feeds to provide more granularity, considering seasonal trends in the price as it relates to months in the year. To price the contract, 
we will need historical data and an estimate of the future gas price at any date.

Commodity storage contracts represent deals between warehouse (storage) owners and participants in the supply chain (refineries, transporters, distributors, etc.). 
The deal is typically an agreement to store an agreed quantity of any physical commodity (oil, natural gas, agriculture) in a warehouse for a specified amount of 
time. The key terms of such contracts (e.g., periodic fees for storage, limits on withdrawals/injections of a commodity) are agreed upon inception of the contract 
between the warehouse owner and the client. The injection date is when the commodity is purchased and stored, and the withdrawal date is when the commodity is 
withdrawn from storage and sold. More details can be found here: 

 - Understanding Commodity Storage - https://www.cmegroup.com/education/courses/introduction-to-energy/introduction-to-crude-oil/understanding-commodity-storage.html

A client could be anyone who would fall within the commodities supply chain, such as producers, refiners, transporters, and distributors. This group would also 
include firms (commodities trading, hedge funds, etc.) whose primary aim is to take advantage of seasonal or intra-day price differentials in physical commodities. 
For example, if a firm is looking to buy physical natural gas during summer and sell it in winter, it would take advantage of the seasonal price differential 
mentioned above. The firm would need to leverage the services of an underground storage facility to store the purchased inventory to realize any profits from this 
strategy.

### Here is your task
After asking around for the source of the existing data, you learn that the current process is to take a monthly snapshot of prices from a market data provider, 
which represents the market price of natural gas delivered at the end of each calendar month. This data is available for roughly the next 18 months and is combined 
with historical prices in a time series database. After gaining access, you are able to download the data in a CSV file.

You should use this monthly snapshot to produce a varying picture of the existing price data, as well as an extrapolation for an extra year, in case the client 
needs an indicative price for a longer-term storage contract.

 - Download the monthly natural gas price data.
 - Each point in the data set corresponds to the purchase price of natural gas at the end of a month, from 31st October 2020 to 30th September 2024.
 - Analyze the data to estimate the purchase price of gas at any date in the past and extrapolate it for one year into the future. 
 - Your code should take a date as input and return a price estimate.

Try to visualize the data to find patterns and consider what factors might cause the price of natural gas to vary. This can include looking at months of the year 
for seasonal trends that affect the prices, but market holidays, weekends, and bank holidays need not be accounted for. Submit your completed code below.

Note: This role often requires the knowledge and utilization of data analysis and machine learning. Python is a useful tool and one that JPMorgan Chase uses a lot 
in quantitative research since it’s capable of completing complex tasks.

Moving forward in this program, the example answers are given in Python code. (If Python is not downloaded on your system, you can execute Python code in Jupyter 
Notebook online for free.)
