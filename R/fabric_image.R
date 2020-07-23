
fabric_image <- function(
                          cid,
                          cwidth = 800,
                          cheight = 600,
                          imgsrc,
                          imgwidth = 500,
                          imgheight = 500,
                          imgscale = 1,
                          left = 100,
                          top = 100,
                          angle = 0,
                          opacity = 1,
                          selectable = TRUE

                          ){

  selectable <- ifelse(selectable == TRUE, "true", "false")



  htmltools::tagList(

    htmltools::tags$canvas(id = cid, width = cwidth, height = cheight),

    htmltools::tags$script(htmltools::HTML(glue::glue(


  "
  var {cid} = new fabric.Canvas('{cid}');


 fabric.Image.fromURL('{imgsrc}', function(myImg) {{

 var img1 = myImg.set({{
 left: {left},
 top: {top},
 angle: {angle},
 opacity: {opacity},
 selectable: {selectable}

  }});

 img1.scaleToHeight({imgheight});
 img1.scaleToWidth({imgwidth});

 {cid}.add(img1);

  });

  "
    )))



  )



}
