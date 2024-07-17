## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----fake_code, eval=FALSE----------------------------------------------------
#  library(shiny.telemetry)
#  data_storage <- DataStorageLogFile$new("local_file.txt")
#  data_storage$read_event_data()

## ----pseudo_data_storage_read, echo=FALSE-------------------------------------
# Code that replicates the example above
session_id <- sprintf("%s...", substr(rlang::hash(Sys.time()), 1, 6))
user_id <- sprintf("%s...", substr(rlang::hash(list(Sys.time(), session_id)), 1, 6))
time <- Sys.time()
data_storage <- shiny.telemetry::DataStorageLogFile$new(withr::local_file("local_file.txt"))
telemetry <- shiny.telemetry::Telemetry$new(app_name = "rhino_app", data_storage)
session <- shiny::MockShinySession$new() # Create dummy session (only for example purposes)
class(session) <- c(class(session), "ShinySession")
session$token <- session_id

telemetry$log_login(user_id, session = session)
telemetry$log_input_manual("name", "John Doe", session = session)
telemetry$log_input_manual("name", "Jane Doe", session = session)
telemetry$log_input_manual("name", "My custom name", session = session)
testthat::with_mocked_bindings(
  telemetry$log_logout(user_id, session = session),
  onSessionEnded = function(fun, ...) fun(),
  .package = "shiny" 
)

knitr::kable(data_storage$read_event_data())

