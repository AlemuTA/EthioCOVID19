## Extract data
# remotes::install_github("joachim-gassen/tidycovid19")
library(tidycovid19)
# library(tidyverse)
# library(knitr)
# library(kableExtra)

# Variable definition
merged <- download_jhu_csse_covid19_data(silent = TRUE, cached = catch_data)
# tidycovid19_variable_definitions %>%
#   select(var_name, var_def) %>%
#   kable() %>% 
#   kable_styling()


Ethiopiamerged <- merged[merged$country=="Ethiopia",]

