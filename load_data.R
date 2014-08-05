# Since all assignment tasks rely on the same data and it takes long time to load it I have implemented
# data caching mechanism

zip_file <- "household_power_consumption.zip";
raw_file <- "household_power_consumption.txt";
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
cache_file <- "_cachedHPC.Rda";

download <- function() {
  if (!file.exists(zip_file)) {
    message(" * Zip file not found.");
    message(" -> downloading from original location")
    download.file(url,method="curl",destfile=zip_file);
  } else {
    message(" * Zip file exists. Skipping download step");
  }
}

read_table <- function() {
  message(" -> Loading raw text file")
  src <- raw_file;
  if (!file.exists(raw_file)) {
    message(" * Raw text file not found.")
    download();
    src <- unzip();
  }
  raw_data <- read.table(src, sep=";", na.strings="?",header=TRUE);
  data <- filter(raw_data);
  data
}

unzip <- function() {
  message(" -> Extracting data");
  socket_connection <- unz(zip_file, raw_file);
  socket_connection
}

filter <- function(raw_data) {
  message (" -> Processing data");
  # Should we care about NA ?
  data <- raw_data[(raw_data$Date=="1/2/2007" | raw_data$Date=="2/2/2007"),];
  data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S");
  data
}

load_data <- function() {
  message("Loading data")
  # First check if cache file already exists
  if (!file.exists(cache_file)) {
    # Since cached version of data does not exists the following actions will be taken
    # Check if txt file exists. If not then check if zip file exists and unzip it
    # Filter the data and parse date time
    # Save to cache
    message (" * Cached version not found");
    table <- read_table();
    message(" -> Saving data to cache file");
    saveRDS(table,cache_file);
  } else {
    # Cached version exists. Load from the cache
    message(" -> Loading data from cache file");
    table <- readRDS(cache_file);
  }
  message("Done data preparation.");
  table
}