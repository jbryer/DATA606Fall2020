+++
title = "Chapter 6"
date = "2017-04-29T18:36:24+02:00"
Weight=6
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

## Inference for Categorical Data

### Learning Outcomes

* Define population proportion $p$ (parameter) and sample proportion $\hat{p}$ (point estimate).
* Calculate the sampling variability of the proportion, the standard error, as 
\[ SE = \sqrt{\frac{p(1-p)}{n}}, \] 
where $p$ is the population proportion.
    * Note that when the population proportion $p$ is not known (almost always), this can be estimated using the sample proportion, $SE = \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$.
* Recognize that the Central Limit Theorem (CLT) is about the distribution of point estimates, and that given certain conditions, this distribution will be nearly normal.
    * In the case of the proportion the CLT tells us that if \\
		1. the observations in the sample are independent, \\
		2. the sample size is sufficiently large (checked using the success/failure condition: $np \ge 10$ and $n(1-p) \ge 10$), \\
then the distribution of the sample proportion will be nearly normal, centered at the true population proportion and with a standard error of $\sqrt{\frac{p(1-p)}{n}}$.
\[ \hat{p} \sim N \left( mean = p, SE = \sqrt{\frac{p(1-p)}{n}} \right) \]
* Note that if the CLT doesn?t apply and the sample proportion is low (close to 0) the sampling distribution will likely be right skewed, if the sample proportion is high (close to 1) the sampling distribution will likely be left skewed. 
* Remember that confidence intervals are calculated as 
\[ \text{point estimate} \pm \text{margin of error} \]
and test statistics are calculated as 
\[ \text{test statistic =} \frac{\text{point estimate - null value}}{\text{standard error}} \]
* Note that the standard error calculation for the confidence interval and the hypothesis test are different when dealing with proportions, since in the hypothesis test we need to assume that the null hypothesis is true -- remember: p-value = P(observed or more extreme test statistic $|$ $H_0$ true).
    * For confidence intervals use $\hat{p}$ (observed sample proportion) when calculating the standard error and when checking the success/failure condition:
`$SE_{\hat{p}} = \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$`
    * For hypothesis tests use $p_0$ (null value) when calculating the standard error and checking the success/failure condition:
`$SE_{\hat{p}} = \sqrt{\frac{p_0 (1-p_0)}{n}}$`
    * Such a discrepancy doesn't exist when conducting inference for means, since the mean doesn't factor into the calculation of the standard error, while the proportion does.
* Calculate the required minimum sample size for a given margin of error at a given confidence level, and explain why we use $\hat{p} = 0.5$ if there are no previous studies suggesting a more accurate estimate.
    * Conceptually: When there is no additional information, 50\% chance of success is a good guess for events with only two outcomes (success or failure).
    * Mathematically: Using $\hat{p} = 0.5$ yields the most conservative (highest) estimate for the required sample size.
* Note that the calculation of the standard error of the distribution of the difference in two independent sample proportions is different for a confidence interval and a hypothesis test.
    * confidence interval (and hypothesis test when `$H_0: p_1 -p_2 =$` some value other than 0): 
`$SE_{(\hat{p}_1 - \hat{p}_2)} = \sqrt{\frac{ \hat{p}_1 (1 - \hat{p}_1)}{n_1} + \frac{ \hat{p}_2 (1 - \hat{p}_2)}{n_2} }$`
    * hypothesis test when `$H_0: p_1 -p_2 = 0$`: 
`$SE_{(\hat{p}_1 - \hat{p}_2)} = \sqrt{\frac{ \hat{p}_{pool} (1 - \hat{p}_{pool})}{n_1} + \frac{ \hat{p}_{pool} (1 - \hat{p}_{pool})}{n_2} }$`,
where $\hat{p}_{pool}$ is the overall rate of success:
`$\hat{p}_{pool} = \frac{\text{number of successes in group 1 + number of successes in group 2}}{n_1 + n_2}$`
* Note that the reason for the difference in calculations of standard error is the same as in the case of the single proportion: when the null hypothesis claims that the two population proportions are equal, we need to take that into consideration when calculating the standard error for the hypothesis test, and use a common proportion for both samples.
* Use a chi-square test of goodness of fit to evaluate if the distribution of levels of a single categorical variable follows a hypothesized distribution.
	* $H_0:$ The distribution of the variable follows the hypothesized distribution, and any observed differences are due to chance.
	* $H_A:$ The distribution of the variable does not follow the hypothesized distribution.
* Calculate the expected counts for a given level (cell) in a one-way table as the sample size times the hypothesized proportion for that level.
* Calculate the chi-square test statistic as 
`$\chi = \sum_{i = 1}^{k}  \frac{(\text{observed count} - \text{expected count})^2}{\text{expected count}}$`,
where $k$ is the number of cells.
* Note that the chi-square distribution is right skewed with one parameter: degrees of freedom. In the case of a goodness of fit test, $df = \# \text{of categories} - 1$.
* List the conditions necessary for performing a chi-square test (goodness of fit or independence)
	1. the observations should be independent
	2. expected counts for each cell should be at least 5
	3. degrees of freedom should be at least 2 (if not, use methods for evaluating proportions)
* Describe how to use the chi-square table to obtain a p-value.
* When evaluating the independence of two categorical variables where at least one has more than two levels, use a chi-square test of independence.
	* $H_0:$ The two variables are independent.
	* $H_A:$ The two variables are dependent.
* Calculate expected counts in two-way tables as 
\[ E = \frac{\text{row total} \times \text{column total}}{\text{grand total}} \]
* Calculate the degrees of freedom for chi-square test of independence as $df = (R - 1) \times (C - 1)$, where $R$ is the number of rows in a two-way table, and $C$ is the number of columns.
* Note that there is no such thing as a chi-square confidence interval for proportions, since in the case of a categorical variables with many levels, there isn't one parameter to estimate.
* Use simulation methods when sample size conditions aren't met for inference for categorical variables.
    * Note that the $t$-distribution is only appropriate to use for means, when sample size isn't sufficiently large, and the parameter of interest is a proportion or a difference between two proportions, we need to use simulation.
* In hypothesis testing
    * for one categorical variable, generate simulated samples based on the null hypothesis, and then calculate the number of samples that are at least as extreme as the observed data.
    * for two categorical variables, use a randomization test.
* Use bootstrap methods for confidence intervals for categorical variables with at most two levels. 


### Supplemental Readings

* [OpenIntro Statistics slides](https://github.com/jbryer/DATA606Fall2020/blob/master/Slides/OpenIntro/chp6.pdf)

### Videos

<iframe width="560" height="315" src="https://www.youtube.com/embed/_iFAZgpWsx0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/Uk36WGxujkc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/yjrsfNdja0U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


