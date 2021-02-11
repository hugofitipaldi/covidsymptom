#' Function to retrieve latest COVID Symptom Study - Sweden datasets
#'
#' On top of the pre-loaded datasets in this packages, this function is an easy way to download the latest data from
#' COVID Symptom Study Sweden without updating the package.
#'
#' @param data_level selects which dataset from CSSS you want to download
#' @return selected dataset
#' @export
get_latest_data <- function(data_level = c("national", "county", "postcode")) {

  data_level  <- match.arg(data_level)
  if (data_level == "national") {
    level_national <- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/nationella_senaste.csv")

  } else if (data_level == "county") {
    level_county <- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/lan_senaste.csv")

  } else if (data_level == "postcode") {
    level_postcode <- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/siffror_senaste.csv")
  }

}
