library(multilevelPSA)
library(ggplot2)

getSimulatedData <- function(nvars=3,
							 ntreat=100, treat.mean=.6, treat.sd=.5,
							 ncontrol=1000, control.mean=.4, control.sd=.5) {
	if(length(treat.mean) == 1) { treat.mean = rep(treat.mean, nvars) }
	if(length(treat.sd) == 1) { treat.sd = rep(treat.sd, nvars) }
	if(length(control.mean) == 1) { control.mean = rep(control.mean, nvars) }
	if(length(control.sd) == 1) { control.sd = rep(control.sd, nvars) }
	
	df <- c(rep(0, ncontrol), rep(1, ntreat))
	for(i in 1:nvars) {
		df <- cbind(df, c(rnorm(ncontrol, mean=control.mean[i], sd=control.sd[i]),
						  rnorm(ntreat, mean=treat.mean[i], sd=treat.sd[i])))
	}
	df <- as.data.frame(df)
	names(df) <- c('treat', letters[1:nvars])
	return(df)
}

test.df1 <- getSimulatedData(treat.mean = .8, control.mean = 0,
							 ntreat=100, ncontrol=1000)
psranges1 <- psrange(test.df1, test.df1$treat, treat ~ .,
					 samples=seq(100,1000,by=100), nboot=20)
plot(psranges1)

head(test.df1)

lr.out1 <- glm(treat ~ a, data = test.df1, family = binomial(link='logit'))
summary(lr.out1)
test.df1$fitted <- fitted(lr.out1)

ggplot(test.df1, aes(x = a, y = treat)) + 
	geom_point() +
	geom_smooth(method = "glm", 
				method.args = list(family = "binomial"), 
				se = FALSE) 


test.df2 <- getSimulatedData(treat.mean=.6, control.mean=.4)
psranges2 <- psrange(test.df2, test.df2$treat, treat ~ .,
					 samples=seq(100,1000,by=100), nboot=20)
plot(psranges2)

ggplot(test.df2, aes(x = a, y = treat)) + 
	geom_point() +
	geom_smooth(method = "glm", 
				method.args = list(family = "binomial"), 
				se = FALSE) 

ggplot(psranges2$models[[1]][[1]]$data, aes(x = a, y = treat)) + 
	geom_point() +
	geom_smooth(method = "glm", 
				method.args = list(family = "binomial"), 
				se = FALSE) 



study <- data.frame(
	Hours=c(0.50,0.75,1.00,1.25,1.50,1.75,1.75,2.00,2.25,2.50,2.75,3.00,
			3.25,3.50,4.00,4.25,4.50,4.75,5.00,5.50),
	Pass=c(0,0,0,0,0,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1)
)
lr.out <- glm(Pass ~ Hours, data=study, family=binomial(link='logit'))
summary(lr.out)
lr.out


study.roc <- calculate_roc(predict(lr.out, type = 'response'), study$Pass)
summary(study.roc)
plot(study.roc, curve = 'cost')
plot(study.roc, curve = 'accuracy')

study$Predict <- predict(lr.out, type = 'response')
study$Predict_Pass <- study$Predict > attr(study.roc, 'threshold')

ggplot(study, aes(x = Hours, y = Pass)) +
	geom_point(aes(color = Predict_Pass)) +
	geom_smooth(method = 'glm', formula = y ~ x,
				method.args = list(family = 'binomial'), se = FALSE, color = 'black') +
	geom_vline(xintercept = mean(study$Hours))


