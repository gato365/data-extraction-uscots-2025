library(rvest)
library(dplyr)
library(purrr)
library(stringr)
library(janitor)

get_team_stats <- function(team_name, year) {
  # Create URL
  generic_url <- paste0("https://www.pro-football-reference.com/teams/", 
                        tolower(team_name), "/", year, ".htm#all_games")
  
  # Fetch and parse webpage
  webpage <- read_html(generic_url)
  web_table <- webpage %>% 
    html_table() %>% 
    pluck(2) %>% 
    setNames(make.unique(ifelse(names(.) == "", "col", names(.))))
  
  # Store first row for column naming
  first_row <- web_table %>% slice(1)
  
  # Modification 1: Handle Type 3 columns (empty header but valuable first row)
  mod_1_table <- web_table %>% 
    setNames(map2_chr(names(web_table), first_row,
                      ~if(startsWith(.x, "col")){.y} else {.x}))
  
  # Modification 2: Handle Type 2 columns (empty header and empty first row)
  mod_2_table <- mod_1_table %>% 
    rename(
      "Time" = 4,
      "Boxoffice" = 5,
      "Game Outcome" = 6,
      "Game Location" = 9
    )
  
  # Modification 3: Handle Type 1 columns (both header and first row values)
  mod_3_table <- mod_2_table %>%
    setNames(map2_chr(names(mod_2_table), first_row,
                      ~{
                        col_index <- match(.x, names(mod_2_table))
                        if(!is.na(col_index) && col_index >= 11) {
                          orig_name <- str_remove_all(.x, "[0-9_]")
                          new_value <- str_remove_all(.y, "[0-9_]")
                          paste(orig_name, new_value, sep = "_")
                        } else {
                          .x
                        }
                      })) %>%
    slice(-1) %>%
    clean_names()
  
  # Convert numeric columns
  mod_4_table <- mod_3_table %>% 
    mutate(across(c(week, score_tm, score_opp, 
                    starts_with("offense_"), 
                    starts_with("defense_"),
                    starts_with("expected_points_")), 
                  as.character ))
  
  # Final data cleaning
  final_table <- mod_4_table %>% 
    mutate(
      game_outcome = as.factor(game_outcome),
      game_location = case_when(
        game_location == "@" ~ "away",
        game_location == "" ~ "home",
        TRUE ~ game_location
      ) %>% as.factor()
    ) %>% 
    filter(day != "")
  
  return(final_table)
}