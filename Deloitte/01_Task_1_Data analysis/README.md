<h2>Task 1: Data analysis</h2>

Build a dashboard to explore the clients telemetry data.

<h3>Task overview</h3>

<b>What you'll learn</b>

 - How to use Tableau to visualise data

<b>What you'll do</b>

 - Analyse the client's data
 - Create a dashboard using Tableau

<h3>Here is the background information on your task</h3>

Using a data unification algorithm, the tech team at our client, Daikibo, has converted all telemetry data collected from its 4 factories:

 - Daikibo Factory Meiyo (Tokyo, Japan)
 - Daikibo Factory Seiko (Osaka, Japan)
 - Daikibo Berlin (Berlin, Germany)
 - Daikibo Shenzhen (Shenzhen, China)

Each location has 9 types of machines, sending a message every 10 mins. Daikibo has been collecting this data for one month (May 2021) and they've shared this data in the form of a single JSON file.

The reason the client wanted to collect telemetry was to answer 2 questions:

 - In which location did machines break the most?
 - What are the machines that broke most often in that location?

<h3>Here is your task</h3>

Your task is to analyse the telemetry data collected by Daikibo in a software called Tableau. Here are the steps that you need to take:

 - Download the free trial of Tableau (link in the Resources).
 - Install Tableau on your computer and register an account with the same email you used to download the software.
 - Download the daikibo-telemetry-data.json.zip file -> unzip -> and import it in Tableau.
 - Create a calculated measure field called "Unhealthy" with a value of 10 for every unhealthy status (representing 10 mins of potential down time since the previous message).
 - Create a bar chart called “Down Time per Factory”.
 - Create a new sheet with a new bar chart called “Down Time per Device Type”.
 - Create a Dashboard with the 2 previous sheets and set the first chart to be used as a filter (selecting a factory in the first chart shows only the down time of the machines in this factory in the second chart).
 - Select the factory with the most down time (click on its bar), make a screenshot of the dashboard and upload it as a submission for this task.

Please find a step-by-step Task Guide pdf attached in the resources below to help you out.

<h3>Here are some resources to help you</h3>

 - Task Guide: https://cdn.theforage.com/vinternships/companyassets/9PBTqmSxAf6zZTseP/Task%202%20Guide.pdf
 - Daikibo's Telemetry data: https://cdn.theforage.com/vinternships/companyassets/9PBTqmSxAf6zZTseP/daikibo-telemetry-data.json.zip
 - Tableau Download: https://www.tableau.com/academic/students
