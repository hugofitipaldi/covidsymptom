#' Update COVID Symptom Study Sweden (CSSS) data
#'
#' @description
#' Update the package datasets on the global environment with the most recent data on the dev version
#'
#' This function enables to refresh the package dataset to the most up-to-date data by re-installing the dev version of the package.
#' Changes will be available on the global environment
#'
#' This function was intended to update the package datasets with the most recent data.
#' It has been disabled as the dataset is no longer updated.
#'
#' @param silence logical function to supress messages
#' @author Hugo Fitipaldi
#'
#' @return Updated data.frames
#' @export
#'
#' @examples
#' update_csss_data() # This will now produce an error.
#'

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
  stop("This function has been disabled as the CSSS data is no longer being updated.")
}
