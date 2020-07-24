


fabric_shape_add <- function(cid,
                             shapeId,
                             shape = "Rect",
                             left = "150",
                             top = "150",
                             fill = "grey",
                             width = 200,
                             height = 200,
                             angle = 0,
                             opacity = 1,
                             strokecolor = "#324C63",
                             strokewidth = 5,
                             selectable = TRUE,
                             radius = NULL){


  radius <- ifelse(!is.null(radius), glue::glue("radius:{radius}"), "")

  selectable <- ifelse(selectable == TRUE, "true", "false")

  htmltools::tags$script(htmltools::HTML(glue::glue(
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
  )))


}
