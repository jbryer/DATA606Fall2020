library(ggplot2)

p.success <- 0.51
sig.level <- 0.05

if(p.success < 0.5) { p.success <- 1 - p.success }
df <- data.frame(
	n = seq(1, 5000, by = 1)
)
df$se <- sqrt( p.success * (1 - p.success) / df$n)
df$sig <- (p.success - qnorm(sig.level / 2, lower.tail = FALSE) * df$se) > (1 - p.success)

ggplot(df, aes(x = n, y = se, color = sig)) +
	geom_path() +
	scale_color_hue('Significance') +
	ylab('Standard Error') + xlab('Sample Size') +
	ggtitle(paste0('Proportion = ', p.success),
		subtitle = paste0('Minimum n for p < ', sig.level, ' is ', min(df[df$sig,]$n)))

