# data-raw/mydataset.R
# Data import and processing pipeline

national_estimates <- utils::read.csv("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/nationella_senaste.csv")
county_estimates <- utils::read.csv("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/lan_senaste.csv")
postcode_estimates <- utils::read.csv("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/siffror_senaste.csv")


# Data cleaning
national_estimates$Datum <- as.Date(national_estimates$Datum, format = "%Y-%m-%d")
county_estimates$Datum <- as.Date(county_estimates$Datum, format = "%Y-%m-%d")
postcode_estimates$Datum <- as.Date(postcode_estimates$Datum, format = "%Y-%m-%d")
postcode_estimates$Postnummer <- as.character(postcode_estimates$Postnummer)
county_estimates$Lan <- stringi::stri_trans_general(str = county_estimates$Lan,id = "Latin-ASCII")
postcode_estimates$Ort <- stringi::stri_trans_general(str = postcode_estimates$Ort,id = "Latin-ASCII")

# Data update
usethis::use_data(national_estimates, county_estimates, postcode_estimates, overwrite = TRUE)
