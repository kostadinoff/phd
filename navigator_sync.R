library(here)
library(tidyverse)
here::i_am("phd/navigator_sync.R")
WD <- getwd()
if (!is.null(WD))
  setwd(WD)

#primary = read_csv(here::here("PHD","ref_navigator.csv"))
#primary = primary |>
#select(Identifier, Title)
#write_csv(primary,
#         here::here("PHD","source_ref.csv"))

source_ref = read_csv(here::here("PHD","source_ref.csv"))

new = read_csv(here::here("PHD","ref.csv"))
new = new |>
 select(Identifier, Title)

sync = source_ref |>
full_join(new)
write_csv(sync,
          here::here("PHD","source_ref.csv"))