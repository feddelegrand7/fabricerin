
fabric_image <- function(
                          cid,
                          cwidth = 800,
                          cheight = 600,
                          cfill = "#FFFFFF",
                          imgId,
                          imgsrc,
                          imgwidth = 500,
                          imgheight = 500,
                          left = 100,
                          top = 100,
                          angle = 0,
                          opacity = 1,
                          strokecolor = "darkblue",
                          strokewidth = 5,
                          selectable = TRUE,
                          isDrawingMode = FALSE

                          ){

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

 fabric.Image.fromURL('{imgsrc}', function(myImg) {{

 var {imgId} = myImg.set({{
 left: {left},
 top: {top},
 angle: {angle},
 opacity: {opacity},
 stroke: '{strokecolor}',
 strokeWidth: {strokewidth},
 selectable: {selectable}

  }});

 {imgId}.scaleToHeight({imgheight});
 {imgId}.scaleToWidth({imgwidth});

 {cid}.add({imgId});

  });

  "
    )))



  )



}
