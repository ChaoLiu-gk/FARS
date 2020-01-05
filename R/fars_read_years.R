#' Return \code{month} column at each year
#'
#' @param years A numeric vector of years
#'
#' @return A list of \code{month} under specific \code{year} for all input \code{years}, or an error message \code{invalid year: year}"
#'
#' @importFrom dplyr mutate select
#' @importFrom magrittr %>%
#'
#' @examples
#' dat_list <- fars_read_years(c(2013, 2014, 2015))
#'
#' @seealso \code{\link{make_filename}}
#' @seealso \code{\link{fars_read}}
#'
#' @export


fars_read_years <- function(years) {
    lapply(years, function(year) {
        file <- make_filename(year)
        tryCatch({
            dat <- fars_read(file)
            dplyr::mutate(dat, year = year) %>%
                dplyr::select(MONTH, year)
        }, error = function(e) {
            warning("invalid year: ", year)
            return(NULL)
        })
    })
}
