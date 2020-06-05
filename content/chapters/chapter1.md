+++
title = "Chapter 1"
date = "2017-04-29T18:36:24+02:00"
Weight=1
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


## Introduction to Data

### Learning Objectives

* Identify the type of variables (e.g. numerical or categorical; discrete or continuous; ordered or not ordered).
* Identify the relationship between multiple variables (i.e. independent vs. dependent).
* Define variables that are not associated as independent.
* Be able to describe and identify the difference between observational and experimental studies.
* Distinguish between simple random, stratified, and cluster sampling, and recognize the benefits and drawbacks
of choosing one sampling scheme over another.
* Identify the four principles of experimental design and recognize their purposes: control any possible con- founders, randomize into treatment and control groups, replicate by using a sufficiently large sample or repeating the experiment, and block any variables that might influence the response.


### Supplemental Readings

* [OpenIntro Statistics slides](https://github.com/jbryer/DATA606Fall2020/blob/master/Slides/OpenIntro/chp1.pdf)


### Videos

*OpenIntro* provides a number of [videos](https://www.openintro.org/stat/videos.php). You may find these helpful while reading the chapter.

[Case Study: Using Stents to Prevent Strokes](https://www.youtube.com/watch?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8&v=nEHFF1ADpWE)

<iframe width="560" height="315" src="https://www.youtube.com/embed/nEHFF1ADpWE?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8" frameborder="0" allowfullscreen></iframe>

[Data Basics: Observations, Variable, and Data Matrices](https://www.youtube.com/watch?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8&v=Mjif8PTgzUs)

<iframe width="560" height="315" src="https://www.youtube.com/embed/Mjif8PTgzUs?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8" frameborder="0" allowfullscreen></iframe>

[Data Collection Principles](https://www.youtube.com/watch?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8&v=2N_bkiyTiXU)

<iframe width="560" height="315" src="https://www.youtube.com/embed/2N_bkiyTiXU?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8" frameborder="0" allowfullscreen></iframe>

[Observational Studies and Sampling Strategies](https://www.youtube.com/watch?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8&v=n1xSeGPGQEg)

<iframe width="560" height="315" src="https://www.youtube.com/embed/n1xSeGPGQEg?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8" frameborder="0" allowfullscreen></iframe>

[Designing Experiments](https://www.youtube.com/watch?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8&v=g7JGe_ykB3I)

<iframe width="560" height="315" src="https://www.youtube.com/embed/g7JGe_ykB3I?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8" frameborder="0" allowfullscreen></iframe>


[Using Randomization to Analyze a Gender Discrimination Study](Using Randomization to Analyze a Gender Discrimination Study)

<iframe width="560" height="315" src="https://www.youtube.com/embed/2pHhjx9hyM4?list=PLkIselvEzpM6pZ76FD3NoCvvgkj_p-dE8" frameborder="0" allowfullscreen></iframe>

