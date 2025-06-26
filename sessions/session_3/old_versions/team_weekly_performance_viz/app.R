library(shiny)
library(ggplot2)
library(dplyr)
library(forcats)
library(stringr)


load("../was_historical_data.RData")
ui <- fluidPage(
  titlePanel("Team Weekly Performance Visualization"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("year_range",
                  "Select Years:",
                  min = 2010,
                  max = 2023,
                  value = c(2019, 2021),
                  step = 1,
                  sep = ""),
    ),
    
    mainPanel(
      plotOutput("score_plot")
    )
  )
)

server <- function(input, output) {
  # Process data
  prepare_data <- reactive({
    plot_3a_data_df <- was_historical_df %>% 
      select(score_tm, week, season) %>% 
      mutate(score_tm = as.numeric(score_tm),
             season = as.factor(season)) %>% 
      filter(str_detect(week, "^[0-9]+$")) %>% 
      mutate(week_str = str_glue("w #{week}")) %>%
      mutate(week_str = fct_reorder(week_str, as.numeric(week)))
    
    plot_3b_data_df <- plot_3a_data_df %>% 
      group_by(week_str, season) %>% 
      summarise(tm_score = mean(score_tm, na.rm = TRUE),
                sd_score = sd(score_tm, na.rm = TRUE),
                n_games = n(),
                .groups = "drop")
    
    # Filter based on selected years
    plot_3b_data_df %>%
      filter(as.numeric(as.character(season)) >= input$year_range[1],
             as.numeric(as.character(season)) <= input$year_range[2])
  })
  
  # Create color palette based on selection
  get_colors <- reactive({
    switch(input$team_color,
           "burgundy_gold" = c("#773141", "#FFB612", "#000000"),
           "classic" = c("#7F1225", "#FFD700", "#000000"),
           "modern" = c("#5A1414", "#FFB612", "#000000"))
  })
  
  # Generate plot
  output$score_plot <- renderPlot({
    ggplot(prepare_data(),
           aes(x = week_str,
               y = tm_score,
               color = season,
               group = season)) +
      geom_line(size = 1) +
      geom_point(size = 3) +
      # scale_color_manual(values = get_colors()) +
      labs(title = str_glue("Mean Team Scores by Week\n{input$year_range[1]}-{input$year_range[2]} Seasons"),
           y = "Mean Score",
           x = "Week") +
      theme_minimal() +
      theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
            axis.text = element_text(size = 12),
            axis.title = element_text(size = 14),
            legend.title = element_text(size = 12),
            legend.text = element_text(size = 10))
  })
}

shinyApp(ui = ui, server = server)