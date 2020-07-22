
fabric_images <- function(
                          cid,
                          cwidth = 800,
                          cheight = 600,
                          imgid,
                          imgsrc,
                          imgwidth = 500,
                          imgheight = 500,
                          left = 100,
                          top = 100,
                          angle = 0,
                          opacity = 1

                          ){


  htmltools::tagList(

    htmltools::tags$canvas(id = cid, width = cwidth, height = cheight),

    htmltools::tags$script(htmltools::HTML(glue::glue(


  "
  var canvas = new fabric.Canvas('{cid}');

  var pugImg = new Image();

  pugImg.onload = function (img) {{

    var pug = new fabric.Image(pugImg, {{
        angle: {angle},
        width: {imgwidth},
        height: {imgheight},
        left: {left},
        top: {top}
    }});

    canvas.add(pug);
}};
pugImg.src = '{imgsrc}';


  "
    )))



  )



}
