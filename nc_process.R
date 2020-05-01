library(readr)
mu_data <- read_csv("mu_data.csv", col_names = FALSE)

total_row <- ncol(mu_data) * nrow(mu_data)

res <- data.frame(id = 1:total_row, lat=NA, lon=NA, val = NA)

cur_lat <- 90
cur_lon <- 0
i = 1

for(row in 1:nrow(mu_data)){
  for(col in 1:ncol(mu_data)){
    res$lat[i] <- cur_lat
    res$lon[i] <- cur_lon
    res$val[i] <- as.numeric(mu_data[row,col])
    cur_lon <- cur_lon + 1.5
    i <- i + 1
  }
  cur_lon <- 0
  cur_lat <- cur_lat - 1.5
  cat("finishing", row, "row of input","\n")
}

write.csv(res, file="result.csv",fileEncoding="UTF-8")
