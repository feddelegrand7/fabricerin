


#' Add a shape object to a preexisting canvas element
#'
#' @param cid the id of the canvas element you want to add your shape to
#' @param shapeId the id of the shape object
#' @param shape the shape of the object. Choices include 'Circle', 'Triangle' and 'Rect'. Defaults to 'Rect'
#' @param left the shape's position from the left relative to the canvas element. Defaults to 100
#' @param top the shape's position from the top relative to the canvas element. Defaults to 100
#' @param fill the color of the shape. Defaults to 'red'
#' @param width the width of the shape. Defaults to 200
#' @param height the height of the shape. Defaults to 200
#' @param angle the angle of rotation of the shape. Defaults to 0 (no rotation)
#' @param opacity the opacity of the shape. Defaults to 1
#' @param strokecolor the stroke color of the shape. Defaults to 'darkblue'
#' @param strokewidth the stroke width of the shape. Defaults to 5.
#' @param selectable logical. If TRUE, the user can modify interactively the shape. Defaults to TRUE
#' @param radius Mandatory if the chosen shape is a 'Circle'. Defaults to NULL
#' @param xPolygon a vector of the coordinate points of the polygon, from the left.
#' @param yPolygon a vector of the coordinate points of the polygon, from the top

#'
#' @return a shape object inside a preexisting canvas element
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'
#' ui <- fluidPage(
#'
#'
#' fabric_shape(cid = "canvas",
#'              shapeId = "shape1",
#'              shape = "Rect",
#'              left = 130,
#'              top = 200),
#'
#' fabric_shape_add(cid = "canvas",
#'                  shapeId = "shapo",
#'                  shape = "Circle",
#'                  radius = 30,
#'                  left = 100,
#'                  top = 100),
#'
#' fabric_shape_add(cid = "canvas",
#'                  shapeId = "shapa",
#'                  shape = "Circle",
#'                  radius = 30,
#'                  left = 200,
#'                  top = 100),
#'
#' fabric_shape_add(cid = "canvas",
#'                  shapeId = "shapox",
#'                  shape = "Circle",
#'                  radius = 30,
#'                  left = 300,
#'                  top = 100),
#'
#' fabric_shape_add(cid = "canvas",
#'                  shapeId = "shapor",
#'                  shape = "Circle",
#'                  radius = 30,
#'                  left = 300,
#'                  top = 100)
#'
#' )
#'
#'
#' server <- function(input, output) {}
#'
#' shinyApp(ui = ui, server = server)
#'
#' }



fabric_shape_add <- function(cid,
                             shapeId,
                             shape = "Rect",
                             left = "100",
                             top = "100",
                             fill = "red",
                             width = 200,
                             height = 200,
                             angle = 0,
                             opacity = 1,
                             strokecolor = "darkblue",
                             strokewidth = 5,
                             selectable = TRUE,
                             radius = NULL,
                             xPolygon = NULL,
                             yPolygon = NULL){


  if (!shape %in% c("Rect",
                    "Circle",
                    "Triangle",
                    "Polygon")) {
    stop(paste0(shape, " shape is not available, choices are Rect, Circle, Triangle and Polygon"))
  }


  if (shape == "Polygon" &
      is.null(yPolygon) & is.null(xPolygon)) {
    stop("If you draw a Polygon, you need to set the xPolygon and yPolygon arguments")
  }

  if (shape == "Polygon" &
      is.null(xPolygon)) {
    stop("If you draw a Polygon, you need to set the xPolygon argument")
  }

  if (shape == "Polygon" &
      is.null(yPolygon)) {
    stop("If you draw a Polygon, you need to set the yPolygon argument")
  }

  if (shape == "Polygon" &

      length(xPolygon) != length(yPolygon)

  ){

    stop("xPolygon and yPolygon must have the same length")

  }

  if (shape == "Circle" &
      is.null(radius)) {
    stop("If you draw a Circle, you need to provide a radius")
  }

  radius <-
    ifelse(!is.null(radius), glue::glue("radius:{radius}"), "")


  selectable <- ifelse(selectable == TRUE, "true", "false")



  if(shape == "Polygon"){


    data <- paste("{x:", xPolygon, ", y:", yPolygon, "}", collapse = ",")




      htmltools::tags$script(htmltools::HTML(
        glue::glue(
          "

var {shapeId} = new fabric.{shape}(

[{data}], {{

fill: '{fill}',
left: {left},
top: {top},
width: {width},
height: {height},
angle: {angle},
opacity: {opacity},
stroke: '{strokecolor}',
strokeWidth: {strokewidth},
selectable: {selectable}

}});

{cid}.add({shapeId});


  "
        )
      )



    )




  } else {



      htmltools::tags$script(htmltools::HTML(
        glue::glue(
          "
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
      )



    )


  }



























}
