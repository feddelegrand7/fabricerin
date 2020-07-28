

#' Create shapes inside a canvas
#'
#' @param cid the id of the canvas element
#' @param cwidth the width of the canvas element. Defaults to 800
#' @param cheight the height of the canvas element. Defaults to 600
#' @param cfill the color of the canvas element
#' @param shapeId the id of the shape object
#' @param shape the shape of the object. Choices include 'Circle', 'Triangle' and 'Rect'. Defaults to 'Rect'
#' @param left the shape's position from the left relative to the canvas element. Defaults to 100
#' @param top the shape's position from the top relative to the canvas element. Defaults to 100
#' @param fill the color of the shape. Defaults to 'red'
#' @param width the width of the shape. Defaults to 200
#' @param height the height of the shape. Defaults to 200
#' @param angle the angle of rotation of the shape. Defaults to 0 (no rotation)
#' @param opacity the opacity of the shape (from 0 to 1). Defaults to 1
#' @param strokecolor the stroke color of the shape. Defaults to 'darkblue'
#' @param strokewidth the stroke width of the shape. Defaults to 5.
#' @param selectable logical. If TRUE, the user can modify interactively the shape's size, position and rotation. Defaults to TRUE
#' @param isDrawingMode logical. If TRUE, the user can draw inside the canvas element.
#' @param radius Mandatory if the chosen shape is a 'Circle'. Defaults to NULL
#'
#' @return a shape object inside a canvas
#' @export
#'
#' @examples
#'
#'if(interactive()){
#'
#'ui <- fluidPage(
#'
#'use_fabric(),
#'
#'h2("Below you'll find a red Rectangle with a darkblue stroke"),
#'
#'fabric_shape(cid = "canvas", shapeId = "shape1", shape = "Rect")
#'
#')
#'
#'server <- function(input, output) {
#'
#'
#'}
#'
#'
#'shinyApp(ui = ui, server = server)
#'
#'}
#'





fabric_shape <- function(cid,
                         cwidth = 800,
                         cheight = 600,
                         cfill = "#FFFFFF",
                         shapeId,
                         shape = "Rect",
                         left = 100,
                         top = 100,
                         fill = "red",
                         width = 200,
                         height = 200,
                         angle = 0,
                         opacity = 1,
                         strokecolor = "darkblue",
                         strokewidth = 5,
                         selectable = TRUE,
                         isDrawingMode = FALSE,
                         radius = NULL,
                         polx = NULL,
                         poly = NULL) {

  if (!shape %in% c("Rect",
                    "Circle",
                    "Triangle",
                    "Polygon")) {
    stop(paste0(shape, " shape is not available, choices are Rect, Circle, Triangle and Polygon"))
  }


  if (shape == "Polygon" &
      is.null(poly) & is.null(polx)) {
    stop("If you draw a Circle, you need to provide a radius")
  }

  if (shape == "Polygon" &
      is.null(polx)) {
    stop("If you draw a Circle, you need to provide a radius")
  }

  if (shape == "Polygon" &
      is.null(poly)) {
    stop("If you draw a Circle, you need to provide a radius")
  }


  if (shape == "Circle" &
      is.null(radius)) {
    stop("If you draw a Circle, you need to provide a radius")
  }

  radius <-
    ifelse(!is.null(radius), glue::glue("radius:{radius}"), "")


  selectable <- ifelse(selectable == TRUE, "true", "false")

  isDrawingMode <- ifelse(isDrawingMode == TRUE, "true", "false")


  if(shape == "Polygon"){


  data <- paste("{x:", polx, ", y:", poly, "}", collapse = ",")


    htmltools::tagList(
      htmltools::tags$canvas(
        id = cid,
        width = cwidth,
        height = cheight
      ),

      htmltools::tags$script(htmltools::HTML(
        glue::glue(
          "
var {cid} = new fabric.Canvas('{cid}', {{

    isDrawingMode: {isDrawingMode}

    }});

{cid}.backgroundColor = '{cfill}';


var {shapeId} = new fabric.{shape}(

[{data}], {{

fill: '{fill}'


}});

{cid}.add({shapeId});


  "
        )
      ))



    )




  } else {


    htmltools::tagList(
      htmltools::tags$canvas(
        id = cid,
        width = cwidth,
        height = cheight
      ),

htmltools::tags$script(htmltools::HTML(
        glue::glue(
          "

var {cid} = new fabric.Canvas('{cid}', {{

    isDrawingMode: {isDrawingMode}

    }});

{cid}.backgroundColor = '{cfill}';


var {shapeId} = new fabric.{shape}({{

left: {left},
top: {top},
fill: '{fill}',
width: {width},
height: {height},
angle: {angle},
opacity: {opacity},
stroke: '{strokecolor}',
strokeWidth: {strokewidth},
selectable: {selectable},

{radius}

}});

{cid}.add({shapeId});


  "
        )
      ))



    )





  }






}
