## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  Sys.setenv("POSTGRES_USER" = "postgres", "POSTGRES_PASS" = "mysecretpassword")
#  data_storage <- DataStoragePostgreSQL$new(
#    user = Sys.getenv("POSTGRES_USER"),
#    password = Sys.getenv("POSTGRES_PASS"),
#    hostname = "127.0.0.1",
#    port = 5432,
#    dbname = "shiny_telemetry",
#    driver = "RPostgreSQL"
#  )

## ----eval=FALSE---------------------------------------------------------------
#  Sys.setenv("MARIADB_USER" = "mariadb", "MARIADB_PASS" = "mysecretpassword")
#  data_storage <- DataStorageMariaDB$new(
#    user = Sys.getenv("MARIADB_USER"),
#    password = Sys.getenv("MARIADB_PASS"),
#    hostname = "127.0.0.1",
#    port = 3306,
#    dbname = "shiny_telemetry"
#  )

## ----eval=FALSE---------------------------------------------------------------
#  Sys.setenv(MSSQL_USER = "sa", MSSQL_PASS = "my-Secr3t_Password")
#  data_storage <- DataStorageMSSQLServer$new(
#    user = Sys.getenv("MSSQL_USER"),
#    password = Sys.getenv("MSSQL_PASS"),
#    hostname = "127.0.0.1",
#    port = 1433,
#    dbname = "my_db",
#    driver = "ODBC Driver 18 for SQL Server",
#    trust_server_certificate = "YES"
#  )

## ----eval=FALSE---------------------------------------------------------------
#  data_storage <- DataStorageMongoDB$new(
#    host = "localhost",
#    dbname = "test",
#    authdb = NULL,
#    options = NULL,
#    ssl_options = mongolite::ssl_options()
#  )
#  
#  To run MongoDB in a container locally, you can use the following Docker compose file: [`inst/examples/mssql/docker-compose.yml`](https://github.com/Appsilon/shiny.telemetry/blob/main/inst/examples/mongodb/docker-compose.yml).

## ----eval=FALSE---------------------------------------------------------------
#  data_storage <- DataStorageSQLite$new(
#    db_path = "telemetry.sqlite"
#  )

