---
title: "Advent of Code day 1"
date: 2022-12-02
tags:
- advent_of_code
- rstats
---

## Part 1

Read in our puzzle input:

    day <- 1

    input <- here::here(
      "2022", "input",
      paste0("day_", stringr::str_pad(day, 2, "left", "0"))
      ) |>
      readLines()

    vec <- as.integer(input)
    breaks <- which(is.na(vec))

    pull_diff <- function(x) {
      `-`(sum(vec[1:breaks[x]], na.rm = TRUE),
        ifelse(x > 1, sum(vec[1:breaks[x-1]], na.rm = TRUE), 0L)
      )
    }

    calories_list <- vapply(seq_along(breaks), pull_diff, 1L)
    max(calories_list)

# Part 2

    sum(tail(sort(calories_list), 3))
