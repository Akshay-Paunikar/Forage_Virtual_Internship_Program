<h2>Task 1: Data extraction and initial analysis</h2>
<h3>Task overview:</h3>

<b>What you'll learn:</b>

 - Techniques for extracting key financial data from 10-K documents.
 - Understanding financial statement components and performance metrics.
 - Preparing and processing data for AI-driven applications.

<b>What you'll do:</b>

 - Extract financial data from provided 10-K documents.
 - Conduct a basic analysis to identify significant financial trends and indicators.
 - Format and clean the data for further processing in an AI model.

<h3>Let's get started</h3>

Welcome to the first task of your journey as a junior data scientist with BCG's GenAI Consulting team. In this initial phase, you are not just undertaking a task; you're laying the cornerstone for a sophisticated AI-driven financial analysis project. Let's explore why this task is not only crucial but also a transformative learning opportunity.

<b>Understanding the project requirements:</b>

 - <b>Contextualizing AI in finance:</b> This task immerses you in the real-world application of AI in finance. By extracting and analyzing data from 10-K documents, you'll understand how AI can transform raw financial data into insightful analytics.
 - <b>Identifying key financial indicators:</b> The ability to discern which data points are critical for financial assessment is fundamental. This task will enhance your acumen in recognizing significant financial metrics crucial for AI analysis.
 
<b>Determining important factors for AI integration</b>

<b>Data quality assessment:</b> The success of AI heavily depends on the quality of data it is fed. Through this task, you'll learn to identify and extract high-quality, relevant financial data, setting a strong foundation for accurate AI modeling.

<b>Understanding data structure:</b> AI models require data in specific formats. This task will help you comprehend the structuring of financial data, which is a pivotal step in preparing it for AI integration.

This task will allow you to develop a deep understanding of financial data analysis and its significance in AI applications. It's about setting the tone and foundation for the rest of your project. As you begin this task, remember that the insights and skills you gain here are key to your growth as a data scientist and the success of the project with your client, GFC. Let's dive in!

<h3>Getting briefed</h3>

<b>Subject:</b> Initiation: Financial Data Analysis for GFC AI Chatbot Project

<b>From:</b> aisha@bcg.com

<b>To:</b> forager@bcg.com

Dear Forager,

We have just kicked off a pivotal project with Global Finance Corp. (GFC), focusing on developing an AI-powered chatbot to revolutionize their financial data analysis. Your contribution, starting with extracting and analyzing data from financial documents, is essential to the project’s success.

<b>Project context:</b>

 - Our goal is to extract meaningful insights from 10-K financial reports.
 - These insights will feed into the AI chatbot, enabling it to provide in-depth financial performance analysis. 

<b>Your role and responsibilities</b>

<b>Data extraction:</b>

 - Research and review 10-K documents.
 - Focus on key financial figures and ratios.

<b>Basic analysis:</b>

 - Identify significant financial trends and indicators.
 - Assess the financial health and performance of the companies.

<b>Data preparation:</b>

 - Format and clean the data for AI model integration.

<b>Deliverable:</b>

 - A comprehensive data analysis report, which should include:
   - your findings
   - a summary providing insights into the financial health of the analyzed companies.

This initial task will set the foundation for our AI model and is instrumental in moving the project forward. Your attention to detail and analytical skills will be key in this phase.

Feel free to reach out for any assistance or clarification needed during this process. I am eager to see the insights you will uncover and how they will shape our project’s trajectory.

Best regards,

Aisha

Senior Data Scientist 

GenAI Consulting Team, BCG


<h3>Techniques for extracting key financial data from 10-Ks</h3>

10-K reports are comprehensive annual reports filed with the SEC by publicly traded companies. They provide a detailed account of a company's financial performance, including audited financial statements, management's discussion and analysis (MD&A), and disclosures about market risk, controls, and legal proceedings.

<b>Key sections to focus on for financial data extraction:</b>

 - <b>Income statement:</b> This section provides information about the company's revenue, costs, and expenses over a specific period of time.
   - <b>Key data points:</b> Total revenue, cost of goods sold (COGS), operating expenses, and net income.
   - <b>Extraction technique:</b> Look for the income statement summary, typically in the early pages of the reports. Pay attention to year-over-year changes.
 - <b>Balance sheet:</b> This section outlines the company’s assets, liabilities, and the shareholders’ equity at a specific point in time.
   - <b>Key data points:</b> Current assets, long-term assets, current liabilities, long-term liabilities, and total shareholders’ equity.
   - <b>Extraction technique:</b> Focus on the balance sheet summary. Compare assets against liabilities to understand the company’s financial health and note any large changes in assets or liabilities.
 - <b>Cash flow statement:</b> This shows how changes to the balance sheet and income impact cash and cash equivalents.
   - <b>Key data points:</b> Cash from operating activities, investing activities, and financing activities.
   - <b>Extraction technique:</b> Analyze the cash flow statement to understand how the company generates and spends its cash. This can provide insights into a company's liquidity.
 
<b>Effective techniques for data extraction:</b>

 - <b>Manual extraction:</b> Start by manually reviewing the documents to understand their layout and where key information is typically found.
 - <b>Highlight and annotate:</b> Use digital tools to highlight and annotate key figures and notes for easy reference.
 - <b>Excel and spreadsheet tools:</b> For quantitative data, using Excel or similar spreadsheet tools can be effective. You can input key figures into a spreadsheet for analysis and comparison.
 - <b>Automated extraction tools:</b> For more advanced users, tools such as Python (in particular, libraries such as Beautiful Soup or Pandas) can automate the extraction of data from these documents, especially if they are available in digital formats.

By understanding the structure of 10-K reports and mastering these extraction techniques, you can efficiently gather the necessary financial data for analysis and further application in AI-driven tools.

<h4>Here are some resources to help you:</h4>

 - How to Read a 10-K/10-Q - https://www.sec.gov/oiea/investor-alerts-and-bulletins/how-read-10-k10-q

<h3>Preparing and preprocessing data for AI-driven applications</h3>

<b>Data preparation steps:</b>

 - <b>Data cleaning:</b> Involves correcting or removing incorrect, corrupted, or duplicate data.
   - Techniques include filling in missing values, smoothing noisy data, and resolving inconsistencies.
 - <b>Data transformation:</b> This step is about normalizing and standardizing data to ensure it's in a usable format for AI models.
   - Includes converting all financial figures to a consistent format (e.g., all figures in thousands or millions) and adjusting for inflation or currency changes where necessary.

<b>Preprocessing for AI models:</b>

 - <b>Feature engineering:</b> The process of using domain knowledge to create features that make machine learning algorithms work. In financial data, this might involve creating ratios or deriving financial health indicators from raw data.
 - <b>Data encoding and formatting:</b> Many AI models require data in a specific format. This may involve encoding categorical data (like fiscal quarters) into numerical values or restructuring data sets for time-series analysis.
 - <b>Dealing with time-series data:</b> Financial data often involves time-series analysis. Special care should be taken to handle trends and seasonality and potentially integrate lag features that capture past values.

<b>Key takeaways:</b>

 - Preparing and preprocessing data is crucial for the successful application of AI in finance. It ensures that the data fed into AI models is clean, consistent, and structured in a way that maximizes the model's ability to learn and make accurate predictions or provide valuable insights.
 - This stage is not just about technical execution but also understanding the financial context and relevance of the data being processed.

By mastering these skills, you can effectively prepare and preprocess financial data, making it ready for AI-driven applications.

<h2>Task instructions</h2>

Your task is to manually extract key financial data for the last three fiscal years from the 10-K filings of Microsoft, Tesla, and Apple. Following the data collection, you will use Python to analyze this data, focusing on trends and insights that could inform the development of an AI-powered financial chatbot.

<h3>Step 1: Data extraction</h3>

<b>Navigate to the SEC's EDGAR database:</b>

 - <b>Microsoft</b>
 - <b>Tesla</b>
 - <b>Apple</b>
 
<b>Manual extraction:</b>

 - For each company, find the 10-K filings for the last three fiscal years.
 - Extract the following financial figures: Total Revenue, Net Income, Total Assets, Total Liabilities, and Cash Flow from Operating Activities.

<b>Organize Your Data:</b>

 - Compile the extracted data into an Excel spreadsheet for easy reference during your Python analysis.

<h3>Step 2: Preparing your Jupyter Notebook environment</h3>

<b>Install Jupyter</b> (if not already installed):

 - Install Jupyter using pip if you haven't already:
pip install notebook
 - Launch Jupyter Notebook:
jupyter notebook
 - This command should open Jupyter in your web browser.

<b>Create a new notebook:</b>

 - In the Jupyter interface, create a new notebook for your analysis.

<h3>Step 3: Python analysis in Jupyter</h3>

<b>Import pandas:</b>

 - At the beginning of your notebook, import the pandas library to work with your data.
import pandas as pd

<b>Load your data:</b>

 - Convert your Excel file to a CSV file for easier handling, then load it into a DataFrame.
df = pd.read_csv('path_to_your_csv_file.csv')

<b>Analyzing trends with pandas:</b>

 - Use pandas to calculate year-over-year changes for each financial metric. You can do this by creating new columns in your DataFrame that represent the percentage change from one year to the next.

df['Revenue Growth (%)'] = df.groupby(['Company'])['Total Revenue'].pct_change() * 100

df['Net Income Growth (%)'] = df.groupby(['Company'])['Net Income'].pct_change() * 100
 - Explore other aggregate functions or groupings to analyze the data across different dimensions (by company, over years, etc.).

<b>Summarizing findings:</b>

 - Conclude your analysis by summarizing your findings directly in the notebook. Use markdown cells to add narrative explanations of your analysis, discussing the trends and changes in financial metrics you've identified.

<h3>Step 4: Documentation and submission</h3>

 - <b>Document your analysis:</b> Use the markdown feature in Jupyter Notebook to document your methodology, observations, and conclusions throughout the notebook.
 - <b>Export your notebook:</b> Once your analysis is complete, export your Jupyter Notebook as a PDF or HTML file for submission.
   - You can do this from the "File" menu in Jupyter, selecting "Download as" and then choosing your preferred format.

This approach allows you to focus on the core analytical aspects using pandas within a Jupyter Notebook, providing a clear, documented narrative of your financial analysis process. By the end of this task, you'll have a comprehensive understanding of how to analyze financial data programmatically, a valuable skill set for data-driven decision-making. Upload your Jupyter Notebook when done with analysis.
