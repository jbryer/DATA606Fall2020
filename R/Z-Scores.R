library(reshape2)
library(ggplot2)
library(DATA606)

n <- 30
df <- data.frame(id = 1:n)

# Right skewed
df$right_skewed_low <- do.call(rlnorm, list(n=n, meanlog=0, sdlog=.25))
df$right_skewed_moderate <- do.call(rlnorm, list(n=n, meanlog=0, sdlog=.5))
df$right_skewed_high <- do.call(rlnorm, list(n=n, meanlog=0, sdlog=1))

df <- melt(df, id.vars = 'id')
head(df)

ggplot(df, aes(x = value)) + geom_density() + facet_wrap(~ variable)


vals <- do.call(rlnorm, list(n=n, meanlog=0, sdlog=1))
z.scores <- (vals - mean(vals)) / sd(vals)
hist(vals)
hist(z.scores)
plot(vals, z.scores)

qqnorm(vals); qqline(vals)
qqnorm(z.scores); qqline(z.scores)

DATA606::qqnormsim(vals)
DATA606::qqnormsim(z.scores)
