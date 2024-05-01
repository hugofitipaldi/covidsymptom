# data-raw/mydataset.R
# Data import and processing pipeline

national_estimates <- utils::read.csv("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/nationella_senaste.csv")
county_estimates <- utils::read.csv("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/lan_senaste.csv")
postcode_estimates <- utils::read.csv("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/siffror_senaste.csv")
csss_tests <- utils::read.csv("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/csss_tester.csv")
symptoms <- utils::read.csv("https://raw.githubusercontent.com/csss-resultat/openData/main/datasets/csss_symptom.csv")

# Data cleaning
national_estimates$Datum <- as.Date(national_estimates$Datum, format = "%Y-%m-%d")
county_estimates$Datum <- as.Date(county_estimates$Datum, format = "%Y-%m-%d")
postcode_estimates$Datum <- as.Date(postcode_estimates$Datum, format = "%Y-%m-%d")
postcode_estimates$Postnummer <- as.character(postcode_estimates$Postnummer)
county_estimates$Lan <- stringi::stri_trans_general(str = county_estimates$Lan,id = "Latin-ASCII")
postcode_estimates$Ort <- stringi::stri_trans_general(str = postcode_estimates$Ort,id = "Latin-ASCII")
symptoms$Symptom <- stringi::stri_trans_general(str = symptoms$Symptom,id = "Latin-ASCII")
csss_tests$date <- as.Date(csss_tests$date, format = "%Y-%m-%d")
csss_tests$test_type <- "Snabbtester"

# Define the translation vector
translations <- c(
  Aptitloshet = "Loss of Appetite",
  Diarre = "Diarrhea",
  Feber = "Fever",
  `Forlorat eller forandrat lukt-/smaksinne` = "Lost or changed sense of smell or taste",
  `Frossa/huttrar` = "Chills or Shivering",
  Heshet = "Hoarseness",
  `Ihallande hosta` = "Persistent Cough",
  `Ont eller irritation i ogon` = "Eye pain or irritation",
  `Ont i halsen` = "Sore Throat",
  `Ovanlig muskelsmarta` = "Unusual muscle pain",
  `Svar trotthet` = "Severe fatigue"
)

# Apply the translations to the 'Symptom' column
symptoms$Symptom <- translations[symptoms$Symptom]

# Data update
usethis::use_data(national_estimates, county_estimates, postcode_estimates, csss_tests, symptoms,  overwrite = TRUE)
