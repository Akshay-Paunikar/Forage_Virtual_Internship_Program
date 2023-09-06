<h3>Task 3 - Credit risk analysis</h3>
Analyze a book of loans to estimate a customer's probability of default

<h3>Here is the background information on your task:</h3>
You have now moved to a new team assisting the retail banking arm, which has been experiencing higher-than-expected default rates on personal loans. Loans are an 
important source of revenue for banks, but they are also associated with the risk that borrowers may default on their loans. A default occurs when a borrower stops 
making the required payments on a debt.

The risk team has begun to look at the existing book of loans to see if more defaults should be expected in the future and, if so, what the expected loss will be. 
They have collected data on customers and now want to build a predictive model that can estimate the probability of default based on customer characteristics. A 
better estimate of the number of customers defaulting on their loan obligations will allow us to set aside sufficient capital to absorb that loss. They have decided 
to work with you in the QR team to help predict the possible losses due to the loans that would potentially default in the next year.

Charlie, an associate in the risk team, who has been introducing you to the business area, sends you a small sample of their loan book and asks if you can try 
building a prototype predictive model, which she can then test and incorporate into their loss allowances.

<h3>Here is your task:</h3>
The risk manager has collected data on the loan borrowers. The data is in tabular format, with each row providing details of the borrower, including their income, 
total loans outstanding, and a few other metrics. There is also a column indicating if the borrower has previously defaulted on a loan. You must use this data to 
build a model that, given details for any loan described above, will predict the probability that the borrower will default (also known as PD: the probability of 
default). Use the provided data to train a function that will estimate the probability of default for a borrower. Assuming a recovery rate of 10%, this can be used 
to give the expected loss on a loan.

 - You should produce a function that can take in the properties of a loan and output the expected loss.
 - You can explore any technique ranging from a simple regression or a decision tree to something more advanced. You can also use multiple methods and provide a
comparative analysis.
