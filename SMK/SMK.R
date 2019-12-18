## Sorcerers of the Magic Kingdom code

# Base code to perform the functions I need
set.seed(1138)

library(dplyr)
library(readr)
library(forcats)

villains <- read_csv("villains.csv", trim_ws = TRUE,
                     col_names = TRUE, col_types = list(
                       villain = col_character(),
                       weakness = col_character(),
                       strength = col_character()
                     ))
#glimpse(villains)
# weakness is what the villain is vulnerable to
# strength is what the villain is (nearly) immune too

# Be sure that spells.csv is saved in UTF-8 format.
spells <- read_csv("spells.csv", trim_ws = TRUE,
                   col_names = TRUE, col_type = list(
                     card_no = col_character(),
                     spell = col_character(),
                     attack = col_double(),
                     boost = col_double(),
                     shield = col_double(),
                     type = col_character(),
                     effect = col_character(),
                     have = col_factor(),
                     rareity = col_factor(levels = c("Common",
                                          "Uncommon", "Rare",
                                          "Super-Rare",
                                          "Promo"))
                   ))
#glimpse(spells)


MSK <- villains %>%
  left_join(spells, by = c("weakness" = "effect"))
#MSK
# View(MSK)
#
# MSK %>%
#   filter(villain == "Jafar") %>%
#   select(spell, attack, boost, shield)
