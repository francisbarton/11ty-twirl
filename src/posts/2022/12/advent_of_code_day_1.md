---
title: "Advent of Code day 1"
date: 2022-12-02
subtitle: 
tags: advent_of_code, rstats
---

Advent of Code day 1
================

## Part 1

Read in our puzzle input:

``` r
day <- 1

vec <- here::here(
  "2022", "input",
  paste0("day_", stringr::str_pad(day, 2, "left", "0"))
  ) |>
  readLines()

vec <- as.integer(vec)
head(vec)
```

    ## [1] 22243 11899    NA  1696  2595  5331

``` r
breaks <- which(is.na(vec))
length(breaks)
```

    ## [1] 254

``` r
head(breaks)
```

    ## [1]  3 17 24 37 46 56

``` r
pull_sum <- function(elem, vec) {
  sum(vec[1:elem], na.rm = TRUE)
}

cumsums <- vapply(breaks, pull_sum, 1L, vec = vec)
any(is.na(cumsums))
```

    ## [1] FALSE

``` r
length(cumsums)
```

    ## [1] 254

``` r
head(cumsums)
```

    ## [1]  34142  89010 117056 181933 221818 253317

``` r
pull_diff <- function(x, vec) {
  vec[x] - ifelse(x > 1, vec[x-1], 0L)
}

calories_list <- vapply(seq_along(cumsums), pull_diff, 1L, vec = cumsums)

head(calories_list)
```

    ## [1] 34142 54868 28046 64877 39885 31499

``` r
length(calories_list)
```

    ## [1] 254

``` r
max(calories_list)
```

    ## [1] 75501

# Part 2

``` r
sum(tail(sort(calories_list), 3))
```

    ## [1] 215594

