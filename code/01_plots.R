library(tidyverse)
library(scholar)
library(jsonlite)

# citation plot ################################################################
# google scholar id
id <- "B8gCz88AAAAJ"

# get google scholar profile
profile <- get_profile(id)
profile$date <- Sys.Date() # add date

# export profile as json file
cat(toJSON(profile), file = here::here("data/profile.json"))

# get citation history
cites <- get_citation_history(id)

# export citation history as json file
cat(toJSON(cites), file = here::here("data/citation.json"))

# citations in the latest 5 years
cites_latest <- tail(cites, 5)
cites_latest$year <- factor(cites_latest$year)

# citation plot
ggplot(cites_latest, aes(x = year, y = cites, label = cites)) +
  geom_bar(stat = "identity", fill = "#d9d9d9") + #96B56C
  geom_text(hjust = 1, size = 4) +
  coord_flip() +
  labs(x = "", y = "", caption = "Data from Google Scholar") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) + 
  theme_minimal(base_size=14) +
  theme(
    panel.grid.major.y = element_blank(),
    panel.background = element_rect(fill = "transparent",colour = NA),
    plot.margin = margin(l = -0.5, r = 0, unit = "cm"),
    plot.background = element_rect(fill = "transparent",colour = NA)
  )
    
# export plot
ggsave(
  here::here("output/citation.png"), bg = "transparent", width = 3.5, height = 4
  )

# Skill bar ####################################################################
# plot skill bars
data.frame(
  language = factor(c("R", "Bash", "Python"), levels = c("R", "Bash", "Python")),
  level = c(4, 2, 0.5) # out of 5
  ) %>%
  ggplot(aes(x = fct_rev(language), y = level, label = language)) +
    geom_bar(stat = "identity", fill = "#d9d9d9") +
    geom_text(aes(y = 0), hjust = 0, size = 4) +
    coord_flip() +
    labs(x = "", y = "Level") +
    scale_x_discrete(expand = expansion(mult = c(0, 0.0))) +
    scale_y_continuous(expand = expansion(mult = c(0, 0.05)), limits = c(0, 5)) + 
    theme_minimal(base_size = 14) + 
    theme(
      axis.text.y = element_blank(),
      panel.grid.major.y = element_blank(),
      panel.background = element_rect(fill = "transparent",colour = NA),
      plot.margin = margin(l = -0.5, r = 0, unit = "cm"),
      plot.background = element_rect(fill = "transparent",colour = NA)
      )
    
# export plot
ggsave(
  here::here("output/coding_skills.png"), bg = "transparent", 
  width = 3.5, height = 2.5
  )
