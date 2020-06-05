library(tidyverse)

pop_n <- 10000
pop_prop <- .65
samp_n <- 100
pop <- c(rep(0, pop_n * (1 - pop_prop)), rep(1, pop_n * pop_prop))

table(pop) %>% prop.table()

samp <- sample(pop, samp_n)
(samp_prop <- sum(samp) / samp_n) # Proportion (of success)

qplot(samp) + geom_histogram()



n <- 1e5
pop <- runif(n, 0, 5)
pop <- rnorm(n, mean = 100, sd = 15)
mean(pop)
samp <- sample(pop, size = 30)
mean(samp)
se <- sd(samp) / sqrt(length(samp))

hist.samp <- density(samp, 
				  from = mean(samp) - 1.96 * sd(samp), 
				  to = mean(samp) + 1.96 * sd(samp)) %$% 
	data.frame(x = x, y = y) %>% 
	mutate(area = x >= cutoff)
hist.sampdist <- data.frame(x = seq(mean(samp) - 1.96 * se,
									mean(samp) + 1.96 * se, 0.01))
hist.sampdist$y <- dnorm(hist.sampdist$x, mean = mean(samp), sd = se)

ggplot(data = data.frame(x = range(samp)), aes(x)) +
	geom_ribbon(data = hist.samp, aes(x = x, ymin = 0, ymax = y), fill = 'blue', alpha = 0.5) +
	geom_density(data = data.frame(x = samp), color = 'blue') +
	geom_ribbon(data = hist.sampdist, aes(x = x, ymin = 0, ymax = y), fill = 'maroon', alpha = 0.5) +
	stat_function(fun = dnorm, n = 1000,
				  args = list(mean = mean(samp), sd = se), color = 'maroon') +
	xlim(mean(samp) - 3 * sd(samp), mean(samp) + 3 * sd(samp)) + ylab("") +
	ylim(c(0, .16)) +
	theme(axis.text.y = element_blank(), axis.ticks.y = element_blank())
