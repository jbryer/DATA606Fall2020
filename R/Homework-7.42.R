load("~/Dropbox (Personal)/School/Teaching/EPSY630 2020 Spring/course_data/gss2010.Rda")

gss <- gss2010[, c('degree', 'hrs1')]
levels(gss) <- c("Less than HS","HS", "Jr Coll", "Bachelor's", "Graduate")

gss.aov <- aov(hrs1 ~ degree, data = gss)
summary(gss.aov)
