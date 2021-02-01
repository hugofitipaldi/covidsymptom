
# covidsymptom <a href='https://github.com/csss-resultat/covidsymptom'><img src='man/figures/hex2.png' width="15%" align="right"  /></a>

<!-- badges: start --->

<!-- badges: end -->

The covidsymptom R package provides an easy way to import open data from
the COVID Symptom Study-Sweden. The package includes three datasets:

  - `national_estimates` - daily estimated incidence of symptomatic
    COVID-19 in Sweden
  - `county_estimates` - daily estimated incidence of symptomatic
    COVID-19 in Swedish counties
  - `postcode_estimates` - daily estimated incidence of symptomatic
    COVID-19 in smaller Swedish regions (2-digit postcodes)

## Installation

Development version of the package can be installed from Github with:

``` r
install.packages("remotes")
remotes::install_github("csss-resultat/covidsymptom")
```

## Update data

Data from COVID Symptom Study - Sweden is updated on a daily basis. If
you want to avoid updating the package to have the most recent data, you
can use the function get\_latest\_data() to import the latest version
available:

``` r
library(covidsymptom)
get_latest_data()

head(level_national)
#>        Datum Uppskattning Low_CI High_CI
#> 1 2020-05-11         0.66   0.60    0.74
#> 2 2020-05-12         0.69   0.63    0.77
#> 3 2020-05-13         0.71   0.65    0.79
#> 4 2020-05-14         0.72   0.65    0.79
#> 5 2020-05-15         0.71   0.65    0.78
#> 6 2020-05-16         0.70   0.64    0.77
```

## Usage

  - National estimates

<!-- end list -->

``` r
library(ggplot2)
library(dplyr)

covidsymptom::national_estimates %>%
  ggplot(aes(x = Datum, y = Uppskattning)) +
  geom_line(col = "#a60f61") +
  geom_point(col = "#a60f61", size = 0.5) +
  labs(x = "Date", y = "Predicted number of cases as % of the population",
       title = "Predicted Number of COVID-19 Cases by Date",
       subtitle = "")  +
  scale_y_continuous(limits = c(0, 1),
                     breaks = seq(0, 1, 0.2),
                     labels = paste0(format(seq(0, 1, 0.2), decimal.mark = ","), " %"), # add % sign to the labels
                     expand = c(0,0)) +
  scale_x_date(date_breaks = "10 days", date_labels = "%d %b") + # can be "1 day", "2 days", etc.
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), panel.grid.minor.x = element_blank()) +
  geom_ribbon(aes(ymin = Low_CI, ymax = High_CI), fill = "#a60f61", alpha = 0.09)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

  - Counties’ estimates

<!-- end list -->

``` r
library(ggplot2)
library(dplyr)
library(lubridate)

counties_selection <- c("Skåne", "Stockholm", "Västra Götaland", "Uppsala")

covidsymptom::county_estimates %>%
  filter(Lan %in% counties_selection) %>%
  ggplot(aes(x = Datum, y = Uppskattning, color = Lan)) +
      geom_line() +
      geom_point(size = 0.5) +
      labs(x = "Datum", y = "Uppskattad förekomst", title = "% Uppskattad förekomst av symtomatisk covid-19", subtitle = "") +
      scale_x_date(date_breaks = "30 days") +
      theme_minimal() + 
      theme(axis.text.x = element_text(angle = 45, hjust = 1), panel.grid.minor.x = element_blank(),
            legend.position = "none", plot.title = element_text(hjust = 0.5)) + 
      geom_ribbon(aes(ymin = Low_CI, ymax = High_CI), color = "transparent", fill = "#a60f61", alpha = 0.09) +
      facet_wrap(. ~ Lan) 
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

  - 2-digit postcodes’ estimates

COVID Symptom Study - Sweden provides also predictions at
<a href = "https://csss-resultat.github.io/sverige2siffror/">2-digit
postcode levels</a>.

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#hggceufoow .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 12px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: transparent;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: transparent;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#hggceufoow .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hggceufoow .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#hggceufoow .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#hggceufoow .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hggceufoow .gt_col_headings {
  border-top-style: solid;
  border-top-width: 3px;
  border-top-color: transparent;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hggceufoow .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#hggceufoow .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#hggceufoow .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#hggceufoow .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#hggceufoow .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#hggceufoow .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: grey;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#hggceufoow .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: grey;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#hggceufoow .gt_from_md > :first-child {
  margin-top: 0;
}

#hggceufoow .gt_from_md > :last-child {
  margin-bottom: 0;
}

#hggceufoow .gt_row {
  padding-top: 3px;
  padding-bottom: 3px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#hggceufoow .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#hggceufoow .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hggceufoow .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#hggceufoow .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hggceufoow .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#hggceufoow .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#hggceufoow .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hggceufoow .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hggceufoow .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#hggceufoow .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hggceufoow .gt_sourcenote {
  font-size: 12px;
  padding: 4px;
}

#hggceufoow .gt_left {
  text-align: left;
}

#hggceufoow .gt_center {
  text-align: center;
}

#hggceufoow .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#hggceufoow .gt_font_normal {
  font-weight: normal;
}

#hggceufoow .gt_font_bold {
  font-weight: bold;
}

#hggceufoow .gt_font_italic {
  font-style: italic;
}

#hggceufoow .gt_super {
  font-size: 65%;
}

#hggceufoow .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="hggceufoow" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table" style="table-layout: fixed;">
  <colgroup>
    <col/>
    <col style="width:95px;"/>
    <col/>
    <col/>
    <col/>
    <col/>
  </colgroup>
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style><strong>Predicted number of cases as % of the population</strong></th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Stockholm's 2-digit regions</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: #000000; font-weight: bold;">Postnummer</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: #000000; font-weight: bold;">Datum</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: #000000; font-weight: bold;">Uppskattning</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: #000000; font-weight: bold;">Low_CI</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: #000000; font-weight: bold;">High_CI</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: #000000; font-weight: bold;">Ort</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_center">19</td>
      <td class="gt_row gt_center">2021-01-31</td>
      <td class="gt_row gt_center" style="background-color: #5E0B21; color: #FFFFFF;">0.70</td>
      <td class="gt_row gt_center">0.10</td>
      <td class="gt_row gt_center">3.06</td>
      <td class="gt_row gt_center">Arlandastad/ Bro/ Kungsängen/ Märsta/ Rosersberg/ Sigtuna/ Sollentuna/ Steningehöjden/ Stockholm/ Upplands Väsby</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">18</td>
      <td class="gt_row gt_center">2021-01-31</td>
      <td class="gt_row gt_center" style="background-color: #96565E; color: #FFFFFF;">0.58</td>
      <td class="gt_row gt_center">0.14</td>
      <td class="gt_row gt_center">1.84</td>
      <td class="gt_row gt_center">Åkersberga/ Brottby/ Danderyd/ Djursholm/ Enebyberg/ Husarö/ Lidingö/ Ljusterö/ Österskär/ Stockholm/ Stocksund/ Täby/ Vallentuna/ Vaxholm</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">14</td>
      <td class="gt_row gt_center">2021-01-31</td>
      <td class="gt_row gt_center" style="background-color: #A4686F; color: #FFFFFF;">0.55</td>
      <td class="gt_row gt_center">0.08</td>
      <td class="gt_row gt_center">2.43</td>
      <td class="gt_row gt_center">Grödinge/ Huddinge/ Kungens Kurva/ Landfjärden/ Muskö/ Norsborg/ Nynäshamn/ Ösmo/ Rönninge/ Segeltorp/ Segersäng/ Skogås/ Sorunda/ Stockholm/ Stora Vika/ Trångsund/ Tullinge/ Tumba/ Uttran/ Vårby</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">15</td>
      <td class="gt_row gt_center">2021-01-31</td>
      <td class="gt_row gt_center" style="background-color: #B68086; color: #000000;">0.51</td>
      <td class="gt_row gt_center">0.00</td>
      <td class="gt_row gt_center">7.07</td>
      <td class="gt_row gt_center">Enhörna/ Hölö/ Järna/ Mölnbo/ Mörkö/ Nykvarn/ Södertälje</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">13</td>
      <td class="gt_row gt_center">2021-01-31</td>
      <td class="gt_row gt_center" style="background-color: #BF8C91; color: #000000;">0.49</td>
      <td class="gt_row gt_center">0.09</td>
      <td class="gt_row gt_center">1.89</td>
      <td class="gt_row gt_center">Älta/ Årsta Havsbad/ Brandbergen/ Dalarö/ Djurhamn/ Gällnöby/ Gålö/ Gränö/ Gustavsberg/ Handen/ Haninge/ Harö/ Hårsfjärden/ Ingarö/ Ingmarsö/ Jordbro/ Möja/ Nacka/ Nacka Strand/ Nämdö/ Norra Sorunda/ Norrby/ Ornö/ Österhaninge/ Runmarö/ Saltsjö-Boo/ Saltsjö-Duvnäs/ Saltsjöbaden/ Sandhamn/ Skälvik/ Söderby/ Sollenkroka Ö/ Stavsnäs/ Stavsudda/ Stockholm/ Tungelsta/ Tynningö/ Tyresö/ Utö/ Värmdö/ Västerhaninge/ Vega/ Vendelsö</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">11</td>
      <td class="gt_row gt_center">2021-01-31</td>
      <td class="gt_row gt_center" style="background-color: #D6ABB0; color: #000000;">0.44</td>
      <td class="gt_row gt_center">0.16</td>
      <td class="gt_row gt_center">1.14</td>
      <td class="gt_row gt_center">Stockholm</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">17</td>
      <td class="gt_row gt_center">2021-01-31</td>
      <td class="gt_row gt_center" style="background-color: #DEB7BC; color: #000000;">0.42</td>
      <td class="gt_row gt_center">0.05</td>
      <td class="gt_row gt_center">2.08</td>
      <td class="gt_row gt_center">Adelsö/ Drottningholm/ Ekerö/ Färentuna/ Järfälla/ Munsö/ Skå/ Solna/ Stenhamra/ Stockholm/ Sundbyberg/ Svartsjö</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">16</td>
      <td class="gt_row gt_center">2021-01-31</td>
      <td class="gt_row gt_center" style="background-color: #F0D1D5; color: #000000;">0.38</td>
      <td class="gt_row gt_center">0.05</td>
      <td class="gt_row gt_center">1.76</td>
      <td class="gt_row gt_center">Bromma/ Hässelby/ Kista/ Solna/ Spånga/ Stockholm/ Vällingby</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">12</td>
      <td class="gt_row gt_center">2021-01-31</td>
      <td class="gt_row gt_center" style="background-color: #F9DEE2; color: #000000;">0.36</td>
      <td class="gt_row gt_center">0.08</td>
      <td class="gt_row gt_center">1.21</td>
      <td class="gt_row gt_center">Älvsjö/ Årsta/ Bagarmossen/ Bandhagen/ Enskede/ Enskede Gård/ Enskededalen/ Farsta/ Hägersten/ Johanneshov/ Skärholmen/ Skarpnäck/ Sköndal/ Stockholm/ Stockholm-Globen</td>
    </tr>
  </tbody>
  
  
</table></div>

``` r
library(ggplot2)
library(dplyr)
library(lubridate)

stockholm_codes <- c('11', '12', '13', '14', '15', '16', '17', '18', '19')

covidsymptom::postcode_estimates %>%
  filter(Postnummer %in% stockholm_codes) %>%
  ggplot(aes(x = Datum, y = Uppskattning, color = Postnummer)) +
  geom_line() +
  geom_point(size = 0.5) +
  labs(x = "Datum", y = "Uppskattad förekomst", title = "% Uppskattad förekomst av symtomatisk covid-19", subtitle = "") +
  scale_x_date(date_breaks = "60 days") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1), panel.grid.minor.x = element_blank(),
        legend.position = "none", plot.title = element_text(hjust = 0.5)) + 
  geom_ribbon(aes(ymin = Low_CI, ymax = High_CI), color = "transparent", fill = "#a60f61", alpha = 0.09) +
  facet_wrap(. ~ Postnummer)   
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

## Dashboard

A supporting dashboard is available
[here](https://csss-resultat.shinyapps.io/csss_dashboard/)

<img src="man/figures/dashboard.png" width="100%" />

## About COVID Symptom Study - Sweden

COVID Symptom Study Sweden uses an app to collect data from study
participants. The app COVID Symptom Study was developed by the British
health company ZOE Global Ltd with the help of scientific analyzes from
King’s College London and Guys and St Thomas hospitals in London and
launched in the UK on March 23, 2020. On April 29, 2020, the app was
launched in Sweden after adapting to Swedish conditions . The app is
maintained by Zoe Global Ltd and ZOE shares data collected in Sweden
with Lund University for processing and analysis.
