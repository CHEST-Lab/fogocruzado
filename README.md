
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Fogo Cruzado

<!-- badges: start -->
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

<table style="width:90%; font-family: &quot;Arial Narrow&quot;, &quot;Source Sans Pro&quot;, sans-serif; width: auto !important; margin-left: auto; margin-right: auto;" class=" lightable-classic">
<thead>
<tr>
<th style="text-align:left;">
Variable Name
</th>
<th style="text-align:left;">
Description
</th>
</tr>
</thead>
<tbody>
<tr grouplength="14">
<td colspan="2" style="background-color: #666; color: #fff;">
<strong>Generall information</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Event_ID
</td>
<td style="text-align:left;">
Occurrence’s ID
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Location
</td>
<td style="text-align:left;">
Occurrence’s address
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Date
</td>
<td style="text-align:left;">
Occurrence’s date
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Time
</td>
<td style="text-align:left;">
Occurrence’s time
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
State_ID
</td>
<td style="text-align:left;">
State’s ID
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
City_ID
</td>
<td style="text-align:left;">
Municipality’s ID
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
State_IBGE_ID
</td>
<td style="text-align:left;">
State’s IBGE code
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
City_IBGE_ID
</td>
<td style="text-align:left;">
Municipality’s IBGE code
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
State_UF
</td>
<td style="text-align:left;">
State’s name abbreviation
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
State_name
</td>
<td style="text-align:left;">
State’s name
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
City_name
</td>
<td style="text-align:left;">
Municipality’s name
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
City_pop
</td>
<td style="text-align:left;">
Municipality’s population
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
City_area
</td>
<td style="text-align:left;">
Municipality’s area
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
City_pop_den
</td>
<td style="text-align:left;">
Municipality’s population density
</td>
</tr>
<tr grouplength="10">
<td colspan="2" style="background-color: #666; color: #fff;">
<strong>Killed and Injured</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Deaths_total
</td>
<td style="text-align:left;">
Total number of people killed in the occurence
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Deaths_civil
</td>
<td style="text-align:left;">
Number of civilians killed
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Deaths_security
</td>
<td style="text-align:left;">
Number of security agends killed
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Deaths_female
</td>
<td style="text-align:left;">
Number of females killed
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Deaths_male
</td>
<td style="text-align:left;">
Number of males killed
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Injured_total
</td>
<td style="text-align:left;">
Total number of people injured in the occurence
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Injured_civil
</td>
<td style="text-align:left;">
Number of civilians injured
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Injured_security
</td>
<td style="text-align:left;">
Number of security agends injured
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Injured_female
</td>
<td style="text-align:left;">
Number of females injured
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Injured_male
</td>
<td style="text-align:left;">
Number of males injured
</td>
</tr>
<tr grouplength="3">
<td colspan="2" style="background-color: #666; color: #fff;">
<strong>Stray bullets</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Stray_bullets
</td>
<td style="text-align:left;">
Has someone in the occurence been killed or injured by stray bullets?
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Stray_bullets__Deaths
</td>
<td style="text-align:left;">
Number of people killed by stray bullets
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Stray_bullets__Injured
</td>
<td style="text-align:left;">
Number of people injured by stray bullets
</td>
</tr>
<tr grouplength="15">
<td colspan="2" style="background-color: #666; color: #fff;">
<strong>Age groups</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Child_under_12
</td>
<td style="text-align:left;">
Were there any children (0 to 12 incomplete years old) among the people
who were shot?
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Child_under_12__Deaths
</td>
<td style="text-align:left;">
Number of children killed
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Child_under_12__Deaths_info
</td>
<td style="text-align:left;">
Additional info
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Child_under_12__Injured
</td>
<td style="text-align:left;">
Number of children injured
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Child_under_12__Injured_info
</td>
<td style="text-align:left;">
Additional info
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Adolecent_under_18
</td>
<td style="text-align:left;">
Were there any teenagers (12 to 18 incomplete years old) among the
people who were shot?
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Adolecent_under_18__Deaths
</td>
<td style="text-align:left;">
Number of teenagers killed
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Adolecent_under_18__Deaths_info
</td>
<td style="text-align:left;">
Additional info
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Adolecent_under_18__Injured
</td>
<td style="text-align:left;">
Number of teenagers injured
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Adolecent_under_18__Injured_Info
</td>
<td style="text-align:left;">
Additional info
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Old_over_60
</td>
<td style="text-align:left;">
Were there any elderly people (over 60 years old) among the people who
were shot?
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Old_over_60__Deaths
</td>
<td style="text-align:left;">
Number of elderly people killed
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Old_over_60__Deaths_info
</td>
<td style="text-align:left;">
Additional info
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Old_over_60__Injured
</td>
<td style="text-align:left;">
Number of elderly people injured
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Old_over_60__Injured_info
</td>
<td style="text-align:left;">
Additional info
</td>
</tr>
<tr grouplength="7">
<td colspan="2" style="background-color: #666; color: #fff;">
<strong>Security agend and police raids</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Security_agent_present
</td>
<td style="text-align:left;">
Was a security agend present in the occurence?
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Police_raid
</td>
<td style="text-align:left;">
Has the gun shooting occured during a police raid?
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Police_raid__Deaths
</td>
<td style="text-align:left;">
Number of deaths during the police raid
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Police_raid__Police_unit
</td>
<td style="text-align:left;">
Description of the police unit
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Police_raid__Vicitims_security
</td>
<td style="text-align:left;">
Have security agends been shot?
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Police_raid__Deaths_security_info
</td>
<td style="text-align:left;">
Additional info of injured security agend (On duty, out of service or
retired/fired)
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Police_raid__Injured_security_info
</td>
<td style="text-align:left;">
Additional info of killed security agend (On duty, out of service or
retired/fired)
</td>
</tr>
<tr grouplength="6">
<td colspan="2" style="background-color: #666; color: #fff;">
<strong>Residential and educational buildings</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Residential_building
</td>
<td style="text-align:left;">
Were the gunfires shot inside houses or in backyards? Were they shot
from outside the house but hit inside them?
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Residential_building__Deaths
</td>
<td style="text-align:left;">
Number of people killed by gunfires inside residences
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Residential_building__Injured
</td>
<td style="text-align:left;">
Number of people injured by gunfires inside residences
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Educational_facility
</td>
<td style="text-align:left;">
Were the gunfires shot from inside educational units (day care centers,
schools and universities) or in their surroundings?
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Educational_facility__Deaths
</td>
<td style="text-align:left;">
Number of people killed in educational units or their surroundings
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Educational_facility__Injured
</td>
<td style="text-align:left;">
Number of people injured in educational units or their surroundings
</td>
</tr>
<tr grouplength="10">
<td colspan="2" style="background-color: #666; color: #fff;">
<strong>Public transport and road traffic affected</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Public_transport__Affected
</td>
<td style="text-align:left;">
Has the public transport been interupted?
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Public_transport__Vehicle_info
</td>
<td style="text-align:left;">
Name of vehicle that has been affected
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Public_transport__Interrupted
</td>
<td style="text-align:left;">
Date/Time of interruption - start
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Public_transport__Released
</td>
<td style="text-align:left;">
Date/Time of interruption - end
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Public_transport__Interruption_hours
</td>
<td style="text-align:left;">
Length of interruption (hours)
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Traffic_route__Affected
</td>
<td style="text-align:left;">
Has a traffic route been blocked?
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Traffic_route__Info
</td>
<td style="text-align:left;">
Name of the traffic route that has been affected
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Traffic_route__Interrupted
</td>
<td style="text-align:left;">
Date/Time of interruption - start
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Traffic_route__Released
</td>
<td style="text-align:left;">
Date/Time of interruption - end
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Traffic_route__Interruption_hours
</td>
<td style="text-align:left;">
Length of interruption (hours)
</td>
</tr>
<tr grouplength="3">
<td colspan="2" style="background-color: #666; color: #fff;">
<strong>Additional info</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Additional_info
</td>
<td style="text-align:left;">
Others - List of cases’ categorizations, which are followed by Fogo
Cruzado’s staff, which do not have specific columns
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Principal_motive
</td>
<td style="text-align:left;">
Probable reason for the gunshots - based on information from the press,
police or trustworthy sources
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
Complementary_motive
</td>
<td style="text-align:left;">
Probable additional reason for the gunshots - based on information from
the press, police or trustworthy sources
</td>
</tr>
<tr grouplength="1">
<td colspan="2" style="background-color: #666; color: #fff;">
<strong>Geometry</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
geom
</td>
<td style="text-align:left;">
Geometry: SIRGAS 2000 / Brazil Polyconic (EPSG:5880)
</td>
</tr>
</tbody>
</table>
