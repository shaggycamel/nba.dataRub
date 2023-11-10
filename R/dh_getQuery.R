#' Query data from a database
#'
#' @param connection A database connection object created by using the `dh_createCon` function.
#' @param query Reference to a SQL file stored in the `queries` directory, or a SQL query string.
#' @param glue_params Reference to any parameters that should be replaced in a SQL file.
#'
#' @return A dataframe
#' @export
#'
dh_getQuery <- function(connection, query, glue_params=NULL){

  if(Sys.getenv("HOME") == here::here())
    stop("To use this function, you must be working within an R-project (ie .Rproj file).")

  if(!dir.exists(here::here("data")) && stringr::str_detect(query, ".sql$"))
    stop("Queries sourced from files must be stored in the \"data\" folder located in the project base directory.")

  query <- if(!stringr::str_detect(query, ".sql$")) glue::glue(query)
    else glue::glue(readr::read_file(here::here("data", query)))

  connection |>
    DBI::dbGetQuery(query) |>
    tibble::as_tibble() |>
    (\(df){
      c_typ <- purrr::keep(purrr::map(df, class), \(x) "integer64" %in% x)
      dplyr::mutate(df, dplyr::across(names(c_typ), \(x) as.integer(x)))
    })()

}
