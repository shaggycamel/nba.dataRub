#' Create a database connection object
#'
#' @param connection_string The name of the database to connect to. There are only two options: "postgres" or "cockroach".
#'
#' @return A DBI database object
#' @export
#'
#' @examples
#' dh_createCon(connection_string = "cockroach")
dh_createCon <- function(connection_string){

  DBI::dbConnect(
    drv = RPostgres::Postgres(),
    user = db_info_data[[connection_string]]$user,
    host = db_info_data[[connection_string]]$host,
    port = db_info_data[[connection_string]]$port,
    password = db_info_data[[connection_string]]$password,
    dbname = db_info_data[[connection_string]]$database,
    options = db_info_data[[connection_string]]$options
  )

}
