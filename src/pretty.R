library(here)
library(tidyverse)

# The data is downloaded from https://www.ngrams.info, but not included in the git

tokens <- read_tsv(here("data/w2c.txt"),
         col_names=c("freq", "word1", "word2", "pos1", "pos2")) %>%
    filter(word1=="pretty",pos2 %in% c("rr","jj")) %>%
    mutate(line=sprintf("  - pretty %s",word2)) %>%
    select(line) %>%
    distinct()


writeLines(tokens$line,here("pretty.tokens"))


