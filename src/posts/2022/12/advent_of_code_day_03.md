## Part 1

Read in our puzzle input:

    day <- 3

    input <- here::here(
      "2022", "input",
      paste0("day_", stringr::str_pad(day, 2, "left", "0"))
      ) |>
      readLines()

Tidyverse version

    priorities <- c(letters, LETTERS)

    tibble::tibble(
      input = input
    ) |>
      dplyr::mutate(
        halfway = nchar(input) / 2,
        part_1 = substr(input, 1, halfway),
        part_2 = substr(input, halfway + 1, 2 * halfway)) |>
      dplyr::rowwise() |>
      dplyr::mutate(common_letter = intersect(stringr::str_split_1(part_1, ""), stringr::str_split_1(part_2, "")),
        priority = stringr::str_which(priorities, common_letter)
      ) |>
      dplyr::pull(priority) |>
      sum()

    ## [1] 7821

Base R version

    halfways <- nchar(input) / 2
    part_1 <- mapply(substr, input, 1, halfways)
    part_2 <- mapply(substr, input, halfways + 1, halfways * 2)

    part_1_letters <- lapply(part_1, strsplit, split = "")
    part_2_letters <- lapply(part_2, strsplit, split = "")

    part_1_letters <- lapply(part_1_letters, unlist)
    part_2_letters <- lapply(part_2_letters, unlist)

    common_letters <- mapply(intersect, part_1_letters, part_2_letters,
                             SIMPLIFY = TRUE, USE.NAMES = FALSE)

    sum(vapply(common_letters, grep, FUN.VALUE = 1, x = priorities,
          ignore.case = FALSE, value = FALSE))

    ## [1] 7821

# Part 2

    input |>
      split(f = rep(1:(length(input) / 3), each = 3)) |>
      lapply(strsplit, split = "") |>
      vapply(Reduce, FUN.VALUE = "a", f = intersect, USE.NAMES = FALSE) |>
      vapply(grep, FUN.VALUE = 1, x = priorities,
          ignore.case = FALSE, value = FALSE) |>
      sum()

    ## [1] 2752
