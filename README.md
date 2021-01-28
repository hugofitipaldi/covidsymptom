# covidsymptom

<!-- badges: start --->

<!-- badges: end -->
<center>
[<img src="man/figures/covid_logo.png" width="60%" />](https://www.covid19app.lu.se/)
</center>

The covidsymptom R package provides an easy way to import open data from the COVID Symptom Study-Sweden. The package includes three datasets:

- `national_estimates` - daily estimated incidence of symptomatic COVID-19 in Sweden
- `county_estimates` - daily estimated incidence of symptomatic COVID-19 in Swedish counties
- `postcode_estimates` - daily estimated incidence of symptomatic COVID-19 in smaller Swedish regions (2-digit postcodes)


## Installation

Install the Github version:

``` r
# install.packages("devtools")
devtools::install_github("csss-resultat/covidsymptom")
```

## Dashboard

A supporting dashboard is available [here](https://csss-resultat.shinyapps.io/csss_dashboard/)

<center>
[<img src="man/figures/dashboard.png" width="100%" />](https://csss-resultat.shinyapps.io/csss_dashboard/)
</center>


## About COVID Symptom Study - Sweden

COVID Symptom Study Sweden uses an app to collect data from study participants. The app COVID Symptom Study was developed by the British health company ZOE Global Ltd with the help of scientific analyzes from King's College London and Guys and St Thomas hospitals in London and launched in the UK on March 23, 2020. On April 29, 2020, the app was launched in Sweden after adapting to Swedish conditions . The app is maintained by Zoe Global Ltd and ZOE shares data collected in Sweden with Lund University for processing and analysis.

