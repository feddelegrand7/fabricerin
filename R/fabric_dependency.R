



fabric_dependency <- function() {
  htmltools::htmlDependency(
    name = "fabric",
    version = "3.6.3",
    package = "fabricerin",
    src = c(
      file = "fabric",
      href = "https://cdnjs.cloudflare.com/ajax/libs/fabric.js/3.6.3/"
    ),
    script = "fabric.min.js",
    all_files = FALSE
  )
}
