---
title: "Advent of Code day 5"
date: 2022-12-05
tags:
- advent_of_code
- rstats
---

Read in our puzzle input:

    day <- 5

    input <- here::here(
      "2022", "input",
      paste0("day_", stringr::str_pad(day, 2, "left", "0"))
      ) |>
      readLines()

## Part 1

    stacks <- head(input, 8)
    orders <- tail(input, -10)

    create_stack_list <- function(n) {
      start <- (4 * n) - 3
      stop <- (4 * n) - 1
      rev(substr(stacks, start, stop)) |>
        stringr::str_subset("\\[[A-Z]{1}\\]")
    }

    stacks_list <- purrr::map(1:9, create_stack_list)

    process_order <- function(stacks_list, order) {
      nos <- stringr::str_extract_all(order, "[0-9]+", simplify = TRUE) |>
        as.numeric()
      move  <- nos[1]
      from <- nos[2]
      to <- nos[3]
      
      to_move <- utils::tail(stacks_list[[from]], move)
      stacks_list[[from]]  <- utils::head(stacks_list[[from]], (move * -1))
      stacks_list[[to]]  <- c(stacks_list[[to]], rev(to_move))

      stacks_list
    }

    purrr::reduce(orders, process_order, .init = stacks_list) |>
      purrr::map_chr(utils::tail, 1) |>
      stringr::str_c(collapse = "") |>
      stringr::str_remove_all("\\[|\\]")

    ## [1] "RFFFWBPNS"

## Part 2

    process_order2 <- function(stacks_list, order) {
      nos <- stringr::str_extract_all(order, "[0-9]+", simplify = TRUE) |>
        as.numeric()
      move  <- nos[1]
      from <- nos[2]
      to <- nos[3]
      
      to_move <- utils::tail(stacks_list[[from]], move)
      stacks_list[[from]]  <- utils::head(stacks_list[[from]], (move * -1))
      stacks_list[[to]]  <- c(stacks_list[[to]], to_move)

      stacks_list
    }

    purrr::reduce(orders, process_order2, .init = stacks_list) |>
      purrr::map_chr(utils::tail, 1) |>
      stringr::str_c(collapse = "") |>
      stringr::str_remove_all("\\[|\\]")

    ## [1] "CQQBBJFCS"
