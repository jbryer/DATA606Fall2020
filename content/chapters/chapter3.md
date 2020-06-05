+++
title = "Chapter 3"
date = "2017-04-29T18:36:24+02:00"
Weight=3
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

## Probability

### Learning Outcomes

* Define trial, outcome, and sample space.
* Define and describe the law of large numbers.
* Distinguish disjoint (also called mutually exclusive) and independent events.
* Use Venn diagrams to represent events and their probabilities.
* Describe probability distributions.
* Distinguish between marginal and conditional probabilities.
* Use tree diagrams and/or Bayes Theorem to calculate conditional probabilities and probabilities of intersection of non-independent events.
* The expected value of a discrete random variable is computed by adding each outcome weighted by its probability.  
`$$ E(X)=\mu=\sum_{i=1}^{k}{{x}_{i}P\left(X={x}_{i}\right)} $$`
* The variance of a discrete random variable is computed by adding each squared deviation of an outcome from the expected value weighted by its probability. The standard deviation is the square root of the variance.  
`$$ Var(X)={\sigma}^{2}=\sum_{i=1}^{k}{{\left({x}_{i}-\mu\right)}P\left(X={x}_{i}\right) } $$`
* The average of a linear combination of discrete random variables is computed as the sum of their averages, weighted by the constant multipliers.
* The variance of a linear combination of independent discrete random variables is computed as the sum of their variances, weighted by the square of the constant multipliers.
* The distribution of a continuous random variable is described by the probability density function.
* The total area under the density curve is 1.
* Probabilities under the density curve can be calculated as the area under the curve.
* The probability of a continuous random variable being exactly equal to a value is 0, since there is no area under the curve at a given location.


### Supplemental Readings

* [OpenIntro Statistics slides](https://github.com/jbryer/DATA606Fall2020/blob/master/Slides/OpenIntro/chp3.pdf)

* Matloff, N. (2009). [*From Algorithms to Z-Scores: Probabilistic and Statistical Modeling in Computer Science*](https://github.com/jbryer/DATA606Fall2020/blob/master/Textbook/ProbStatBook.pdf?raw=true). Available from [http://heather.cs.ucdavis.edu/probstatbook](http://heather.cs.ucdavis.edu/probstatbook).


### Videos

[Probability Introduction](https://www.youtube.com/watch?list=PLkIselvEzpM5EgoOajhw83Ax_FktnlD6n&v=rG-SLQ2uF8U)

<iframe width="560" height="315" src="https://www.youtube.com/embed/rG-SLQ2uF8U" frameborder="0" allowfullscreen></iframe>

[Would You Take This Bet?](https://www.youtube.com/watch?v=vBX-KulgJ1o)

<iframe width="560" height="315" src="https://www.youtube.com/embed/vBX-KulgJ1o" frameborder="0" allowfullscreen></iframe>

[The Monty Hall Problem](https://www.youtube.com/watch?v=mhlc7peGlGg)

<iframe width="420" height="315" src="https://www.youtube.com/embed/mhlc7peGlGg" frameborder="0" allowfullscreen></iframe>

