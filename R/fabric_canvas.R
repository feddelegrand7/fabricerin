
fabric_canvas <- function(cid,
                          cwidth = 800,
                          cheight = 600,
                          cfill = "#FFFFFF",
                          isDrawingMode = TRUE,
                          drawingWidth = 2,
                          drawingColor = "#1E1E1E"){



isDrawingMode <- ifelse(isDrawingMode == TRUE, "true", "false")


htmltools::tagList(

  htmltools::tags$canvas(id = cid, width = cwidth, height = cheight),

  htmltools::tags$script(htmltools::HTML(glue::glue(
    "

var {cid} = new fabric.Canvas('{cid}', {{

    isDrawingMode: {isDrawingMode}

    }});

{cid}.backgroundColor = '{cfill}';

{cid}.freeDrawingBrush.width = {drawingWidth};

{cid}.freeDrawingBrush.color = '{drawingColor}';


  "
  )))



)















}




















