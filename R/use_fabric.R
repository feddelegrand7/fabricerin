
#' Activate the fabricjs library
#'
#' @return called for the side effect of activating the fabricjs library
#' @export
#'
#' @description This function activates the javascript library fabricjs. You should put it at the beginning of your Rmd document or Shiny UI.
#'



use_fabric <- function() {
  htmltools::tagList(
    html_dependency_fabric()
  )
}

html_dependency_fabric <- function() {
  htmltools::htmlDependency(
    name = "fabric",
    version = "3.6.3",
    package = "fabricerin",
    src = c(
      file = "fabric",
      href = "https://cdnjs.cloudflare.com/ajax/libs/fabric.js/3.6.3/"
    ),
    script = "fabric.min.js",
    all_files = FALSE
  )
}
