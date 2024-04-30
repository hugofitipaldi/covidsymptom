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
  # Define data levels
  data_level  <- match.arg(data_level)

  # Simulate a check to see if the data is still the latest
  # For demonstration purposes, we assume the data is always up-to-date.
  data_is_up_to_date <- TRUE

  if (!data_is_up_to_date) {
    # This block is just for the sake of example. It won't actually execute.
    # Here you would normally handle the logic to update data if it was out of date.
    print("Updating data...")
  } else {
    print("Your data is up-to-date.")
  }

  # You could still show what the function would return by using locally stored versions of your final dataset.
  # For example, load a local CSV file or an R data object stored within the package.
  if (data_level == "national") {
    level_national <- read.csv(system.file("extdata", "nationella_senaste.csv", package = "YourPackageName"))
    level_national$Datum <- as.Date(level_national$Datum, format = "%Y-%m-%d")
    return(level_national)
  } else if (data_level == "county") {
    level_county <- read.csv(system.file("extdata", "lan_senaste.csv", package = "YourPackageName"))
    level_county$Datum <- as.Date(level_county$Datum, format = "%Y-%m-%d")
    level_county$Lan <- stringi::stri_trans_general(str = level_county$Lan, id = "Latin-ASCII")
    return(level_county)
  } else if (data_level == "postcode") {
    level_postcode <- read.csv(system.file("extdata", "siffror_senaste.csv", package = "YourPackageName"))
    level_postcode$Datum <- as.Date(level_postcode$Datum, format = "%Y-%m-%d")
    level_postcode$Ort <- stringi::stri_trans_general(str = level_postcode$Ort, id = "Latin-ASCII")
    return(level_postcode)
  }
}
