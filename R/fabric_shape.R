

fabric_shape <- function(id,
                         cwidth = 800,
                         cheight = 600,
                         shape,
                         left,
                         top,
                         fill,
                         width,
                         height,
                         angle = 0,
                         opacity = 1,
                         strokecolor = "red",
                         strokewidth = 5,
                         selectable = TRUE){


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

selectable: {selectable}

}});

canvas.add(shape);


  "
  )))



)



}
