dev <- FALSE
vowels <- c("a", "e", "i", "o", "u")
vowels <- c(vowels, toupper(vowels))
APP_TITLE <- "NIST PFAS Database Explorer"
if (!exists("RENV_ESTABLISHED_SHINY") || !RENV_ESTABLISHED_SHINY) source(here::here("inst", "apps", "env_shiny.R"))
if (exists("LOGGING") && LOGGING_ON) {
  log_ns <- "APP_TABLE_VIEWER"
  if (!log_ns %in% names(LOGGING)) {
    LOG_DIRECTORY <- here::here(ifelse(exists("LOG_DIRECTORY"), LOG_DIRECTORY, "logs"))
    logger_settings <- list(
      list(
        log = TRUE,
        ns = tolower(log_ns),
        to = "file",
        file = file.path(LOG_DIRECTORY, sprintf("log_%s.txt", tolower(log_ns))),
        threshold = "info")
    ) %>%
      setNames(log_ns)
    LOGGING <- append(LOGGING, logger_settings)
    update_logger_settings()
  }
  log_it("info", "Starting app: table_viewer", "shiny")
  log_it("info", "Starting app", tolower(log_ns))
}

# Session variables
if (exists("PLUMBER_URL") && api_endpoint(PLUMBER_URL, path = "db_active")) {
  table_list <- sort(
    c(
      api_endpoint(PLUMBER_URL, path = "list_views"),
      api_endpoint(PLUMBER_URL, path = "list_tables")
    )
  )
} else {
  stop("This app requires an active API connection.")
}
if (!exists("db_map")) db_map <- readRDS(file.path("data", "er_map.RDS"))
if (!exists("db_dict")) {
  db_dict <- grep("dictionary.json",
                  list.files(here::here(),
                             full.names = TRUE),
                  value = TRUE) %>%
    jsonlite::read_json() %>%
    lapply(bind_rows)
}