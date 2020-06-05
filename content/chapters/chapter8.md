+++
title = "Chapter 8"
date = "2017-04-29T18:36:24+02:00"
Weight=8
+++

<!-- 
See issue with underscores in MathJax equations here: https://gohugo.io/content-management/formats/#issues-with-markdown
The solution, put backticks (`) around the LaTeX equation
-->

<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  tex2jax: {
    inlineMath: [['$','$'], ['\\(','\\)']],
    displayMath: [['$$','$$'], ['\[','\]']],
    processEscapes: true,
    processEnvironments: true,
    skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'],
    TeX: { equationNumbers: { autoNumber: "AMS" },
         extensions: ["AMSmath.js", "AMSsymbols.js"] }
  }
});
</script>

<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

## Introduction to Linear Regression

### Learning Outcomes

* Define the explanatory variable as the independent variable (predictor), and the response variable as the dependent variable (predicted).
* Plot the explanatory variable ($x$) on the x-axis and the response variable ($y$) on the y-axis, and fit a linear regression model
`$y = \beta_0 + \beta_1 x$`
where $\beta_0$ is the intercept, and $\beta_1$ is the slope.
    * Note that the point estimates (estimated from observed data) for $\beta_0$ and $\beta_1$ are $b_0$ and $b_1$, respectively.
* When describing the association between two numerical variables, evaluate
    * direction: positive ($x \uparrow, y \uparrow$), negative ($x \downarrow, y \uparrow$)
    * form: linear or not
    * strength: determined by the scatter around the underlying relationship
* Define correlation as the \emph{linear} association between two numerical variables.
    * Note that a relationship that is nonlinear is simply called an association.
* Note that correlation coefficient ($r$, also called Pearson's $r$) the following properties:
    * the magnitude (absolute value) of the correlation coefficient measures the strength of the linear association between two numerical variables
    * the sign of the correlation coefficient indicates the direction of association
    * the correlation coefficient is always between -1 and 1, inclusive, with -1 indicating perfect negative linear association, +1 indicating perfect positive linear association, and 0 indicating no \emph{linear} relationship
    * the correlation coefficient is unitless
    * since the correlation coefficient is unitless, it is not affected by changes in the center or scale of either variable (such as unit conversions)
    * the correlation of X with Y is the same as of Y with X 
    * the correlation coefficient is sensitive to outliers
* Recall that correlation does not imply causation.
* Define residual ($e$) as the difference between the observed ($y$) and predicted ($\hat{y}$) values of the response variable.
`$e_i = y_i - \hat{y}_i$`
* Define the least squares line as the line that minimizes the sum of the squared residuals, and list conditions necessary for fitting such line:
	1. linearity
	2. nearly normal residuals
	3. constant variability
* Define an indicator variable as a binary explanatory variable (with two levels).
* Calculate the estimate for the slope ($b_1$) as 
`$b_1 = R\frac{s_y}{s_x}$`,
where $r$ is the correlation coefficient, $s_y$ is the standard deviation of the response variable, and $s_x$ is the standard deviation of the explanatory variable.
* Interpret the slope as 
    * "For each unit increase in $x$, we would expect $y$ to increase/decrease on average by $|b_1|$ units" when $x$ is numerical.
    * "The average increase/decrease in the response variable when between the baseline level and the other level of the explanatory variable is $|b_1|$." when $x$ is categorical.
    * Note that whether the response variable increases or decreases is determined by the sign of $b_1$.
* Note that the least squares line always passes through the average of the response and explanatory variables ($\bar{x},\bar{y}$).
* Use the above property to calculate the estimate for the slope ($b_0$) as 
`$b_0 = \bar{y} - b_1 \bar{x}$`,
where $b_1$ is the slope, $\bar{y}$ is the average of the response variable, and $\bar{x}$ is the average of explanatory variable.
* Interpret the intercept as
    * "When $x = 0$, we would expect $y$ to equal, on average, $b_0$." when $x$ is numerical.
    * "The expected average value of the response variable for the reference level of the explanatory variable is $b_0$." when $x$ is categorical.
* Predict the value of the response variable for a given value of the explanatory variable, $x^\star$, by plugging in $x^\star$ in the in the linear model:
`$\hat{y} = b_0 + b_1 x^\star$`
    * Only predict for values of $x^\star$ that are in the range of the observed data.
    * Do not extrapolate beyond the range of the data, unless you are confident that the linear pattern continues.
* Define $R^2$ as the percentage of the variability in the response variable explained by the the explanatory variable.
    * For a good model, we would like this number to be as close to 100\% as possible.
    * This value is calculated as the square of the correlation coefficient, and is between 0 and 1, inclusive.
* Define a leverage point as a point that lies away from the center of the data in the horizontal direction.
* Define an influential point as a point that influences (changes) the slope of the regression line.
    * This is usually a leverage point that is away from the trajectory of the rest of the data.
* Do not remove outliers from an analysis without good reason.
* Be cautious about using a categorical explanatory variable when one of the levels has very few observations, as these may act as influential points.
* Determine whether an explanatory variable is a significant predictor for the response variable using the $t$-test and the associated p-value in the regression output.
* Set the null hypothesis testing for the significance of the predictor as `$H_0: \beta_1 = 0$`, and recognize that the standard software output yields the p-value for the two-sided alternative hypothesis.
    * Note that $\beta_1 = 0$ means the regression line is horizontal, hence suggesting that there is no relationship between the explanatory and the response variables.
* Calculate the T score for the hypothesis test as
`$T_{df}=\frac { b_{ 1 }-{ null\quad value } }{ SE_{ b_{ 1 } } }$`
with $df = n - 2$.
    * Note that the T score has $n - 2$ degrees of freedom since we lose one degree of freedom for each parameter we estimate, and in this case we estimate the intercept and the slope.
* Note that a hypothesis test for the intercept is often irrelevant since it's usually out of the range of the data, and hence it is usually an extrapolation.
* Calculate a confidence interval for the slope as
`$b_1 \pm t^\star_{df} SE_{b_1}$`
where $df = n - 2$ and `$t^\star_{df}$` is the critical score associated with the given confidence level at the desired degrees of freedom.
    * Note that the standard error of the slope estimate `$SE_{b_1}$` can be found on the regression output.


### Supplemental Readings

* [OpenIntro Statistics slides](https://github.com/jbryer/DATA606Fall2020/blob/master/Slides/OpenIntro/chp8.pdf)

* [Interaction Terms](https://www.openintro.org/download.php?file=stat_extra_interaction_effects&referrer=/stat/textbook.php)

* [Regerssion for non-linear terms](https://www.openintro.org/download.php?file=stat_extra_nonlinear_relationships&referrer=/stat/textbook.php)

* [Linear regression with SAT scores](https://htmlpreview.github.io/?https://github.com/jbryer/DATA606Fall2019/blob/master/Pages/Linear_Regression_SAT.html) - This document outlines the implementation of linear regression step-by-step emphasizing visualizations.


### Videos

<iframe width="560" height="315" src="https://www.youtube.com/embed/mPvtZhdPBhQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/z8DmwG2G4Qc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/jZEKAlo1E54" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/depiT-hTaGA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


