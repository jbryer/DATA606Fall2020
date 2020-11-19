+++
title = "Software"
description = ""
weight = 4
+++

### Computer Hardware

This course will make extensive use of the R statistical language. You are expected to have a computer sufficient to run this the software listed below. The software will run on most platforms so a Mac or PC (running Windows or Linux) will work fine. I recommend having at least 16GBs of RAM.


### R and RStudio

We will make use of [R](http://r-project.org), an open source statistics program and language. Be sure to [install R](http://cran.r-project.org/) and [RStudio](http://rstudio.com) on your own computers within the first few days of the class.

* R - [Windows](http://cran.r-project.org/bin/windows/base/) or [Mac](http://cran.r-project.org/bin/macosx/)
* RStudio - [Download Windows or Mac version from here](http://www.rstudio.com/products/rstudio/download/)

If using Windows, you also need to download [RTools](http://cran.r-project.org/bin/windows/Rtools/) and [ActivePerl](https://www.activestate.com/products/activeperl/downloads/).


### LaTeX

[LaTeX](https://www.latex-project.org/) is a typesetting language for preparing documents. Documents are written in plain text files. Formatting the document is done using specific markup. If you have used HTML, the framework is similar however instead of using `<TAG></TAG>` syntax, LaTeX uses `\TAG{}` format. We will primarily use [Markdown](https://daringfireball.net/projects/markdown/), and its extension [R Markdown](https://rmarkdown.rstudio.com/) for preparing documents in this class. However, when preparing PDF documents, the Markdown will first be converted to LaTeX before creating the PDF file. As such, a LaTeX converter is necessary. There are LaTeX installers for [Windows (MiKTeX)](http://miktex.org/) and [Mac (BasicTeX)](http://www.tug.org/mactex/morepackages.html). Alternatively, the [`tinytex`](https://yihui.name/tinytex/) R package provides an easier way of installing LaTeX directly from within R:

```
install.packages('tinytex')
tinytex::install_tinytex()
```

### Source Control

All course materials will be made available on [Github](https://github.com/jbryer/DATA606Fall2020/) which provides an implementation of the [git](https://git-scm.com/) open source version control system. RStudio supports git directly, but I recommend downloading [Sourcetree](https://www.sourcetreeapp.com/). This is a free desktop client that provides an easier interface for working with Github. You will also need to [create an account on Github](https://github.com/).

For more information, Jenny Bryan's [*Happy Git and Github for the useR*](https://happygitwithr.com/) is a free online book covering the important features of source control for R users.

### R Packages

Once everything is installed, execute the following command in RStudio to install the packages we will use for this class (you can copy-and-paste):

```
install.packages(c('openintro','OIdata','devtools','tidyverse', 'ggplot2',
                   'psych','reshape2','knitr','markdown','shiny','R.rsp',
                   'fivethirtyeight'))
devtools::install_github("jbryer/DATA606")
```

### The `DATA606` R Package

Many of the course resouces are available in the `DATA606` R package. Here are some command to get started:

```
library('DATA606')          # Load the package
vignette(package='DATA606') # Lists vignettes in the DATA606 package
vignette('os4')             # Loads a PDF of the OpenIntro Statistics book
data(package='DATA606')     # Lists data available in the package
getLabs()                   # Returns a list of the available labs
viewLab('Lab1')             # Opens Lab1 in the default web browser
startLab('Lab1')            # Starts Lab1 (copies to getwd()), opens the Rmd file
shiny_demo()                # Lists available Shiny apps
```

