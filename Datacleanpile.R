library(readr)
library(dplyr)
library(devtools)
# data <- read_tsv("SoilChamber_2.tab")
# dat <- read_tsv("Annual CH4 estimates_v6a2.txt")


# Use readLines to preview the first few lines
# preview <- readLines("SoilChamber_1.tab", n = 20)
# print(preview)  # Check where the data begins

# Read the data starting after the metadata
data <- read.table("SoilChamber_1.tab",
                   header = TRUE,
                   sep = "\t",
                   stringsAsFactors = FALSE,
                   skip = 58,  # Adjust this number based on where your data starts
                   fill = TRUE,
                   quote = "",
                   check.names = FALSE)

# Inspect the data
head(data)
str(data)


data.2 <- read.table("SoilChamber_2.tab",
                   header = TRUE,
                   sep = "\t",
                   stringsAsFactors = FALSE,
                   skip = 71,  # Adjust this number based on where your data starts
                   fill = TRUE,
                   quote = "",
                   check.names = FALSE)


data.3 <- read.table("Beringian_coastal_wetlands_CH4.tab",
                   header = TRUE,
                   sep = "\t",
                   stringsAsFactors = FALSE,
                   skip = 101,  # Adjust this number based on where your data starts
                   fill = TRUE,
                   quote = "",
                   check.names = FALSE)


data.4 <- read.table("Annual CH4 estimates_v6a2.txt",
                     header = TRUE,
                     sep = "\t",
                     stringsAsFactors = FALSE,
                     # skip = 101,  # Adjust this number based on where your data starts
                     fill = TRUE,
                     quote = "",
                     check.names = FALSE)


### renaming convenction

colnames(data) <- c("Timestamp_UTC", "Timestamp_local", "Latitude", "Longitude",
                    "Chamber_no", "Landcover_Class", "Chamber_Type", "CH4_Flux_ug_m2_h",
                    "Air_Temp_C", "PPFD_umol_m2_s", "Soil_Temp_C", "Soil_Moisture_VWC",
                    "WFPS_Percent", "Soil_Temp_GF_C", "Soil_Moisture_GF_VWC", "WFPS_GF_Percent",
                    "Soil_Temp_10cm_C", "Soil_Temp_20cm_C", "Soil_Temp_30cm_C",
                    "Soil_Moisture_10cm", "Soil_Moisture_20cm", "Soil_Moisture_30cm",
                    "WFPS_10cm", "WFPS_20cm", "WFPS_30cm", "Air_Pressure_hPa",
                    "WindSpeed_7m", "WindSpeed_10m", "Friction_Velocity", "Air_Temp_2m_C",
                    "Relative_Humidity", "Vapor_Pressure_Deficit_kPa", "Shortwave_Radiation_In",
                    "Longwave_Radiation_In", "Shortwave_Radiation_Out", "Longwave_Radiation_Out",
                    "PPFD_Incoming", "PPFD_Outgoing", "Wind_Direction_deg", "Precip_mm")

colnames(data.2) <- c("Event", "Site", "Latitude", "Longitude", "Year", "Date_Flux",
                      "Date_SoilGas", "Landcover_Class", "MicroSite_Info", "Vegetation_Cover",
                      "Replicate", "Location_ID", "CH4_Flux_ug_m2_h", "CH4_2cm_ppmv",
                      "CH4_5cm_ppmv", "CH4_10cm_ppmv", "CH4_20cm_ppmv", "CO2_2cm_ppmv",
                      "CO2_5cm_ppmv", "CO2_10cm_ppmv", "CO2_20cm_ppmv", "N2O_2cm_ppmv",
                      "N2O_5cm_ppmv", "N2O_10cm_ppmv", "N2O_20cm_ppmv", "Soil_Temp_Flux_C",
                      "Soil_Temp_FSG_C", "Soil_Moisture_VWC", "WFPS_Percent",
                      "Shortwave_Radiation_In", "Shortwave_Radiation_Out", "Longwave_Radiation_In",
                      "Longwave_Radiation_Out", "PPFD_Incoming", "PPFD_Outgoing", "Air_Temp_2m_C",
                      "Relative_Humidity", "Air_Pressure_hPa", "Wind_Speed", "Wind_Direction_deg",
                      "Friction_Velocity", "Precip_Daily_mm", "Precip_3d_mm", "Precip_7d_mm",
                      "Vapor_Pressure_Deficit_kPa", "Thaw_Depth_cm", "Greenness_Percent")

colnames(data.3) <- c("Ord_No", "Site", "CH4_Flux_g_m2_a", "Type", "Class", "Method",
                      "Major_Vegetation", "Latitude", "Longitude", "Location", "Original_Value",
                      "Original_Unit", "Reference", "Persistent_ID", "Comment")

colnames(data.4) <- c("Sort", "Reference", "Measurement_Location", "Site_Name", "Ecosystem_Type",
                      "Wetland_Class", "Soil_Type", "Annual_Flux_Type", "Permafrost", "Method",
                      "Latitude", "Longitude", "Region", "Biome", "Mean_Annual_Air_Temp_C",
                      "Mean_Annual_Precip_mm", "Dry_Wet_Avg", "Water_Table_Depth_cm", "pH",
                      "Soil_Temp_C", "Max_Active_Layer_Thickness_cm", "Vegetation_Description",
                      "Moss_None", "Moss_Brown", "Moss_Sphagnum", "Cyperaceae", "Eri_Shrub",
                      "Tree", "Timing", "Year", "Mean_Daily_Growing_CH4_mg_m2_d", "SD",
                      "Growing_Season_Length_days", "Annual_Flux_Multiplier",
                      "Seasonal_CH4_g_m2", "Non_Growing_Season_Flux_g_m2",
                      "Annual_CH4_Flux_g_m2_y", "SD_1", "Remove_QC", "Notes1",
                      "Notes2_McGuire_Supp", "Reference_1", "Column_1", "Column_2", "Column_3")


# Preview the first few rows of each dataset
head(data)
head(data.2)
head(data.3)
head(data.4)


# Standardize Landcover_Class in data and data.2
data$Landcover_Class <- gsub("TL", "Lichen", data$Landcover_Class)
data$Landcover_Class <- gsub("TS", "Shrub", data$Landcover_Class)
data$Landcover_Class <- gsub("TT", "Tussock", data$Landcover_Class)

# data.2$Landcover_Class <- gsub("TL", "Lichen", data.2$Landcover_Class)
# data.2$Landcover_Class <- gsub("TS", "Shrub", data.2$Landcover_Class)
# data.2$Landcover_Class <- gsub("TT", "Tussock", data.2$Landcover_Class)


# # Rename columns in `data` to align with `data.2` for easier merging
# data$Vegetation_Cover <- gsub("TL", "Lichen", data$Landcover_Class)
# data$Vegetation_Cover <- gsub("TS", "Shrub", data$Vegetation_Cover)
# data$Vegetation_Cover <- gsub("TT", "Tussock", data$Vegetation_Cover)

# Ensure consistent column names for merging
colnames(data) <- sub("Landcover_Class", "Vegetation_Cover", colnames(data))
colnames(data)[colnames(data) == "Timestamp_UTC"] <- "Date"


# Make sure `data.2` has matching column names for key columns
colnames(data.2)[colnames(data.2) == "Date_Flux"] <- "Date"


# Identify columns in each dataset
data_columns <- colnames(data)
data2_columns <- colnames(data.2)

# Add missing columns to align both datasets and fill with NA
missing_in_data <- setdiff(colnames(data.2), colnames(data))
missing_in_data2 <- setdiff(colnames(data), colnames(data.2))

for (col in missing_in_data) {
  data[[col]] <- NA
}

for (col in missing_in_data2) {
  data.2[[col]] <- NA
}

# Combine data and data.2 into a single dataset
combined_data <- rbind(data, data.2)

# Add a Source column to indicate combined samples
combined_data$Source <- "Combined Sample"



data.4$Moss_Type <- apply(data.4[, c("Moss_None", "Moss_Brown", "Moss_Sphagnum")], 1, function(x) {
  moss_types <- c("None", "Brown", "Sphagnum")
  selected_moss <- moss_types[which(x == 1)]
  if (length(selected_moss) == 0) {
    return("None")
  } else {
    return(paste(selected_moss, collapse = ", "))
  }
})

# Rename Eri_Shrub to Shrub
colnames(data.4)[colnames(data.4) == "Eri_Shrub"] <- "Shrub"

data.4$Vegetation_Summary <- apply(data.4[, c("Vegetation_Description", "Cyperaceae", "Shrub", "Tree")], 1, function(x) {
  veg_description <- x[1]
  other_vegetation <- c()

  if (!is.na(x[2]) && (x[2] == "Present" || x[2] == "Dominant")) {
    other_vegetation <- c(other_vegetation, "Cyperaceae")
  }
  if (!is.na(x[3]) && (x[3] == "Present" || x[3] == "Dominant")) {
    other_vegetation <- c(other_vegetation, "Shrub")
  }
  if (!is.na(x[4]) && (x[4] == "Present" || x[4] == "Dominant")) {
    other_vegetation <- c(other_vegetation, "Tree")
  }

  if (length(other_vegetation) > 0) {
    return(paste(veg_description, paste(other_vegetation, collapse = ", "), sep = "; "))
  } else {
    return(veg_description)
  }
})




# Use Timing column to create a placeholder date (if possible)
data.4$Date <- as.Date(ifelse(data.4$Timing == "Annual", "2021-01-01", NA), format = "%Y-%m-%d")  # Adjust placeholder as needed

# Inspect changes
head(data.4[, c("Moss_Type", "Vegetation_Summary", "Date")])

colnames(data.4)

unique(data.4$Timing)
unique(data.4$Year)

# Display the first few rows of the Year and Timing columns
head(data.4[, c("Year", "Timing")])

# Extract the base year from the Year column
base_year <- trimws(data.4$Year[2])  # Replace [1] with different indices as needed for testing
base_year <- ifelse(grepl("-", base_year), unlist(strsplit(base_year, "-"))[1], base_year)
base_year <- gsub("[^0-9]", "", base_year)  # Clean any non-numeric characters

# Print the base year to check the output
print(paste("Base year:", base_year))

# Extract specific date ranges from the Timing column
timing <- data.4$Timing[1]  # Replace [1] with different indices for testing
matches <- regmatches(timing, gregexpr("\\d+\\s\\w+", timing))

# Print the matches to see if the dates are extracted correctly
print(matches)

# Apply function to parse Date and ensure correct format
data.4$Date <- apply(data.4[, c("Year", "Timing")], 1, function(row) {
  year <- trimws(row[1])  # Clean up any extra spaces
  timing <- row[2]

  # Handle missing or NA values in Year
  if (is.na(year) || year == "") {
    return(NA)
  }

  # Extract and clean base_year
  base_year <- ifelse(grepl("[-/,]", year), unlist(strsplit(year, "[-/,]"))[1], year)
  base_year <- gsub("[^0-9]", "", base_year)  # Remove non-numeric characters

  # Check if base_year is a valid four-digit year
  if (!grepl("^\\d{4}$", base_year)) {
    return(NA)  # Return NA if base_year is not a valid four-digit year
  }

  # Handle Timing if it's NA or empty
  if (is.na(timing) || timing == "") {
    return(as.Date(paste0(base_year, "-01-01")))  # January 1st as default
  }

  # Handle specific cases for Timing
  if (grepl("Winter", timing, ignore.case = TRUE)) {
    return(as.Date(paste0(base_year, "-12-01")))  # December for winter
  }

  if (grepl("Annual|Year-round|Throughout the year", timing, ignore.case = TRUE)) {
    return(as.Date(paste0(base_year, "-01-01")))  # January 1st for annual data
  }

  if (grepl("growing season|snow-free season|seasonal \\(150 days\\)", timing, ignore.case = TRUE)) {
    return(as.Date(paste0(base_year, "-06-01")))  # Default June 1st for summer
  }

  # Extract specific date ranges if present
  matches <- regmatches(timing, gregexpr("\\d+\\s\\w+", timing))

  if (length(matches[[1]]) >= 1) {
    start_date_str <- matches[[1]][1]

    # Convert to abbreviated format if needed
    start_date_str <- sub("January", "Jan", start_date_str)
    start_date_str <- sub("February", "Feb", start_date_str)
    start_date_str <- sub("March", "Mar", start_date_str)
    start_date_str <- sub("April", "Apr", start_date_str)
    start_date_str <- sub("June", "Jun", start_date_str)
    start_date_str <- sub("July", "Jul", start_date_str)
    start_date_str <- sub("August", "Aug", start_date_str)
    start_date_str <- sub("September", "Sep", start_date_str)
    start_date_str <- sub("October", "Oct", start_date_str)
    start_date_str <- sub("November", "Nov", start_date_str)
    start_date_str <- sub("December", "Dec", start_date_str)

    # Attempt to parse the date
    parsed_date <- as.Date(paste(base_year, start_date_str), format = "%Y %d %b")

    if (!is.na(parsed_date)) {
      return(parsed_date)
    }
  }

  # Default date if no specific match found
  return(as.Date(paste0(base_year, "-06-01")))
})

# Convert to Date type explicitly (if needed)
data.4$Date <- as.Date(data.4$Date, origin = "1970-01-01")

# Check the structure and output
str(data.4$Date)
head(data.4[, c("Year", "Timing", "Date")])


data.4 <- data.4[, !(names(data.4) %in% c("Column_1", "Column_2", "Column_3", NA, "Notes1", "Notes2_McGuire_Supp"))]

# Correct the incorrect year entry
data.4$Year <- gsub("^2066-", "2006-", data.4$Year)

standardize_ecosystem <- function(ecosystem_type) {
  if (is.na(ecosystem_type)) {
    return(NA)
  } else if (grepl("bog", ecosystem_type, ignore.case = TRUE)) {
    return("Bog")
  } else if (grepl("lake", ecosystem_type, ignore.case = TRUE)) {
    return("Lake")
  } else if (grepl("fen", ecosystem_type, ignore.case = TRUE)) {
    return("Fen")
  } else if (grepl("forest|lowland black spruce|Alder Carr", ecosystem_type, ignore.case = TRUE)) {
    return("Forest")
  } else if (grepl("pond|pool", ecosystem_type, ignore.case = TRUE)) {
    return("Pond")
  } else if (grepl("stream", ecosystem_type, ignore.case = TRUE)) {
    return("Stream")
  } else if (grepl("palsa|Aapa mire", ecosystem_type, ignore.case = TRUE)) {
    return("Palsa")
  } else if (grepl("peat|marsh|hummock", ecosystem_type, ignore.case = TRUE)) {
    return("Marsh")
  } else if (grepl("alpine", ecosystem_type, ignore.case = TRUE)) {
    return("Alpine")
  } else if (grepl("meadow|pool margin", ecosystem_type, ignore.case = TRUE)) {
    return("Meadow")
  } else if (grepl("swamp", ecosystem_type, ignore.case = TRUE)) {
    return("Swamp")
  } else if (grepl("tundra|upland|mineral|grassland", ecosystem_type, ignore.case = TRUE)) {
    return("Tundra")
  } else {
    return(NA)  # Return NA if no match is found
  }
}

# Apply the updated function to create the new column
data.4$Standardized_Ecosystem_Type <- sapply(data.4$Ecosystem_Type, standardize_ecosystem)

# Check the unique values again to ensure everything is mapped
unique(data.4$Standardized_Ecosystem_Type)

data.4$Standardized_Ecosystem_Type <- sapply(data.4$Ecosystem_Type, standardize_ecosystem)

# Check the unique values in the new column
unique(data.4$Standardized_Ecosystem_Type)


unique(data.4$Ecosystem_Type)
# Check which ecosystem types were not mapped
unmapped_types <- unique(data.4$Ecosystem_Type[is.na(data.4$Standardized_Ecosystem_Type)])
unmapped_types


unique(data.4$Biome)
unique(data.4$Standardized_Ecosystem_Type)
unique(data.3$Type)
unique(data.3$Method)
unique(data.3$Location)

# nevermind is done, its not showing on the map though can you find out why? lets also filter data.4 by Biome


# Create a function to standardize measurement type names
standardize_measurement_type <- function(Method) {
  if (grepl("chamber", Method, ignore.case = TRUE)) {
    return("Chamber Measurements")
  } else if (grepl("eddy covariance", Method, ignore.case = TRUE)) {
    return("Eddy Covariance")
  } else if (grepl("GC|gas chromatography", Method, ignore.case = TRUE)) {
    return("Gas Chromatography")
  } else if (grepl("infrared", Method, ignore.case = TRUE)) {
    return("Infrared Gas Analyzer")
  } else if (grepl("floating", Method, ignore.case = TRUE)) {
    return("Floating Chamber")
  } else if (grepl("water sample", Method, ignore.case = TRUE)) {
    return("Water Sample")
  } else {
    return("Gas-liquid Chromatography")
  }
}

# Apply the function to the column in data.3 using as.character to ensure the output format is correct
# Use vapply for stricter type-checking
# Apply the standardization function to the Method column
data.3$Method_Used <- as.character(sapply(data.3$Method, standardize_measurement_type))

# Verify the changes
head(data.3$Method_Used)

# Verify the changes
head(data.3$Method_Used)


# Check the unique values to confirm standardization
unique(data.3$Method_Used)


# Can you find out why data.4 is not showing on the map? lets also filter data.4 by Biome and data.3 by Method_Used


# Define the standardization function for the Type column
standardize_type <- function(type) {
  if (is.na(type)) {
    return(NA)
  } else if (grepl("bog", type, ignore.case = TRUE)) {
    return("Bog")
  } else if (grepl("lake", type, ignore.case = TRUE)) {
    return("Lake")
  } else if (grepl("fen", type, ignore.case = TRUE)) {
    return("Fen")
  } else if (grepl("forest", type, ignore.case = TRUE)) {
    return("Forest")
  } else if (grepl("pond|pool", type, ignore.case = TRUE)) {
    return("Pond")
  } else if (grepl("stream|riparian", type, ignore.case = TRUE)) {
    return("Stream")
  } else if (grepl("palsa", type, ignore.case = TRUE)) {
    return("Palsa")
  } else if (grepl("marsh|peat|hummock", type, ignore.case = TRUE)) {
    return("Marsh")
  } else if (grepl("alpine|sub-arctic", type, ignore.case = TRUE)) {
    return("Alpine")
  } else if (grepl("meadow|wetland", type, ignore.case = TRUE)) {
    return("Meadow")
  } else if (grepl("swamp", type, ignore.case = TRUE)) {
    return("Swamp")
  } else if (grepl("tundra|grassland|coastal", type, ignore.case = TRUE)) {
    return("Tundra")
  } else if (grepl("coastal|mud|tidal", type, ignore.case = TRUE)) {
    return("Coastal")
  } else {
    return(NA)  # Return NA if no match is found
  }
}

# Apply the function to create the new column in data.3
data.3$Standardized_Type <- sapply(data.3$Type, standardize_type)

# Check the unique values in the new column to verify
unique(data.3$Standardized_Type)

unique(data.4$Mean_Daily_Growing_CH4_mg_m2_d)

# data.4$Mean_Daily_Growing_CH4_mg_m2_d <- "CH4_mg_m2_d"

colnames(data.4)[colnames(data.4) == "Mean_Daily_Growing_CH4_mg_m2_d"] <- "CH4_mg_m2_d"


# Remove columns from data.2 that are entirely NA
# data.2 <- data.2[, colSums(is.na(data.2)) < nrow(data.2)]


# # Save data as .rds files
# saveRDS(combined_data, "SoilChamber_1.rds")
# saveRDS(data.2, "SoilChamber_2.rds")
# saveRDS(data.3, "Beringian_coastal_wetlands_CH4.rds")
# saveRDS(data.4, "Annual_CH4_estimates.rds")
#
# # Save data as .RData if you prefer
# save(data, data.2, data.3, data.4, file = "datasets.RData")

