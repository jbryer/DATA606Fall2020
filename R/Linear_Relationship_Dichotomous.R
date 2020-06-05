library(ggplot2)
library(psych)

df <- data.frame(
	x = rep(c(0, 1), each = 10),
	y = c(rnorm(10, mean = 1, sd = 1),
		  rnorm(10, mean = 2, sd = 1.5))
)
df

tab <- describeBy(df$y, group = df$x, mat = TRUE, skew = FALSE)
tab$group1 <- as.integer(as.character(tab$group1))

ggplot(df, aes(x = x, y = y)) + 
	geom_point(alpha = 0.5) +
	geom_point(data = tab, aes(x = group1, y = mean), color = 'red', size = 4) + 
	geom_smooth(method = lm, se = FALSE, formula = y ~ x)
