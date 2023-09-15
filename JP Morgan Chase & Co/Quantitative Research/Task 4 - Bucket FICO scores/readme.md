<h2>Task 4 - Bucket FICO scores</h2>
Use dynamic programming to convert FICO scores into categorical data to predict defaults

<h3>Here is the background information on your task:</h3>
Now that you are familiar with the portfolio and personal loans and risk are using your model as a guide to loss provisions for the upcoming year, the team now asks you to look at their mortgage book. They suspect that FICO scores will provide a good indication of how likely a customer is to default on their mortgage. Charlie wants to build a machine learning model that will predict the probability of default, but while you are discussing the methodology, she mentions that the architecture she is using requires categorical data. As FICO ratings can take integer values in a large range, they will need to be mapped into buckets. She asks if you can find the best way of doing this to allow her to analyze the data.

A FICO score is a standardized credit score created by the Fair Isaac Corporation (FICO) that quantifies the creditworthiness of a borrower to a value between 300 to 850, based on various factors. FICO scores are used in 90% of mortgage application decisions in the United States. The risk manager provides you with FICO scores for the borrowers in the bank’s portfolio and wants you to construct a technique for predicting the PD (probability of default) for the borrowers using these scores. 

<h3>Here is your task:</h3>
Charlie wants to make her model work for future data sets, so she needs a general approach to generating the buckets. Given a set number of buckets corresponding to the number of input labels for the model, she would like to find out the boundaries that best summarize the data. You need to create a rating map that maps the FICO score of the borrowers to a rating where a lower rating signifies a better credit score.

The process of doing this is known as quantization. You could consider many ways of solving the problem by optimizing different properties of the resulting buckets, such as the mean squared error or log-likelihood (see below for definitions). For background on quantization, see here.

<h4>Mean squared error</h4>

You can view this question as an approximation problem and try to map all the entries in a bucket to one value, minimizing the associated squared error. We are now looking to minimize the following:

![image](https://github.com/Akshay-Paunikar/Forage_Virtual_Internship_Program/assets/86560684/c2f9a44c-4d7a-46ce-aba1-2dfa6d488831)

<h4>Log-likelihood</h4>

A more sophisticated possibility is to maximize the following log-likelihood function:

![image](https://github.com/Akshay-Paunikar/Forage_Virtual_Internship_Program/assets/86560684/5491f27f-e297-4e60-a162-79d314a5b78a)

Where bi is the bucket boundaries, ni is the number of records in each bucket, ki is the number of defaults in each bucket, and pi = ki / ni is the probability of default in the bucket. This function considers how rough the discretization is and the density of defaults in each bucket. This problem could be addressed by splitting it into subproblems, which can be solved incrementally (i.e., through a dynamic programming approach). For example, you can break the problem into two subproblems, creating five buckets for FICO scores ranging from 0 to 600 and five buckets for FICO scores ranging from 600 to 850. Refer to this page for more context behind a likelihood function. This page may also be helpful for background on dynamic programming. 

<h3>Resources to help you with the task:</h3>

 - Quantization (signal processing) - https://en.wikipedia.org/wiki/Quantization_(signal_processing)
 - Likelihood function - https://en.wikipedia.org/wiki/Likelihood_function
 - Dynamic programming - https://en.wikipedia.org/wiki/Dynamic_programming#Computer_programming
