#' save a data.frame in a csv file
#'
#'
#'
#' @param dataset a data.frame
#' @param filename the name of the output csv
#' @param row.names attribute of the data.frame
#'
#' @return csv file
#' @export
#' @importFrom utils write.csv2
#'
#' @examples
#' \dontrun{
#' save_as_csv(..,"name.csv")
#'
#' }
#'
#'
save_as_csv <- function(dataset, filename, row.names = FALSE) {
  assert_that(has_extension(filename,"csv"))
  assert_that(is.dir(dirname(filename)))
  assert_that(is.writeable(dirname(filename)))
  assert_that(not_empty(dataset))
  assert_that(is.data.frame(dataset))
  write.csv2(x = dataset, file = filename, row.names = row.names)
  invisible(normalizePath(filename))
}
