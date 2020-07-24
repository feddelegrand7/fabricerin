

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
                         radius = NULL){


radius <- ifelse(!is.null(radius), glue::glue("radius:{radius}"), "")


selectable <- ifelse(selectable == TRUE, "true", "false")

isDrawingMode <- ifelse(isDrawingMode == TRUE, "true", "false")


htmltools::tagList(

  htmltools::tags$canvas(id = cid, width = cwidth, height = cheight),

  htmltools::tags$script(htmltools::HTML(glue::glue(
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
  )))



)



}
