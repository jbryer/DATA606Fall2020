+++
title = "Chapter 4"
date = "2017-04-29T18:36:24+02:00"
Weight=4
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


## Distributions of Random Variables

### Learning Outcomes

* Define the standardized (Z) score of a data point as the number of standard deviations it is away from the mean: $Z = \frac{x - \mu}{\sigma}$.
* Use the Z score 
	* if the distribution is normal: to determine the percentile score of a data point (using technology or normal probability tables)
	* regardless of the shape of the distribution: to assess whether or not the particular observation is considered to be unusual (more than 2 standard deviations away from the mean) 
* Depending on the shape of the distribution determine whether the median would have a negative, positive, or 0 Z score.
* Assess whether or not a distribution is nearly normal using the 68-95-99.7\% rule or graphical methods such as a normal probability plot.
	* Reading: Section 4.1 of OpenIntro Statistics
	* Test yourself: True/False: In a right skewed distribution the Z score of the median is positive.
* If X is a random variable that takes the value 1 with probability of success $p$ and 0 with probability of success $1-p$, then $X$ is a Bernoulli random variable.
* The geometric distribution is used to describe how many trials it takes to observe a success.
* Define the probability of finding the first success in the $n^{th}$ trial as $(1-p)^{n-1}p$.
	* $\mu = \frac{1}{p}$
	* $\sigma^2 = \frac{1-p}{p^2}$
	* $\sigma = \sqrt{\frac{1-p}{p^2}}$
* Determine if a random variable is binomial using the four conditions:
	* The trials are independent. 
	* The number of trials, n, is fixed. 
	* Each trial outcome can be classified as a success or failure. 
	* The probability of a success, p, is the same for each trial. 
* Calculate the number of possible scenarios for obtaining $k$ successes in $n$ trials using the choose function: ${n \choose k} = \frac{n!}{k!~(n - k)!}$.
* Calculate probability of a given number of successes in a given number of trials using the binomial distribution: $P(k = K) = \frac{n!}{k!~(n - k)!}~p^k~(1-p)^{(n - k)}$. 
* Calculate the expected number of successes in a given number of binomial trials $(\mu = np)$ and its standard deviation $(\sigma = \sqrt{np(1-p)})$.
* When number of trials is sufficiently large ($np \ge 10$ and $n(1-p) \ge 10$), use normal approximation to calculate binomial probabilities, and explain why this approach works.


### Supplemental Readings

* [OpenIntro Statistics slides](https://github.com/jbryer/DATA606Fall2020/blob/master/Slides/OpenIntro/chp4.pdf)

### Videos

<iframe width="560" height="315" src="https://www.youtube.com/embed/S_p5D-YXLS4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/smJBsZ4YQZw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/tKmyzhvgudw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/VvksxAZAlrQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>



