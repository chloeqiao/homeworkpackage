#' plot simultaneously the popularity of more than one name
#'
#' @param the_names name in the dataset
#'
#' @return graph
#' @export
#' @import prenoms
#' @import ggplot2
#' @import dplyr
#'
#'
#'
#' @examples
#' \dontrun{
#' draw_names(c("Diane"."Vincent"))
#'
#' }
#'
#'

draw_names<-function(the_names){
  data(prenoms)
  assert_that(is.character(the_names))
  assert_that(not_empty(prenoms))
  prenoms %>%
    filter(name %in% the_names) %>%
    group_by(year,name) %>%
    summarise(total=sum(n)) %>%
    ggplot(aes(x=year, y=total,color=name)) + geom_line()
}
