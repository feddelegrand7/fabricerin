


jquery_dependency <- function() {
  htmltools::htmlDependency(
    name = "jQuery",
    version = "3.5.1",
    package = "fabricerin",
    src = c(
      file = "fabric",
      href = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"
    ),
    script = "jquery-3.5.1.min.js",
    all_files = FALSE
  )
}
