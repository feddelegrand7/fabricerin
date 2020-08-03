
#' Insert external images inside canvas element
#'
#' @param cid the id of the canvas element
#' @param cwidth the width of the canvas element. Defaults to 800
#' @param cheight the height of the canvas element. Defaults to 600
#' @param cfill the color of the canvas element
#' @param imgId the id of the image
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
#' @param isDrawingMode logical. If TRUE, the user can draw inside the canvas element.
#'
#' @return an image inside a canvas element
#' @export
#'
#' @examples
#'
#'
#' if (interactive()) {
#'
#' img <- "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/R_logo.svg/724px-R_logo.svg.png"
#'
#' ui <- fluidPage(
#'
#'
#' fabric_image(cid = "cimage",
#'              cfill = "lightblue",
#'              imgId = "Rimg",
#'              imgsrc = img)
#'
#'              )
#'
#'server <- function(input, output) {}
#'
#'
#'shinyApp(ui = ui, server = server)
#'
#'}
#'

fabric_image <- function(
                          cid,
                          cwidth = 800,
                          cheight = 600,
                          cfill = "#FFFFFF",
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
                          selectable = TRUE,
                          isDrawingMode = FALSE

                          ){

  selectable <- ifelse(selectable == TRUE, "true", "false")

  isDrawingMode <- ifelse(isDrawingMode == TRUE, "true", "false")

  htmltools::tagList(

    htmltools::tags$canvas(id = cid, width = cwidth, height = cheight),

    fabric_dependency(),


    htmltools::tags$script(htmltools::HTML(glue::glue(


  "
  var {cid} = new fabric.Canvas('{cid}', {{

    isDrawingMode: {isDrawingMode}

    }});

  {cid}.backgroundColor = '{cfill}';

 fabric.Image.fromURL('{imgsrc}', function({imgId}) {{

 var {imgId} = {imgId}.set({{
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

  });

  "
    )))



  )



}
