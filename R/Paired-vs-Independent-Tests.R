library(tidyverse)
library(reshape2)
data("textbooks", package = 'openintro')

str(textbooks)

ggplot(textbooks, aes(x = uclaNew, y = amazNew)) + 
	geom_abline(intercept = 0, slope = 1, color = '#1b9e77', size = 1) +
	geom_smooth(method = 'lm', se = FALSE, color = '#d95f02', size = 1) +
	geom_point() +
	coord_equal()

textbooks.melt <- textbooks %>%
	select(ibsn, uclaNew, amazNew) %>% 
	melt(id.vars = 'ibsn')

ggplot(textbooks.melt, aes(x = value, color = variable)) + 
	geom_density()

ggplot(textbooks, aes(x = diff)) + geom_density() + geom_vline(xintercept = 0)

t.test(textbooks$uclaNew, textbooks$amazNew, paired = TRUE)
t.test(textbooks$uclaNew, textbooks$amazNew, paired = FALSE)
