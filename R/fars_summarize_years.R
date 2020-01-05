#' Summarize fars data
#'
#' @description \code{fars_summarize_years} returns a data frame with number of total accident under
#' each month in different years
#'
#' @param years A numeric vector of years
#'
#' @importFrom dplyr bind_rows group_by summarize
#' @importFrom magrittr %>%
#' @importFrom tidyr spread
#'
#' @seealso \code{\link{fars_read_years}}
#'
#' @examples
#' setwd(system.file("extdata", package = "FARS"))
#' fars_summarize_year(2013:2015)
#'
#' @export

fars_summarize_years <- function(years) {
    dat_list <- fars_read_years(years)
    dplyr::bind_rows(dat_list) %>%
        dplyr::group_by(year, MONTH) %>%
        dplyr::summarize(n = n()) %>%
        tidyr::spread(year, n)
}

