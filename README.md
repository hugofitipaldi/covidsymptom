# covidsymptom <a href='https://github.com/csss-resultat/covidsymptom'><img src='man/figures/hex2.png' width="15%" align="right"  /></a>

<!-- badges: start --->

<!-- badges: end -->

The covidsymptom R package provides an easy way to import open data from the COVID Symptom Study-Sweden. The package includes three datasets:

- `national_estimates` - daily estimated incidence of symptomatic COVID-19 in Sweden
- `county_estimates` - daily estimated incidence of symptomatic COVID-19 in Swedish counties
- `postcode_estimates` - daily estimated incidence of symptomatic COVID-19 in smaller Swedish regions (2-digit postcodes)


## Installation

Development version of the package can be installed from Github with:

``` r
install.packages("remotes")
remotes::install_github("csss-resultat/covidsymptom")
```

## Dashboard

A supporting dashboard is available [here](https://csss-resultat.shinyapps.io/csss_dashboard/)

<img src="man/figures/dashboard.png" width="100%" />


## About COVID Symptom Study - Sweden

COVID Symptom Study Sweden uses an app to collect data from study participants. The app COVID Symptom Study was developed by the British health company ZOE Global Ltd with the help of scientific analyzes from King's College London and Guys and St Thomas hospitals in London and launched in the UK on March 23, 2020. On April 29, 2020, the app was launched in Sweden after adapting to Swedish conditions . The app is maintained by Zoe Global Ltd and ZOE shares data collected in Sweden with Lund University for processing and analysis.

