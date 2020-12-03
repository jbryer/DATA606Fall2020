# Adapted from: https://cimentadaj.github.io/blog/2020-11-26-maximum-likelihood-distilled/maximum-likelihood-distilled/
# See this PDF on the Nedler Mead method for optimization
# http://www.jasoncantarella.com/downloads/NelderMeadProof.pdf
# Maximum Likelihood Programming in R
# https://www.ime.unicamp.br/~cnaber/optim_1.pdf
# Examples of Maximum Likelihood Estimation and Optimization in R
# http://web.pdx.edu/~joel8/resources/ConceptualPresentationResources/MLE_examples_final1.pdf
# Maximum Likelihood and Logistic Regression
# http://courses.atlas.illinois.edu/spring2016/STAT/STAT200/RProgramming/Maximum_Likelihood.html

library(ggplot2)
library(reshape2)
data(mtcars)

##### Bivariate Regression

lm.out <- lm(mpg ~ disp, data = mtcars)
lm.out
summary(lm.out)

optim_run <- list() # Save the parameters at each iteration
loglikelihood <- function(parameters, predictor, outcome) {
	n <- length(optim_run)
	optim_run[[n + 1]] <<- parameters

	a <- parameters[1] # Intercept
	b <- parameters[2] # beta coefficient
	sigma <- parameters[3] # error

	# Calculate the likelihood of y given a + b = x
	ll.vec <- dnorm(outcome, a + b * predictor, sigma, log = TRUE)

	# sum the likelihood over all the values in the data
	return(sum(ll.vec))
}

inits <- runif(3)

loglikelihood(inits,
			  predictor = mtcars$disp,
			  outcome = mtcars$mpg)

mle <- optim(
	inits, # Random initial values
	loglikelihood, # likelihood function
	lower = c(-Inf, -Inf, 1.e-5), # The lower bounds for the values, note sigma (error), cannot be negative
	method = "L-BFGS-B", # https://en.wikipedia.org/wiki/Nelder–Mead_method
	control = list(fnscale = -1), # Indicates that the maximum is desired rather than the minimum
	predictor = mtcars$disp,
	outcome = mtcars$mpg
)

mle$par
lm.out

df <- as.data.frame(do.call(rbind, optim_run))
names(df) <- c('Intercept', 'Slope', 'Sigma')
df$iter <- 1:nrow(df)
df <- melt(df, id.var = 'iter')
ggplot(df, aes(x = iter, y = value, color = variable)) +
	geom_path() +
	facet_wrap(~ variable, scales = "free_y", ncol = 1) +
	xlab('Iteration') + ylab('Parameter Estimate')


##### Logistic Regression

lr.out <- glm(am ~ mpg, data = mtcars, family = binomial(link = 'logit'))
lr.out$coefficients
summary(lr.out)

# Define the logistic function
logit <- function(x,beta0,beta1) {
	1/(1 + exp(-beta0-beta1*x))
}

ggplot(mtcars, aes(x = mpg, y = am)) +
	geom_point() +
	geom_smooth(method = "glm",
				se = FALSE,
				formula = y ~ x,
				method.args = list(family = "binomial"),
				color = 'blue',
				size = 1)

ggplot(mtcars, aes(x = mpg, y = am)) +
	geom_point() +
	stat_function(fun = logit, args = list(beta0 = lr.out$coefficients[1],
										   beta1 = lr.out$coefficients[2]),
				  color = 'red',
				  size = 1)



loglikelihood.binom <- function(parameters, predictor, outcome) {
	a <- parameters[1] # Intercept
	b <- parameters[2] # beta coefficient
	p <- logit(predictor, a, b)
	sum( outcome * log(p) + (1 - outcome) * log(1 - p))
}

loglikelihood.binom(c(0, 1), mtcars$mpg, mtcars$am)

mle.am <- optim(
	c(0, 1), # Initial values
	loglikelihood.binom,
	method = "L-BFGS-B",
	control = list(fnscale = -1),
	predictor = mtcars$mpg,
	outcome = mtcars$am
)

lr.out
mle.am$par
