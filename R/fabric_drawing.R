
#' Create a canvas element for drawing
#'
#' @param cid the id of the canvas element
#' @param cwidth the width of the canvas element
#' @param cheight the height of the canvas element
#' @param cfill the color of the canvas element. Default to #FFFFFF (white)
#' @param drawingWidth the width of the drawing output. Default to 2
#' @param drawingColor the color of the drawing output. Default to #1E1E1E (black)
#' @param gumSize specify the size of the gum. Defaults to 10
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
                          gumSize = 10){



htmltools::tagList(


  htmltools::tags$input(id=glue::glue("erase{cid}"), type="checkbox", " Gum"),

  htmltools::tags$input(id=glue::glue("export{cid}"), type="button", value = "Export"),

  htmltools::tags$input(id = "drawing-color", type = "color", value = "#005E7A"),

  htmltools::tags$br(),  htmltools::tags$br(),

  htmltools::tags$canvas(id = cid, width = cwidth, height = cheight),

  htmltools::tags$script(src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"),

  htmltools::tags$script(src="https://cdn.jsdelivr.net/npm/file-saver@2.0.2/dist/FileSaver.min.js"),

  htmltools::tags$script(htmltools::HTML(glue::glue(
    "

const {cid} = new fabric.Canvas('{cid}', {{
    backgroundColor: '{cfill}',
    isDrawingMode: true

    }});


{cid}.freeDrawingBrush.width  = {drawingWidth};


drawingColorEl = document.getElementById('drawing-color');

{cid}.freeDrawingBrush.color = drawingColorEl.value;

drawingColorEl.onchange = function() {{
    {cid}.freeDrawingBrush.color = drawingColorEl.value;
  }};





 $('#erase{cid}').click(function(){{

    if (this.checked) {{

      {cid}.freeDrawingBrush.color  = '{cfill}';

    }} else {{

      {cid}.freeDrawingBrush.color = drawingColorEl.value;

    }}



}});





 $('#erase{cid}').click(function(){{

    if (this.checked) {{

      {cid}.freeDrawingBrush.width   = {gumSize};

    }} else {{

      {cid}.freeDrawingBrush.width  = {drawingWidth};

    }}


}});


$('#export{cid}').click(function(){{

  $('#{cid}').get(0).toBlob(function(blob){{

    saveAs(blob, '{cid}-IMG.png');


  }});


}});







  "
  )))



)















}




















