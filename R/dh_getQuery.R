dh_getQuery <- function(connection, query, glue_params=NULL){

  query <- if(!stringr::str_detect(query, ".sql$")) query
    else glue::glue(readr::read_file(here::here("queries", query)))

  connection |>
    DBI::dbGetQuery(query) |>
    tibble::as_tibble() |>
    dplyr::mutate(dplyr::across(where(~ class(.x) == "integer64"), ~ as.integer(.x)))

}
