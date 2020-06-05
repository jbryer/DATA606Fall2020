# Copyright 2014, OpenIntro
# This code is released under a Creative Commons Attribution 3.0 license

# The ContingencyTableToDataFrame() function can be used to convert
# contingency tables to data frames.
ContingencyTableToDataFrame <-
function (x,
          rn = row.names(x),
          cn = colnames(x),
          dfn = c("row.var", "col.var")) {
  rs <- rowSums(x)
  cs <- colSums(x)
  v1 <- rep(rn, rs)
  v2 <- c()
  for (i in 1:nrow(x)) {
    v2 <- append(v2, rep(cn, x[i, ]))
  }
  d <- data.frame(v1, v2)
  colnames(d) <- dfn
  return(d)
}

a <- matrix(c(459, 727, 854, 385, 99, 4198, 6245, 4821, 1634, 578), 2, byrow = TRUE)
b <- 
ContingencyTableToDataFrame(a,
                            c("No", "Yes"),
                            c("Excellent", "Very good", "Good", "Fair", "Poor"),
                            c("coverage", "health_status"))
# Sanity-check
table(b)

# Write to tab-delimited text file
cat("file saved to", getwd())
write.table(b, "health_coverage.txt",
            quote = FALSE, sep = "\t",
            row.names = FALSE)
write.table(b, "health_coverage.csv",
            sep = ",", row.names = FALSE)
health_coverage <- b
save(health_coverage, file = "health_coverage.rda")
prompt(health_coverage)

