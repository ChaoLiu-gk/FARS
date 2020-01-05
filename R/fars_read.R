#' Import fars file
#'
#' @description \code{fars_read} import the fars file with the directory as argument.
#'
#' @param filename The directory to the file to be imported. Data dictionary can be obtained as:
#' \itemize{
#'     \item{\code{system.file("extdata", "accident_2013.csv.bz2", package = "FARS")}}
#'     \item{\code{system.file("extdata", "accident_2014.csv.bz2", package = "FARS")}}
#'     \item{\code{system.file("extdata", "accident_2015.csv.bz2", package = "FARS")}}
#' }
#'
#' @return A data frame with data stored from the csv file, or an error if the file does not exist.
#'
#' @examples
#' dat <- fars_read("accident_2013.csv.bz2")
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' @seealso \code{\link{make_filename}}
#'
#' @export

fars_read <- function(filename) {

    filedir <- system.file("extdata", filename, package = "FARS")

    if(!file.exists(filedir))
        stop("file '", filename, "' does not exist")
    data <- suppressMessages({
        readr::read_csv(filedir, progress = FALSE)
    })
    dplyr::tbl_df(data)

}
