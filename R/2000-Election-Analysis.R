library(ggplot2)

elections <- read.table("course_data/2000elections.txt", header=TRUE)
source('course_data/fl_counties.R')

ggplot(elections, aes(bush, buch)) +
	geom_point() +
	xlab("Number of votes for Bush") +
	ylab("Number of votes for Buchanan") +
	ggtitle("Number of votes by county in Florida")

# Generally, the votes for bush increase as votes for Buchanan increase.
# It appears to be fairly linear, but with slight curviture.
# There are a couple of outliers.

cor.test(elections$buch, elections$bush)

# I would say that the line appears to be curvilinear and therefore
# simple linear regressions would not capture the non-linearities.
# However there does appear to be a linear relationship, positive, that
# is supported by the correlation and visual inspection of the
# scatter plot.

ggplot(elections, aes(bush, buch)) +
	geom_point() +
	scale_x_log10() + scale_y_log10() +
	xlab("Log of number of votes for Bush") +
	ylab("Log of number of votes for Buchanan") +
	ggtitle("Number of votes by county in Florida")

cor.test(log(elections$buch), log(elections$bush))

# We see that the scatter plot is much more linear appearing, outliers
# and potentially influential observations are less apparent, and
# correlation is greatly increased.

model <- lm(log(buch) ~ log(bush), data = elections)
summary(model)

## Obtain estimated coefficients
betas <- coef(model)

## Interpretation
# as number of votes for buch increase by % the expected % increase
# of votes for bush are 1.12 the standard error is .0585

## Confidence intervals for the coefficients
confint(model)

## Residual Analysis
par.orig <- par(mfrow=c(2,2))
plot(log(bush),resid(model), main="Predictors vs Residuals")
abline(0,0)
plot(fitted(model),resid(model),main="Fitted vs Residuals",
xlab="Fitted Values")
abline(0,0)
qqnorm(resid(model),main="QQ-Plot of Residuals")
qqline(resid(model))
hist(resid(model),main="Histogram of Residuals")
par(par.orig)

# Validity of linear assumption, by plot 1, validated.
# Looks like maybe one outlier, 2,3,4.
# Normality of Errors plot 3,4 looks like there is a negative outlier by QQ and hist
# Hetero sekdasticity. Plot 2. Appears fairly constant, excepting a couple negative outliers

## Is the Palm Beach vote count an anomaly?

## Omit Palm Beach
model.red <- lm(log(buch) ~ log(bush), data = elections[-50,])
summary(model.red)

# The slope and intercept term both change.
# In the model dropping PB the intercept is higher.
# However the confidence intervals overlap => no real change in slope.
# Residuals are similar. QQ plot slightly better. The large negative residual is gone
# removing some of the skew in the distribution.

## Obtain the predicted vote count for Palm Beach given the fitted model without
new <- data.frame(bush = bush[50])
## The difference between predicted on the original scale and the observed vote count
buch[50] - exp(predict(model.red, new))

## Prediction Confidence Interval for log(vote count)
predict(model.red, new, interval='prediction', level=.95)
## Prediction Confidence Interval on the original scale
exp(predict(model.red, new, interval='prediction',level=.95))
buch[50]

# Therefore, what we can say is that it is likely that Palm Beach is a different community
# That comes from a different model than the rest of the


