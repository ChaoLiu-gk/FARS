#' Mark the incidence location on a map
#'
#' @description \code{fars_map_state} extracts the geometry information of each accident from fars data and plot them
#' to the map.
#'
#' @param state.num A state number in numeric or integer format
#' @param year A year in numeric format
#'
#' @return \code{fars_map_state} returns a map plot with each accident marked on it. It will return an error message \code{invalid STATE number: state.num}
#' if the \code{state.num} cannot be located in the fars data. If there is no accidents found in the query,
#' the function will return a message \code{no accidents to plot}.
#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' @seealso \code{\link{make_filename}}
#' @seealso \code{\link{fars_read}}
#'
#' @references the US National Highway Traffic Safety Administration's Fatality Analysis Reporting System.
#' \href{*Fatality Analysis Reporting System*}{https://www.nhtsa.gov/Data/Fatality-Analysis-Reporting-System-(FARS)}
#'
#' @examples
#' setwd(system.file("extdata", package = "FARS"))
#' fars_map_state(state.num = 30, year = 2013)
#'
#' @export

fars_map_state <- function(state.num, year) {

        filename <- make_filename(year)
        data <- fars_read(filename)
        state.num <- as.integer(state.num)

        if(!(state.num %in% unique(data$STATE)))
                stop("invalid STATE number: ", state.num)
        data.sub <- dplyr::filter(data, STATE == state.num)
        if(nrow(data.sub) == 0L) {
                message("no accidents to plot")
                return(invisible(NULL))
        }
        is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 200
        is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
        with(data.sub, {
                maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
                          xlim = range(LONGITUD, na.rm = TRUE))
                graphics::points(LONGITUD, LATITUDE, pch = 46)
        })
}
