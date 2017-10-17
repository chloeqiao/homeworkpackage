#' import all sheets from an xlsx file
#'
#' @param file path to a an xlsx file
#'
#' @return list
#' @export
#' @import readxl
#'
#' @examples
#' \dontrun{
#' multi_excel("../../name.xlsx")
#'
#' }
#'
#'
#'
multi_excel <- function(file) {
  assert_that(has_extension(file,"xlsx"))
  assert_that(not_empty(file))
  assert_that(is.readable(file))
  all_sheets <- readxl::excel_sheets(file)
  result <- lapply(all_sheets, function(sheet) {
    readxl::read_excel(file, sheet = sheet)
  })
  return(result)
}
