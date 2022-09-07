Fogo Cruzado
================
September 07, 2022

<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7056702.svg)](https://doi.org/10.5281/zenodo.7056702)

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
| :--------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------- |
| **Generall information**                       |                                                                                                                            |
| Event\_ID                                      | Occurrence’s ID                                                                                                            |
| Location                                       | Occurrence’s address                                                                                                       |
| Date                                           | Occurrence’s date                                                                                                          |
| Time                                           | Occurrence’s time                                                                                                          |
| State\_ID                                      | State’s ID                                                                                                                 |
| City\_ID                                       | Municipality’s ID                                                                                                          |
| State\_IBGE\_ID                                | State’s IBGE code                                                                                                          |
| City\_IBGE\_ID                                 | Municipality’s IBGE code                                                                                                   |
| State\_UF                                      | State’s name abbreviation                                                                                                  |
| State\_name                                    | State’s name                                                                                                               |
| City\_name                                     | Municipality’s name                                                                                                        |
| City\_gentilic                                 | Municipality’s gentilic                                                                                                    |
| City\_pop                                      | Municipality’s population                                                                                                  |
| City\_area                                     | Municipality’s area                                                                                                        |
| City\_pop\_den                                 | Municipality’s population density                                                                                          |
| **Killed and Injured**                         |                                                                                                                            |
| Deaths\_total                                  | Total number of people killed in the occurrence                                                                            |
| Deaths\_civil                                  | Number of civilians killed                                                                                                 |
| Deaths\_security                               | Number of security agents killed                                                                                           |
| Deaths\_female                                 | Number of females killed                                                                                                   |
| Deaths\_male                                   | Number of males killed                                                                                                     |
| Injured\_total                                 | Total number of people injured in the occurrence                                                                           |
| Injured\_civil                                 | Number of civilians injured                                                                                                |
| Injured\_security                              | Number of security agents injured                                                                                          |
| Injured\_female                                | Number of females injured                                                                                                  |
| Injured\_male                                  | Number of males injured                                                                                                    |
| **Stray bullets**                              |                                                                                                                            |
| Stray\_bullets                                 | Has someone in the occurrence been killed or injured by stray bullets?                                                     |
| Stray\_bullets\_\_Deaths                       | Number of people killed by stray bullets                                                                                   |
| Stray\_bullets\_\_Injured                      | Number of people injured by stray bullets                                                                                  |
| **Age groups**                                 |                                                                                                                            |
| Child\_under\_12                               | Were there any children (0 to 12 incomplete years old) among the people who were shot?                                     |
| Child\_under\_12\_\_Deaths                     | Number of children killed                                                                                                  |
| Child\_under\_12\_\_Deaths\_info               | Additional info                                                                                                            |
| Child\_under\_12\_\_Injured                    | Number of children injured                                                                                                 |
| Child\_under\_12\_\_Injured\_info              | Additional info                                                                                                            |
| Adolecent\_under\_18                           | Were there any teenagers (12 to 18 incomplete years old) among the people who were shot?                                   |
| Adolecent\_under\_18\_\_Deaths                 | Number of teenagers killed                                                                                                 |
| A dolecent\_under\_18\_\_Deaths\_info          | Additional info                                                                                                            |
| Adolecent\_under\_18\_\_Injured                | Number of teenagers injured                                                                                                |
| Ad olecent\_under\_18\_\_Injured\_Info         | Additional info                                                                                                            |
| Old\_over\_60                                  | Were there any elderly people (over 60 years old) among the people who were shot?                                          |
| Old\_over\_60\_\_Deaths                        | Number of elderly people killed                                                                                            |
| Old\_over\_60\_\_Deaths\_info                  | Additional info                                                                                                            |
| Old\_over\_60\_\_Injured                       | Number of elderly people injured                                                                                           |
| Old\_over\_60\_\_Injured\_info                 | Additional info                                                                                                            |
| **Security agent and police raids**            |                                                                                                                            |
| Security\_agent\_present                       | Was a security agent present in the occurence?                                                                             |
| Police\_raid                                   | Has the gun shooting occurred during a police raid?                                                                        |
| Police\_raid\_\_Deaths                         | Number of deaths during the police raid                                                                                    |
| Police\_raid\_\_Police\_unit                   | Description of the police unit                                                                                             |
| Police\_raid\_\_Vicitims\_security             | Have security agents been shot?                                                                                            |
| Pol ice\_raid\_\_Deaths\_security\_info        | Additional info of injured security agent (On duty, out of service or retired/fired)                                       |
| Poli ce\_raid\_\_Injured\_security\_info       | Additional info of killed security agent (On duty, out of service or retired/fired)                                        |
| **Residential and educational buildings**      |                                                                                                                            |
| Residential\_building                          | Was the gunfire shot inside houses or in backyards? Were they shot from outside the house but hit inside them?             |
| Residential\_building\_\_Deaths                | Number of people killed by gunfire inside residences                                                                       |
| Residential\_building\_\_Injured               | Number of people injured by gunfire inside residences                                                                      |
| Educational\_facility                          | Were the gunfire shot from inside educational units (day care centers, schools and universities) or in their surroundings? |
| Educational\_facility\_\_Deaths                | Number of people killed in educational units or their surroundings                                                         |
| Educational\_facility\_\_Injured               | Number of people injured in educational units or their surroundings                                                        |
| **Public transport and road traffic affected** |                                                                                                                            |
| Traffic\_route\_\_Affected                     | Has a traffic route been blocked?                                                                                          |
| Traffic\_route\_\_Info                         | Name of the traffic route that has been affected                                                                           |
| Traffic\_route\_\_Interrupted                  | Date/Time of interruption - start                                                                                          |
| Traffic\_route\_\_Released                     | Date/Time of interruption - end                                                                                            |
| Tra ffic\_route\_\_Interruption\_hours         | Length of interruption (hours)                                                                                             |
| **Additional info**                            |                                                                                                                            |
| Additional\_info                               | Others - List of cases’ categorizations, which are followed by Fogo Cruzado’s staff, which do not have specific columns    |
| Principal\_motive                              | Probable reason for the gunshots - based on information from the press, police or trustworthy sources                      |
| Complementary\_motive                          | Probable additional reason for the gunshots - based on information from the press, police or trustworthy sources           |
| **Geometry**                                   |                                                                                                                            |
| geom                                           | Geometry: SIRGAS 2000 / Brazil Polyconic (EPSG:5880)                                                                       |
