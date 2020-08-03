#' Add text within preexisting canvas element
#'
#' @param cid the id of the canvas element
#' @param textId the id of the text
#' @param text the content of the text
#' @param left the text's position from the left relative to the canvas element. Defaults to 100
#' @param top the text's position from the top relative to the canvas element. Defaults to 100
#' @param fill the text's color. Defaults to '#2F3941' (dark shade of cyan-blue)
#' @param angle the angle of rotation of the text. Defaults to 0 (no rotation)
#' @param opacity text opacity (from 0 to 1). Defaults to 1
#' @param fontFamily the font family of the text. Defaults to 'Comic Sans'
#' @param fontSize text sizing. Defaults to 40
#' @param fontStyle the font style of the text. Either 'normal' or 'italic'
#' @param strokecolor the stroke color of the text Defaults to '#282A36' (Very dark grayish blue)
#' @param strokewidth the stroke width of the text. Defaults to 1
#' @param fontWeight allows the user to make text thicker or thinner. Keywords can be used ('normal', 'bold'), or numbers. Defaults to 'normal'
#' @param underline logical. Whether to underline the text or not. Defaults to FALSE
#' @param linethrough logical. Whether to insert a line through the text or not. Defaults to FALSE
#' @param overline logical. Whether to put a line above the text or not. Defaults to FALSE
#' @param selectable logical. If TRUE, the user can modify interactively the image's size, position and rotation. Defaults to TRUE
#' @param shadow logical. If TRUE a text shadow will be inserted behind the raw text. Defaults to FALSE
#' @param shadowCol the color of the text shadow. Defaults to #FFFAF0 (floral white)
#' @param textAlign the alignment of text. Useful when there are line breaks. Defaults to "center"
#' @param lineHeight the height of the line breaks.Defaults to 1
#' @param textBackgroundColor the background color of the text, defaults to NULL
#'
#' @return a text object within a preexisting canvas element
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'
#' ui <- fluidPage(
#'
#'
#' fabric_shape(cid = "canvas123",
#'              cfill = "lightblue",
#'              cwidth = 1000,
#'              shapeId = "tri1",
#'              shape = "Triangle",
#'              fill = "darkblue"),
#'
#' fabric_text_add(cid = "canvas123",
#'                 textId = "txt1",
#'                 text = "This is a darkblue Triangle !",
#'                 left = 350
#'                 )
#'
#'                 )
#'
#' server <- function(input, output) {}
#'
#' shinyApp(ui = ui, server = server)
#'
#'
#' }




fabric_text_add <- function(cid,
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
                        textBackgroundColor = NULL
                        ){



  if (!fontStyle %in% c("normal",
                        "italic")) {
    stop(paste0("fontStyle accepts two values: 'normal' or 'italic'"))
  }

  selectable <- ifelse(selectable == TRUE, "true", "false")


  underline <- ifelse(underline == TRUE, "true", "false")

  linethrough <- ifelse(linethrough == TRUE, "true", "false")

  overline <- ifelse(overline == TRUE, "true", "false")

  shadow <- ifelse(shadow == TRUE, glue::glue("shadow:'{shadowCol} 5px 5px 5px'"), "")

  tBG <- ifelse(is.null(textBackgroundColor), character(0), glue::glue("textBackgroundColor: '{textBackgroundColor}',"))



    htmltools::tags$script(htmltools::HTML(glue::glue(


      "


  var {textId} = new fabric.Text(\"{text}\", {{

  left: {left},
  top: {top},
  fontFamily: '{fontFamily}',
  fontSize: {fontSize},
  fontStyle: '{fontStyle}',
  fontWeight: '{fontWeight}',
  underline: {underline},
  linethrough: {linethrough},
  overline: {overline},
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
      , .na = ""))



  )















}

























