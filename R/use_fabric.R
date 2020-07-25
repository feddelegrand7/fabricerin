
#' Activate the fabricjs library
#'
#' @return called for the side effect of activating the fabricjs library
#' @export
#'
#' @description This function activates the javascript library fabricjs. You should put it at the beginning of your Rmd document or Shiny UI.
#' Note that you'll need to be connected to the internet.
#'



use_fabric <- function(){


  htmltools::tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/fabric.js/3.6.3/fabric.min.js")

}
