#' Load Methane Dataset 1
#'
#' Returns the first Soil Chamber dataset.
#' @return A data frame containing Soil Chamber data.
#' @export
# Load function for annual estimates
load_annual_estimates <- function() {
  file_path <- system.file("extdata", "Annual_CH4_estimates.rds", package = "MethaneData")
  if (file_path == "") stop("File not found. Ensure 'Annual_CH4_estimates.rds' is in 'inst/extdata'.")
  data <- readRDS(file_path)
  return(data)
}

#' Load Methane Dataset 2
#'
#' Returns the second Soil Chamber dataset.
#' @return A data frame containing Soil Chamber data.
#' @export

# Load function for Beringian wetlands
load_beringian_wetlands <- function() {
  file_path <- system.file("extdata", "Beringian_coastal_wetlands_CH4.rds", package = "MethaneData")
  if (file_path == "") stop("File not found. Ensure 'Beringian_coastal_wetlands_CH4.rds' is in 'inst/extdata'.")
  data <- readRDS(file_path)
  return(data)
}

#' Load Methane Dataset 3
#'
#' Returns the Beringian Coastal Wetlands dataset.
#' @return A data frame containing CH4 flux data.
#' @export

# Load function for SoilChamber 1
load_soilchamber_1 <- function() {
  file_path <- system.file("extdata", "SoilChamber_1.rds", package = "MethaneData")
  if (file_path == "") stop("File not found. Ensure 'SoilChamber_1.rds' is in 'inst/extdata'.")
  data <- readRDS(file_path)
  return(data)
}

#' Load Methane Dataset 4
#'
#' Returns the Annual CH4 estimates dataset.
#' @return A data frame containing annual CH4 estimates.
#' @export

# Load function for SoilChamber 2
load_soilchamber_2 <- function() {
  file_path <- system.file("extdata", "SoilChamber_2.rds", package = "MethaneData")
  if (file_path == "") stop("File not found. Ensure 'SoilChamber_2.rds' is in 'inst/extdata'.")
  data <- readRDS(file_path)
  return(data)
}

