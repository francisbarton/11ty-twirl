Read in our puzzle input:

    day <- 4

    input <- here::here(
      "2022", "input",
      paste0("day_", stringr::str_pad(day, 2, "left", "0"))
      ) |>
      readLines()

## Part 1

    inputs <- strsplit(input, ",") |>
      lapply(strsplit, split = "-")

    compare_pairs <- function(l) {
      a <- as.numeric(l[[1]])
      b <- as.numeric(l[[2]])
      (a[1] >= b[1] & a[2] <= b[2]) | (b[1] >= a[1] & b[2] <= a[2]) 
    }

    inputs |>
      vapply(compare_pairs, TRUE) |>
      sum()

    ## [1] 494

# Part 2

    compare_pairs2 <- function(l) {
      a <- as.numeric(l[[1]])
      b <- as.numeric(l[[2]])
      length(intersect(seq(a[1], a[2]), seq(b[1], b[2]))) > 0
    }

    inputs |>
      vapply(compare_pairs2, TRUE) |>
      sum()

    ## [1] 833
