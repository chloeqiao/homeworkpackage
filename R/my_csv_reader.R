#' import all csv from a folder
#'
#' @param folder path to the folder
#'
#' @return a list
#' @export
#' @importFrom utils read.csv2
#'
#' @examples
#' \dontrun{
#'
#' my_csv_reader(../../../path)
#'
#' }
#'
my_csv_reader <- function(folder){
  csvlist <- list.files(path = folder, pattern = ".*csv$", full.names = TRUE)
  assert_that(is.dir(folder))
  assert_that(not_empty(csvlist))
  for (i in csvlist){
    assert_that(has_extension(i,"csv"))
  }
  result <- lapply(csvlist,read.csv2)
  return(result)
}
