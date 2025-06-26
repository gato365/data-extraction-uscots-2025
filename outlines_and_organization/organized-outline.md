
---

# Organized Workshop Outline

## Deliverable

* Final output: **R Quarto Document(s)** (4–6 files aligned with each session and additional activities)

---

## General Timeline

1. **8:30 – 10:15** Session 1: Introduction to Data Extraction
2. **10:15 – 10:45** Snack Break 1
3. **10:45 – 12:30** Session 2: APIs and Practice
4. **12:30 – 1:30** Lunch
5. **1:30 – 2:30** Session 3: Web Scraping with HTML
6. **2:30 – 3:30** Snack Break 2
7. **3:30 – 4:15** Session 4: Deep Dives into Complete Lessons

---

## Session 1: Introduction to Data Extraction

1. Set expectations and workshop goals
2. Why data extraction matters: relevance to real-world education
3. Overview of the layout / table of contents
4. Discuss libraries used (tidyverse, rvest, httr, etc.)
5. Best practices (e.g., avoiding hardcoding, consistent comments)
6. Adapting to changing APIs/websites
7. Anecdote: Spotify example of lost API access
8. Explain tidy data: snake\_case column names, correct data types
9. Emphasize code flexibility — developers can change APIs overnight
10. Activity: Scaffolding + Code review using example(s)


### Goals & Objectives

1. Identify the value of real-world data in statistics education
2. Describe the distinction between extraction, transformation, and visualization (ETv)
3. Recognize challenges associated with pulling live data from the web
4. Apply tidy data principles to imported datasets

### Conceptual Foundation

* Why use live data?
* What is extraction and why it matters for teaching modern statistics
* ETv framework: introduction to the first stage (Extraction)
* Importance of code flexibility and the fragility of external sources (e.g., Spotify anecdote)
* Tidy data principles: naming conventions, structure, and data types

### Hands-On Coding Activity

* Extracting from accessible sources such as:

  * A static `.csv` hosted online (warm-up)
  * A Wikipedia table using `rvest` and `janitor`
* Introduce `read_csv()` and `rvest::html_table()`
* Add cleaning steps to enforce tidy principles (snake\_case, correct types)

### Reflection

* How can you introduce real-world messiness without overwhelming students?
* How would you scaffold tidy principles at the intro-level?



---

## Session 2: API Fundamentals

1. What is an API? Examples (Spotify, Weather, one bonus example)
2. Basic API structure: request URLs, endpoints, tokens
3. HTTP protocols and status codes
4. CRUD operations (Create, Read, Update, Delete)
5. API best practices (e.g., pagination, authentication, caching)
6. Tidyverse-friendly workflows (avoid deep nesting, use readable steps)
7. Activity:

   * Modify API request (e.g., hometown weather)
   * Scaffolded practice (fill-in-the-blank)
   * Optional take-home transformation/visualization


### Goals & Objectives

1. Explain what an API is and how it supports data extraction
2. Make requests to a public API and interpret the JSON response
3. Understand and apply HTTP status codes and API keys
4. Write clean, readable code to extract and parse API data

### Conceptual Foundation

* RESTful APIs: endpoints, parameters, keys
* Authentication: tokens, secrets, and environment variables
* Status codes and error handling (focus on 200, 401, 403, 404)
* JSON structure: nested data and tidy conversion

### Hands-On Coding Activity

* Weather API (e.g., OpenWeatherMap):

  * Retrieve current weather for participant’s hometown
  * Modify query parameters (e.g., units, location)
  * Parse and visualize simple results (e.g., temperature, humidity)
* Scaffold activity: prewritten functions + one blank section

### Reflection

* Where could API data naturally integrate in your curriculum?
* What are the pitfalls (rate limits, authentication) students need to know?

---

## Session 3: HTML Scraping in R

1. What is HTML and why it's useful?
2. Examples: Wikipedia, sports sites (NFL, Olympics)
3. Structured vs unstructured web data
4. Reading the webpage source and locating tables/divs
5. Practice: Going back and forth between R and browser to inspect structure
6. Tidy HTML scraping practices using `rvest` and `janitor`
7. Different approaches:

   * Full walkthrough
   * Partial scaffold
8. Activity:

   * Scrape 2 sources (in pairs), compare
   * Clean the data: name 3 needed transformations
   * Use visualization and interpretation
   * Discuss hardcoding and fragile selectors
   
### Goals & Objectives

1. Identify basic HTML structure relevant for scraping
2. Scrape tables and text from structured web pages
3. Clean scraped data using tidyverse tools
4. Compare different websites in terms of data accessibility

### Conceptual Foundation

* HTML basics: tags, attributes, structure of web tables
* Using `rvest` to read web pages and extract data
* The importance of inspecting elements with browser tools
* Structured vs. unstructured sites: Wikipedia vs. ESPN

### Hands-On Coding Activity

* Scrape sports statistics from a reliable table:

  * Example: Wikipedia table of Olympic medal counts or NBA season stats
  * Clean using `janitor::clean_names()`
  * Compare scraped data from 2 sites (optional pair task)

### Reflection

* How could students use scraped data in a final project?
* What scaffolds would help students inspect and trust their source?

---

## Session 4: Deep Dives into Lessons

1. Work through 2 complete lessons — each with:

   * API-based extraction and visualization
   * HTML-based extraction and transformation
2. Split class into two groups: API vs HTML, then reconvene
3. Highlight pedagogical framing: how this can be implemented in class
4. Build reflection and discussion time: What will you bring into your course?

### Goals & Objectives

1. Review key takeaways from API and HTML extraction
2. Collaborate with peers on a structured mini-project
3. Reflect on how to implement extraction in your own course
4. Share classroom-ready ideas with other educators

### Recap (Conceptual Foundation)

* Extraction is not “just tech” — it's pedagogy
* API vs. HTML: strengths, limitations, educational value
* Designing learning activities around messy data: student engagement, real-world relevance

### Hands-On Coding Activity

* Participants are randomly assigned:

  * **Group A**: Use an API (weather, Spotify, etc.)
  * **Group B**: Scrape HTML data (sports, Wikipedia, etc.)
* Work in small groups to clean, transform, and visualize
* Prepare a brief “teaching demo” of how this could be used in class

### Discussion & Reflection

* What worked in your group?
* What teaching goals does this type of project help support?
* How would you modify it for your students’ level and context?


---

## Supporting Infrastructure

* Use recent versions of all packages
* All materials hosted on:

  * [CourseKata](https://www.coursekata.org/) for workshop delivery
  * GitHub repo for behind-the-scenes development organization
* Each session includes:

  * Code chunk scaffolds (empty/fill-in versions)
  * Solution files
  * Pedagogical notes and discussion questions
* **Output files**:

  * 4–6 R Quarto files
  * Matching Jupyter notebooks for hands-on use
* Bonus activities:

  * Combine scraping + API for multi-source projects (e.g., sports + weather + sales)

---

## Workshop Strategy & Logistics

### Outcomes After Workshop

* Invite participants to join a newsletter and mailing list
* Promote:

  * Monthly subscription model (\$25/month) for materials
  * Teaching-focused seminars
  * Culturally relevant virtual textbook
  * Conference workshops

### Planning Tips for Success

1. Make goals explicit from the start
2. Align each activity with stated goals
3. Include participant work time and discussions
4. Schedule breaks for casual conversation and social connection
5. Know your audience (collect pre-attendance data)
6. Send prep info (software setup, expectations) in advance
7. Anticipate and plan for no-shows

### Additional Notes

* Provide API tokens ahead of time (Spotify key for all)
* Explain API rate limits and possible costs
* Teach foundational status codes
* Clarify complexity differences:

  * **HTML**: Cleaning/structure focus
  * **API**: Parsing/logic focus (JSON)
* Raffle and candy: build fun and engagement
* Encourage pair programming and peer instruction
* Allow participants to **present** their work at the end

---

## Rationale for Combinations

* **Session 1 & General Thoughts**: Merged all teaching philosophy related to data extraction fundamentals here.
* **API Examples & API Best Practices**: Combined into Session 2 for cohesion and clarity.
* **HTML Examples & Cleaning Strategies**: Combined into Session 3 for a unified focus on web scraping.
* **Session 4 & Misc Deep Dives**: Naturally fit as a concluding session to synthesize all techniques and apply in pedagogically rich lessons.
* **Outcomes, Planning, and Misc Strategy**: Organized into coherent post-workshop and infrastructure support categories.

Let me know if you want me to turn this into a `.qmd`, Google Doc, or a GitHub `README.md`.
