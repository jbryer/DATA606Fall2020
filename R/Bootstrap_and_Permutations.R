# The Wikipedia artcile on resampling is very good. See the sections on bootstrapping
# and permutation tests.
# https://en.wikipedia.org/wiki/Resampling_(statistics)

library(reshape2)
library(psych)

data(mtcars)

samples <- 5000

# Difference in miles per gallon based onn transmission type (0 = automatic, 1 = manual)
formu <- mpg ~ am

(t.result <- t.test(formu, data = mtcars))
(test.stat <- unname(diff(t.result$estimate)))

df <- data.frame(iter = 1:samples)
df$bootstrap <- as.numeric(NA)
df$permutation <- as.numeric(NA)

pb <- txtProgressBar(min = 0, max = samples, style = 3)
for(i in 1:nrow(df)) {
	boot.sample <- sample(nrow(mtcars), size = nrow(mtcars), replace = TRUE)
	boot.t.result <- t.test(formu, data = mtcars[boot.sample,])

	# NOTE: There are 32! possible permutations, therefore we cannot try them
	# all. Here, we are randomly shuffling the dependent variable. Technically,
	# we should not reuse any combination of the dependent variable, but given
	# the small percentage of combinations tried the chance of duplicates is small
	# and is ignored for simplicity.
	perm.sample <- sample(0:1, size = nrow(mtcars), replace = TRUE)
	perm.estimate <- diff(describeBy(mtcars[,all.vars(formu)[1]],
									 group = perm.sample,
									 mat = TRUE,
									 skew = FALSE)$mean)

	df[i,]$bootstrap <- diff(boot.t.result$estimate)
	df[i,]$permutation <- perm.estimate
	setTxtProgressBar(pb, i)
}
close(pb)


tmp <- melt(df, id.vars = 'iter')
tmp <- rbind(tmp,
			 data.frame(iter = 1, variable = 'original', value = mtcars$mpg),
			 data.frame(iter = 1, variable = '0', value = mtcars[mtcars[,'am'] == 0,]$mpg),
			 data.frame(iter = 1, variable = '1', value = mtcars[mtcars[,'am'] == 1,]$mpg))
ggplot(tmp, aes(x = value, color = variable)) +
	geom_vline(xintercept = diff(t.result$estimate), linetype = 2) +
	geom_vline(xintercept = mean(df$bootstrap), linetype = 3) +
	geom_density()

# The two-sided p-value of the test is calculated as the proportion of sampled
# permutations where the absolute difference was greater than or equal to abs(test.stat).
sum(abs(df$permutation) >= test.stat) / nrow(df) # Two sided p-value for the permutation test
