#' Function to retrieve latest COVID Symptom Study - Sweden datasets
#'
#' This function imports the later CSSS datasets
#'
#' @param infile dataset level
#' @return selected dataset
#' @export
get_latest_data <- function(data_level = c("all", "national", "county", "postcode")) {

  data_level  <- match.arg(data_level)
  if(data_level == "all"){

    level_national <<- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/nationella_senaste.csv")
    level_county <<- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/lan_senaste.csv")
    level_postcode <<- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/siffror_senaste.csv")

  } else if (data_level == "national") {
    level_national <<- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/nationella_senaste.csv")

  } else if (data_level == "county") {
    level_county <<- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/lan_senaste.csv")

  } else if (data_level == "postcode") {
    level_postcode <<- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/siffror_senaste.csv")
  }

}

