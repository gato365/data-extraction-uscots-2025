





### **ETV Process I - Critical Thinking Session 1**
**Total Project Duration Goal**: 2 hours  
**Time Spent So Far**: 50 minutes  
11/26/2024 - 250 minutes on extraction format
   - **10 mins**: Writing initial thoughts and project details.
   - **10 mins**: Refining approach and organization with AI assistance.
   - **05 mins**: Set up GitHub repo & R project for the project.

- Brain storm process with clear detail then execute the plan
- Bring in data from past 10 years
- Clean data to have features for each team
   - Make sure each outcome is a row (remove likelihood of duplicate games)
   - Make sure each feature is a column



## Extraction
- Find the URL for one year outcome and 1 team: 15 minutes and you have to think hard
- Note that #tablename after .htm is important (not that important when I went deeper into this)
- Extracting the appropriate table from the html page, show you need to know which number the table you want to extract, this will be very important
- Let Audience see all tables so they have access to granted we are focused on [[2]] or pluck 2
- Really explain what is going on regarding the table your extracting (emphasize offense and defense aspects of table and how the play a role in labeling, offense is referring to the team you searched info)
- Bringing the html page of URL 
- Understanding teams change location and names so, we have to prepare for that
- Discuss the code to bring URL into R
- When we bring in a table notice how every thing is in quotes



Transitioning into Tidy Data Phase of Extraction (This is just to get it into tidy format not to answer any question and it is important to note this, these skills sometime when these exact skills are not brought up into class)


Clean columns names, reminds me that data is messy and the effort here might break for another year if different information is stored by the website



1. Notes columns 4-6 and 9 do not have column names, and some columns have row 1 names while others have both, we can shy from this or we can approach this and use AI to enhance our understanding. No, all columns have issues and we need to address them accordingly

I think a big issue will be having to explain the nuanced details of each steps AND PROVIDING QUESTIONS TO FOSTER DEEPER UNDERSTANDING OF MATERIAL, 

THIS MAKES THIS NOT STATISTICS AND NOT CS











## Transformation 
Turn entire process into a function, get multiple years across multiple teams
Used Purrr functionality to run multiple years witihin a function, I had to change most variables to be characters so that they can bind rows
STart with a small range of years 




## Resources:
https://rvest.tidyverse.org/
dplyr
ggplot2
janitor
purrr

## Philosophy
- We need to know already existing paths (this teaching demonstration) not only to learn from but to explore what can be done 
- We sometimes want our code to fix every single issue possible and never experience errors, but that is not reality, we have to gain skills to be handle this data edge cases 
- We try o make it general as much as we can handle for the next time we have to run an analysis
- Cleaning data can be redefine to be bringing data into its 1st phase of Tidy Data, in which I subjectively want to define this within E phase, this includes tidying the column names, making numeric data and levels for factors
- Select variables before making visualizations to enhance understanding of what is going on
- Look at the data frame while cleaning, transforming and visualizing of data 
- draw out and/or explain what you are going to do to the data before doing it ( I do not always do this)
- Progressively create Plot, 1 variable then 2 then 3
- Understand there are many opportunities to ask questions and emphasize the many aspects of the learning objectives of the class, it just depends on the class that you are teaching


#### **1. Introduction & Purpose (5 mins)**
   - Clarify the goal: Create an R Shiny app to predict NFL game outcomes (win/loss) using various factors.
   - Introduce the ETv philosophy and its relevance to the project.

#### **2. Data Extraction (10 mins)**
   - Identify the data source: NFL Reference.
   - Discuss the features to extract:
     - Offensive metrics (e.g., total yards, touchdowns).
     - Defensive metrics (e.g., sacks, interceptions).
     - Special Teams performance.
     - Game outcome factors (e.g., final score, score difference).
   - Target response variable: Win/Loss.
   - Plan for handling data with potential inconsistencies (e.g., no ties).

#### **3. Data Transformation (25 mins)**
   - Discuss how to clean, preprocess, and structure the data.
   - Selection/creation of 15 key features for analysis (30 total variables including both teams).
     - Offensive, Defensive, Special Teams, and Game Outcome metrics.
   - Consider how to deal with data imbalance or outliers.
   - Prepare for feature engineering if necessary.

#### **4. Model Development (30 mins)**
   - Train/Test Split with percentage breakdown.
   - Set up k-fold cross-validation for model evaluation.
   - Discuss the use of Decision Trees as the primary visualization for model interpretation.
   - Consider using ROC curves for evaluating model performance.

#### **5. Visualization (20 mins)**
   - Focus on how to display Decision Tree and/or ROC curve.
   - Allow user interaction:
     - Select features for the model.
     - Adjust cross-validation parameters.
   - Make the visualization informative and interactive to help users understand the prediction model.

#### **6. Application Implementation (20 mins)**
   - Discuss GitHub version control:
     - Create a repo for the project.
     - Plan how to manage contributions and updates.
   - Structure the Shiny app for educational use in STAT 331.
   - Implement a user guide to explain the ETv process and its importance.

#### **7. Wrap-up & Next Steps (10 mins)**
   - Summarize key takeaways.
   - Outline tasks to be completed before the next session.
   - Identify any potential challenges or areas that need further exploration.
   
   
   

## Specital Notes:
### A: `user_agent`
This is a User-Agent string, which is a piece of text that identifies the web browser and operating system to websites when making HTTP requests. In this case, it's being used with the `user_agent()` function, likely in R's rvest package for web scraping.

When using rvest for web scraping, setting a user-agent is important because:

1. It helps your web scraping requests appear more like regular browser traffic
2. Some websites block or limit requests that don't have a proper user-agent string
3. It's considered good practice to identify your scraping bot appropriately

This particular user-agent string indicates:
- A Chrome browser (version 91.0.4472.124)
- Running on Windows 10 64-bit
- Using the WebKit engine (537.36)

You would typically use this with rvest like this:

```r
library(rvest)

# Set up the session with the user agent
session <- session(
  "https://example.com",
  user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")
)

# Then use the session for scraping
webpage <- read_html(session)
```



