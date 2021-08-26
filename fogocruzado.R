# Input
email <- "..." # fill in the mail address of your account
password <- "..." # fill in the password of your account

# Packages
if (!require("devtools")){
  install.packages("devtools")
  library(devtools)
}

if(!require(crossfire)){
  devtools::install_github("voltdatalab/crossfire")
  library(crossfire)
}

if(!require(lubridate)){
  install.packages("lubridate")
  library(lubridate)
}

if(!require(dplyr)){
  install.packages("dplyr")
  library(dplyr)
}

if(!require(sf)){
  install.packages("sf")
  library(sf)
}

################################ define functions ##################################


check.backup <- function(backupfiles){
  
  if(!is.na(backupfile[1])){
    
    # Check for full backup
    fogocruzado_backup <- read.csv(backupfile) %>% select(-X)
    
    return(fogocruzado_backup)
    
  }else if(!is.na(backupfile_raw[1])){
    
    # If no full backup exists, get raw backups
    lapply(backupfile_raw, function(files){
      tmp <- read.csv(files) %>% select(-X)
      return(tmp)
    }) %>% do.call(rbind, .) %>% cleanup(.) -> fogocruzado_backup
    
    return(fogocruzado_backup)
    
  }else{
    
    return(NA)
    
  }
  
}

update.backup <- function(fogocruzado_backup){
  
  # delete raw backups older than a year
  for (i in 1:length(backupfile_raw)) {
    
    # get final date
    last_event <- strsplit(backupfile_raw[i], "_") %>%.[[1]] %>% .[length(.)] %>%
      strsplit(".", fixed = T) %>% .[[1]] %>% .[1]
    
    # delete older files
    if(as.Date(last_event) < Sys.Date() - years(1)){
      file.remove(backupfile_raw[i])
    }
  }
  
  # get dates for update
  last_event <- fogocruzado_backup$Date %>% as.Date() %>% max()
  last_quartal <- as.Date(last_event) - months(4)
  
  # get more recent data for last month
  fogocruzado_update <- get_fogocruzado(initial_date = last_quartal, final_date = last_event) %>%
    cleanup() %>% arrange(Event_ID)
  
  # update existing backup file
  fogocruzado_backup_new <- fogocruzado_backup %>% arrange(Event_ID) %>%
    filter(Date < last_quartal) %>%
    rbind(., fogocruzado_update)
  
  filename <- paste0("data/fogocruzado/full_backup.csv")
  
  write.csv(fogocruzado_backup_new, filename)
  
  return(fogocruzado_backup)
  
}

download.data <- function(initial_date){
  
  # get final date for first time step
  t_0 <- initial_date
  
  fogocruzado_all <- data.frame()
  j <- 0
  
  # get data
  while(j != 1){
    
    if(final_date > Sys.Date()){
      final_date <- Sys.Date()
    }
    
    if(final_date == Sys.Date()) j <- 1
    
    cat("downloading: ", as.character(initial_date), "to", as.character(final_date))
    
    fogocruzado_this_step <- get_fogocruzado(initial_date = initial_date, final_date = final_date)
    fogocruzado_all <- rbind(fogocruzado_all, fogocruzado_this_step)
    
    if(final_date < Sys.Date()){
      initial_date <- as.Date(final_date) + days(1)
      final_date <- as.Date(initial_date) + months(6)
    }
    
    Sys.sleep(5)
  }
  
  # save backup
  filename <- paste0("data/fogocruzado/raw_backup/fogocruzado_raw_", t_0, "_", Sys.Date(), ".csv")
  write.csv(fogocruzado_all, filename)
  
  return(fogocruzado_all)
  
}

cleanup <- function(fogocruzado_data){
  
  # Meta data
  meta_data <- fogocruzado_data[,c(1:2,5, 6, 3, 4, 12:13, 22, 15, 21, 20, 14, 16,  17:19)]
  names(meta_data) <- c("Event_ID", "Location", "Date", "Time", "Latitude", "Longitude",
                        "State_ID", "City_ID", "State_IBGE_ID", "City_IBGE_ID", "State_UF", "State_name", "City_name", "Gentilico",  
                        "City_pop", "City_area", "City_pop_den")
  meta_data$Date <- meta_data$Date %>% substr(., 1,10)
  
  # Event data
  event_data <- fogocruzado_data[,c(7:11, 23:ncol(fogocruzado_data))]
  names(event_data) <- c("Security_agent_present",
                         "Deaths_civil", "Deaths_security",
                         "Injured_civil", "Injured_security",
                         "Deaths_male", "Injured_male", "Deaths_female", "Injured_female",
                         "Police_raid", "Police_raid__Deaths", "Police_raid__Police_unit", "Police_raid__Vicitims_security", "Police_raid__Deaths_security_info", "Police_raid__Injured_security_info",
                         "Stray_bullets", "Stray_bullets__Deaths", "Stray_bullets__Injured",
                         "Residential_building", "Residential_building__Deaths", "Residential_building__Injured",
                         "Educational_facility", "Educational_facility__Deaths", "Educational_facility__Injured",
                         "Child_under_12", "Child_under_12__Deaths", "Child_under_12__Deaths_info", "Child_under_12__Injured", "Child_under_12__Injured_info",
                         "Adolecent_under_18", "Adolecent_under_18__Deaths", "Adolecent_under_18__Deaths_info", "Adolecent_under_18__Injured", "Adolecent_under_18__Injured_Info",
                         "Old_over_60", "Old_over_60__Deaths", "Old_over_60__Deaths_info", "Old_over_60__Injured", "Old_over_60__Injured_info",
                         "Public_transport__Affected", "Public_transport__Vehicle_info", "Public_transport__Interrupted", "Public_transport__Released",
                         "Traffic_route__Affected", "Traffic_route__Info", "Traffic_route__Interrupted", "Traffic_route__Released",
                         "Additional_info",
                         "Principal_motive", "Complementary_motive")
  
  
  fogocruzado_final <- data.frame(meta_data, event_data)
  return(fogocruzado_final) 
}

save.gpkg <- function(fogocruzado_all){
  
  list.files(subdir, ".gpkg", full.names = T) %>% file.remove()
  
  # File path
  filename <- "data/fogocruzado/fogo_cruzado.gpkg"
  
  fogocruzado_sf <- fogocruzado_all %>% 
    st_as_sf(crs = 4326, coords = c("Longitude", "Latitude")) %>%
    st_transform(5880) %>%
    
    # Convert to boolean
    mutate(Security_agent_present = if_else(Security_agent_present == 1, 
                                            TRUE, FALSE)) %>% 
    mutate_at(.vars = c(
      "Police_raid", "Police_raid__Vicitims_security", 
      "Stray_bullets", "Residential_building", "Educational_facility", 
      "Child_under_12", "Adolecent_under_18", "Old_over_60", 
      "Public_transport__Affected", "Traffic_route__Affected"
    ), funs(!is.na(.))) %>%
    
    # Convert to factor
    mutate_at(.vars = c(
      "State_IBGE_ID", "City_IBGE_ID"
    ), funs(as.integer(.))) %>% 
    
    # Convert to DateTime
    mutate(Date = lubridate::ymd(Date),
           Time = replace(Time, Time == "0:00:00", NA),
           Public_transport__Interruption_hours = difftime(ymd_hms(Public_transport__Released),
                                                           ymd_hms(Public_transport__Interrupted), 
                                                           units="hours") %>% as.numeric(),
           Traffic_route__Interruption_hours = difftime(ymd_hms(Traffic_route__Released),
                                                        ymd_hms(Traffic_route__Interrupted), 
                                                        units="hours") %>% as.numeric()
    ) %>%
    
    # Total deaths/injured
    mutate(Deaths_total = Deaths_civil + Deaths_security,
           Injured_total = Injured_civil + Injured_security) %>% 
    
    # Reorder
    select(
      # Generall information
      Event_ID, Location, Date, Time,
      State_ID, City_ID, State_IBGE_ID, City_IBGE_ID, State_UF, State_name, City_name,  
      City_pop, City_area, City_pop_den,
      
      # Deaths and Injured
      Deaths_total, Deaths_civil, Deaths_security, Deaths_female, Deaths_male,
      Injured_total, Injured_civil, Injured_security, Injured_female, Injured_male,
      
      # Stray bullets
      Stray_bullets, Stray_bullets__Deaths, Stray_bullets__Injured,
      
      # Age groupes
      Child_under_12, Child_under_12__Deaths, Child_under_12__Deaths_info, Child_under_12__Injured, Child_under_12__Injured_info,
      Adolecent_under_18, Adolecent_under_18__Deaths, Adolecent_under_18__Deaths_info, Adolecent_under_18__Injured, Adolecent_under_18__Injured_Info,
      Old_over_60, Old_over_60__Deaths, Old_over_60__Deaths_info, Old_over_60__Injured, Old_over_60__Injured_info,
      
      # Security agend and police raids
      Security_agent_present, Police_raid, Police_raid__Deaths, Police_raid__Police_unit, Police_raid__Vicitims_security, Police_raid__Deaths_security_info, Police_raid__Injured_security_info,
      
      # Residential and Educational buildings
      Residential_building, Residential_building__Deaths, Residential_building__Injured,
      Educational_facility, Educational_facility__Deaths, Educational_facility__Injured,
      
      # Public transport and road traffic affected
      Public_transport__Affected, Public_transport__Vehicle_info, Public_transport__Interrupted, Public_transport__Released, Public_transport__Interruption_hours,
      Traffic_route__Affected, Traffic_route__Info, Traffic_route__Interrupted, Traffic_route__Released, Traffic_route__Interruption_hours,
      
      # Additional info
      Additional_info, Principal_motive, Complementary_motive
    )
  
  write_sf(fogocruzado_sf, filename, driver = "GPKG")
}


################################ main ################################

# build directories
subdir <-  "data/fogocruzado/"
rawbackup <- "data/fogocruzado/raw_backup"

if(!dir.exists(subdir)) dir.create(subdir, recursive = TRUE)
if(!dir.exists(rawbackup)) dir.create(rawbackup, recursive = TRUE)

# check existing data
backupfile <- list.files(subdir, pattern = ".csv", full.names = T)
backupfile_raw <- list.files(rawbackup, full.names = T)
check.backup(backupfile) -> fogocruzado_backup

# dummy check input date
if(is.data.frame(fogocruzado_backup)){
  initial_date <- max(as.Date(fogocruzado_backup$Date)) + days(1)
  final_date <- as.Date(initial_date) + months(6)
}else{
  initial_date <- "2016-07-05"
  final_date <- as.Date(initial_date) + months(6)
}

# login 
fogocruzado_signin(email, password)

# Get new data
if(!is.data.frame(fogocruzado_backup)){
  
  # First download - get everything from start date until now
  fogocruzado_all <- download.data(initial_date) %>% cleanup()
  
}else{
  
  # update backup
  update.backup(fogocruzado_backup) -> fogocruzado_backup_updated
  
  # update initial date
  initial_date <- fogocruzado_backup$Date %>%
    as.Date() %>% max() %>% as.Date() + days(1)
  
  # Consecutive download
  download.data(initial_date) %>% cleanup() -> fogocruzado_new
  
  # join data
  fogocruzado_all <- rbind(fogocruzado_backup_updated, fogocruzado_new)
}

# Save results as gpkg
save.gpkg(fogocruzado_all)