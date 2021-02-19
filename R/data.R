#' Estimates of COVID-19 in Sweden (national level)
#'
#' A dataset containing predictions of COVID Symptom Study Sweden at national level
#'
#' @format A data frame of 4 columns
#' \describe{
#'  \item{Datum}{Date of prediction}
#'  \item{Uppskattning}{Estimated prevalence of COVID-19 in Sweden}
#'  \item{Low_CI}{Confidence Interval Lower Bound}
#'  \item{High_CI}{Confidence Interval Higher Bound}
#' }
#' @source COVID Symptom Study-Sweden \href{https://www.covid19app.lu.se/}{website}.
#' @keywords datasets coronavirus COVID19
#' @details This dataset contains daily estimated prevalence of symptomatic covid-19
#' in Sweden.
#' @examples
#' data(national_estimates)
"national_estimates"

#' Estimates of COVID-19 in Sweden (county level)
#'
#' A dataset containing predictions of COVID Symptom Study Sweden at national level
#'
#' @format A data frame of 5 columns
#' \describe{
#'  \item{Lan}{Swedish county}
#'  \item{Datum}{Date of prediction}
#'  \item{Uppskattning}{Estimated prevalence of COVID-19 in Sweden}
#'  \item{Low_CI}{Confidence Interval Lower Bound}
#'  \item{High_CI}{Confidence Interval Higher Bound}
#' }
#' @source COVID Symptom Study-Sweden \href{https://www.covid19app.lu.se/}{website}.
#' @keywords datasets coronavirus COVID19
#' @details This dataset contains daily estimated prevalence of symptomatic covid-19
#' in swedish counties.
#' @examples
#' data(county_estimates)
"county_estimates"

#' Estimates of COVID-19 in Sweden (2-digit postal code level)
#'
#' A dataset containing predictions of COVID Symptom Study Sweden at national level
#'
#' @format A data frame of 5 columns
#' \describe{
#'  \item{Postnummer}{2-digit postal code area}
#'  \item{Datum}{Date of prediction}
#'  \item{Uppskattning}{Estimated prevalence of COVID-19 in Sweden}
#'  \item{Low_CI}{Confidence Interval Lower Bound}
#'  \item{High_CI}{Confidence Interval Higher Bound}
#'  \item{Ort}{Regions/cities within the postcode area }
#' }
#' @source COVID Symptom Study-Sweden \href{https://www.covid19app.lu.se/}{website}.
#' @keywords datasets coronavirus COVID19
#' @details This dataset contains daily estimated prevalence of symptomatic covid-19
#' in swedish 2-digit postcode regions.
#' @examples
#' data(postcode_estimates)
"postcode_estimates"

