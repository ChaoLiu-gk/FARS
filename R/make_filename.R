#' Make fars file name
#'
#' @description \code{make_filename} returns a character string with the format of "accident_\code{year}.csv.bz2" as file name
#'
#' @return a file name for accident data at different years. No specific error checking was enclosed.
#'
#' @param year A numeric value of year
#'
#' @return A character vector containing character strings with the input \code{year}
#'
#' @examples
#' make_filename(2013)
#'
#' @seealso \code{\link{fars_read}}
#'
#' @export


make_filename <- function(year) {
    year <- as.integer(year)
    sprintf("accident_%d.csv.bz2", year)
}
