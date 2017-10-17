#' plot the popularity of babynames in times
#'
#' @param the_name name in the dataset
#' @param the_sex sex of the chosen name
#'
#' @return graph
#' @export
#' @import prenoms
#' @import ggplot2
#' @import dplyr
#'
#' @examples
#' \dontrun{
#' draw_a_name("...","M")
#'
#' }
#'
draw_a_name<-function(the_name, the_sex){
  data(prenoms)
  assert_that(not_empty(prenoms))
  assert_that(is.character(the_name))

  prenoms %>%
    filter(name==the_name,sex==the_sex) %>%
    group_by(year) %>%
    summarise(total = sum(n)) %>%
    ggplot(aes(x=year, y=total))+geom_line()

}
