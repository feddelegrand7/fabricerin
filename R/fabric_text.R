
fabric_text <- function(cid,
                        cwidth = 800,
                        cheight = 600,
                        cfill = "#FFFFFF",
                        textId,
                        text,
                        left = 100,
                        top = 100,
                        fill = "#2F3941",
                        angle = 0,
                        opacity = 1,
                        fontFamily = 'Comic Sans',
                        fontSize = 40,
                        fontStyle = 'normal',
                        strokecolor = "#282A36",
                        strokewidth = 1,
                        fontWeight = "normal",
                        underline = FALSE,
                        linethrough = FALSE,
                        overline = FALSE,
                        selectable = TRUE,
                        shadow = FALSE,
                        shadowCol = "#324C63",
                        textAlign = "center",
                        lineHeight = 1,
                        textBackgroundColor = NULL,
                        isDrawingMode = FALSE){




  selectable <- ifelse(selectable == TRUE, "true", "false")

  isDrawingMode <- ifelse(isDrawingMode == TRUE, "true", "false")

  underline <- ifelse(underline == TRUE, "true", "false")

  linethrough <- ifelse(linethrough == TRUE, "true", "false")

  overline <- ifelse(overline == TRUE, "true", "false")

  shadow <- ifelse(shadow == TRUE, glue::glue("shadow:'{shadowCol} 5px 5px 5px'"), "")

  tBG <- ifelse(is.null(textBackgroundColor), character(0), glue::glue("textBackgroundColor: '{textBackgroundColor}',"))



  htmltools::tagList(

    htmltools::tags$canvas(id = cid, width = cwidth, height = cheight),

    htmltools::tags$script(htmltools::HTML(glue::glue(
      "

  var {cid} = new fabric.Canvas('{cid}', {{

    isDrawingMode: {isDrawingMode}

    }});

  {cid}.backgroundColor = '{cfill}';

  var {textId} = new fabric.Text('{text}', {{

  left: {left},
  top: {top},
  fontFamily: '{fontFamily}',
  fontSize: {fontSize},
  fontStyle: '{fontStyle}',
  fontWeight: '{fontWeight}',
  underline: {underline},
  linethrough: {underline},
  overline: {underline},
  fill: '{fill}',
  angle: {angle},
  opacity: {opacity},
  stroke: '{strokecolor}',
  strokeWidth: {strokewidth},
  textAlign: '{textAlign}',
  lineHeight: {lineHeight},
  {tBG}
  selectable: {selectable},
  {shadow}

}});

  {cid}.add({textId});

  "
    , .na = "")))



  )
















}

























