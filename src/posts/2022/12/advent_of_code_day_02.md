# Advent of Code day 2

## Part 1

Read in our puzzle input:

    day <- 2

    input <- here::here("2022", "input",
      paste0("day_", stringr::str_pad(day, 2, "left", 0))) |>
      readLines()

    length(input)

    ## [1] 2500

Convert to 2 character vectors:

    vecs <- input |>
      stringr::str_extract_all("[A-Z]{1}")

    player_1 <- purrr::map_chr(vecs, 1)
    player_2 <- purrr::map_chr(vecs, 2)

Work out the results / points:

    tibble::tibble(
      a = player_1, b = player_2
    ) |>
      dplyr::mutate(result_points = dplyr::case_when(
        # draws
        a == "A" & b == "X" ~ 3,
        a == "B" & b == "Y" ~ 3,
        a == "C" & b == "Z" ~ 3,
        # a wins
        a == "A" & b == "Z" ~ 0,
        a == "B" & b == "X" ~ 0,
        a == "C" & b == "Y" ~ 0,
        # b wins
        a == "A" & b == "Y" ~ 6,
        a == "B" & b == "Z" ~ 6,
        a == "C" & b == "X" ~ 6
      )) |>
      dplyr::mutate(shape_points = dplyr::case_when(
        b == "X" ~ 1,
        b == "Y" ~ 2,
        b == "Z" ~ 3
      )) |>
      dplyr::summarise(dplyr::across(
        all_of(c("result_points", "shape_points")), sum)) |>
      unlist() |>
      sum()

    ## [1] 14297

## Part 2

    tibble::tibble(
      a = player_1, b = player_2
    ) |>
      dplyr::mutate(shape_points = dplyr::case_when(
        # lose
        a == "A" & b == "X" ~ 3,
        a == "B" & b == "X" ~ 1,
        a == "C" & b == "X" ~ 2,
        # draw
        a == "A" & b == "Y" ~ 1,
        a == "B" & b == "Y" ~ 2,
        a == "C" & b == "Y" ~ 3,
        # win
        a == "A" & b == "Z" ~ 2,
        a == "B" & b == "Z" ~ 3,
        a == "C" & b == "Z" ~ 1
      )) |>
      dplyr::mutate(result_points = dplyr::case_when(
        b == "X" ~ 0,
        b == "Y" ~ 3,
        b == "Z" ~ 6
      )) |>
      dplyr::summarise(dplyr::across(
        all_of(c("result_points", "shape_points")), sum)) |>
      unlist() |>
      sum()

    ## [1] 10498
