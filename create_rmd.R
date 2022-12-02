post_title <- readline("Post title: ")
post_slug <- tolower(gsub(" ", "_", post_title))

year <- format(Sys.Date(), "%Y")
month <- format(Sys.Date(), "%m")
file_loc <- here::here("src", "posts", year, month, paste0(post_slug, ".Rmd"))
if (!dir.exists(dirname(file_loc))) {
  dir.create(dirname(file_loc), recursive = TRUE)
}

yaml_block <- paste(
  "---",
  paste0("title: \"", post_title, "\""),
  paste0("date: ", Sys.Date()),
  "output: md_document",
  "subtitle: ",
  "tags: ",
  "---",
  sep = "\n"
)

writeLines(yaml_block, file_loc)
