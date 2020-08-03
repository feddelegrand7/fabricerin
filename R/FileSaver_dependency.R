


filesaver_dependency <- function() {
  htmltools::htmlDependency(
    name = "FileSaver",
    version = "2.0.2",
    package = "fabricerin",
    src = c(
      file = "fabric",
      href = "https://cdn.jsdelivr.net/npm/file-saver@2.0.2/dist/FileSaver.min.js"
    ),
    script = "FileSaver.min.js",
    all_files = FALSE
  )
}

