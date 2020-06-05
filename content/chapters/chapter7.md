+++
title = "Chapter 7"
date = "2017-04-29T18:36:24+02:00"
Weight=7
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

## Inference for Numerical Data

### Learning Outcomes

* Use the $t$-distribution for inference on a single mean, difference of paired (dependent) means, and difference of independent means.
* Explain why the $t$-distribution helps make up for the additional variability introduced by using $s$ (sample standard deviation) in calculation of the standard error, in place of $\sigma$ (population standard deviation).
* Describe how the $t$-distribution is different from the normal distribution, and what ?heavy tail? means in this context. 
* Note that the $t$-distribution has a single parameter, degrees of freedom, and as the degrees of freedom increases this distribution approaches the normal distribution. 
* Use a $t$-statistic, with degrees of freedom $df = n - 1$ for inference for a population mean:
    * Standard error: $SE = \frac{s}{\sqrt{n}}$
    * Confidence interval: `$\bar{x} \pm t_{df}^\star SE$`
    * Hypothesis test: `$T_{df} = \frac{\bar{x} - \mu}{SE}$`
\end{itemize}
* Describe how to obtain a p-value for a $t$-test and a critical $t$-score (`$t^\star_{df}$`) for a confidence interval.
* Define observations as paired if each observation in one dataset has a special correspondence or connection with exactly one observation in the other data set. 
* Carry out inference for paired data by first subtracting the paired observations from each other, and then treating the set of differences as a new numerical variable on which to do inference (such as a confidence interval or hypothesis test for the average difference). 
* Calculate the standard error of the difference between means of two paired (dependent) samples as `$SE = \frac{s_{diff}}{\sqrt{n_{diff}}}$` and use this standard error in hypothesis testing and confidence intervals comparing means of paired (dependent) groups. 
* Use a $t$-statistic, with degrees of freedom `$df = n_{diff} - 1$` for inference for a population mean:
\begin{itemize}
    * Standard error: $SE = \frac{s}{\sqrt{n}}$
    * Confidence interval: `$\bar{x}_{diff} \pm t_{df}^\star SE$`
    * Hypothesis test: `$T_{df} = \frac{\bar{x}_{diff} - \mu_{diff}}{SE}$`. Note that `$\mu_{diff}$` is often 0, since often `$H_0: \mu_{diff} = 0$`.
* Recognize that a good interpretation of a confidence interval for the difference between two parameters includes a comparative statement (mentioning which group has the larger parameter). 
* Recognize that a confidence interval for the difference between two parameters that doesn?t include 0 is in agreement with a hypothesis test where the null hypothesis that sets the two parameters equal to each other is rejected. 
* Calculate the standard error of the difference between means of two independent samples as `$SE = \sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}}$`, and use this standard error in hypothesis testing and confidence intervals comparing means of independent groups.
* Use a $t$-statistic, with degrees of freedom `$df = min(n_1 - 1, n_2 - 1)$` for inference for a population mean:
    * Standard error: `$\sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}}$`
    * Confidence interval: `$(\bar{x}_1 - \bar{x}_2) \pm t_{df}^\star SE$`
    * Hypothesis test: `$T_{df} = \frac{(\bar{x}_1 - \bar{x}_2) - (\mu_1 - \mu_2)}{SE}$`. Note that $\mu_{diff}$ is often 0, since often `$H_0: \mu_1 - \mu_2 = 0$`.
* Calculate the power of a test for a given effect size and significance level in two steps: (1) Find the cutoff for the sample statistic that will allow the null hypothesis to be rejected at the given significance level, (2) Calculate the probability of obtaining that sample statistic given the effect size.
* Explain how power changes for changes in effect size, sample size, significance level, and standard error.
* Define analysis of variance (ANOVA) as a statistical inference method that is used to determine if the variability in the sample means is so large that it seems unlikely to be from chance alone by simultaneously considering many groups at once.
* Recognize that the null hypothesis in ANOVA sets all means equal to each other, and the alternative hypothesis suggest that at least one mean is different.
\begin{itemize}
	* `$H_0: \mu_1 = \mu_2 = \cdots = \mu_k$`
	* $H_A:$ At least one mean is different
* List the conditions necessary for performing ANOVA
	1. the observations should be independent within and across groups
	2. the data within each group are nearly normal
	3. the variability across the groups is about equal  
and check if they are met using graphical diagnostics.
* Recognize that the test statistic for ANOVA, the F statistic, is calculated as the ratio of the mean square between groups (MSG, variability between groups) and mean square error (MSE, variability within errors), and has two degrees of freedom, one for the numerator (`$df_{G} = k - 1$`, where $k$ is the number of groups) and one for the denominator (`$df_{E} = n - k$`, where $n$ is the total sample size).
    * Note that you won't be expected to calculate MSG or MSE from the raw data, but you should have a conceptual understanding of how they're calculated and what they measure.
* Describe why calculation of the p-value for ANOVA is always "one sided".
* Describe why conducting many $t$-tests for differences between each pair of means leads to an increased Type 1 Error rate, and we use a corrected significance level (Bonferroni corection, $\alpha^\star = \alpha / K$, where $K$ is the e number of comparisons being considered) to combat inflating this error rate.
* Describe why it is possible to reject the null hypothesis in ANOVA but not find significant differences between groups as a result of pairwise comparisons.


### Supplemental Readings

* [OpenIntro Statistics slides](https://github.com/jbryer/DATA606Fall2020/blob/master/Slides/OpenIntro/chp7.pdf)

### Videos

<iframe width="560" height="315" src="https://www.youtube.com/embed/uVEj2uBJfq0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/RYVIGj1l4xs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/K0QZ9_4w0HU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/emZ24asR2F4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/vnjjhQDedvs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/W36DMVJ4Ibo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/HGFiWMA5OC8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/THG0P3YNbdI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


