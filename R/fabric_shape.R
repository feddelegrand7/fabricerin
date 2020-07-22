

fabric_shape <- function(id,
                         cwidth = 800,
                         cheight = 600,
                         shape,
                         left,
                         top,
                         fill,
                         width,
                         height){



htmltools::tagList(

  htmltools::tags$canvas(id = id, width = cwidth, height = cheight),

  htmltools::tags$script(htmltools::HTML(glue::glue(
    "

var canvas = new fabric.Canvas('c');

var shape = new fabric.{shape}({{


left: {left},

top: {top},

fill: '{fill}',

width: {width},

height: {height}

}});

canvas.add(shape);


  "
  )))



)



}
