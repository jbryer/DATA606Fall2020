# The Wikipedia artcile on resampling is very good. See the sections on bootstrapping
# and permutation tests.
# https://en.wikipedia.org/wiki/Resampling_(statistics)

library(reshape2)
library(psych)
library(ggplot2)

samples <- 1000

mean.a <- 10
mean.b <- 11
sd.a <- sd.b <- 4
n.a <- n.b <- 50

thedata <- data.frame(
	group = c(rep('A', n.a), rep('B', n.b)),
	value = c(rnorm(n.a, mean = mean.a, sd = sd.a),
			  rnorm(n.b, mean = mean.b, sd = sd.b))
)
formu <- value ~ group

# Difference in miles per gallon based on transmission type (0 = automatic, 1 = manual)
# data(mtcars)
# formu <- mpg ~ am
# thedata <- mtcars


x.var <- all.vars(formu)[2]
y.var <- all.vars(formu)[1]

(t.result <- t.test(formu, data = thedata))
(test.stat <- unname(diff(t.result$estimate)))
test.se <- sd(thedata[,y.var]) / sqrt(nrow(thedata))

df <- data.frame(iter = 1:samples)
df$bootstrap <- as.numeric(NA)
df$permutation <- as.numeric(NA)

pb <- txtProgressBar(min = 0, max = samples, style = 3)
for(i in 1:nrow(df)) {
	boot.sample <- sample(nrow(thedata), size = nrow(thedata), replace = TRUE)
	boot.t.result <- t.test(formu, data = thedata[boot.sample,])

	# NOTE: There are 32! possible permutations, therefore we cannot try them
	# all. Here, we are randomly shuffling the dependent variable. Technically,
	# we should not reuse any combination of the dependent variable, but given
	# the small percentage of combinations tried the chance of duplicates is small
	# and is ignored for simplicity.
	perm.sample <- sample(0:1, size = nrow(thedata), replace = TRUE)
	perm.estimate <- diff(describeBy(thedata[,y.var],
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
			 data.frame(iter = 1, variable = 'original', value = thedata[,y.var]),
			 data.frame(iter = 1, variable = 'A', value = thedata[thedata[,x.var] == 'A', y.var]),
			 data.frame(iter = 1, variable = 'B', value = thedata[thedata[,x.var] == 'B', y.var]))
ggplot(tmp, aes(x = value, color = variable)) +
	stat_function(fun = dnorm, n = 1001, args = list(mean = test.stat, sd = test.se), color = 'black') +
	geom_vline(xintercept = diff(t.result$estimate), linetype = 2) +
	geom_vline(xintercept = mean(df$bootstrap), linetype = 3) +
	geom_density()


# Build plot in pieces (used in Shiny app)
p <- ggplot() + xlim(c(-5, 25))
p <- p + geom_vline(xintercept = diff(t.result$estimate), linetype = 2)
# p <- p + geom_vline(xintercept = mean(df$bootstrap), linetype = 3)

tmp <- rbind(data.frame(iter = 1, variable = 'original', value = thedata[,y.var]),
			 data.frame(iter = 1, variable = 'A', value = thedata[thedata[,x.var] == 'A', y.var]),
			 data.frame(iter = 1, variable = 'B', value = thedata[thedata[,x.var] == 'B', y.var]))
p <- p + geom_density(data = tmp, aes(x = value, color = variable))

# p <- p + stat_function(fun = dnorm, n = 1001, args = list(mean = test.stat, sd = test.se), color = 'black')

tmp3 <- melt(df, id.vars = 'iter')
tmp3 <- tmp3[tmp3$variable == 'permutation',]
p <- p + geom_density(data = tmp3,
					  aes(x = value, color = variable))
# p + geom_density(data = tmp3[tmp3$value > test.stat,],
# 			  aes(x = value, fill = variable), alpha = 0.5)


tmp2 <- melt(df, id.vars = 'iter')
tmp2 <- tmp2[tmp2$variable == 'bootstrap',]
# p <- p + geom_density(data = tmp2,
# 					  aes(x = value, color = variable))
p


# The two-sided p-value of the test is calculated as the proportion of sampled
# permutations where the absolute difference was greater than or equal to abs(test.stat).
sum(abs(df$permutation) >= test.stat) / nrow(df) # Two sided p-value for the permutation test
