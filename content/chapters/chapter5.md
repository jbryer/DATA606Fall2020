+++
title = "Chapter 5"
date = "2017-04-29T18:36:24+02:00"
Weight=5
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

## Foundations for Inference

### Learning Outcomes

* Define sample statistic as a point estimate for a population parameter, for example, the sample proportion is used to estimate the population proportion, and note that point estimate and sample statistic are synonymous.
* Recognize that point estimates (such as the sample proportion) will vary from one sample to another, and define this variability as sampling variation.
* Calculate the sampling variability of the proportion, the standard error, as $SE = \sqrt{\frac{p(1-p)}{n}}$, where $p$ is the population proportion.
    * Note that when the population proportion $p$ is not known (almost always), this can be estimated using the sample proportion, $SE = \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$.
* Standard error measures the variability in point estimates from different samples of the same size and from the same population, i.e. measures the sampling variability.
* Recognize that when the sample size increases we would expect the sampling variability to decrease.
    * Conceptually: Imagine taking many samples from the population. When sample sizes are large the sample proportion will be much more consistent across samples than when the sample sizes are small.
    * Mathematically: $SE = ???$, when $n$ increases, $SE$ will decrease since $n$ is in the denominator.
* Notice that sampling distributions of point estimates coming from samples that don't meet the required conditions for the CLT (about sample size and independence) will not be normal.
* Define a confidence interval as the plausible range of values for a population parameter.
* Define the confidence level as the percentage of random samples which yield confidence intervals that capture the true population parameter.
* Calculate an approximate 95\% confidence interval by adding and subtracting 2 standard errors to the point estimate: $point~estimate \pm 2 \times SE$.
* Recognize that the Central Limit Theorem (CLT) is about the distribution of point estimates, and that given certain conditions, this distribution will be nearly normal.
    * In the case of the proportion the CLT tells us that if
		1. the observations in the sample are independent, and
		2. there are at least 10 successes and 10 failures,
	\end{itemize}
	then the distribution of the sample proportion will be nearly normal, centered at the true population proportion and with a standard error of $\sqrt{\frac{p(1-p)}{n}}$.
	\[ \hat{p} \sim N \left( mean = p, SE = \sqrt{\frac{\hat{p}(1-\hat{p})}{n}} \right) \]
    * When the population proportion is unknown, condition (2) can be checked using the sample proportion.
* Recall that independence of observations in a sample is provided by random sampling (in the case of observational studies) or random assignment (in the case of experiments).
    * In addition, the sample should not be \textit{too} large compared to the population, or more precisely, should be smaller than 10\% of the population, since samples that are too large will likely contain observations that are not independent.
\end{itemize}
* Recognize that the nearly normal distribution of the point estimate (as suggested by the CLT) implies that a more precise confidence interval can be calculated as
\[ point~estimate \pm z^{\star} \times SE, \] 
where $z^{\star}$ corresponds to the cutoff points in the standard normal distribution to capture the middle XX\% of the data, where XX\% is the desired confidence level.
    * For proportions this is $\bar{x} \pm Z^\star \sqrt{\frac{p(1-p)}{n}}$.
    * Note that $z^{\star}$ is always positive.
* Define margin of error as the distance required to travel in either direction away from the point estimate when constructing a confidence interval, i.e. $z^{\star} \times SE$.
    * Notice that this corresponds to half the width of the confidence interval.
* Interpret a confidence interval as "We are XX\% confident that the true population parameter is in this interval", where XX\% is the desired confidence level.
    * Note that your interpretation must always be in context of the data -- mention what the population is and what the parameter is (mean or proportion).
* Explain how the hypothesis testing framework resembles a court trial.
* Recognize that in hypothesis testing we evaluate two competing claims: 
    * the null hypothesis, which represents a skeptical perspective or the status quo, and 
    * the alternative hypothesis, which represents an alternative under consideration and is often represented by a range of possible parameter values.
* Construction of hypotheses:
    * Always construct hypotheses about population parameters (e.g. population proportion, $p$) and not the sample statistics (e.g. sample proportion, $\hat{p}$). Note that the population parameter is unknown while the sample statistic is measured using the observed data and hence there is no point in hypothesizing about it.
    * Define the null value as the value the parameter is set to equal in the null hypothesis.
    * Note that the alternative hypothesis might be one-sided ($\mu$ $<$ or $>$ the null value) or two-sided ($\mu$ $\ne$ the null value), and the choice depends on the research question.
* Define a p-value as the conditional probability of obtaining a sample statistic at least as extreme as the one observed given that the null hypothesis is true.
`$\text{p-value} = \text{P(observed or more extreme sample statistic}~|~H_0 \text{ true)}$`
* Calculate a p-value as the area under the normal curve beyond the observed sample proportion (either in one tail or both, depending on the alternative hypothesis). Note that in doing so you can use a Z score, where
`$Z = \frac{sample~statistic - null~value}{SE} = \frac{\bar{x} - \mu_0}{SE}$`
    * Always sketch the normal curve when calculating the p-value, and shade the appropriate area(s) depending on whether the alternative hypothesis is one- or two-sided.
* Infer that if a confidence interval does not contain the null value the null hypothesis should be rejected in favor of the alternative.
* Compare the p-value to the significance level to make a decision between the hypotheses:
    * If the p-value $<$ the significance level, reject the null hypothesis since this means that obtaining a sample statistics at least as extreme as the observed data is extremely unlikely to happen just by chance, and conclude that the data provides evidence for the alternative hypothesis.
    * If the p-value $>$ the significance level, fail to reject the null hypothesis since this means that obtaining a sample statistics at least as extreme as the observed data is quite likely to happen by chance, and conclude that the data does not provide evidence for the alternative hypothesis.
    * Note that we can never "accept" the null hypothesis since the hypothesis testing framework does not allow us to confirm it.
* Note that the conclusion of a hypothesis test might be erroneous regardless of the decision we make.
    * Define a Type 1 error as rejecting the null hypothesis when the null hypothesis is actually true.
    * Define a Type 2 error as failing to reject the null hypothesis when the alternative hypothesis is actually true.
* Choose a significance level depending on the risks associated with Type 1 and Type 2 errors.
    * Use a smaller $\alpha$ is Type 1 error is relatively riskier.
    * Use a larger $\alpha$ is Type 2 error is relatively riskier.
* Formulate the framework for statistical inference using hypothesis testing and nearly normal point estimates:
	1. Set up the hypotheses first in plain language and then using appropriate notation.
	2. Identify the appropriate sample statistic that can be used as a point estimate for the parameter of interest.
	3. Verify that the conditions for the CLT holds.
	4. Compute the SE, sketch the sampling distribution, and shade area(s) representing the p-value.
	5. Using the sketch and the normal model, calculate the p-value and determine if the null hypothesis should be rejected or not, and state your conclusion in context of the data and the research question.
* If the conditions necessary for the CLT to hold are not met, note this and do not go forward with the analysis. (We will later learn about methods to use in these situations.)
* Distinguish statistical significance vs. practical significance.


### Supplemental Readings

* [OpenIntro Statistics slides](https://github.com/jbryer/DATA606Fall2020/blob/master/Slides/OpenIntro/chp5.pdf)

* [Why do we use 0.05 as a significance level?](https://www.openintro.org/stat/why05.php)


### Videos

<iframe width="560" height="315" src="https://www.youtube.com/embed/oLW_uzkPZGA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/A6_W8qY8zJo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/NVbPE1_Cbx8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/BqXgM-PCcls" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


