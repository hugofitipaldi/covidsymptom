#' Retrieve updated COVID Symptom Study Sweden (CSSS) data
#'
#' Downloads latest version of CSSS data.
#'
#' This function was designed to download the latest data from COVID Symptom Study Sweden without the need to update the package on a regular basis.
#'
#' @param data_level selects which data set from CSSS you want to download: "national" (default), "county" or "postcode"
#'
#' @author Hugo Fitipaldi
#'
#' @import rio
#' @import stringi
#'
#' @return This function returns the selected \code{data.frame}
#' @export
#'
#' @examples
#' df <- get_latest_data(data_level = "county")
#'
get_latest_data <- function(data_level = c("national", "county", "postcode")) {

  data_level  <- match.arg(data_level)
  if (data_level == "national") {
    level_national <- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/nationella_senaste.csv")
    level_national$Datum <- as.Date(level_national$Datum, format = "%Y-%m-%d")
    return(level_national)

  } else if (data_level == "county") {
    level_county <- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/lan_senaste.csv")
    level_county$Datum <- as.Date(level_county$Datum, format = "%Y-%m-%d")
    level_county$Lan <- stringi::stri_trans_general(str = level_county$Lan,id = "Latin-ASCII")
    return(level_county)

  } else if (data_level == "postcode") {
    level_postcode <- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/siffror_senaste.csv")
    level_postcode$Datum <- as.Date(level_postcode$Datum, format = "%Y-%m-%d")
    level_postcode$Ort <- stringi::stri_trans_general(str = level_postcode$Ort,id = "Latin-ASCII")
    return(level_postcode)
  }

}
