---
editor_options: 
  markdown: 
    wrap: 72
---

<!-- README.md is generated from README.Rmd. Please edit that file -->

# Fogo Cruzado

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/400119248.svg)](https://zenodo.org/badge/latestdoi/400119248)

<!-- badges: end -->

This repositiry provides monthly updated, georeferenced data on gun
shootings in the metropolitan areas of Rio de Janeiro and Recife, as
well as the necessary code.

The original data is provided in csv formate by the [Fogo
Cruzado](https://fogocruzado.org.br) project and volt data lab who also
provide the R package
[crossfire](https://github.com/voltdatalab/crossfire) for access to the
data.

To download the GeoPackage use this link:
[https://bit.ly/3B5hKA3](https://github.com/CHEST-Lab/fogocruzado/raw/main/data/fogocruzado/fogo_cruzado.gpkg)

If you are using the R programming language, you can directly import the
data:

``` r
library(sf)
read_sf("https://bit.ly/3B5hKA3")
```

The data include the following information for each shooting:

| Variable Name                                  | Description                                                                                                                |
|:----------------------------------|:----------------------------------|
| **Generall information**                       |                                                                                                                            |
| Event_ID                                       | Occurrence's ID                                                                                                            |
| Location                                       | Occurrence's address                                                                                                       |
| Date                                           | Occurrence's date                                                                                                          |
| Time                                           | Occurrence's time                                                                                                          |
| State_ID                                       | State's ID                                                                                                                 |
| City_ID                                        | Municipality's ID                                                                                                          |
| State_IBGE_ID                                  | State's IBGE code                                                                                                          |
| City_IBGE_ID                                   | Municipality's IBGE code                                                                                                   |
| State_UF                                       | State's name abbreviation                                                                                                  |
| State_name                                     | State's name                                                                                                               |
| City_name                                      | Municipality's name                                                                                                        |
| City_gentilic                                  | Municipality's gentilic                                                                                                    |
| City_pop                                       | Municipality's population                                                                                                  |
| City_area                                      | Municipality's area                                                                                                        |
| City_pop_den                                   | Municipality's population density                                                                                          |
| **Killed and Injured**                         |                                                                                                                            |
| Deaths_total                                   | Total number of people killed in the occurrence                                                                            |
| Deaths_civil                                   | Number of civilians killed                                                                                                 |
| Deaths_security                                | Number of security agents killed                                                                                           |
| Deaths_female                                  | Number of females killed                                                                                                   |
| Deaths_male                                    | Number of males killed                                                                                                     |
| Injured_total                                  | Total number of people injured in the occurrence                                                                           |
| Injured_civil                                  | Number of civilians injured                                                                                                |
| Injured_security                               | Number of security agents injured                                                                                          |
| Injured_female                                 | Number of females injured                                                                                                  |
| Injured_male                                   | Number of males injured                                                                                                    |
| **Stray bullets**                              |                                                                                                                            |
| Stray_bullets                                  | Has someone in the occurrence been killed or injured by stray bullets?                                                     |
| Stray_bullets\_\_Deaths                        | Number of people killed by stray bullets                                                                                   |
| Stray_bullets\_\_Injured                       | Number of people injured by stray bullets                                                                                  |
| **Age groups**                                 |                                                                                                                            |
| Child_under_12                                 | Were there any children (0 to 12 incomplete years old) among the people who were shot?                                     |
| Child_under_12\_\_Deaths                       | Number of children killed                                                                                                  |
| Child_under_12\_\_Deaths_info                  | Additional info                                                                                                            |
| Child_under_12\_\_Injured                      | Number of children injured                                                                                                 |
| Child_under_12\_\_Injured_info                 | Additional info                                                                                                            |
| Adolecent_under_18                             | Were there any teenagers (12 to 18 incomplete years old) among the people who were shot?                                   |
| Adolecent_under_18\_\_Deaths                   | Number of teenagers killed                                                                                                 |
| A dolecent_under_18\_\_Deaths_info             | Additional info                                                                                                            |
| Adolecent_under_18\_\_Injured                  | Number of teenagers injured                                                                                                |
| Ad olecent_under_18\_\_Injured_Info            | Additional info                                                                                                            |
| Old_over_60                                    | Were there any elderly people (over 60 years old) among the people who were shot?                                          |
| Old_over_60\_\_Deaths                          | Number of elderly people killed                                                                                            |
| Old_over_60\_\_Deaths_info                     | Additional info                                                                                                            |
| Old_over_60\_\_Injured                         | Number of elderly people injured                                                                                           |
| Old_over_60\_\_Injured_info                    | Additional info                                                                                                            |
| **Security agent and police raids**            |                                                                                                                            |
| Security_agent_present                         | Was a security agent present in the occurence?                                                                             |
| Police_raid                                    | Has the gun shooting occurred during a police raid?                                                                        |
| Police_raid\_\_Deaths                          | Number of deaths during the police raid                                                                                    |
| Police_raid\_\_Police_unit                     | Description of the police unit                                                                                             |
| Police_raid\_\_Vicitims_security               | Have security agents been shot?                                                                                            |
| Pol ice_raid\_\_Deaths_security_info           | Additional info of injured security agent (On duty, out of service or retired/fired)                                       |
| Poli ce_raid\_\_Injured_security_info          | Additional info of killed security agent (On duty, out of service or retired/fired)                                        |
| **Residential and educational buildings**      |                                                                                                                            |
| Residential_building                           | Was the gunfire shot inside houses or in backyards? Were they shot from outside the house but hit inside them?             |
| Residential_building\_\_Deaths                 | Number of people killed by gunfire inside residences                                                                       |
| Residential_building\_\_Injured                | Number of people injured by gunfire inside residences                                                                      |
| Educational_facility                           | Were the gunfire shot from inside educational units (day care centers, schools and universities) or in their surroundings? |
| Educational_facility\_\_Deaths                 | Number of people killed in educational units or their surroundings                                                         |
| Educational_facility\_\_Injured                | Number of people injured in educational units or their surroundings                                                        |
| **Public transport and road traffic affected** |                                                                                                                            |
| Traffic_route\_\_Affected                      | Has a traffic route been blocked?                                                                                          |
| Traffic_route\_\_Info                          | Name of the traffic route that has been affected                                                                           |
| Traffic_route\_\_Interrupted                   | Date/Time of interruption - start                                                                                          |
| Traffic_route\_\_Released                      | Date/Time of interruption - end                                                                                            |
| Tra ffic_route\_\_Interruption_hours           | Length of interruption (hours)                                                                                             |
| **Additional info**                            |                                                                                                                            |
| Additional_info                                | Others - List of cases' categorizations, which are followed by Fogo Cruzado's staff, which do not have specific columns    |
| Principal_motive                               | Probable reason for the gunshots - based on information from the press, police or trustworthy sources                      |
| Complementary_motive                           | Probable additional reason for the gunshots - based on information from the press, police or trustworthy sources           |
| **Geometry**                                   |                                                                                                                            |
| geom                                           | Geometry: SIRGAS 2000 / Brazil Polyconic (EPSG:5880)                                                                       |
