
---

# Organized Workshop Outline

## Deliverable

* Final output: **R Quarto Document(s)** (4 files aligned with each session and additional activities)

---

## General Timeline

1. **8:30 – 10:15** Session 1: Introduction to Data Extraction
2. **10:15 – 10:30** Snack Break 1
3. **10:30 – 12:10** Session 2: APIs and Practice
4. **12:10 – 1:30** Lunch
5. **1:30 – 2:30** Session 3: Web Scraping with HTML
6. **2:30 – 3:30** Snack Break 2
7. **3:30 – 4:15** Session 4: Deep Dives into Complete Lessons

---

# General Approach

* **Interactive Format**: This workshop is designed to be interactive, with a mix of short lectures followed by hands-on activities.

* **Questions Are Highly Encouraged**: Curiosity is key to learning, so please ask anything that comes to mind. To keep us on track and ensure all topics are covered, we'll handle questions as follows:

    * If your question is about a topic we will get to later, I'll make a note of it and we will address it when we reach that section.
    
    * If a question is beyond the scope of this particular workshop, I’ll let you know, and we can discuss it after the session.

#### Our Technical Setup

* **Platform**: All of our work today will be done within the **CourseKata** platform. This environment is pre-configured to ensure everything runs smoothly for everyone.

* **Packages and Libraries**: The platform comes with almost all required R packages pre-installed. We will only need to install **one package** before we need it, and I will guide you through that simple process.

* **Fill-in-the-Blank Exercises**: Our coding activities use a "fill-in-the-blank" style. The goal is to help you focus on the core concepts without getting bogged down by minor syntax details.

* **Clear Function Calls**: For maximum clarity, we will explicitly name all arguments in function calls (e.g., `read_html(url = my_url)`). This makes it easy to see exactly what each part of the function is doing.



# Session 1

## Goals & Objectives

**Session 1: Introduction**

Understand the importance of extracting **dynamic data** (via HTML and
APIs) in modern data analysis and teaching

**Session 2: Getting Weather Data via OpenWeather API**

In this session, we dive into OpenWeather API and learn to use packages
like httr2 to execute API calls. We will also discuss URLs, queries,
data structures, and more.

**Session 3: Scraping NFL Sports Data**

In this session, we will use Pro-Football Reference to learn how to
extract and clean HTML table data for use in statistical analysis and
visualizations.

**Session 4: Putting it All Together (Project)**

In this project, we will use HTML scraping joined with the OpenWeather
API to create our own cloropleth map of Iowa.

## Reflection

-   What did we learn?

-   How does this connect to the original **Goals & Objectives** of the session?

-   How do you see yourself using this in your classroom?

-   What kinds of APIs or HTML sources would be most relevant for your
    students?



---

# Session 2: API Fundamentals



## Goals & Objectives

1.  **Understand the foundational concepts of APIs** as a bridge for
    data exchange, including how they function in modern software and
    support real-time data extraction.

2.  **Query public APIs effectively**, forming well-structured requests
    that interact with remote databases and return meaningful results.

3.  **Interpret JSON responses**, with a focus on the **data** element,
    while also distinguishing between **metadata** and **status codes**.
    Develop an understanding of how HTTP status codes and API keys work
    to validate and secure data access.

4.  **Write clean, purposeful R code** to send API requests, handle
    responses, and parse structured data into tidy, analyzable formats.



## Reflection

1.  Now that you have hands-on experience with the OpenWeather API, what
    is another type of real-world data you are curious about? What kind
    of API (e.g., sports, finance, social media, government) would you
    search for to start a project with that data? Why?

2.  This session emphasized writing reusable functions
    (`get_city_coords`, `get_city_current_weather`, etc.). How does this
    practice change how you would approach a task that involves fetching
    data for 100 different cities versus just one or two?

3.  Think about the different parts of an API request you built today:
    the endpoint URL, the query parameters (like `q=` or `lat=`), and
    the API key. If your script suddenly failed, which of these
    components would you check first to debug the problem, and why?

4.  What was the most challenging or surprising part of turning the
    theoretical diagram of an API call into actual, working R code? What
    concept "clicked" for you during the hands-on activities?
   

# Session 3

## Goals & Objectives

1.  **Deconstruct HTML Structure for Scraping:** Identify and understand the role of fundamental HTML tags (`<table>`, `<tr>`, `<td>`, `<th>`) within a live webpage's source code to locate target data for extraction.
2.  **Extract Tabular Data Using `rvest`:** Use the `rvest` package to read the HTML from a URL, select a specific table from the page, and convert it into a raw R data frame.
3.  **Perform Advanced Data Tidying and Transformation:** Execute a multi-step data cleaning workflow on a messy, scraped data frame using packages like `janitor` and `dplyr` to clean column names, remove irrelevant rows, and correctly parse data types.
4.  **Appreciate the "Brittleness" of Web Scrapers:** Recognize why web scraping scripts can break over time due to changes in a website's layout and understand the importance of writing adaptable and well-documented code.



## Reflection

1.  This session described web scrapers as being **"brittle."** Based on the NFL example, what do you think this means? What could cause your working script to fail a month from now, even without changing your code?
2.  Now that you have experience with both methods, describe a scenario where you might choose to **scrape a website** even if a related **API was available**. (Hint: Think about cost, API rate limits, or the specific data available).
3.  It's often said that data science is 80% data cleaning and 20% analysis. How did the NFL scraping example in this session **support or challenge** that idea for you?
4.  Web scraping, especially at a large scale, can put a heavy load on a website's server. What are some **"good citizen"** practices you should follow when scraping a site to be respectful and avoid getting your IP address blocked? 
* How could students use scraped data in a final project?
* What scaffolds would help students inspect and trust their source?

---

# Session 4: Final Challenge and Reflection




## Goals & Objectives

* **Synthesize Skills:** Combine API requests and web scraping techniques in two separate, start-to-finish projects.
* **Develop Reusable Functions:** Write modular R functions that handle the logic for extracting and cleaning data, making your code more readable and reusable.
* **Master Data Cleaning:** Practice essential data cleaning skills required to transform raw, messy data from both APIs and HTML tables into a format ready for analysis.
* **Create Meaningful Visualizations:** Use `ggplot2` to create two distinct data visualizations—a geographic map and a sorted bar chart—to effectively communicate the findings from your extracted data.



## Reflection Questions

1.  Compare the data cleaning required for the API response in Project 1 (Geocoding) versus the scraped table in Project 2 (Box Office Mojo). Which required more work to prepare for plotting, and what does this tell you about the trade-offs between using APIs and web scraping?
2.  The Box Office Mojo scraper works today, but the website could be redesigned at any time. What specific part of our scraping code (`pluck(1)`) is most likely to break if the website's layout changes, and what would be your first step to debug it?
3.  Our `get_city_coords` function is useful, but it assumes the API key is stored in a specific way (`Sys.getenv('OPENWEATHER_API_KEY')`). What argument could you add to this function to make it more flexible and easier for another person to use with their own key?
4.  Think about the two datasets we created: one with city coordinates and one with movie revenues. What is a new, interesting question you could potentially answer by finding a way to **join** these two datasets (perhaps with a third dataset)? What would be the biggest challenge in that process?

