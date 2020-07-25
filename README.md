
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fabricerin

<!-- badges: start -->

<!-- badges: end -->

The `fabricerin` (spelled **fabrikerine**) package allows you to create
easily canvas elements within your Shiny app and RMarkdown documents.
You can use the canvas to render shapes, images and text. You can also
create a canvas for drawing/taking notes purposes. Under the hoods,
`fabricerin` relies on the the [fabricjs](http://fabricjs.com/)
JavaScript library.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")

remotes::install_github("feddelegrand7/fabricerin")
```

## Examples:

First of all, I’d like to state that all the example provided apply the
same way to Shiny and Rmd documents. Secondly, in order to use
`fabricerin`, you always have to run the `use_fabric()` function at the
beginning of your app/document. The function activates the
[fabricjs](http://fabricjs.com/) library. Note that you’ll need to be
connected to the internet. Finally, `fabricerin` is not an R wrapper for
the fabricjs library. The package doesn’t cover all the capabilities of
the library. The `fabricerin` package only relies on some specified
features that according to me will help Shiny/Rmd users. Of course, if
you need some improvement, feel free to create a Pull Request.

### Create a canvas for taking notes

``` r
library(shiny)
library(fabricerin)


ui <- fluidPage(
  
  
  use_fabric(), # do not forget to include the use_fabric() function at the beginning of your document
  
  h1("You can take some notes below"), 
  
  fabric_drawing(cid = "canvas1", 
                 cwidth = 400, 
                 cheight = 400, 
                 drawingWidth = 5, 
                 drawingColor = "red")
)

server <- function(input, output){}

shinyApp(ui, server)
```
