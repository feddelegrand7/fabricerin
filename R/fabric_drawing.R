
#' Create a canvas element for drawing
#'
#' @param cid the id of the canvas element
#' @param cwidth the width of the canvas element
#' @param cheight the height of the canvas element
#' @param cfill the color of the canvas element. Default to #FFFFFF (white)
#' @param drawingWidth the width of the drawing output. Default to 2
#' @param drawingColor the color of the drawing output. Default to #1E1E1E (black)
#'
#' @return an HTML canvas element
#' @export
#'
#' @examples
#'if (interactive()) {
#'
#'ui <- fluidPage(
#'
#'    use_fabric(),
#'
#'    h1("Draw some stuff here"),
#'
#'    fabric_drawing(cid = "canvas1")
#'
#'    )
#'
#'server <- function(input, output) {}
#'
#'shinyApp(ui = ui, server = server)
#'
#'}




fabric_drawing <- function(cid,
                          cwidth = 800,
                          cheight = 600,
                          cfill = "#FFFFFF",
                          drawingWidth = 2,
                          drawingColor = "#1E1E1E"){



htmltools::tagList(


  htmltools::tags$input(id="erase", type="checkbox", " Erase"),

  htmltools::tags$canvas(id = cid, width = cwidth, height = cheight),

  htmltools::tags$script(htmltools::HTML(glue::glue(
    "
var dcol = '{drawingColor}';
var ccol = '{cfill}';


var {cid} = new fabric.Canvas('{cid}', {{

    isDrawingMode: true

    }});

{cid}.backgroundColor = '{cfill}';


$(document).ready(function() {{

 $('#erase').click(function(){{

    if (this.checked) {{

      {cid}.freeDrawingBrush.width   = 10;

    }} else {{

      {cid}.freeDrawingBrush.width  = {drawingWidth};

    }}
}})


} );



$(document).ready(function() {{

 $('#erase').click(function(){{

    if (this.checked) {{

      {cid}.freeDrawingBrush.color  = ccol;

    }} else {{

      {cid}.freeDrawingBrush.color = dcol;

    }}
}})


} );



  "
  )))



)















}




















