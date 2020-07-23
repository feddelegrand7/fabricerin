fabric_image_add <- function(cid,
                             cwidth = 800,
                             cheight = 600,
                             imgsrc,
                             imgwidth = 500,
                             imgheight = 500,
                             left = 100,
                             top = 100,
                             angle = 0,
                             opacity = 1,
                             strokecolor = "darkblue",
                             strokewidth = 5,
                             selectable = TRUE) {


  selectable <- ifelse(selectable == TRUE, "true", "false")

  htmltools::tags$script(htmltools::HTML(
    glue::glue(
      "

 fabric.Image.fromURL('{imgsrc}', function(myImg) {{

 var img1 = myImg.set({{
 left: {left},
 top: {top},
 angle: {angle},
 opacity: {opacity},
 stroke: '{strokecolor}',
 strokeWidth: {strokewidth},
 selectable: {selectable}

  }});

 img1.scaleToHeight({imgheight});
 img1.scaleToWidth({imgwidth});

 {cid}.add(img1);

  });


      "
    )
  ))



}
