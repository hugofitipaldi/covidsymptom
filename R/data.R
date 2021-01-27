#' @title national_estimates
#' @description COVID Symptom Study data - national level
#' @format A data frame with 261 rows and 4 variables:
#' \describe{
#'   \item{\code{Datum}}{double Date}
#'   \item{\code{Uppskattning}}{double Prediction (%) of covid for Sweden based on reported symptoms}
#'   \item{\code{Low_CI}}{double Confidence Interval - lower bound}
#'   \item{\code{High_CI}}{double Confidence Interval - higher bound}
#'}
#' @source \url{http://somewhere.important.com/}
"national_estimates"

#' @title county_estimates
#' @description COVID Symptom Study data - county level
#' @format A data frame with 5481 rows and 5 variables:
#' \describe{
#'   \item{\code{Lan}}{character Swedish county}
#'   \item{\code{Datum}}{double Date}
#'   \item{\code{Uppskattning}}{double Prediction of covid for county based on reported symptoms}
#'   \item{\code{Low_CI}}{double Confidence Interval - lower bound}
#'   \item{\code{High_CI}}{double Confidence Interval - higher bound}
#'}
#' @source \url{http://somewhere.important.com/}
"county_estimates"

#' @title postcode_estimates
#' @description COVID Symptom Study data - 2-digit postcode level
#' @format A data frame with 22427 rows and 5 variables:
#' \describe{
#'   \item{\code{Postnummer}}{integer 2-digit postal code region}
#'   \item{\code{Datum}}{double Date}
#'   \item{\code{Uppskattning}}{double Prediction of covid for 2-digit region based on reported symptoms}
#'   \item{\code{Low_CI}}{double Confidence Interval - lower bound}
#'   \item{\code{High_CI}}{double Confidence Interval - higher bound}
#'}
#' @source \url{http://somewhere.important.com/}
"postcode_estimates"

