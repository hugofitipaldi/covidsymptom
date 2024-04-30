#' Update COVID Symptom Study Sweden (CSSS) data
#'
#' @description
#' Originally, this function would update the package datasets in the global environment with the most recent data from the development version of the package. However, as updates to the CSSS dataset have been discontinued, this function now simply notifies that no updates are available.
#'
#' This function served to ensure that the package datasets remained up-to-date without requiring a full package reinstallation. It would compare the local version of the data with the latest online version and offer to update if newer data were found.
#'
#' Due to the discontinuation of data updates from CSSS, this function now only serves to inform users that no new updates will be provided, preserving its structure for educational or demonstration purposes.
#'
#' @param silence A logical parameter (default FALSE) to suppress messages. Setting this parameter will not affect the functionality now as the function does not perform any operations.
#'
#' @return None. This function now simply prints a message to the console indicating that the function has been disabled and no updates are available.
#'
#' @export
#'
#' @author Hugo Fitipaldi
#'
#' @examples
#' update_csss_data() # This will print a message that no updates are available.

# update_csss_data <- function(silence = FALSE){
#
#   flag <- FALSE
#   cat(paste0("\033[4;", 32, "m","Checking for updates for the covidsymptom package","\033[0m","\n"))
#   cat("covidsymptom dataset...")
#   national_csv <- utils::read.csv("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/nationella_senaste.csv")
#   national_csv$Datum <- as.Date(national_csv$Datum, format = "%Y-%m-%d")
#
#   covidsymptom_current <- covidsymptom::national_estimates
#   if(!base::identical(national_csv, covidsymptom_current)){
#     if(base::nrow(national_csv) > base::nrow(covidsymptom_current)){
#       flag <- TRUE
#     }
#   }
#
#   if(flag){
#     if(!silence){
#       q <- base::tolower(base::readline("Updates are available on the covidsymptom dev version, do you want to install this version? n/Y"))
#     } else {
#       q <- "y"
#     }
#     if(q == "y" | q == "yes"){
#
#       if ("package:covidsymptom" %in% search()) { detach("package:covidsymptom", unload=TRUE) }
#       if ("covidsymptom" %in% rownames(utils::installed.packages())) { utils::remove.packages("covidsymptom")}
#       base::tryCatch(
#         expr = {
#           devtools::install_github("csss-resultat/covidsymptom",
#                                   upgrade = "never",
#                                   ref = "master")
#           if ("covidsymptom" %in% names(utils::sessionInfo()$otherPkgs)) {
#             detach(package:covidsymptom, unload = TRUE)
#             library(covidsymptom)
#           }
#         },
#
#         error = function(e){
#           message('Caught an error!')
#           print(e)
#         },
#         warning = function(w){
#           message('Caught an warning!')
#           print(w)
#         }
#
#       )
#     }
#   } else {
#     base::message(" no updates are available")
#   }
# }

update_csss_data <- function(silence = FALSE) {
  print("This function has been disabled as the CSSS data is no longer being updated.")
}
