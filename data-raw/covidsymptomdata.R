# data-raw/mydataset.R
# Data import and processing pipeline

national_estimates <- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/nationella_senaste.csv")
county_estimates <- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/lan_senaste.csv")
postcode_estimates <- rio::import("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/siffror_senaste.csv")


# Data cleaning code here...
national_estimates$Datum <- as.Date(national_estimates$Datum, format = "%Y-%m-%d")
county_estimates$Datum <- as.Date(county_estimates$Datum, format = "%Y-%m-%d")
postcode_estimates$Datum <- as.Date(postcode_estimates$Datum, format = "%Y-%m-%d")

# This should be the last line.
# Note that names are unquoted.
# I like using overwrite = T so everytime I run the script the
# updated objects are saved, but the default is overwrite = F
usethis::use_data(national_estimates, county_estimates, postcode_estimates, overwrite = TRUE)
