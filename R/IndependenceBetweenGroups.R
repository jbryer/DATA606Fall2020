library(tidyverse)
library(reshape2)
library(latex2exp)

set.seed(2112)

propA <- .55 # Proportion for group A
propB <- .6 # Proportion for group B
pop.n <- 100000 # Population size
sampleA.n <- 1000
sampleB.n <- 1000

replications <- 10 

results <- data.frame(
	percent = rep(seq(0.01, 0.5, 0.01), each = replications),
	p_hat_pop = NA_real_,
	p_hat_popA = NA_real_,
	p_hat_popB = NA_real_,
	p_hat_A = NA_real_,
	p_hat_A_not_B = NA_real_,
	p_hat_B = NA_real_
)

pb <- txtProgressBar(0, nrow(results), style = 3)
for(i in seq_len(nrow(results))) {
	A.n <- pop.n * (1 - results[i,]$percent)
	B.n <- pop.n * results[i,]$percent
	
	pop <- data.frame(
		group = c(rep('A', A.n),
				  rep('B', B.n) ),
		response = c(
			sample(c(1,0), 
				   size = A.n, 
				   prob = c(propA, 1 - propA), 
				   replace = TRUE),
			sample(c(1,0), 
				   size = B.n, 
				   prob = c(propB, 1 - propB), 
				   replace = TRUE) )
	)
	
	tmp <- aggregate(pop$response, by = list(pop$group), FUN = mean)
	results[i,]$p_hat_pop <- mean(pop$response)
	results[i,]$p_hat_popA <- tmp[1,]$x
	results[i,]$p_hat_popB <- tmp[2,]$x
	
	sampA <- pop[sample(nrow(pop), size = sampleA.n),]
	sampB <- pop[sample(which(pop$group == 'B'), size = sampleB.n),]
	
	results[i,]$p_hat_A <- mean(sampA$response)
	results[i,]$p_hat_A_not_B <- mean(sampA[sampA$group == 'A',]$response)
	results[i,]$p_hat_B <- mean(sampB$response)
	
	setTxtProgressBar(pb, i)
}
close(pb)

results.melt <- melt(results[,c(1,5,6,7)], 
					 id.vars = 'percent', 
					 value.name = 'p_hat')

ggplot(results.melt, aes(x = percent, y = p_hat, color = variable)) + 
	geom_hline(yintercept = propA) +
	geom_hline(yintercept = propB) + 
	geom_point(alpha = 0.2) + 
	geom_smooth(se = TRUE, method = 'loess') +
	scale_color_brewer('', palette = 2, type = 'qual') +
	xlab('Size of group B as a percentage of population') +
	ylab(TeX('$\\hat{p}$'))

