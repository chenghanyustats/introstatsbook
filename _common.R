set.seed(1234)

knitr::opts_chunk$set(
  comment = "#",
  collapse = TRUE,
  # cache = TRUE,
  fig.retina = 2,
  fig.width = 6,
  fig.asp = 0.618,
  fig.show = "hold",
  echo = FALSE,
  fig.align = "center",
  warning = FALSE,
  message = FALSE
)


# Activate crayon output
options(
  #crayon.enabled = TRUE,
  pillar.bold = TRUE,
  stringr.html = FALSE,
  dplyr.print_min = 6,
  dplyr.print_max = 6,
  # warn = -1
  digits = 3,
  global.par = TRUE
)

par(mar = c(4, 4, 2, 1))

# defaultW <- getOption("warn") 
# options(warn = defaultW)

suppressWarnings(suppressPackageStartupMessages({
    library(openintro)
    library(knitr)
    library(emoji)
    library(tidyverse)
    library(broom)
    library(rminer)
    library(sets)
    library(tidyverse)
    library(ggVennDiagram)
    library(plotrix)
    library(diagram)
    library(kableExtra)
    library(reticulate)
}))



ggplot2::theme_set(ggplot2::theme_gray(12))

# status <- function(type) {
#   status <- switch(type,
#                    polishing = "should be readable but is currently undergoing final polishing",
#                    restructuring = "is undergoing heavy restructuring and may be confusing or incomplete",
#                    drafting = "is currently a dumping ground for ideas, and we don't recommend reading it",
#                    complete = "is largely complete and just needs final proof reading",
#                    stop("Invalid `type`", call. = FALSE)
#   )
#   
#   cat(paste0(
#     "::: status\n",
#     "You are reading the work-in-progress second edition of R for Data Science. ",
#     "This chapter ", status, ". ",
#     "You can find the complete first edition at <https://r4ds.had.co.nz>.\n",
#     ":::\n"
#   ))
# }



hook_output <- knitr::knit_hooks$get("output")
knitr::knit_hooks$set(output = function(x, options) {
  lines <- options$output.lines
  if (is.null(lines)) {
    return(hook_output(x, options))  # pass to default hook
  }
  x <- unlist(strsplit(x, "\n"))
  more <- "..."
  if (length(lines)==1) {        # first n lines
    if (length(x) > lines) {
      # truncate the output, but add ....
      x <- c(head(x, lines), more)
    }
  } else {
    x <- c(more, x[lines], more)
  }
  # paste these lines together
  x <- paste(c(x, ""), collapse = "\n")
  hook_output(x, options)
})
