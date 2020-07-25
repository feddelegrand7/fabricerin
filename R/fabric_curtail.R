
fabric_curtail <- function(cid,
                           imgsrc,
                           type = "background"){


  type <- ifelse(type == "background", "setBackgroundImage", "setOverlayImage")

  htmltools::tags$script(htmltools::HTML(glue::glue("



  fabric.Image.fromURL('{imgsrc}', function(img) {{
      img.set({{
          scaleX: {cid}.getWidth() / img.width,
          scaleY: {cid}.getHeight() / img.height,
          objectCaching: false,
          originX: 'left',
          originY: 'top'
       }});
       {cid}.{type}(img, {cid}.renderAll.bind({cid}));
   }});


                                    ")))














}




