% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fars_map_state.R
\name{fars_map_state}
\alias{fars_map_state}
\title{Mark the incidence location on a map}
\usage{
fars_map_state(state.num, year)
}
\arguments{
\item{state.num}{A state number in numeric or integer format}

\item{year}{A year in numeric format}
}
\value{
\code{fars_map_state} returns a map plot with each accident marked on it. It will return an error message \code{invalid STATE number: state.num}
if the \code{state.num} cannot be located in the fars data. If there is no accidents found in the query,
the function will return a message \code{no accidents to plot}.
}
\description{
\code{fars_map_state} extracts the geometry information of each accident from fars data and plot them
to the map.
}
\examples{
fars_map_state(state.num = 30, year = 2013)

}
\references{
the US National Highway Traffic Safety Administration's Fatality Analysis Reporting System.
\href{*Fatality Analysis Reporting System*}{https://www.nhtsa.gov/Data/Fatality-Analysis-Reporting-System-(FARS)}
}
\seealso{
\code{\link{make_filename}}

\code{\link{fars_read}}
}
