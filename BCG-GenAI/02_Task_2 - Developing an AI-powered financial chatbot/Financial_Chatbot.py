from flask import Flask, request, jsonify, render_template
import pandas as pd

app = Flask(__name__)

# Load the financial data including growth percentages
financial_data = pd.read_csv('E:\\Forage_Virtual_Internship_Program\\BCG-GenAI\\02_Task_2 - Developing an AI-powered financial chatbot\\financial_data.csv')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/chat', methods=['POST'])
def chat():
    data = request.json
    query = data.get('query')
    company = data.get('company')
    year = int(data.get('year'))

    # Filter data based on company and year
    company_data = financial_data[(financial_data['Company'] == company) & (financial_data['Year'] == year)]

    response = ""
    if not company_data.empty:
        if query == "total_revenue":
            response = f"The total revenue for {company} in {year} was ${company_data.iloc[0]['Total Revenue (in millions)']} million."
        elif query == "net_income":
            response = f"The net income for {company} in {year} was ${company_data.iloc[0]['Net Income (in millions)']} million."
        elif query == "total_assets":
            response = f"The total assets for {company} in {year} were ${company_data.iloc[0]['Total Assets (in millions)']} million."
        elif query == "total_liabilities":
            response = f"The total liabilities for {company} in {year} were ${company_data.iloc[0]['Total Liabilities (in millions)']} million."
        elif query == "operating_expenses_rd":
            response = f"The operating expenses (R&D) for {company} in {year} were ${company_data.iloc[0]['Operating Expenses(R & D)']} million."
        elif query == "operating_expenses_sg":
            response = f"The operating expenses (Sales & Marketing) for {company} in {year} were ${company_data.iloc[0]['Operating Expenses(Sales & Marketing, Other Administrative)']} million."
        elif query == "cash_flow":
            response = f"The total cash flow from operating activities for {company} in {year} was ${company_data.iloc[0]['Total Cash Flow from Operating Activities (in millions)']} million."
        elif query == "revenue_growth":
            response = f"The revenue growth for {company} in {year} was {company_data.iloc[0]['Revenue Growth (%)']}%."
        elif query == "net_income_growth":
            response = f"The net income growth for {company} in {year} was {company_data.iloc[0]['Net Income Growth (%)']}%."
        elif query == "assets_growth":
            response = f"The assets growth for {company} in {year} was {company_data.iloc[0]['Assets Growth (%)']}%."
        elif query == "liabilities_growth":
            response = f"The liabilities growth for {company} in {year} was {company_data.iloc[0]['Liabilities Growth (%)']}%."
        elif query == "cash_flow_growth":
            response = f"The cash flow growth for {company} in {year} was {company_data.iloc[0]['Cash Flow Growth (%)']}%."
        else:
            response = "I'm sorry, I can't understand your question."
    else:
        response = "Data not found for the selected company and year."

    return jsonify({"response": response})

if __name__ == '__main__':
    app.run(debug=True)