## Part 1

Read in our puzzle input:

    day <- 6

    input <- here::here(
      "2022", "input",
      paste0("day_", stringr::str_pad(day, 2, "left", "0"))
      ) |>
      readLines()


    test_inputs <- c(
      "mjqjpqmgbljsphdztnvjfqwrcgsmlb",
      "bvwbjplbgvbhsrlpgdmjqwftvncz",
      "nppdvjthqldpwncqszvftbrmjlhg",
      "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg",
      "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"
    )

    test_answers <- c(7, 5, 6, 10, 11)

    check_marker <- function(buffer, n = 4) {
        stopifnot("n is beyond the length of the buffer" = n <= length(buffer))

        if (length(unique(buffer[(n-3):n])) < 4) {
          check_marker(buffer, n + 1)
        } else n
      }


    check_marker(unlist(strsplit(test_inputs[1], ""))) == test_answers[1] &
    check_marker(unlist(strsplit(test_inputs[2], ""))) == test_answers[2] & 
    check_marker(unlist(strsplit(test_inputs[3], ""))) == test_answers[3] & 
    check_marker(unlist(strsplit(test_inputs[4], ""))) == test_answers[4] & 
    check_marker(unlist(strsplit(test_inputs[5], ""))) == test_answers[5]

    ## [1] TRUE

    strsplit(input, "") |>
      unlist() |>
      check_marker()

    ## [1] 1912

## Part 2

    test_answers2 <- c(19, 23, 23, 29, 26)

    check_marker2 <- function(buffer, n = 14) {
        stopifnot("n is beyond the length of the buffer" = n <= length(buffer))

        if (length(unique(buffer[(n-13):n])) < 14) {
          check_marker2(buffer, n + 1)
        } else n
      }

    check_marker2(unlist(strsplit(test_inputs[1], ""))) == test_answers2[1] &
    check_marker2(unlist(strsplit(test_inputs[2], ""))) == test_answers2[2] & 
    check_marker2(unlist(strsplit(test_inputs[3], ""))) == test_answers2[3] & 
    check_marker2(unlist(strsplit(test_inputs[4], ""))) == test_answers2[4] & 
    check_marker2(unlist(strsplit(test_inputs[5], ""))) == test_answers2[5]

    ## [1] TRUE

    strsplit(input, "") |>
      unlist() |>
      check_marker2()

    ## [1] 2122
