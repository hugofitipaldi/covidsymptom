#' Update COVID Symptom Study Sweden (CSSS) data
#'
#' Update the package datasets on the global environment with the most recent data on the dev version
#'
#' This function enables to refresh the package dataset to the most up-to-date data by re-installing the dev version of the package.
#' Changes will be available on the global environment
#'
#' @param silence logical function to supress messages
#' @author Hugo Fitipaldi
#'
#' @import rio
#' @import remotes
#'
#' @return Updated data.frames
#' @export
#'
#' @examples
#' update_csss_data()
#'

update_csss_data <- function(silence = FALSE){

  flag <- FALSE
  cat(paste0("\033[4;", 32, "m","Checking for updates for the covidsymptom package","\033[0m","\n"))
  cat("covidsymptom dataset...")
  national_csv <- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/nationella_senaste.csv")
  national_csv$Datum <- as.Date(national_csv$Datum, format = "%Y-%m-%d")

  covidsymptom_current <- covidsymptom::national_estimates
  if(!base::identical(national_csv, covidsymptom_current)){
    if(base::nrow(national_csv) > base::nrow(covidsymptom_current)){
      flag <- TRUE
    }
  }

  if(flag){
    if(!silence){
      q <- base::tolower(base::readline("Updates are available on the covidsymptom dev version, do you want to update? n/Y"))
    } else {
      q <- "y"
    }
    if(q == "y" | q == "yes"){

      base::tryCatch(
        expr = {
          remotes::install_github("csss-resultat/covidsymptom")

          if ("covidsymptom" %in% names(utils::sessionInfo()$otherPkgs)) {
            detach(package:covidsymptom, unload = TRUE)
            library(covidsymptom)
          }
        },
        error = function(e){
          message('Caught an error!')
          print(e)
        },
        warning = function(w){
          message('Caught an warning!')
          print(w)
        }

      )
    }
  } else {
    base::message(" no updates are available")
  }
}
