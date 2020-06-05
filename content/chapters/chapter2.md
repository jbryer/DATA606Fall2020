+++
title = "Chapter 2"
date = "2017-04-29T18:36:24+02:00"
Weight=2
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


## Summarizing Data

### Learning Outcomes

* Use appropriate visualizations for different types of data (e.g. histogram, barplot, scatterplot, boxplot, etc.).
* Use different measures of center and spread and be able to describe the robustness of different statistics.
* Describe the shape of distributions vis-a-vis histograms and boxplots.
* Create and intepret contingency and frequency tables (one- and two-way tables).


### Supplemental Readings

* [OpenIntro Statistics slides](https://github.com/jbryer/DATA606Fall2020/blob/master/Slides/OpenIntro/chp2.pdf)
* [ggplot2](http://ggplot2.org/) - `ggplot2` is an R package by Wickham that implements the [grammer of graphics](http://www.amazon.com/The-Grammar-Graphics-Statistics-Computing/dp/0387245448) (Wilkinson, 2005) in R. I will frequently make use of the graphing framework throughout the course and is worth learning.
* [Visualizing Likert Data](http://jason.bryer.org/likert/) - An R package for visualizing [Likert scale](https://en.wikipedia.org/wiki/Likert_scale) data built on the `ggplot2` framework.
* [Quick-R base graphics](http://www.statmethods.net/graphs/index.html) - Covers many of the visualizations using R's base graphics.


### Videos

[Summarizing and Graphing Numerical Data](https://www.youtube.com/watch?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8&v=Xm0PPtci3JE)

<iframe width="560" height="315" src="https://www.youtube.com/embed/Xm0PPtci3JE?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8" frameborder="0" allowfullscreen></iframe>

[Exploring Categorical Data](https://www.youtube.com/watch?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8&v=7NhNeADL8fA)

<iframe width="560" height="315" src="https://www.youtube.com/embed/7NhNeADL8fA?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8" frameborder="0" allowfullscreen></iframe>

### Note about Pie Charts

There is only one pie chart in *OpenIntro Statistics* (Diez, Barr, & ??etinkaya-Rundel, 2015, p. 48). Consider the following three pie charts that represent the preference of five different colors. Is there a difference between the three pie charts? This is probably a difficult to answer.

![Pie](/figures/Pie.png)

However, consider the bar plot below. Here, we cleary see there is a difference between the ratio of the three colors. As John Tukey famously said:

> There is no data that can be displayed in a pie chart that cannot better be displayed in some other type of chart

![Bar](/figures/Bar.png)

Source: [https://en.wikipedia.org/wiki/Pie_chart](https://en.wikipedia.org/wiki/Pie_chart).

