## code to prepare `db_info_data` dataset goes here

db_info_data <- list(

  "postgres" = list(
    "dialect" = "postgresql",
    "user" = "postgres",
    "password" = "zxc123",
    "host" = "localhost",
    "port" = "5432",
    "database" = "nba",
    "options" = "-c search_path=nba"
  ),

  "cockroach" = list(
    "dialect" = "postgresql",
    "user" = "fred",
    "password" = "W15lrdGiHLKpPUgI3-5JHw",
    "host" = "nba-data-mgmt-9184.8nj.cockroachlabs.cloud",
    "cluster" = "nba-data-mgmt-9184",
    "port" = "26257",
    "database" = "nba",
    "options" = "--cluster=nba-data-mgmt-9184"
  )

)

usethis::use_data(db_info_data, internal = TRUE)


