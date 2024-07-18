
library(devtools)

db_con <- dh_createCon("cockroach")

load_all()

dh_ingestData(db_con, rates, "forex", "rates", append=FALSE)

