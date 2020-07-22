

fabric_shape <- function(id,
                         cwidth = 800,
                         cheight = 600,
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
                         radius = NULL){


radius <- ifelse(!is.null(radius), glue::glue("radius:{radius}"), "")


selectable <- ifelse(selectable == TRUE, "true", "false")

htmltools::tagList(

  htmltools::tags$canvas(id = id, width = cwidth, height = cheight),

  htmltools::tags$script(htmltools::HTML(glue::glue(
    "

var canvas = new fabric.Canvas('{id}');

var shape = new fabric.{shape}({{


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

canvas.add(shape);


  "
  )))



)



}
