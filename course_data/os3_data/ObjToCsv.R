

folder <- "./Ch 8 Exercise Data"

if ("xyz.txt" %in% list.files(folder)) {
  xyz <- read.table(paste0(folder, "/xyz.txt"))
} else {
  xyz <- read.csv(paste0(folder, "/xyz.csv"))
}
save(xyz, file = "rda/xyz.rda")
prompt(xyz, file = "Rd/xyz.Rd")

