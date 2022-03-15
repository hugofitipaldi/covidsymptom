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
#' @source COVID Symptom Study-Sweden.
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
#' @source COVID Symptom Study-Sweden.
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
#' @source COVID Symptom Study-Sweden.
#' @keywords datasets coronavirus COVID19
#' @details This dataset contains daily estimated prevalence of symptomatic covid-19
#' in swedish 2-digit postcode regions.
#' @examples
#' data(postcode_estimates)
"postcode_estimates"

#' Daily covid-19 tests reported in the COVID Symptom Study Sweden
#'
#' A dataset containing daily reported number of covid-19 tests and the proportion of positive results
#'
#' @format A data frame of 4 columns
#' \describe{
#'  \item{date}{Date of report}
#'  \item{total_tests}{Number of tests}
#'  \item{proportion_positive}{Proportion of positive tests}
#'  \item{test_type}{Type of test: snabbtest (antigen) or PCR}
#' }
#' @source COVID Symptom Study-Sweden.
#' @keywords datasets coronavirus COVID19
#' @details This dataset contains daily reports of covid-19 tests and the proportion of positive results
#' in swedish 2-digit postcode regions.
#' @examples
#' data(csss_tests)
"csss_tests"

#' Daily proportion of symptoms reported by CSSS users
#'
#' A dataset containing daily reported number of covid-19 tests and the proportion of positive results
#'
#' @format A data frame of 4 columns
#' \describe{
#'  \item{Datum}{Date of report}
#'  \item{Symptom}{Symptom}
#'  \item{Andel}{Proportion of symptom}
#'  \item{Vikt}{Weight related to covid19: positiv or negativ}
#' }
#' @source COVID Symptom Study-Sweden.
#' @keywords datasets coronavirus COVID19
#' @details This dataset contains daily reports of covid-19 tests and the proportion of positive results
#' in swedish 2-digit postcode regions.
#' @examples
#' data(csss_tests)
"symptoms"
