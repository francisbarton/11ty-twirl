## Part 1

Read in our puzzle input:

    day <- 1

    input <- here::here(
      "2022", "input",
      paste0("day_", stringr::str_pad(day, 2, "left", "0"))
      ) |>
      readLines()

    vec <- as.integer(input)
    head(vec)

    ## [1] 22243 11899    NA  1696  2595  5331

    breaks <- which(is.na(vec))

    pull_diff <- function(x) {
      `-`(sum(vec[1:breaks[x]], na.rm = TRUE),
        ifelse(x > 1, sum(vec[1:breaks[x-1]], na.rm = TRUE), 0L)
      )
    }

    calories_list <- vapply(seq_along(breaks), pull_diff, 1L)

    head(calories_list)

    ## [1] 34142 54868 28046 64877 39885 31499

    length(calories_list)

    ## [1] 254

    max(calories_list) # 75501

    ## [1] 75501

# Part 2

    sum(tail(sort(calories_list), 3)) # 215594

    ## [1] 215594
