#' Write data to a database
#'
#' @param connection A database connection object created by using the `dh_createCon` function.
#' @param df A dataframe to ingest into database
#' @param schema The schema name of the database
#' @param table The table name of the database
#' @param append Whether or now to append df to an existing database object. Defaults to true, this means if the table doesn't exist it will be created.
#'
#' @return Nothing. A message is printed to signal success or failure.
#' @export
#'
dh_ingestData <- function(connection, df, schema, table, append=TRUE){

  # using this to reduce confusion
  schma <- schema
  tbl <- table

  success <- if(append){
    DBI::dbAppendTable(connection, DBI::Id(schema = schma, table = tbl), df)
  } else{
    DBI::dbWriteTable(connection, DBI::Id(schema = schma, table = tbl), df, append = TRUE)
  }

  if(success){
    cat("Data successfully ingested.")
  } else {
    cat("There was a problem, data was not ingested for some reason")
  }

}
