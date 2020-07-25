
#' Add a background or an overlay image to a preexisting canvas
#'
#' @param cid the id of the canvas element
#' @param imgsrc the URL source of the image
#' @param type whether to use an image as a 'background' or as an 'overlay'
#'
#' @return a canvas with a background or overlay image
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'
#' ui <- fluidPage(
#'
#' use_fabric(),
#'
#' fabric_shape(cid = "canvas123",
#'              shapeId = "tri1",
#'              shape = "Triangle",
#'              fill = "darkblue"),
#'
#'fabric_curtail(cid = "canvas123",
#'              imgsrc = ""https://st.depositphotos.com/1642482/1904/i/950/depositphotos_19049237-stock-photo-leaf.jpg"",
#'              type = "background"
#'
#'              )
#'
#')
#'
#'server <- function(input, output) {}
#'
#'
#'shinyApp(ui = ui, server = server)
#'
#'}





fabric_curtail <- function(cid,
                           imgsrc,
                           type = "background"){

  if (!type %in% c("background",
                    "overlay")) {
    stop(paste0("type accepts two values: 'background' or 'overlay'"))
  }


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




