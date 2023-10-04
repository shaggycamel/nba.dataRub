#' @export
dh_createCon <- function(connection_string){

  DBI::dbConnect(
    drv = RPostgres::Postgres(),
    user = db_info_data[connection_string]$user,
    host = db_info_data[connection_string]$host,
    port = db_info_data[connection_string]$port,
    password = db_info_data[connection_string]$password,
    dbname = db_info_data[connection_string]$database,
    options = db_info_data[connection_string]$options
  )

}
