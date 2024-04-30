#' Retrieve updated COVID Symptom Study Sweden (CSSS) data
#'
#' This function was originally designed to download the latest version of CSSS data dynamically. Due to the cessation of data updates from the COVID Symptom Study Sweden, this function now checks if locally stored data is up-to-date and notifies the user accordingly. The function will not fetch new data from online sources.
#'
#' Note: As the COVID Symptom Study Sweden is no longer updating their data sets, this function serves as a demonstration of how data updates could be managed without needing frequent package updates. It returns the data that was last available before updates were discontinued.
#'
#' @param data_level A character string specifying which data set from CSSS you want to "download". Can be "national" (default), "county", or "postcode".
#'
#' @return This function returns a \code{data.frame} containing the data for the specified level. Data returned is the last available snapshot stored within the package.
#'
#' @export
#'
#' @author Hugo Fitipaldi
#'
#' @examples
#' # The following example demonstrates how to retrieve data at the county level.
#' # Since the online data source is no longer available, the returned data will be the last snapshot provided by the package.
#' df <- get_latest_data(data_level = "county")

get_latest_data <- function(data_level = c("national", "county", "postcode")) {
  data_level  <- match.arg(data_level)

  if (data_level == "national") {
    level_national <- utils::read.csv("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/nationella_senaste.csv")
    level_national$Datum <- as.Date(level_national$Datum, format = "%Y-%m-%d")

    # Corrected the missing parentheses in the if condition
    if (max(level_national$Datum) == max(covidsymptom::national_estimates$Datum)) {
      return("Your data is up-to-date")
    } else {
      return(level_national)
    }

  } else if (data_level == "county") {
    level_county <- utils::read.csv("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/lan_senaste.csv")
    level_county$Datum <- as.Date(level_county$Datum, format = "%Y-%m-%d")
    level_county$Lan <- stringi::stri_trans_general(str = level_county$Lan, id = "Latin-ASCII")

    if (max(level_county$Datum) == max(covidsymptom::county_estimates$Datum)) {
      return("Your data is up-to-date")
    } else {
      return(level_county)
    }

  } else if (data_level == "postcode") {
    level_postcode <- utils::read.csv("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/siffror_senaste.csv")
    level_postcode$Datum <- as.Date(level_postcode$Datum, format = "%Y-%m-%d")
    level_postcode$Ort <- stringi::stri_trans_general(str = level_postcode$Ort, id = "Latin-ASCII")

    if (max(level_postdate$Datum) == max(covidsymptom::postcode_estimates$Datum)) {
      return("Your data is up-to-date")
    } else {
      return(level_postcode)
    }
  }
}
