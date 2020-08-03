#' Add an image to a preexisting canvas element
#'
#' @param cid the id of the canvas element you want to add your image to
#' @param imgId the of the image
#' @param imgsrc the URL source of the image
#' @param imgwidth the width of the image. Defaults to 500
#' @param imgheight the height of the image. Defaults to 500
#' @param left the image's position from the left relative to the canvas element. Defaults to 100
#' @param top the image's position from the top relative to the canvas element. Defaults to 100
#' @param angle the angle of rotation of the image. Defaults to 0 (no rotation)
#' @param opacity the opacity of the image (from 0 to 1). Defaults to 1
#' @param strokecolor the stroke color of the image. Defaults to 'darkblue'
#' @param strokewidth the stroke width of the image. Defaults to 1
#' @param selectable logical. If TRUE, the user can modify interactively the image's size, position and rotation. Defaults to TRUE
#'
#' @return an image inside a preexisting canvas element
#' @export
#'
#' @examples
#' if (interactive()) {
#'
#' img1 <- "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/R_logo.svg/724px-R_logo.svg.png"
#' img2 <- "https://raw.githubusercontent.com/rstudio/hex-stickers/master/PNG/dplyr.png"
#' ui <- fluidPage(
#'
#' use_fabric(),
#'
#'
#'
#' fabric_image(cid = "cimage",
#'              imgId = "Rimg",
#'              imgsrc = img1,
#'              imgheight = 200,
#'              imgwidth = 200),
#'
#' fabric_image_add(cid = "cimage",
#'                  imgId = "rstudioimg",
#'                  imgsrc = img2,
#'                  imgwidth = 200,
#'                  imgheight = 200,
#'                  left = 400)
#'                  )
#'
#'server <- function(input, output) {}
#'
#'shinyApp(ui = ui, server = server)
#'
#'}



fabric_image_add <- function(cid,
                             imgId,
                             imgsrc,
                             imgwidth = 500,
                             imgheight = 500,
                             left = 100,
                             top = 100,
                             angle = 0,
                             opacity = 1,
                             strokecolor = "darkblue",
                             strokewidth = 1,
                             selectable = TRUE) {


  selectable <- ifelse(selectable == TRUE, "true", "false")

  htmltools::tagList(

    fabric_dependency(),


  htmltools::tags$script(htmltools::HTML(
    glue::glue(
      "

 fabric.Image.fromURL('{imgsrc}', function(myImg) {{

 var {imgId} = myImg.set({{
 left: {left},
 top: {top},
 angle: {angle},
 opacity: {opacity},
 stroke: '{strokecolor}',
 strokeWidth: {strokewidth},
 selectable: {selectable}

  }});

 {imgId}.scaleToHeight({imgheight});
 {imgId}.scaleToWidth({imgwidth});

 {cid}.add({imgId});

 {cid}.renderAll();


  }}, {{ crossOrigin: 'anonymous'}});


      "
    )
  )))



}
