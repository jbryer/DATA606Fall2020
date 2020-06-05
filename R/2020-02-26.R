
geo_mean <- function(p) {
	return( 1 / p)
}

geo_sd <- function(p) {
	return(sqrt( (1 - p) / p^2))
}

p <- seq(0.01, .5, .01)

plot(p, geo_mean(p))
plot(p, geo_sd(p))
plot(geo_mean(p), geo_sd(p))
